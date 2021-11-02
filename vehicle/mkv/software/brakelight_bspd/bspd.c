#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "config.h"
#include "libs/gpio/api.h"

#include <stdbool.h>
#include <stdint.h>

volatile uint16_t brake_pressure = 0;
volatile bool send_can = false;

volatile uint8_t shutdown_sense_activated = 0;
volatile uint8_t brakelight_activated = 0;
volatile uint8_t bspd_current_sense = 0;

void timer0_callback(void) {
    send_can = true;
}

void pcint1_callback(void) {
    brakelight_activated = gpio_get_pin(BRAKELIGHT_GATE);
    can_data_bspd[3] = brakelight_activated ? 0xFF : 0x00;

    bspd_current_sense = gpio_get_pin(BSPD_CURRENT_SENSE);
    can_data_bspd[4] = (bspd_current_sense) ? 0xFF : 0x00;

    shutdown_sense_activated = gpio_get_pin(SHUTDOWN_SENSE_BSPD);
    can_data_bspd[0] = (shutdown_sense_activated) ? 0xFF : 0x00;
}

int main(void) {
    sei();
    can_init(BAUD_500KBPS);
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
        brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);

        if (send_can) {
            can_data_bspd[1] = (uint8_t)((brake_pressure & 0xFF00) >> 8);
            can_data_bspd[2] = (uint8_t)brake_pressure & 0xFF;
            bspd_msg.data = can_data_bspd;
            can_send(&bspd_msg);
            send_can = false;
        }
    }
}
