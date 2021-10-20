#include <avr/io.h>
#include <util/delay.h>

#include "config.h"
#include "libs/gpio/api.h"
#include "libs/uart/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t LED0 = PD5;
gpio_t LED1 = PD6;
gpio_t LED_EXT = PB7;
gpio_t BUTTON = PB5;

void toggle(void) {
    gpio_toggle_pin(LED_EXT);
}

int main(void) {
    gpio_set_mode(LED0, OUTPUT);
    gpio_set_mode(LED_EXT, OUTPUT);

    gpio_attach_interrupt(BUTTON, &toggle);

    for (;;) {
        gpio_toggle_pin(LED0);
        // gpio_toggle_pin(LED_EXT);
        _delay_ms(250);
    }
}
