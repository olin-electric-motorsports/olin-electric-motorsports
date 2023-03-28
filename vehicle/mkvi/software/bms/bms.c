#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <stdbool.h>
#include <stdint.h>

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/tasks/tasks.h"
#include "vehicle/mkv/software/bms/utils/mux.h"
#include "vehicle/mkvi/software/bms/can_api.h"

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
    
    gpio_set_mode(BSPD_CURRENT_THRESH, INPUT);

    adc_init();
    spi_init(&spi_cfg);
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);
}

static int initial_checks(void) {
    int rc = 0;

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;
    uint8_t retry = 0;

    do {
        uint16_t pack_voltage = 0;
        rc = voltage_task(&pack_voltage, &ov, &uv);
        bms_core.pack_voltage = pack_voltage;
        bms_metrics.voltage_pec_error_count += rc;

        if (retry >= MAX_PEC_RETRY) {
            rc = 1;
            set_fault(BMS_FAULT_PEC);
            return rc;
        } else {
            retry++;
        }
    } while (rc != 0);

    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
        rc = 1;
        return rc;
    } else if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        rc = 1;
        return rc;
    }

    // read all temperatures
    uint32_t ot = 0;
    uint32_t ut = 0;
    int16_t min_temp, max_temp;

    for (uint16_t i = 0; i < NUM_MUXES * NUM_MUX_CHANNELS; i++) {
        rc = temperature_task(&ot, &ut, &min_temp, &max_temp);
        bms_metrics.temperature_pec_error_count += rc;
    }

    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;
}

static void run_bms_loop(void) {
    if (bms_core.bms_fault != BMS_FAULT_NONE) {
        bms_core.bms_state = BMS_STATE_FAULT;
        gpio_clear_pin(BMS_RELAY_LSD);
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

        if bms_metrics.voltage_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = BMS_STATE_FAULT;
        }
        return;
    } else {
        bms_metrics.voltage_pec_error_count = 0;
    }

    // read all temperatures
    uint32_t ot = 0;
    uint32_t ut = 0;
    int16_t min_temp, max_temp;

    rc = temperature_task(&ot, &ut, &min_temp, &max_temp);
    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

    // Check for PEC errors
    if (rc != 0) {
        bms_metrics.temperature_pec_error_count += rc;

        if bms_metrics.temperature_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = BMS_STATE_FAULT;
        }
        return;
    } else {
        bms_metrics.temperature_pec_error_count = 0;
    }

    // TODO: Open wire detection
    
    // read current
    int16_t current = 0;
    uint16_t vref = 0;
    uint16_t vout = 0;
    current_task(&current, &vref, &vout);
    bms_core.pack_current = current;
    bms_sense.current_vref = vref;
    bms_sense.current_vout = vout;

    if (ut > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        bms_core.bms_state = BMS_STATE_FAULT;
        return;
    } else if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
        bms_core.bms_state = BMS_STATE_FAULT;
        return;
    }

    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
        bms_core.bms_state = BMS_STATE_FAULT;
    } else if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        bms_core.bms_state = BMS_STATE_FAULT;
    }
}

int main(void) {
    hw_init();
    can_init_bms();

    if (initial_checks() != 0) {
        bms_core.state = BMS_STATE_FAULT;
    } else {
        bms_core.state = BMS_STATE_IDLE;
        gpio_set_pin(BMS_RELAY_LSD);
    }

    can_send_bms_core();
    can_send_bms_sense();

    while (true) {
        if (run_10ms) {
            can_send_bms_core();
            can_send_bms_sense();

            run_bms_loop();

            run_10ms = false;
        }
    }
}
