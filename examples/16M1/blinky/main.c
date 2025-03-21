#include <util/delay.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t LED0 = PC5;
gpio_t IN = PB7;

int main(void) {
    gpio_set_mode(IN, INPUT);
    gpio_set_mode(LED0, OUTPUT);

    for (;;) {
        gpio_toggle_pin(LED0);
        _delay_ms(500);
    }
}
