#include <avr/interrupt.h>
#include <stdbool.h>

#include "libs/gpio/api.h"
#include "vehicle/mkv/software/bms/bsp.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

/* TODO
 *   State machine
 *     INIT
 *     IDLE: Maybe if the car is off but the board is powered?
 *     ACTIVE
 *     CHARGING
 *     FAULT
 *   Do not do BMS if car is off (TS off? LV off?)
 */

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

// Array of mux addresses
uint8_t MUXES[3] = { MUX1, MUX2, MUX3 };

static void set_fault(enum fault_code the_fault) {
    gpio_clear_pin(BMS_RELAY_LSD);

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

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // Configure over/undervoltage thresholds for each chip
        LTC6811_set_cfgr_uv(ic, ICS, UNDERVOLTAGE_THRESHOLD);
        LTC6811_set_cfgr_ov(ic, ICS, OVERVOLTAGE_THRESHOLD);
    }

    // Write the configured values to the chips
    LTC6811_wrcfg(NUM_ICS, ICS);
}

void voltage_task(void) {
    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    // Blocks until all ADCs are done being read
    (void)LTC6811_pollAdc(); // Ignore return value because we don't care how
                             // long it took

    wakeup_idle(NUM_ICS);

    // Stores the voltages in the c_codes variable
    int error = LTC6811_rdcv(SEL_ALL_REG, NUM_ICS, ICS);

    // TODO
    if (error) {
        metrics.cell_pec_errors++;
        // Do something
    }

    uint16_t pack_voltage = 0;
    uint32_t uv = 0;
    uint32_t ov = 0;

    // Sum together all the voltages of the cells and check over/under voltage
    // conditions
    for (uint8_t ic; ic < NUM_ICS; ic++) {
        pack_voltage += ICS[ic].stat.stat_codes[0];

        // Odd bits of the ST register are used for undervoltage flags
        uv = (ICS[ic].st.flags[0] & 0x55)
             | (ICS[ic].st.flags[1] & 0x55)
             | (ICS[ic].st.flags[2] & 0x55);

        // Even bits of the ST register are used for overvoltage flags
        ov = (ICS[ic].st.flags[0] & 0xAA)
             | (ICS[ic].st.flags[1] & 0xAA)
             | (ICS[ic].st.flags[2] & 0xAA);

        if (uv > 0) {
            set_fault(FAULT_UNDERVOLTAGE);
        } else if (uv > 0) {
            set_fault(FAULT_OVERVOLTAGE);
        }
    }

    bms_core.pack_voltage = pack_voltage;
}

void temperature_task(void) {
    uint8_t error = 0;

    for (uint8_t mux = 0; mux < NUM_MUXES; mux++) {
        // For each mux,
        for (uint8_t ch = 0; ch < NUM_MUX_CHANNELS; ch++) {
            configure_mux(NUM_ICS, ICS, MUXES[mux], true, ch);

            // read aux gpio voltage for temperature
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);
            (void)LTC6811_pollAdc();

            int error = LTC6811_rdaux(AUX_CH_ALL, NUM_ICS, ICS);

            // TODO
            if (error) {
                metrics.cell_pec_errors++;
                // Do something
            }

            uint32_t temperature = 0;

            for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
                // Use 0 as the a_codes index for GPIO1 channel
                temperature = ICS[ic].aux.a_codes[0];

                // Using negative-temperature-coefficient (NTC) thermistors, so
                // comparisons are reversed
                if (temperature < OVERTEMPERATURE_THRESHOLD) {
                    set_fault(FAULT_OVERTEMPERATURE);
                } else if (temperature > UNDERTEMPERATURE_THRESHOLD) {
                    set_fault(FAULT_UNDERTEMPERATURE);
                }
            }

            bms_core.temperature = temperature_voltage;
        }
    }

    // Finally, disable all multiplexers
    configure_mux(NUM_ICS, ICS, MUX1, false, 0);
    configure_mux(NUM_ICS, ICS, MUX2, false, 0);
    configure_mux(NUM_ICS, ICS, MUX3, false, 0);
}

void openwire_task(void) {
    // Run open wire test on all cells
    LTC6811_run_openwire_single(NUM_ICS, ICS);

    long open_wire;
    for (uint8_t ic; ic < NUM_ICS; ic++) {
        open_wire = ICS[ic].system_open_wire;
    }
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
    // TODO: Unless charging
    gpio_set_pin(BMS_RELAY_LSD);

    sei();

    while (true) {
        // Tracks the number of times the 10ms loop has been run
        uint8_t loop_counter = 0;

        if (run_10ms) {
            wakeup_sleep(NUM_ICS);

            voltage_task();
            temperature_task();
            openwire_task();

            can_send_bms_core();

            if (loop_counter == 25) {
                // Occurs at 4Hz, every 250ms
                can_send_bms_voltages();
                can_send_bms_temperatures();

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
