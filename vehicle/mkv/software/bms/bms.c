#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <stdbool.h>

#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/tasks/tasks.h"
#include "vehicle/mkv/software/bms/utils/can.h"
#include "vehicle/mkv/software/bms/utils/fault.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

// Defines maximum current range (-125 to 125A)
#define MAX_CURRENT_RANGE (250)

/* TODO
 *   State machine
 *     INIT
 *     IDLE: Maybe if the car is off but the board is powered?
 *     ACTIVE
 *     CHARGING
 *     FAULT
 *   Do not do BMS if car is off (TS off? LV off?)
 */

enum State {
    INIT = 0,
    IDLE,
    DISCHARGING,
    CHARGING,
    FAULT,
};

// Represents all of LTC6811 chips used in the BMS. Contains cell
// voltages, auxiliary readings (i.e. temperatures), and configs
cell_asic ICS[NUM_ICS];

uint16_t TEMPERATURES[NUM_TEMPERATURE_ICS][NUM_MUXES * NUM_MUX_CHANNELS];

/*
 * Interrupt for nOCD
 */
void pcint0_callback(void) {
    bms_core.overcurrent_detect = !gpio_get_pin(nOCD);

    if (bms_core.overcurrent_detect) {
        set_fault(BMS_FAULT_OVERCURRENT);
    }
}

/*
 * Interrupt for BSPD_CURRENT_SENSE
 */
void pcint2_callback(void) {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
}

static uint16_t get_current_sensor_value(void) {
    uint16_t vref = adc_read(CURRENT_SENSE_VREF);
    uint16_t vout = adc_read(CURRENT_SENSE_VOUT);

    return (vout - vref) / MAX_CURRENT_RANGE;
}

static void configure_ics(void) {
    LTC6811_init_cfg(NUM_ICS, ICS);
    LTC6811_init_reg_limits(NUM_ICS, ICS);

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // Configure over/undervoltage thresholds for each chip
        LTC6811_set_cfgr_uv(ic, ICS, UNDERVOLTAGE_THRESHOLD);
        LTC6811_set_cfgr_ov(ic, ICS, OVERVOLTAGE_THRESHOLD);
    }

    // Write the configured values to the chips
    LTC6811_wrcfg(NUM_ICS, ICS);
}

/*
 * Perform initial startup checks on the BMS.
 *
 * - Runs BIST (built-in self test) in all the ICs
 * - Checks all temperatures and voltages and ensures they are in range
 */
static int initial_checks(void) {
    int rc = 0;

    LTC6811_diagn();

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        if (ICS[ic].stat.mux_fail[0] == 1) {
            set_fault(BMS_FAULT_DIAGNOSTICS_FAIL);
            rc = 1;
            goto bail;
        }
    }

    rc += LTC6811_run_cell_adc_st(CELL, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    rc += LTC6811_run_cell_adc_st(AUX, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    rc += LTC6811_run_cell_adc_st(STAT, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);

    // TODO: should rc be zero here?

    // read all voltages
    voltage_task();

    if (bms_core.bms_fault_state) {
        rc = 1;
        goto bail;
    }

    // read all temperatures
    temperature_task();

    if (bms_core.bms_fault_state) {
        rc = 1;
        goto bail;
    }

    // check for open-circuit
    openwire_task();

    if (bms_core.bms_fault_state) {
        rc = 1;
        goto bail;
    }

bail:
    return rc;
}

/*
 * Interrupts
 */
static volatile bool run_10ms = false;

void timer0_isr(void) {
    run_10ms = true;
}

int main(void) {
    can_init_bms();

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(RJ45_LEDO, OUTPUT);
    gpio_set_mode(RJ45_LEDG, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE1, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE2, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);

    gpio_set_mode(nOCD, INPUT);
    gpio_set_mode(BSPD_CURRENT_SENSE, INPUT);

    gpio_enable_interrupt(nOCD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    adc_init();

    spi_init(&spi_cfg);

    timer_init(&timer0_cfg);
    timer_init(&timer1_fan_cfg);

    // Turn on GENERAL_LED to indicate checks will run
    gpio_set_pin(GENERAL_LED);

    // do initial checks
    if (!initial_checks()) {
        goto fault;
    }

    configure_ics();

    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    // Close the BMS shutdown circuit relay
    gpio_set_pin(BMS_RELAY_LSD);

    sei();

    while (true) {
        // Tracks the number of times the 10ms loop has been run
        uint8_t loop_counter = 0;

        if (run_10ms) {
            // state_machine_run();
            wakeup_sleep(NUM_ICS);

            voltage_task();
            temperature_task();
            openwire_task();

            uint16_t current = get_current_sensor_value();
            (void)current;

            can_send_bms_core();
            can_send_bms_metrics();
            can_send_bms_debug();

            if (loop_counter == 25) {
                // Occurs at 4Hz, every 250ms
                can_send_bms_voltages(NUM_ICS, ICS);
                can_send_bms_temperatures(NUM_ICS, (uint16_t**)TEMPERATURES);
                can_send_open_wires(NUM_ICS, ICS);

                loop_counter = 0;
            }

            loop_counter++;
        }
    }

fault:
    gpio_clear_pin(BMS_RELAY_LSD);
    gpio_set_pin(FAULT_LED);

    while (true) {
        if (run_10ms) {
            can_send_bms_core();
        }
    };
}
