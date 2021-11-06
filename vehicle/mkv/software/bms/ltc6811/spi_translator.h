#include "libs/gpio/api.h"
#include "libs/spi/api.h"
#include <util/delay.h>

#define cs_low(pin) gpio_clear_pin(pin)

#define cs_high(pin) gpio_set_pin(pin)

#define delay_u _delay_us

#define delay_m _delay_ms

// #define spi_write_array

// #define spi_write_read

// #define spi_read_byte
