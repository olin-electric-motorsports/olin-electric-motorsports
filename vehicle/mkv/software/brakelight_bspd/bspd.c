#include "bspd_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/brakelight_bspd/can_api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

volatile uint16_t brake_pressure = 0;
volatile bool send_can = false;

void timer0_callback(void) {
    send_can = true;
}

void pcint1_callback(void) {
    brakelight.brake_gate = !!gpio_get_pin(BRAKELIGHT_GATE);
    brakelight.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
    brakelight.status = !!gpio_get_pin(SHUTDOWN_SENSE_BSPD);
}

int main(void) {
    sei();
    can_init_brakelight_bspd();
    adc_init();
    timer_init(&timer0_cfg);

    gpio_set_mode(DEBUG_LED_1, OUTPUT);
    gpio_set_mode(DEBUG_LED_2, OUTPUT);
    gpio_set_mode(DEBUG_LED_3, OUTPUT);
    gpio_set_mode(RJ45_LED_G, OUTPUT);
    gpio_set_mode(RJ45_LED_O, OUTPUT);
    gpio_set_mode(BSPD_CURRENT_SENSE, INPUT);
    gpio_set_mode(SHUTDOWN_SENSE_BSPD, INPUT);

    gpio_enable_interrupt(BRAKELIGHT_GATE);
    gpio_enable_interrupt(SHUTDOWN_SENSE_BSPD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    pcint1_callback();

    for (;;) {
        if (send_can) {
            brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
            brakelight.brake_pressure = brake_pressure;
            can_send_brakelight();
            send_can = false;
        }
    }
}
