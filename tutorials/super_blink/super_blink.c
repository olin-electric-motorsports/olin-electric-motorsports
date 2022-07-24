#include "blink_config.h"
#include <avr/interrupt.h>
#include <stdbool.h>

static volatile uint8_t counter = 0;
static volatile bool run_blink_30Hz = true;

void timer_callback_30Hz(void) {
    run_blink_30Hz = true;
}

int main(void) {
    // set up LEDs
    gpio_set_mode(LED_5Hz, OUTPUT);
    gpio_set_mode(LED_30Hz, OUTPUT);
    timer_init(&timer_cfg_30Hz);

    sei(); // globally enable interrupts

    for (;;) {
        if (run_blink_30Hz){
            gpio_toggle_pin(LED_30Hz);
            counter++; // count up

        }
        if ((counter % 6) == 0){
            // 5Hz is every 6th of 30Hz
            gpio_toggle_pin(LED_5Hz);
            counter = 0;
        }
    }
}
