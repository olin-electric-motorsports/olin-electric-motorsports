/* Atmega 16M1 Uart Library Implementation
 * All page numbers refer to
 * http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7647-Automotive-Microcontrollers-ATmega16M1-32M1-64M1-32C1-64C1_datasheet.pdf
 */
#include "libs/uart/api.h"
#include <avr/io.h>

void uart_init(uint16_t baudrate) {
    // pg 179, 191
    LINCR |= (1 << LENA) | 0x7; // Enable UART

    // Default samples per 8 bits of data
    // Samples each bit 8 times
    // pg 183-4,194
    LINBTR |= 0x20;

    // pg 183, 194; use 2nd eq on 183
    uint16_t cfg = ((F_CPU / 0x20) / baudrate) - 1;
    LINBRR = cfg;
}

char uart_getc(void) {
    // pg 182, 186 ,196

    while (!(LINSIR & 0x1)) {
        // wait
    }

    loop_until_bit_is_clear(LINSIR, LBUSY);

    return LINDAT;
}

void uart_putc(char c) {
    // pg 182, 186, 196
    loop_until_bit_is_clear(LINSIR, LBUSY);
    LINDAT = c;
}

void uart_puts(char* s) {
    while (*s) {
        uart_putc(*s);
        s++;
    }
}

int uart_gets(char* s, int len) {
    int ret = 0;
    char c;

    while ((c = uart_getc()) != '\n') {
        switch (c) {
            case '\x03': {
                // <C-c>
                ret = 0;
                uart_puts("\n");
                goto getout;
            }
            case '\x08':
            case '\x7F': {
                // backspace
                if (ret > 0) {
                    s--;
                    uart_puts("\b \b");
                }
                break;
            }
            case '\r': {
                // Enter key pressed, carriage return
                s[ret] = '\0';
                uart_puts("\r\n");
                break;
            }
            default: {
                if (ret == len) {
                    goto getout;
                }
                s[ret] = c;
                ret++;
                uart_putc(c);
                break;
            }
        }
    }

getout:
    s[ret] = '\0';
    return ret;
}
