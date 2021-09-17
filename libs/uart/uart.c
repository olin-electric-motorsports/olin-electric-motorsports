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
    // Unimplemented!
    return '\0';
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

void uart_gets(char* s) {
    // Unimplemented!
}
