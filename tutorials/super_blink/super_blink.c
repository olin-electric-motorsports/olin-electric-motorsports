#include "blink_config.h"
#include <avr/interrupt.h>
#include <stdbool.h>

static volatile bool blink0 = false;
static volatile int blink1 = 1;
static volatile int can = 1;

void timer0_callback(void) {
    blink0 = true;
    blink1++;
    can++;
}

int main(void) {
    gpio_set_mode(LED0, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);
    timer_init(&timer0_cfg);

    sei();

    while (true) {
        if (blink0) {
            gpio_toggle_pin(LED0);
            blink0 = false;
        }
        if (blink1 == 6) {
            gpio_toggle_pin(LED1);
            blink1 = 1;
        }
        if(can == 3) {
            /* TODO */
        }
    }
}