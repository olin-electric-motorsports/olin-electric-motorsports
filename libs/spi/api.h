#pragma once

#include <stdbool.h>
#include <stdint.h>

#include "libs/gpio/api.h"

typedef enum {
    MSB,
    LSB,
} spi_data_order_e;

typedef enum {
    SECONDARY,
    MAIN,
} spi_mode_e;

typedef enum {
    RISING_FALLING,
    FALLING_RISING,
} spi_clock_polarity_e;

typedef enum {
    SAMPLE_SETUP,
    SETUP_SAMPLE,
} spi_clock_phase_e;

typedef enum {
    F_OSC_DIV_4,
    F_OSC_DIV_16,
    F_OSC_DIV_64,
    F_OSC_DIV_128,
    F_OSC_DIV_2,
    F_OSC_DIV_8,
    F_OSC_DIV_32,
    F_OSC_DIV_64_2,
} spi_clock_rate_e;

typedef struct {
    bool interrupt_enable;
    spi_data_order_e data_order;
    spi_mode_e mode;
    spi_clock_polarity_e polarity;
    spi_clock_phase_e phase;
    spi_clock_rate_e clock_rate;
    gpio_t* cs_pin_overide; // Set as void to use default pins
    bool pin_redirect;
} spi_cfg_s;

/*
 * Initializes SPI peripheral with the specified parameters
 */
void spi_init(spi_cfg_s* cfg);

/*
 * Transmits byte array (txdata) and returns byte array (rxdata) of
 * data from other party. Both of these are (len) bytes long.
 * Rxdata can be ignored if a null pointer is provided
 */
void spi_transceive(uint8_t* txdata, uint8_t* rxdata, uint8_t len);

void spi_receive(uint8_t* rxdata, uint8_t len);
