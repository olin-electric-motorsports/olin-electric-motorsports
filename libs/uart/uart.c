#include "libs/uart/api.h"
#include <avr/io.h>

void uart_init(uint16_t baudrate, bool use_interrupt) {
    // TODO: Implement
    (void)baudrate;
    (void)use_interrupt;

    LINCR |= (1 << LENA) | 0x7; // Enable UART
    LINBRR = 0x0C;
}

char uart_getchar(void) {
    loop_until_bit_is_clear(LINSIR, LBUSY);
    char c = LINDAT;
    return c;
}

void uart_putchar(char c) {
    loop_until_bit_is_clear(LINSIR, LBUSY);
    LINDAT = c;
}

void uart_puts(char* s) {
    while (*s) {
        uart_putchar(*s);
        s++;
    }
}

void uart_gets(char* s, int size) {
    char c = 0;

    for (int i = 0; i < size; i++) {
        while (!(LINSIR & 0x1)) {
            // wait
        }

        loop_until_bit_is_clear(LINSIR, LBUSY);
        c = LINDAT;

        s[i] = c;

        loop_until_bit_is_clear(LINSIR, LBUSY);
        uart_putchar(c);

        if (c == '\n') {
            s[i] = '\0';
            break;
        }
    }

    s[size - 1] = '\0';
}
