#include <avr/io.h>
#include <util/delay.h>

#define LED0 (PD6)

int main(void) {
    DDRD |= _BV(LED0);

    for (;;) {
        PORTD ^= _BV(LED0);

        _delay_ms(250);
    }
}
