#pragma once

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

#include "libs/spi/api.h"

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = RISING_FALLING,
    .phase = SAMPLE_SETUP,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin_overide = 0, // Set as null: 0 to use default pins
    .pin_redirect = false,
};
