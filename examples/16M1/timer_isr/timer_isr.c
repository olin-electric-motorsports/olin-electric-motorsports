#include "timer_isr.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

volatile bool toggle_led = false;

void timer0_callback(void) {
    toggle_led = true;
}

int main(void) {
    sei();
    gpio_set_mode(LED_PIN, OUTPUT);
    timer_init(&timer0_cfg);
    while (true) {
        if(toggle_led) {
            gpio_toggle_pin(LED_PIN);
            toggle_led = false;
        }
    }

}
