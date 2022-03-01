#include "libs/uart/api.h"
#include <stdbool.h>
#include <string.h>
#include <avr/io.h>

void invalid_input(void){
    /*
     * Displays a message when user input is invalid
     */
    uart_puts("Unrecognized command: enter a valid command\r\n");
}

void handle_gpio(char str[256], char *token, const char s[2]){
    /*
     * Handles user input related to gpio.
     *
     * The user specifies a pin letter and number and a command. The command
     * options are set, clear, toggle, mode input, and mode output. A valid 
     * command will configure a pin accordingly, and a message telling the 
     * user what they did will be displayed. If the input is invalid, the 
     * invalid_input function is called. 
     * 
     * Args:
     *      str: A string containing the entirety of the user input
     *      token: A string that is the second word of user input (after gpio)
     *      s: A string containing a space, which is the token delimeter
     */
    char *pin = "";
    char *number_char = "";

    // Check for valid pin letter
    if (strcmp(token, "B") == 0 || strcmp(token, "C") == 0 || \
    strcmp(token, "D") == 0 || strcmp(token, "E") == 0){
        pin = token;
        token = strtok(NULL, s);

        // Check for valid pin number
        if ((strcmp(token, "0") == 0 || strcmp(token, "1") == 0 || \
        strcmp(token, "2") == 0) || (strcmp(pin, "E") != 0 && \
        (strcmp(token, "3") == 0 || strcmp(token, "4") == 0 || \
        strcmp(token, "5") == 0 || strcmp(token, "6") == 0 || \
        strcmp(token, "7") == 0))){
            number_char = token;
            token = strtok(NULL, s);
            int num = number_char[0] - '0';

            if (strcmp(token, "set") == 0){
                // Set pin high
                if (strcmp(pin, "B") == 0){
                    PORTB |= _BV(num);
                }
                else if (strcmp(pin, "C") == 0){
                    PORTC |= _BV(num);
                }
                else if (strcmp(pin, "D") == 0){
                    PORTD |= _BV(num);
                }
                else if (strcmp(pin, "E") == 0){
                    PORTE |= _BV(num);
                }
                uart_puts("Pin ");
                uart_puts(pin);
                uart_puts(number_char);
                uart_puts(" set high\r\n");
            }
            else if (strcmp(token, "clear") == 0){
                // Set pin low
                if (strcmp(pin, "B") == 0){
                    PORTB &= ~_BV(num);
                }
                else if (strcmp(pin, "C") == 0){
                    PORTC &= ~_BV(num);
                }
                else if (strcmp(pin, "D") == 0){
                    PORTD &= ~_BV(num);
                }
                else if (strcmp(pin, "E") == 0){
                    PORTE &= ~_BV(num);
                }
                uart_puts("Pin ");
                uart_puts(pin);
                uart_puts(number_char);
                uart_puts(" set low\r\n");
            }
            else if (strcmp(token, "toggle") == 0){
                // Toggle pin
                if (strcmp(pin, "B") == 0){
                    PORTB ^= _BV(num);
                }
                else if (strcmp(pin, "C") == 0){
                    PORTC ^= _BV(num);
                }
                else if (strcmp(pin, "D") == 0){
                    PORTD ^= _BV(num);
                }
                else if (strcmp(pin, "E") == 0){
                    PORTE ^= _BV(num);
                }
                uart_puts("Pin ");
                uart_puts(pin);
                uart_puts(number_char);
                uart_puts(" toggled\r\n");
            }
            else if (strcmp(token, "mode") == 0){
                token = strtok(NULL, s);

                if (strcmp(token, "output") == 0){
                    // Set mode to output
                    if (strcmp(pin, "B") == 0){
                        DDRB |= _BV(num);
                    }
                    else if (strcmp(pin, "C") == 0){
                        DDRC |= _BV(num);
                    }
                    else if (strcmp(pin, "D") == 0){
                        DDRD |= _BV(num);
                    }
                    else if (strcmp(pin, "E") == 0){
                        DDRE |= _BV(num);
                    }
                    uart_puts("Pin ");
                    uart_puts(pin);
                    uart_puts(number_char);
                    uart_puts(" mode set to output\r\n");
                }
                else if (strcmp(token, "input") == 0){
                    // Set mode to input
                    if (strcmp(pin, "B") == 0){
                        DDRB &= ~_BV(num);
                    }
                    else if (strcmp(pin, "C") == 0){
                        DDRC &= ~_BV(num);
                    }
                    else if (strcmp(pin, "D") == 0){
                        DDRD &= ~_BV(num);
                    }
                    else if (strcmp(pin, "E") == 0){
                        DDRE &= ~_BV(num);
                    }
                    uart_puts("Pin ");
                    uart_puts(pin);
                    uart_puts(number_char);
                    uart_puts(" mode set to input\r\n");
                }
                else{
                    invalid_input();
                }
            }
            else{
                invalid_input();
            } 
        }
        else{
            invalid_input();
        }
    }
    else{
        invalid_input();
    }
}

int main(void) {
    /*
     * Runs the shell continuously until it is closed.
     * 
     * The user is given a prompt to enter a command with a maximum character
     * limit of 255. If the command is "ping", a message "pong" is displayed.
     * If the first word of the user input is "gpio", the handle_gpio function
     * is called. Otherwise, the invalid_input function is called.
     */

    // Initialize shell
    uart_init(9600);
    uart_puts("\nEcho shell");
    uart_puts("- Enter up to 255 characters\r\n");

    // Run the shell continuously
    int rc = 0;
    for (;;) {
        uart_puts("# ");
        char str[256];
        rc = uart_gets(str, 256);

        const char s[2] = " ";
        char *token;
        token = strtok(str, s);

        if (strcmp(token, "ping") == 0){
            // Display "pong" if token is "ping"
            token = strtok(NULL, s);
            if (token == NULL){
            uart_puts("pong\r\n");
            }
            else{
                invalid_input();
            }
        }
        else if (strcmp(token, "gpio") == 0){
            // Call the handle_gpio function if token is "gpio"
            token = strtok(NULL, s);
            handle_gpio(str, token, s);
        }
        else if (rc > 0) {
            // Handle invalid input
            invalid_input();
        }
    }
}