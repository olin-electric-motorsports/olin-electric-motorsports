#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <stdbool.h>

#include "vehicle/mkv/software/bms/bsp/bsp.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

/*
 * ic.system_open_wire is a 16 bit number. Each bit is an open wire (1: no
 * openwire, 0: openwire)
 */
#define NO_OPEN_WIRES \
    (65335) // ic.system_open_wire is a 16 bit number. Each
            // bit is an open wire (1: no openwire, 0: openwire)

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
    ACTIVE,
    CHARGING,
    FAULT,
};

enum FaultCode {
    FAULT_NONE = 0x00,
    FAULT_UNDERVOLTAGE,
    FAULT_OVERVOLTAGE,
    FAULT_UNDERTEMPERATURE,
    FAULT_OVERTEMPERATURE,
    FAULT_DIAGNOSTICS_FAIL,
    FAULT_OPEN_WIRE,
    FAULT_OVERCURRENT,
};

// Represents all of LTC6811 chips used in the BMS. Contains cell
// voltages, auxiliary readings (i.e. temperatures), and configs
cell_asic ICS[NUM_ICS];

uint16_t TEMPERATURES[NUM_TEMPERATURE_ICS][NUM_MUXES * NUM_MUX_CHANNELS];

// Array of mux addresses
const uint8_t MUXES[NUM_MUXES] = { LTC1380_MUX1, LTC1380_MUX2, LTC1380_MUX3 };

static void set_fault(enum FaultCode the_fault) {
    gpio_clear_pin(BMS_RELAY_LSD);

    if (bms_core.fault_state == FAULT_NONE) {
        bms_core.fault_state = the_fault;
    }
}

/*
 * Interrupt for nOCD
 */
void pcint0_callback(void) {
    bms_core.overcurrent_detect = !gpio_get_pin(nOCD);

    if (bms_core.overcurrent_detect) {
        set_fault(FAULT_OVERCURRENT);
    }
}

/*
 * Interrupt for BSPD_CURRENT_SENSE
 */
void pcint2_callback(void) {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
}

static void fan_enable(bool enable) {
    timer1_fan_cfg.channel_b.pin_behavior = enable ? TOGGLE : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the timer
    timer_init(&timer1_fan_cfg);
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

static void voltage_task(void) {
    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    // Blocks until all ADCs are done being read
    (void)LTC6811_pollAdc(); // Ignore return value because we don't care how
                             // long it took

    wakeup_idle(NUM_ICS);

    // Stores the voltages in the c_codes variable
    uint8_t error = LTC6811_rdcv(REG_ALL, NUM_ICS, ICS);

    if (error) {
        bms_metrics.voltage_pec_error_count += error;
        return;
    }

    uint16_t pack_voltage = 0;
    uint32_t uv = 0;
    uint32_t ov = 0;

    // Sum together all the voltages of the cells and check over/under voltage
    // conditions
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        /*
         * Sum of cells for a single IC
         *
         * The pins C5, C6, C11, and C12 are not connected to their own
         * cells, so we subtract them off
         */
        pack_voltage += ICS[ic].stat.stat_codes[0]
            - ICS[ic].cells.c_codes[4]
            - ICS[ic].cells.c_codes[5]
            - ICS[ic].cells.c_codes[10]
            - ICS[ic].cells.c_codes[11];

        // Odd bits of the ST register are used for undervoltage flags
        uv = (ICS[ic].stat.flags[0] & 0x55) | (ICS[ic].stat.flags[1] & 0x55)
             | (ICS[ic].stat.flags[2] & 0x55);

        // Even bits of the ST register are used for overvoltage flags
        ov = (ICS[ic].stat.flags[0] & 0xAA) | (ICS[ic].stat.flags[1] & 0xAA)
             | (ICS[ic].stat.flags[2] & 0xAA);

        if (uv > 0) {
            set_fault(FAULT_UNDERVOLTAGE);
        } else if (ov > 0) {
            set_fault(FAULT_OVERVOLTAGE);
        }
    }

    bms_core.pack_voltage = pack_voltage;
}

static void temperature_task(void) {
    uint8_t error = 0;
    int32_t cumulative_temperature = 0;

    for (uint8_t mux = 0; mux < NUM_MUXES; mux++) {
        // For each mux,
        for (uint8_t ch = 0; ch < NUM_MUX_CHANNELS; ch++) {
            // For each mux channel (ch)

            enable_mux(NUM_ICS, ICS, MUXES[mux], MUX_ENABLE, ch);

            // read aux gpio voltage (this is what the tmperature sensor is
            // connected to) for temperature
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

            // Wait for conversions to finish
            (void)LTC6811_pollAdc();

            // Read voltage from auxiliary pin (connected to the mux)
            error = LTC6811_rdaux(AUX_CH_GPIO1, NUM_ICS, ICS);

            if (error) {
                bms_metrics.temperature_pec_error_count += error;
                continue;
            }

            uint16_t temperature = 0;

            /*
             * temp_ic indexes the ICs that measure the temperature, so
             *   temp_ic = 0 := ic 1
             *   temp_ic = 1 := ic 3
             *   temp_ic = 2 := ic 5
             *   etc.
             */
            for (uint8_t temp_ic = 0; temp_ic < NUM_TEMPERATURE_ICS;
                 temp_ic += 1) {
                // Use 0 as the a_codes index for GPIO1 channel
                temperature = ICS[(temp_ic * 2) + 1].aux.a_codes[0];

                /*
                 * Store temperature [(mux * NUM_MUX_CHANNELS) + ch] indexes the
                 * channel of the mux. We store temperatures as a 2D array of
                 * ICS vs mux channels and use 24 as the number of mux channels
                 * (3 muxes, 8 channels each).
                 */
                uint16_t channel = (mux * NUM_MUX_CHANNELS) + ch;
                TEMPERATURES[temp_ic][channel] = temperature;
                cumulative_temperature += temperature;

                /*
                 * Using negative-temperature-coefficient (NTC) thermistors, so
                 * comparisons are reversed (i.e. less than over-temp threshold)
                 */
                if (temperature < OVERTEMPERATURE_THRESHOLD) {
                    set_fault(FAULT_OVERTEMPERATURE);
                }

                /*
                 * TODO: It would be good to have some buffer so the fans aren't
                 * pulsing on and off ever. This could be as simple as having a
                 * counter while the fan is on, and we keep the fan on for the
                 * duration of the counter, and once the counter is up, we check
                 * if the temperature is in safe range (lower than soft OT), we
                 * turn the fan off and keep checking.
                 */

                // If temperatures are getting a bit too high, we turn on the
                // fan
                if (temperature < SOFT_OVERTEMPERATURE_THRESHOLD) {
                    fan_enable(true);
                }

                if (temperature > SOFT_OVERTEMPERATURE_THRESHOLD) {
                    fan_enable(false);
                }

                if (temperature > UNDERTEMPERATURE_THRESHOLD) {
                    set_fault(FAULT_UNDERTEMPERATURE);
                }
            } // End for each IC

            /*
             * Compute average temperature. WARNING: truncates a 32 bit number
             * into a 16 bit number. This shouldn't be a problem, but the reader
             * should be aware that this is intentional. A 32 bit number is
             * needed to store the cumulative sum.
             */
            bms_core.temperature
                = (uint16_t)cumulative_temperature
                  / (NUM_MUXES * NUM_MUX_CHANNELS * NUM_TEMPERATURE_ICS);

        } // End for each mux channel
    } // End for each mux

    // Finally, disable all multiplexers
    enable_mux(NUM_ICS, ICS, MUX1, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, ICS, MUX2, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, ICS, MUX3, MUX_DISABLE, 0);
}

static void openwire_task(void) {
    // Run open wire test on all cells
    LTC6811_run_openwire_single(NUM_ICS, ICS);

    long open_wire;
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        open_wire = ICS[ic].system_open_wire;

        /*
         * If system_open_wire is 0xFFFF, there are no open wires. Otherwise,
         * the value is set to the first pin that has an open wire.
         */
        if (open_wire != NO_OPEN_WIRES) {
            set_fault(FAULT_OPEN_WIRE);
        }
    }
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

    if (bms_core.fault_state) {
        rc = 1;
        goto bail;
    }

    // read all temperatures
    temperature_task();

    if (bms_core.fault_state) {
        rc = 1;
        goto bail;
    }

    // check for open-circuit
    openwire_task();

    if (bms_core.fault_state) {
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
