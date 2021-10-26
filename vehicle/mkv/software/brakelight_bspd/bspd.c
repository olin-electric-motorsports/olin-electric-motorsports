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

void timer0_callback(void) {
    send_can = true;
}

void brakelight_callback(void) {
    brakelight_activated = gpio_get_pin(BRAKELIGHT_GATE);
}

void shutdown_sense_callback(void) {
    shutdown_sense_activated = gpio_get_pin(SHUTDOWN_SENSE_BSPD);
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

    gpio_attach_interrupt(BRAKELIGHT_GATE, brakelight_callback);
    gpio_attach_interrupt(SHUTDOWN_SENSE_BSPD, shutdown_sense_callback);

    for (;;) {
        brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
        can_data_bspd[1] = brake_pressure;

        if (send_can) {
            can_send(&bspd_msg);
            send_can = false;
        }
    }
}
