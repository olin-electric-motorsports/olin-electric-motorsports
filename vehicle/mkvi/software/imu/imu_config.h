#pragma once

#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"

// SPI pins
gpio_t miso = PD2;
gpio_t mosi = PD3;
gpio_t sck = PD4;
gpio_t cs = PC4;
gpio_t imu_int = PB7;

// SPI config
spi_cfg_s imu_spi
    = { .interrupt_enable = false,
        .data_order = MSB,
        .mode = MAIN,
        .polarity = RISING_FALLING,
        .phase = SAMPLE_SETUP,
        .clock_rate
        = F_OSC_DIV_2, // TODO: Update to F_OSC_DIV_4 if using 16MHz crystal
        .cs_pin = &cs };

// Debug LED
gpio_t debug_led = PD6;

// Binary ID pins, for physically differentiating IMUs on the same CAN bus
gpio_t bin_id_0 = PC5;
gpio_t bin_id_1 = PC6;
gpio_t bin_id_2 = PC7;
