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
#include "vehicle/mkv/software/bms/utils/fault.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

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

enum State {
    ACTIVE = 0,
    CHARGING,
    FAULT,
};

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
}

/*
 * Interrupt for BSPD_CURRENT_SENSE
 */
void pcint2_callback(void) {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
}

/*
 * Primary state machine function
 */
static void monitor_cells(void) {
    if (bms_core.bms_fault_state != BMS_FAULT_NONE) {
        bms_core.bms_state = FAULT;
        gpio_clear_pin(BMS_RELAY_LSD);
    }

    /*
     * Read voltages
     */
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    int rc = voltage_task(&pack_voltage, &ov, &uv);
    bms_core.pack_voltage = pack_voltage;

    if (rc) {
        bms_metrics.voltage_pec_error_count += rc;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_IN_A_ROW) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = FAULT;
        }
        return;
    } else {
        bms_metrics.voltage_pec_error_count = 0;
    }

    /*
     * Read temperatures
     */
    uint32_t ot = 0;
    uint32_t ut = 0;
    int16_t min_temp, max_temp;

    // uint16_t pack_temperature;
    rc = temperature_task(&ot, &ut, &min_temp, &max_temp);

    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

    if (ut > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        bms_core.bms_state = FAULT;
        return;
    } else if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
        bms_core.bms_state = FAULT;
        return;
    }

    /*
     * Check for PEC errors
     */
    if (rc) {
        bms_metrics.temperature_pec_error_count += rc;

        if (bms_metrics.temperature_pec_error_count >= MAX_PEC_IN_A_ROW) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = FAULT;
        }
    } else {
        bms_metrics.temperature_pec_error_count = 0;
    }

    /*
     * Check for open-wires
     */
    // TODO: rc = openwire_task();

    int16_t current = 0;
    uint16_t vref = 0;
    uint16_t vout = 0;

    current_task(&current, &vref, &vout);

    bms_core.pack_current = current;
    bms_sense.current_vref = vref;
    bms_sense.current_vout = vout;

    if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        bms_core.bms_state = FAULT;
    }

    switch (bms_core.bms_state) {
        case ACTIVE: {
            if (uv > 0) {
                set_fault(BMS_FAULT_UNDERVOLTAGE);
                bms_core.bms_state = FAULT;
            }
        } break;
        case CHARGING: {
            if (can_poll_receive_charging_fbk() == 0) {
                /*
                 * Read status flags
                 */
                uint8_t charger_status = charging_fbk_data[4];
                if (charger_status != 0) {
                    if ((charger_status & (1 << 3)) == 0) {
                    } else if ((charger_status & (1 << 2)) == 0) {
                    } else {
                        set_fault(BMS_FAULT_CHARGER_FAULT);
                    }
                }

                can_receive_charging_fbk();
            }
        } break;
        case FAULT: {
            gpio_clear_pin(BMS_RELAY_LSD);
            charging_cmd.max_voltage = 0;
            charging_cmd.max_current = 0;
            charging_cmd.enable = false;
        } break;
        default: {
            bms_core.bms_fault_state = BMS_FAULT_DIAGNOSTICS_FAIL;
            bms_core.bms_state = FAULT;
        } break;
    }
}

int main(void) {
    sei();

    can_init_bms();
    updater_init(BTLDR_ID, 5);

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(RJ45_LEDO, OUTPUT);
    gpio_set_mode(RJ45_LEDG, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);
    gpio_set_mode(FAN_PWM, OUTPUT);

    gpio_set_mode(CHARGER_DETECT_OUT, OUTPUT);
    gpio_clear_pin(CHARGER_DETECT_OUT);

    gpio_set_mode(CHARGER_DETECT_IN, INPUT);
    gpio_set_pin(CHARGER_DETECT_IN); // Enable pullup

    gpio_set_mode(nOCD, INPUT);
    gpio_set_mode(BSPD_CURRENT_SENSE, INPUT);

    gpio_enable_interrupt(nOCD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    adc_init();

    timer_init(&timer0_cfg);
    timer_init(&timer1_fan_cfg);

    // Turn on GENERAL_LED to indicate checks will run
    gpio_set_pin(GENERAL_LED);

    pcint0_callback();
    pcint2_callback();

    if (!!gpio_get_pin(CHARGER_DETECT_IN) == 0) {
        bms_core.bms_state = CHARGING;
        bms_core.charger_connected = true;
        charging_cmd.max_voltage = 0;
        charging_cmd.max_current = 0;
        charging_cmd.enable = true;
        can_receive_charging_fbk();
    } else {
        bms_core.bms_state = ACTIVE;
    }

    spi_init(&spi_cfg);

    gpio_set_pin(BMS_RELAY_LSD);

    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    // Tracks the number of times the 10ms loop has been run
    uint8_t loop_counter = 0;

    while (true) {
        updater_loop(); // TODO: Can we always update BMS?

        if (run_10ms) {
            can_send_bms_core();
            can_send_bms_sense();
            can_send_bms_metrics();
            monitor_cells();

            // Every 500ms send sensing and debug data
            if (loop_counter == 50) {
                can_send_bms_debug();
                can_send_bms_metrics();
            }

            if (bms_core.bms_state == CHARGING) {
                if (loop_counter % 80 == 0) {
                    can_send_charging_cmd();
                }
            }

            loop_counter++;

            if (loop_counter == 100) {
                loop_counter = 0;
            }

            run_10ms = false;
        }
    }
}
