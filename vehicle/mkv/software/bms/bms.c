#include <avr/interrupt.h>
#include <stdbool.h>

#include "libs/gpio/api.h"
#include "vehicle/mkv/software/bms/bsp.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

enum fault_code {
    FAULT_NONE = 0x00,
    FAULT_UNDERVOLTAGE,
    FAULT_OVERVOLTAGE,
    FAULT_UNDERTEMPERATURE,
    FAULT_OVERTEMPERATURE,
    FAULT_DIAGNOSTICS_FAIL,
}

// Represents all of LTC6811 chips used in the BMS. Contains cell
// voltages, auxiliary readings (i.e. temperatures), and configs
cell_asic ICS[NUM_ICS];

static void set_fault(enum fault_code the_fault) {
    if (bms_core.fault_state == FAULT_NONE) {
        bms_core.fault_state = the_fault;
    }
}

static void fan_enable(bool enable) {
    timer1_fan_cfg.channel_b.pin_behavior = enable ? TOGGLE : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the timer
    timer_init(&timer1_fan_cfg);
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
    
    for (uint8_t ic; ic < NUM_ICS; ic++) {
        if (ICS[ic].stat.mux_fail[0] == 1) {
            set_fault(FAULT_DIAGNOSTICS_FAIL);
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

    // read all temperatures
    temperature_task();

    // check for open-circuit
    openwire_task();

bail:
    return rc;
}

static void configure_ics(void) {
    LTC6811_init_cfg(NUM_ICS, ICS);

    bool gpios[5] = { false };
    bool dcc[12] = { false };
    bool dcto[4] = { false };

    for (uint8_t ic = 0; ic < NUM_ICS; ic ++) {
        LTC6811_set_cfgr(
            ic,
            ICS,
            false,
            false,
            gpios,
            dcc,
            dcto,
            UNDERVOLTAGE_THRESHOLD,
            OVERVOLTAGE_THRESHOLD
        );
    }

    LTC68811_wrcfgr(NUM_ICS, ICS); // TODO
}

void voltage_task(void) {

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    // Blocks until all ADCs are done being read
    (void)LTC6811_pollAdc();

}

void temperature_task(void) {

}

void openwire_task(void) {

}

/*
 * Interrupts
 */
static volatile bool run_1ms = false;

void timer0_isr(void) {
    run_1ms = true;
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

    spi_init(&spi_cfg);

    timer_init(&timer0_cfg);
    timer_init(&timer1_fan_cfg);

    // Turn on GENERAL_LED to indicate checks will run
    gpio_set_pin(GENERAL_LED);

    // do initial checks
    if (!initial_checks()) {
        goto fault;
    }

    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    // configure_ics();
    sei();

    while (true) {
        if (run_1ms) {
            wakeup_sleep(NUM_ICS);

            voltage_task();
            temperature_task();
            openwire_task();

            // bms_core.pack_voltage = get_pack_voltage(NUM_ICS, ICS);
            // bms_core.temperature = get_pack_temperature(NUM_ICS, ICS);

            can_send_bms_core();
        }
    }

fault:
    gpio_set_pin(BMS_RELAY_LSD);
    gpio_set_pin(FAULT_LED);

    while (true);
}
