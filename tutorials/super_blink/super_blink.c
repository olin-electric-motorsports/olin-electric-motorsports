#include "blink_config.h"

#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>

#include <stdint.h>

volatile int counter = 0;
volatile int blink = false;

void timer1_callback(void) {
    if (blink) {
        counter += 1;
    }
    blink = !blink;
}

int main(void) {
    sei();
    timer_init(&timer1_cfg);

    while (1) {
        if (blink) {
            if (counter == 5) {
                gpio_toggle_pin(DEBUG_LED_1);
                counter = 0;
            }
            gpio_toggle_pin(DEBUG_LED_2);
        }
    }
}
