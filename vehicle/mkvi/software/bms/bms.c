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
    gpio_set_pin(DEBUG_LED_1);

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
    // read all temperatures
    uint32_t ot = 0;
    uint32_t ut = 0;
    static uint16_t min_temp = 0;
    static uint16_t max_temp = UINT16_MAX;

    uint16_t pec_errors = 0;
    temperature_task(&ot, &ut, &min_temp, &max_temp, &pec_errors);

    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

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
    }
    
    if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
    }

    bms_debug.dbg_1 = ut;
    bms_debug.dbg_1 = ot;
}

int main(void) {
    hw_init();

    // Tracks the number of times the 10ms loop has been run
    uint8_t loop_counter = 0;

    while (true) {
        if (run_10ms) {
            can_send_bms_core();
            monitor_cells();
            // Only set the BMS relay LSD if no faults are present
            if (!check_fault_state()) {
                gpio_set_pin(BMS_RELAY_LSD);
            }
            
            can_send_bms_sense();
            can_send_bms_voltage();
            
            if (loop_counter == 50) {
              // can_send_bms_debug();
              can_send_bms_metrics();
            }


            // Untested
            // if (bms_core.bms_state == BMS_STATE_CHARGING) {
            //     if (loop_counter % 80 == 0) {
            //         can_send_charging_cmd();
            //     }
            // }

            loop_counter++;

            if (loop_counter == 100) {
              loop_counter = 0;
            }

            run_10ms = false;
        }
    }
}
