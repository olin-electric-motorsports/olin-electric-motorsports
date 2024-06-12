#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <stdbool.h>
#include <stdint.h>
#include <util/delay.h>

#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/tasks/tasks.h"
#include "vehicle/mkvi/software/bms/utils/cell_balancing.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"
#include "vehicle/mkvi/software/bms/utils/i2c_helpers.h"

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

/*
 * INTERRUPTS
 */
static volatile bool run_10ms = false;
void timer0_isr() {
    run_10ms = true;
}

void pcint0_callback() {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_THRESH);
}

void hw_init() {
    sei();

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(COOLING_PUMP_LSD, OUTPUT);
    gpio_set_mode(DEBUG_LED_1, OUTPUT);
    gpio_set_mode(DEBUG_LED_2, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE_IN, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE_OUT, OUTPUT);
    gpio_set_pin(DEBUG_LED_1);

    gpio_set_mode(BSPD_CURRENT_THRESH, INPUT);

    adc_init();
    spi_init(&spi_cfg);
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);

    can_init_bms();
    mux_init(NUM_ICS);

    pcint0_callback();

    can_receive_charging_fbk();

    wakeup_sleep(NUM_ICS);

    updater_init(BTLDR_ID, 5);
}

static void monitor_cells(void) {
    // read all temperatures
    static uint32_t ot = 0;
    static uint32_t ut = 0;
    static uint16_t min_temp = 0;
    static uint16_t max_temp = UINT16_MAX;

    uint16_t pec_errors = 0;
    temperature_task(&ot, &ut, &min_temp, &max_temp, &pec_errors);

    // Check for PEC errors
    if (pec_errors != 0) {
        bms_metrics.temperature_pec_error_count += pec_errors;

        if (bms_metrics.temperature_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
        }
    } else {
        bms_metrics.temperature_pec_error_count = 0;
    }

    // Check for undertemparature and overtemperature faults
    if (ut > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
    } else {
        // clear_fault(BMS_FAULT_UNDERTEMPERATURE);
    }

    if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
    } else {
        // clear_fault(BMS_FAULT_OVERTEMPERATURE);
    }
    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    pec_errors = 0;

    disable_cell_balancing();
    voltage_task(&pack_voltage, &ov, &uv, &pec_errors);
    enable_cell_balancing();
    bms_core.pack_voltage = pack_voltage;

    // read current
    int16_t current = 0;
    // current_task(&current);
    current = (adc_read(CURRENT_SENSE_VOUT) - 568) * 24;
    bms_core.pack_current = current;

    // Check for overcurrent fault
    if (current > CURRENT_THRESH) {
        set_fault(BMS_FAULT_OVERCURRENT);
    } else {
        // clear_fault(BMS_FAULT_OVERCURRENT);
    }

    // Check for PEC errors
    if (pec_errors != 0) {
        bms_metrics.voltage_pec_error_count += pec_errors;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
        }
    } else {
        bms_metrics.voltage_pec_error_count = 0;
        // clear_fault(BMS_FAULT_PEC);
    }

    // Check for undervoltage and overvoltage faults
    if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
    } else if (ov == 0) {
        // clear_fault(BMS_FAULT_OVERVOLTAGE);
    }

    if (uv > NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
    } else if (uv == NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS) {
        // clear_fault(BMS_FAULT_UNDERVOLTAGE);
    }
}

int main(void) {
    hw_init();

    // Tracks the number of times the 10ms loop has been run
    uint8_t loop_counter = 0;

    while (true) {
        if (run_10ms) {
            monitor_cells();
            if (!check_fault_state()) {
                gpio_set_pin(BMS_RELAY_LSD);
            } else {
                gpio_clear_pin(BMS_RELAY_LSD);
            }
            can_send_bms_core();
            can_send_bms_sense();

            if (loop_counter % 50 == 0) {
                // can_send_bms_debug();
                can_send_bms_metrics();
            }

            // Untested
            static uint16_t balancing_counter = 0;
            static bool balancing_cooldown = false;
            // bms_debug.dbg_2 = balancing_cooldown;
            can_send_bms_debug();
            if (balancing_cooldown) {
                if (balancing_counter % 250 == 0) { // 10s
                    balancing_cooldown = false;
                    // bms_debug.dbg_2 = balancing_cooldown;
                    can_send_bms_debug();
                    balancing_counter = 1;
                }
            }
            bms_core.bms_state = BMS_STATE_CHARGING; // TOOD: Remove later
            if (bms_core.bms_state == BMS_STATE_CHARGING) {
                if (loop_counter % 5 == 0) { // Every 200ms
                    if (balancing_counter % 300 == 0
                        && !balancing_cooldown) { // Every 60s
                        cell_balancing_task();
                        balancing_cooldown = true;
                        // bms_debug.dbg_2 = balancing_cooldown;
                        can_send_bms_debug();
                        balancing_counter = 1;
                    }
                    charging_cmd.target_voltage = 403;
                    charging_cmd.target_current = 5;
                    charging_cmd.enable_charging = true;
                    can_send_charging_cmd();
                    balancing_counter++;
                    // bms_debug.dbg_3 = balancing_counter;
                    can_send_bms_debug();
                }
            }

            loop_counter++;

            if (loop_counter == 1000) {
                loop_counter = 0;
            }
            updater_loop();

            run_10ms = false;
        }
    }
}
