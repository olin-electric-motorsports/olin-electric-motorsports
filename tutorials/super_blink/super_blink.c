#include "blink_config.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#define HW_TIMER_Hz     (30)
#define SW_TIMER_SCALER (6)

static volatile bool run_blink_led0 = true;
static volatile bool run_blink_led1 = true;
uint8_t counter = 0;

void timer0_callback(void) {
    run_blink_led0 = true;
}

void sw_timer_callback(void) {
    run_blink_led1 = true;
}

void sw_timer(void) {
    counter += 1;
    if (counter % (HW_TIMER_Hz / SW_TIMER_SCALER) == 0) {
        sw_timer_callback();
        counter = 0;
    }
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
            sw_timer();
        }

        if (run_blink_led1) {
            gpio_toggle_pin(LED1);
            run_blink_led1 = false;
        }
    }
}