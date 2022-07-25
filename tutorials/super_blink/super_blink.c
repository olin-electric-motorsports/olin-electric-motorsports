#include "libs/can/api.h"
#include "libs/gpio/api.h"

#include <avr/interrupt.h>

#include "blink_config.h"

volatile bool run_blink = false;

void timer1_callback(void) {
    run_blink = true;
}

int main(void) {
    sei();
    can_init(BAUD_500KBPS);
    timer_init(&timer1_cfg);

    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);

    int timer_counter = 0;
    while (true) {
        if (run_blink) {
            timer_counter++;
            run_blink = false;

            // Blink LED2 30 Hz, so every interrupt callback
            gpio_toggle_pin(LED2);

            // Blink LED1 at 5 hz, once every 6/30 of a second
            if (timer_counter % 6 == 0) {
                gpio_toggle_pin(LED1);
            }

            // Send CAN message at 10hz, once every 3/30 of a second
            if (timer_counter % 3 == 0) {
                can_send(&super_blink_msg);
            }

            // Reset timer_counter if it has reached 30, once a second
            if (timer_counter == 30) {
                timer_counter = 0;
            }
        }
    }
}
