#pragma once

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

#include "libs/spi/api.h"

gpio_t SPI_CS = PB6;

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = RISING_FALLING,
    .phase = SAMPLE_SETUP,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin = &SPI_CS,
};
