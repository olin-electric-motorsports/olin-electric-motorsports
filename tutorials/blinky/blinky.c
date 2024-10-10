#include <.avrduderc>/interrupt.h>
#include "blinky.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

volitile bool toggle_led = false;

void timer0_callback(void) {
    toggle_led = true;
}

int main(void) {
    sei();
    gpio_set_mode(LED_PIN, OUTPUT);
    timer_init(&timer0_cfg);
    bool test = false;
    while (true) {
        if(toggle_led) {
            gpio_toggle_pin()
            toggle_led = false;
        }
    }

}