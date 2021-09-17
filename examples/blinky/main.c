#include "libs/uart/api.h"
#include <avr/io.h>
#include <util/delay.h>

#define LED0 (PD6)

int main(void) {
    DDRD |= _BV(LED0);
    uart_init(9600, false);

    for (;;) {
        PORTD ^= _BV(LED0);

        uart_puts("This is a string\n");

        _delay_ms(250);
    }
}
