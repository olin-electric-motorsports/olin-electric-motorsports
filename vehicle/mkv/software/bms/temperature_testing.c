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
#include "vehicle/mkv/software/bms/utils/can.h"
#include "vehicle/mkv/software/bms/utils/fault.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

enum State {
    INIT = 0,
    IDLE,
    DISCHARGING,
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

int main(void) {
    sei();

    can_init_bms();

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(RJ45_LEDO, OUTPUT);
    gpio_set_mode(RJ45_LEDG, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE1, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE2, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);
    gpio_set_mode(FAN_PWM, OUTPUT);

    gpio_set_pin(BMS_RELAY_LSD);

    gpio_enable_interrupt(nOCD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    adc_init();

    spi_init(&spi_cfg);

    timer_init(&timer0_cfg);
    timer_init(&timer1_fan_cfg);

    // Turn on GENERAL_LED to indicate checks will run
    gpio_set_pin(GENERAL_LED);

    // Check state of cells
    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    // Close the BMS shutdown circuit relay
    gpio_set_pin(BMS_RELAY_LSD);

    // Set up first receive of AIR Control and BMS charging messages
    can_receive_air_control_critical();
    can_receive_bms_charging();

    // Tracks the number of times the 10ms loop has been run

    while (true) {

        if (run_10ms) {
            uint32_t ov = 0;
            uint32_t uv = 0;
            
            uint16_t pack_voltage = 0;
            voltage_task(&pack_voltage, &ov, &uv);
            bms_core.pack_voltage = pack_voltage;
            
            can_send_bms_voltages();

            uint32_t ot = 0;
            uint32_t ut = 0;

            uint16_t pack_temperature = 0;
            temperature_task(&pack_temperature, &ot, &ut);

            can_send_bms_core();
            can_send_bms_debug();
            can_send_bms_temperatures();

            run_10ms = false;
        }
    }
}
