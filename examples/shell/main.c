#include "libs/uart/api.h"
#include <stdbool.h>

int main(void) {
    uart_init(9600, false);
    uart_puts("Echo shell");
    uart_puts("- Enter up to 255 characters\n");

    for (;;) {
        uart_puts("# ");

        char str[256];
        uart_gets(str, 256);
        uart_puts(str);
    }
}
