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
#include "vehicle/mkvi/software/bms/utils/fault.h"
#include "vehicle/mkvi/software/bms/utils/mux.h"

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
    gpio_set_pin(DEBUG_LED_2);
    gpio_set_pin(BMS_RELAY_LSD);

    gpio_set_mode(BSPD_CURRENT_THRESH, INPUT);

    adc_init();
    spi_init(&spi_cfg);
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);

    mux_init(NUM_ICS);

    can_init_bms();
    pcint0_callback();

    wakeup_sleep(NUM_ICS);
}

static void monitor_cells(void) {
    // Set a new fault
    // if (bms_core.bms_fault != BMS_FAULT_NONE) {
    //     bms_core.bms_state = BMS_STATE_FAULT;
    //     gpio_clear_pin(BMS_RELAY_LSD);
    // }

    // Handle condition where fault was cleared
    // TODO: also need to handle charging here
    if (bms_core.bms_state == BMS_STATE_FAULT
        && bms_core.bms_fault == BMS_FAULT_NONE) {
        bms_core.bms_state = BMS_STATE_ACTIVE;
    }

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    int rc = voltage_task(&pack_voltage, &ov, &uv);
    bms_core.pack_voltage = pack_voltage;

    // Check for PEC errors
    if (rc != 0) {
        bms_metrics.voltage_pec_error_count += rc;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = BMS_STATE_FAULT;
        }
        return;
    } else {
        bms_metrics.voltage_pec_error_count = 0;
    }

    // read all temperatures
    static uint32_t ot = 0;
    static uint32_t ut = 0;
    static uint16_t min_temp = 0;
    static uint16_t max_temp = UINT16_MAX;

    rc = temperature_task(&ot, &ut, &min_temp, &max_temp);
    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

    if (ut > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        bms_core.bms_state = BMS_STATE_FAULT;
        return;
    } else if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
        bms_core.bms_state = BMS_STATE_FAULT;
        return;
    }

    // Check for PEC errors
    if (rc != 0) {
        bms_metrics.temperature_pec_error_count += rc;

        if (bms_metrics.temperature_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = BMS_STATE_FAULT;
        }
        return;
    } else {
        bms_metrics.temperature_pec_error_count = 0;
    }

    // // Run BMS Chip open wire detection
    // rc = openwire_task();
    // if (rc != 0) {
    //     bms_core.bms_state = BMS_STATE_FAULT;
    //     return;
    // }

    // // read current
    // int16_t current = 0;
    // uint16_t vref = 0;
    // uint16_t vout = 0;
    // current_task(&current, &vref, &vout);
    // bms_core.pack_current = current;
    // bms_sense.current_vref = vref;
    // bms_sense.current_vout = vout;

    if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        bms_core.bms_state = BMS_STATE_FAULT;
    }

    // switch (bms_core.bms_state) {
    //     case BMS_STATE_ACTIVE: {
    //         if (uv > 0) {
    //             set_fault(BMS_FAULT_UNDERVOLTAGE);
    //             bms_core.bms_state = BMS_STATE_FAULT;
    //         }
    //     } break;
    //     case BMS_STATE_CHARGING: {
    //         if (can_poll_receive_charging_fbk() == 0) {
    //             uint8_t charger_status = charging_fbk_data[4];
    //             if (charger_status != 0) {
    //                 if ((charger_status & (1 << 3)) == 0) {
    //                 } else if ((charger_status & (1 << 2)) == 0) {
    //                 } else {
    //                     set_fault(BMS_FAULT_CHARGER_FAULT);
    //                 }
    //             }

    //             can_receive_charging_fbk();
    //         }
    //     } break;
    //     case BMS_STATE_FAULT: {
    //         gpio_clear_pin(BMS_RELAY_LSD);
    //         charging_cmd.max_voltage = 0;
    //         charging_cmd.max_current = 0;
    //         charging_cmd.enable = false;
    //     } break;
    //     default: {
    //         // shouldn't reach here. failsafe
    //         set_fault(BMS_FAULT_STATE_MACHINE);
    //         bms_core.bms_state = BMS_STATE_FAULT;
    //     } break;
    // }
}

int main(void) {
    hw_init();

    uint16_t loop_counter = 0;

    while (true) {
        if (run_10ms) {
            gpio_set_pin(BMS_RELAY_LSD);
            // wakeup_sleep(NUM_ICS);
            // LTC681x_wrcfg_trunc(NUM_ICS, cell_data.cells);
            monitor_cells();

            can_send_bms_core();
            can_send_bms_sense();
            // can_send_bms_metrics();

            //     // will run every 50 ms (20 Hz)
            //     if (loop_counter == 50) {
            //         loop_counter = 0;
            //         can_send_bms_debug();
            //     }

            //     // will run every 80 ms (12.5 Hz)
            //     if (bms_core.bms_state == BMS_STATE_CHARGING) {
            //         if (loop_counter % 80 == 0) {
            //             can_send_charging_cmd();
            //         }
            //     }

            loop_counter++;

            //     if (loop_counter == 400) {
            //         loop_counter = 0;
            //     }

            run_10ms = false;
        }
        if (loop_counter == 10) {
            gpio_toggle_pin(DEBUG_LED_2);
            loop_counter = 0;
        }
    }
}
