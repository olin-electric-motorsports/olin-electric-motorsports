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

#include "vehicle/mkvii/software/bms/bms_config.h"
#include "vehicle/mkvii/software/bms/can_api.h"
#include "vehicle/mkvii/software/bms/tasks/tasks.h"
#include "vehicle/mkvii/software/bms/utils/cell_balancing.h"
#include "vehicle/mkvii/software/bms/utils/fault.h"
#include "vehicle/mkvii/software/bms/utils/i2c_helpers.h"

<<<<<<< HEAD
// #include "projects/btldr/btldr_lib.h"
// #include "projects/btldr/git_sha.h"
// #include "projects/btldr/libs/image/api.h"
=======
#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"
>>>>>>> rishit/final-bms

/*
 * Required for btldr
 */
<<<<<<< HEAD
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };
=======
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};
>>>>>>> rishit/final-bms

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

<<<<<<< HEAD
=======
#define MAX_TEMPATURE_FAN (50)
#define MIN_TEMPERATURE_FAN (20)

void cooling_fan_control(uint16_t* max_temp) {
    uint16_t duty_cycle;
    uint16_t range = MAX_TEMPATURE_FAN - MIN_TEMPERATURE_FAN;
    if (*max_temp >= MAX_EXTRANEOUS_TEMPERATURES) {
        duty_cycle = 1023;
    } else if (*max_temp < MIN_TEMPERATURE_FAN) {
        duty_cycle = 0;
    } else {
        duty_cycle = (*max_temp - MIN_TEMPERATURE_FAN) * 1023 / range; 
    }

    OCR1B = duty_cycle;
}

>>>>>>> rishit/final-bms
void hw_init() {
    sei();

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(COOLING_PUMP_LSD, OUTPUT);
    gpio_set_mode(DEBUG_LED_1, OUTPUT);
    gpio_set_mode(DEBUG_LED_2, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE_IN, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE_OUT, OUTPUT);
<<<<<<< HEAD
=======
    gpio_set_mode(COOLING_PUMP_PWM, OUTPUT);
>>>>>>> rishit/final-bms

    gpio_set_pin(COOLING_PUMP_LSD);
    

    gpio_set_mode(BSPD_CURRENT_THRESH, INPUT);

    adc_init();
    spi_init(&spi_cfg);
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);

    can_init_bms();
    mux_init(NUM_ICS);

    pcint0_callback();

    // can_receive_charging_fbk();
  
    wakeup_sleep(NUM_ICS);

    cell_balancing_init();


<<<<<<< HEAD
    // updater_init(BTLDR_ID, 5);
=======
    updater_init(BTLDR_ID, 5);
>>>>>>> rishit/final-bms
    gpio_set_pin(DEBUG_LED_1);
    
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
        clear_fault(BMS_FAULT_UNDERTEMPERATURE);
    }

    if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
    } else {
        clear_fault(BMS_FAULT_OVERTEMPERATURE);
    }
<<<<<<< HEAD
    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;
    uint16_t loop_count = 0;

    uint16_t pack_voltage = 0;
    pec_errors = 0;
    voltage_task(&pack_voltage, &ov, &uv, &pec_errors, &loop_count);
=======

    cooling_fan_control(&max_temp);

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    pec_errors = 0;
    voltage_task(&pack_voltage, &ov, &uv, &pec_errors);
>>>>>>> rishit/final-bms
    bms_core.pack_voltage = pack_voltage;

    // read current
    int16_t current = 0;
<<<<<<< HEAD
    //current_task(&current);
    current = (adc_read(CURRENT_SENSE_VOUT) - 568) * 24;
    bms_core.pack_current = current;

    // openwire_task();

=======
    current_task(&current);
    current = (adc_read(CURRENT_SENSE_VOUT) - 568) * 24;
    bms_core.pack_current = current;

>>>>>>> rishit/final-bms
    // Check for overcurrent fault
    if (current > CURRENT_THRESH) {
        set_fault(BMS_FAULT_OVERCURRENT);
    } else {
        clear_fault(BMS_FAULT_OVERCURRENT);
    }

    // Check for PEC errors
    if (pec_errors != 0) {
        bms_metrics.voltage_pec_error_count += pec_errors;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_ERROR_COUNT) {
            set_fault(BMS_FAULT_PEC);
        }
    } else {
        bms_metrics.voltage_pec_error_count = 0;
        clear_fault(BMS_FAULT_PEC);
    }

    // Check for undervoltage and overvoltage faults
    if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
    } else if (ov == 0) {
        clear_fault(BMS_FAULT_OVERVOLTAGE);
    }

<<<<<<< HEAD
    if (uv > NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS && loop_count > UNDERVOLTAGE_LOOP_THRESHOLD) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
    } else if (uv == NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS || loop_count <= UNDERVOLTAGE_LOOP_THRESHOLD) {
=======
    if (uv > NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
    } else if (uv == NUM_UNUSED_VOLTAGE_CHANNELS * NUM_ICS) {
>>>>>>> rishit/final-bms
        clear_fault(BMS_FAULT_UNDERVOLTAGE);
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
                can_send_bms_debug();
                can_send_bms_metrics();
            }

<<<<<<< HEAD
            if (bms_core.bms_state == BMS_STATE_CHARGING) {
                if (loop_counter % 5 == 0) {
                    charging_cmd.target_voltage = 403;
                    charging_cmd.target_current = 5;
                    charging_cmd.enable_charging = false;
                    can_send_charging_cmd();
                }
            }
=======
            charging_cmd.target_voltage = 403;
            charging_cmd.target_current = 5;
            charging_cmd.enable_charging = false;
            can_send_charging_cmd();
>>>>>>> rishit/final-bms

            loop_counter++;

            if (loop_counter == 1000) {
                loop_counter = 0;
            }
<<<<<<< HEAD
            // updater_loop();
=======
            updater_loop();
>>>>>>> rishit/final-bms

            run_10ms = false;
        }
    }
}
