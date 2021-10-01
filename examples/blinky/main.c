#include <util/delay.h>
#include <avr/io.h>
#include "libs/gpio/api.h"
#include "libs/uart/api.h"
#include "config.h"

gpio_t LED0 = {
    .num = PB0,
    .ddr = DDRB,
    .port = PORTB,
    .pin = PINB,
};

int main(void) {
    gpio_set_mode(LED0, OUTPUT);

    for (;;) {
        gpio_toggle_pin(LED0);
        _delay_ms(250);
    }
}
