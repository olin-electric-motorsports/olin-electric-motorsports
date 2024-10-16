#pragma once

#include <stdbool.h>
#include <stdint.h>

#include "libs/gpio/api.h"

typedef enum {
    MSB = 0,
    LSB,
} spi_data_order_e;

typedef enum {
    SECONDARY = 0,
    MAIN,
} spi_mode_e;

typedef enum {
    RISING_FALLING = 0,
    FALLING_RISING,
} spi_clock_polarity_e;

typedef enum {
    SAMPLE_SETUP = 0,
    SETUP_SAMPLE,
} spi_clock_phase_e;

typedef enum {
    F_OSC_DIV_4, // I believe this is 4mhz
    F_OSC_DIV_16,
    F_OSC_DIV_64,
    F_OSC_DIV_128,
    F_OSC_DIV_2,
    F_OSC_DIV_8,
    F_OSC_DIV_32,
    F_OSC_DIV_64_2,
} spi_clock_rate_e;

/**
 * Redirect SPI to either the main or alternate bus
 * MAIN_BUS: MISO (PB0), MOSI (PB1), SCK (PB7)
 * ALT_BUS: MISO_A (PD2), MOSI_A (PD3), SCK_A (PD4)
 *
 * MAIN_BUS is the default, as most existing boards use the _A SPI pins
 */
typedef enum { MAIN_BUS = 0, ALT_BUS = 1 } spi_channel_e;

typedef struct {
    bool interrupt_enable;
    spi_data_order_e data_order;
    spi_mode_e mode;
    spi_clock_polarity_e polarity;
    spi_clock_phase_e phase;
    spi_clock_rate_e clock_rate;
    gpio_t* cs_pin;
    spi_channel_e spi_channel;
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
void spi_transceive_cs(uint8_t* txdata, uint8_t* rxdata, uint8_t len);

void spi_transmit(uint8_t* txdata, uint8_t len);
void spi_receive(uint8_t* rxdata, uint8_t len);

/*
 * Set CS pin low. Used for LTC681x libraries and for fine-grain SPI control
 */
void spi_cs_low(void);

/*
 * Set CS pin high. Used for LTC681x libraries and for fine-grain SPI control
 */
void spi_cs_high(void);
