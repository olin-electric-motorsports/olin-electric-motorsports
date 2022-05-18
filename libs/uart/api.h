#include <stdbool.h>
#include <stdint.h>

/*
 * Initializes UART peripheral with the specified baudrate
 */
void uart_init(uint32_t baudrate);

/*
 * Returns a single character from the UART peripheral
 *
 * TODO
 *   How to deal with blocking or nonblocking? Do we need to?
 */
char uart_getc(void);

/*
 * Puts a single character over UART
 */
void uart_putc(char c);

/*
 * Puts a null-terminated string `s` over UART
 */
void uart_puts(char* s);

/*
 * Receives a new-line terminated string from UART and converts the new-line
 * '\n' to a null-terminater '\0'
 */
int uart_gets(char* s, int len);
