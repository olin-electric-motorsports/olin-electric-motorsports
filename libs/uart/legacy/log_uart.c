#include "log_uart.h"

#define __LOG_NEED_DATA ((uint8_t) 0)

uint8_t __LOG_UART_COMM;
uint8_t __LOG_UART_DATA;

//char uart_buffer[1024]  ="";

ISR(LIN_TC_vect) {
    // Check to see if we need the data
    if (bit_is_set(__LOG_UART_COMM, __LOG_NEED_DATA)) {
        // Get the data
        __LOG_UART_DATA = LINDAT;

        // Unset the "need data" bit, which will unblock
        // our reader
        __LOG_UART_COMM &= ~_BV(__LOG_NEED_DATA);
    }
}

void LOG_init(void) {
    // TX is MOSI_A (PD3)
    // RX is SCK_A (PD4)

    // Enable UART & Tx/Rx
    LINCR |= _BV(LENA) | 0b111;

    // Set the baud rate to 9600
    LINBRR = 0x0C;

    // Enable interrupt on received data only
    LINENIR |= _BV(LENRXOK);

    // Default our globals
    __LOG_UART_COMM = 0;
}

void LOG_chr(char data) {
    loop_until_bit_is_clear(LINSIR, LBUSY);
    LINDAT = data;
}

void LOG_println(char *data, uint8_t data_len) {
    // Send our data
    for (int i=0; i < data_len; i++) {
        loop_until_bit_is_clear(LINSIR, LBUSY);
        LINDAT = (uint8_t) data[i];
    }

    // Send a newline
    loop_until_bit_is_clear(LINSIR, LBUSY);
    LINDAT = 0xa;

    // Send a return-carriage
    loop_until_bit_is_clear(LINSIR, LBUSY);
    LINDAT = 0xd;
}

uint8_t LOG_block_read(void) {
    // Set our "need data" bit so that the interrupt
    // knows to log data
    __LOG_UART_COMM |= _BV(__LOG_NEED_DATA);

    // Wait until an interrupt logs the data and clears our
    // blocking bit
    loop_until_bit_is_clear(__LOG_UART_COMM, __LOG_NEED_DATA);

    // Return the data
    return __LOG_UART_DATA;
}
