#include <avr/io.h>
#include <util/delay.h>

#include "config.h"
#include "libs/gpio/api.h"
#include "libs/uart/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t LED0 = PD5;
gpio_t LED1 = PD6;

int main(void) {
    gpio_set_mode(LED0, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);
    gpio_set_pin(LED1);

    for (;;) {
        gpio_toggle_pin(LED0);
        gpio_toggle_pin(LED1);
        _delay_ms(250);
    }
}
