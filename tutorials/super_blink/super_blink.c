#include "libs/timer/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "blink_config.h"

#include <avr/interrupt.h>

volatile uint8_t scaled_timer = 0;
volatile bool blink_first_LED = true;

void timer0_callback(void) {
    blink_first_LED = true;
}

int main(void) {
    sei();
    gpio_set_mode(LED_1, OUTPUT);
    gpio_set_mode(LED_2, OUTPUT);
    timer_init(&timer0_cfg);

    while(1) {
        if(blink_first_LED) {
            gpio_toggle_pin(LED_1);
            scaled_timer++;
        }
        if(scaled_timer % 6 == 0) {
            gpio_toggle_pin(LED_2);
            scaled_timer = 0;
        }
    }
}
