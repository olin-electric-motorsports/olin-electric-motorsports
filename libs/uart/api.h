#include <stdbool.h>
#include <stdint.h>

/*
 * Initializes UART peripheral with the specified baudrate
 *
 * If use_interrupt is true, UART receive interrupts will be enabled and the ISR
 * will be available using:
 *
 * TODO handle ISR and other bitrates (not just 9600)
 */
void uart_init(uint16_t baudrate, bool use_interrupt);

/*
 * Returns a single character from the UART peripheral
 *
 * TODO
 *   How to deal with blocking or nonblocking? Do we need to?
 */
char uart_getchar(void);

/*
 * Puts a single character over UART
 */
void uart_putchar(char c);

/*
 * Puts a null-terminated string `s` over UART
 */
void uart_puts(char* s);

/*
 * Receives a new-line terminated string from UART and converts the new-line
 * '\n' to a null-terminater '\0'
 */
void uart_gets(char* s);
