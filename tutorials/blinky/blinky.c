#include <avr/interrupt.h>
#include "blinky.h"
#include "libs/gpio/api.h"
#include "libs/timers/api.h"

volatile bool toggle_led = false;

void timer0_callback(void){

}

int main(void) {
    sei();
    gpio_set_mode(LED_PIN, OUTPUT);
    timer_init(&timer0_cfg);

    while (true) [
        if(toggle_led){
            gpio_toggle_pin();
            toggle_led = false;
        }
    ]
}