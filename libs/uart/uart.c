/* Atmega 16M1 Uart Library Implementation
All page numbers refer to http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7647-Automotive-Microcontrollers-ATmega16M1-32M1-64M1-32C1-64C1_datasheet.pdf
*/
#include "libs/uart/api.h"
#include <avr/io.h>

void uart_init(uint16_t baudrate, bool use_interrupt) {
    // TODO: Implement
    (void)use_interrupt;
    
    // pg 179, 191
    LINCR |= (1 << LENA) | 0x7; // Enable UART
    // Default samples per 8 bits of data
    // Samples each bit 8 times
    // pg 183-4,194
    LINBTR |= 0x20; 
    // pg 183, 194; use 2nd eq on 183
    int cfg = ((F_CPU/0x20) / baudrate) - 1;
    LINBRRL = (cfg & 0xFF);
    LINBRRH = (cfg >> 8 & 0x0F);    
}

char uart_getchar(void) {
    // pg 182, 186 ,196
    loop_until_bit_is_clear(LINSIR, LBUSY);
    char c = LINDAT;
    return c;
}

void uart_putchar(char c) {
    // pg 182, 186, 196
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
