#include "blink_config.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#define TIMER_5HZ     (5)

static volatile bool run_blink_led0 = true;
uint8_t counter = 0;

void timer0_callback(void) {
    run_blink_led0 = true;
}

int main(void) {
    gpio_set_mode(LED0, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);

    timer_init(&timer0_cfg);

    sei();

    for (;;) {
        if (run_blink_led0) {
            gpio_toggle_pin(LED0);
            run_blink_led0 = false;
            counter++;
        }

        if (counter % TIMER_5HZ) {
            gpio_toggle_pin(LED1);
        }
    }
}