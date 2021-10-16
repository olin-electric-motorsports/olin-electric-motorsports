#include "libs/uart/api.h"
#include <stdbool.h>

int main(void) {
    uart_init(9600, false);
    uart_puts("\nEcho shell");
    uart_puts("- Enter up to 255 characters\n");

    int rc = 0;
    for (;;) {
        uart_puts("# ");

        char str[256];
        rc = uart_gets(str, 256);
        if (rc > 0) {
            uart_puts(str);
            uart_puts("\n");
        }
    }
}
