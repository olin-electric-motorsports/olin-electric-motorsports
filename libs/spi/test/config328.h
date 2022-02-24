#include "libs/gpio/api.h"
#include "libs/spi/api.h"

#include <stdint.h>

gpio_t cs_pin;

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = RISING_FALLING,
    .phase = SAMPLE_SETUP,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin_overide = &cs_pin, // Set as void to use default pins
    .pin_redirect = false,
};
