#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

#include <util/delay.h>

int main(void) {
	gpio_t LED = PB0;
	gpio_set_mode(LED, OUTPUT);

	for(;;) {
		gpio_set_pin(LED);
		_delay_ms(500);
		gpio_clear_pin(LED);
		_delay_ms(500);
	}
}
