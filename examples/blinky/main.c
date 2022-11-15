#include "libs/gpio/pin_defs.h"


#include "libs/gpio/api.h"
#include <util/delay.h>


// Timer setup

int main(void) {
    gpio_t LED = PD5;
    gpio_set_mode(LED, OUTPUT);
    while (1) {

        gpio_set_pin(LED);
        _delay_ms(500);
        gpio_clear_pin(LED);
        _delay_ms(500);


    }


  
}
