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
 * Interrupts
 */
static volatile bool run_10ms = false;

void timer0_isr(void) {
    run_10ms = true;
}

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

static uint16_t current_task(void) {
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

    /*
     * Run all LTC6811 self-tests
     */
    rc += LTC6811_run_cell_adc_st(CELL, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    rc += LTC6811_run_cell_adc_st(AUX, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    rc += LTC6811_run_cell_adc_st(STAT, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);

    if (rc != 0) {
        set_fault(BMS_FAULT_DIAGNOSTICS_FAIL);
        goto bail;
    }

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    rc = voltage_task(&bms_core.pack_voltage, &ov, &uv);

    if (rc != 0) {
        set_fault(); // TODO: maybe we should keep track of metrics, and if we
                     // start seeing a lot of failures, we should fault
        goto bail;
    }

    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
        rc = 1;
        goto bail;
    } else if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        rc = 1;
        goto bail;
    }

    // read all temperatures
    uint32_t ot = 0;
    uint32_t ut = 0;

    rc = temperature_task(&bms_core.pack_temperature, &ot, &ut);

    if (rc != 0) {
        set_fault(); // TODO: maybe we should keep track of metrics, and if we
                     // start seeing a lot of failures, we should fault
        rc = 1;
        goto bail;
    }

    if (ut > 0) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        rc = 1;
        goto bail;
    } else if (ot > 0) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
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
 * Primary state machine function
 */
static void state_machine_run(void) {
    if (bms_core.bms_fault_state != BMS_FAULT_NONE) {
        bms_core.bms_state = FAULT;
        gpio_clear_pin(BMS_RELAY_LSD);
    }

    // Wake up all LTC6811s
    wakeup_sleep(NUM_ICS);

    /*
     * Voltages
     */
    uint32_t ov = 0;
    uint32_t uv = 0;

    int rc = voltage_task(&bms_core.pack_voltage, &ov, &uv);

    if (rc != 0) {
        set_fault(); // TODO: maybe we should keep track of metrics, and if we
                     // start seeing a lot of failures, we should fault
        return;
    };


    /*
     * Temperatures
     */
    rc = temperature_task(&bms_core.pack_temperature, &ot, &ut);

    if (rc != 0) {
        set_fault(); // TODO: maybe we should keep track of metrics, and if we
                     // start seeing a lot of failures, we should fault
        return;
    }

    if (ut > 0) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        return;
    } else if (ot > 0) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
        return;
    }

    switch (bms_core.bms_state) {
        case IDLE: {
        } break;
        case DISCHARGING: {
            if (uv > 0) {
                set_fault(BMS_FAULT_UNDERVOLTAGE);
            } else if (ov > 0) {
                set_fault(BMS_FAULT_OVERVOLTAGE);
            }

            /*
             * Temperature
             */
        } break;
        case CHARGING: {
            // static bool blink_led = true;
            // called every 10ms, so we lower the blink rate to every 500ms
            static uint8_t blink_counter = 0;

            // TODO
            if (blink_counter == 50) {
                gpio_set_pin(GENERAL_LED);
                blink_counter++;
            } else if (blink_counter == 100) {
                gpio_clear_pin(GENERAL_LED);
                blink_counter = 0;
            } else {
                blink_counter++;
            }

            if (ov > 0) {
                // Do we set fault or just disable charging and move to IDLE?
            }
        } break;
        case FAULT: {
            gpio_clear_pin(BMS_RELAY_LSD);
            gpio_set_pin(FAULT_LED);

            // TODO: If charger is detected, move into CHARGING
            if (bms_core.bms_fault_state == BMS_FAULT_UNDERVOLTAGE) {
                // if (charger_connected) {
                //     gpio_set_pin(CHARGE_ENABLE1);
                //     gpio_set_pin(CHARGE_ENABLE2);
                //     bms_core.bms_fault_state = BMS_FAULT_NONE;
                //     bms_core.bms_state = CHARGING;
                // }
            }
        } break;
        default: {
            // Just to be safe. This shouldn't happen
            bms_core.bms_state = FAULT;
        } break;
    }
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

    bms_core.bms_state = IDLE;

    // Close the BMS shutdown circuit relay
    gpio_set_pin(BMS_RELAY_LSD);

    sei();

    while (true) {
        // Tracks the number of times the 10ms loop has been run
        uint8_t loop_counter = 0;

        if (run_10ms) {
            state_machine_run();

            // wakeup_sleep(NUM_ICS);

            // uint16_t pack_voltage = 0;
            // uint32_t ov = 0;
            // uint32_t uv = 0;

            // int rc = voltage_task(&pack_voltage, &ov, &uv);
            // temperature_task();
            openwire_task();

            uint16_t current = current_task();
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
