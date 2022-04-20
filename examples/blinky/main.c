#include <util/delay.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t LED0 = PB0;
gpio_t LED1 = PB1;
gpio_t LED2 = PB4;

int main(void) {
    gpio_set_mode(LED0, OUTPUT);

    for (;;) {
        // gpio_toggle_pin(LED0);
        gpio_toggle_pin(LED1); 
        gpio_toggle_pin(LED2); 
        _delay_ms(500);
    }
}
