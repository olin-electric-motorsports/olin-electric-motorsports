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
    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    uint16_t pec_errors = 0;
    voltage_task(&pack_voltage, &ov, &uv, &pec_errors);
    bms_core.pack_voltage = pack_voltage;

    // Check for PEC errors
    if (pec_errors != 0) {
        bms_metrics.voltage_pec_error_count += pec_errors;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
        }
        return;
    } else {
        bms_metrics.voltage_pec_error_count = 0;
    }

    // Check for undervoltage and overvoltage faults
    if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
    }
    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
    }
}

int main(void) {
    hw_init();

    while (true) {
        if (run_10ms) {
            monitor_cells();
            // Only set the BMS relay LSD if no faults are present
            if (!check_fault_state()) {
                gpio_set_pin(BMS_RELAY_LSD);
            }
            can_send_bms_core();
            can_send_bms_sense();
            run_10ms = false;
        }
    }
}
