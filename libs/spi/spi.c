/*
 * Spi library for atmega 16m1
 */
#include <stdlib.h>

#include <avr/interrupt.h>
#include <avr/io.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"

uint8_t txdata_receive = 0xFF;

// CS Pins

// Spi pins
gpio_t miso = PB0;
gpio_t mosi = PB1;
gpio_t sck = PB7;
gpio_t miso_a = PD2;
gpio_t mosi_a = PD3;
gpio_t sck_a = PD4;
gpio_t cs;

spi_mode_e mode = MAIN;


static bool spi_interrupt_enabled = false;
static void (*spi_callback)(void);

ISR(SPI_STC_vect) {
    if (spi_interrupt_enabled) {
        (*spi_callback)();
    }
}

void spi_init(spi_cfg_s* spi_cfg) {
    MCUCR |= spi_cfg->peripheral << SPIPS; 
    cs = *spi_cfg->cs_pin;
    mode = spi_cfg->mode;

    uint8_t main_direction = (mode == MAIN) ? OUTPUT : INPUT;
    uint8_t secondary_direction = (mode == MAIN) ? INPUT : OUTPUT;

    if (spi_cfg->peripheral == SPI) {
        gpio_set_mode(mosi, main_direction);
        gpio_set_mode(miso, secondary_direction);
        gpio_set_mode(sck, main_direction);
    } else {
        gpio_set_mode(mosi_a, main_direction);
        gpio_set_mode(miso_a, secondary_direction);
        gpio_set_mode(sck_a, main_direction);
    }

    gpio_t ss = PD3;
    gpio_set_mode(ss, OUTPUT);

    SPCR |= (spi_cfg->data_order << DORD) | (spi_cfg->interrupt_enable << SPIE)
            | (spi_cfg->polarity << CPOL) | (spi_cfg->phase << CPHA)
            | (spi_cfg->mode << MSTR) | (spi_cfg->clock_rate);

    SPSR |= (((uint8_t)spi_cfg->clock_rate & 0x4) >> 2);

    SPCR |= 1 << SPE; // Enable SPI

    gpio_set_mode(cs, main_direction);
    gpio_set_pin(cs);
    
    if (spi_cfg->peripheral == SPI) {
        gpio_set_pin(miso);
    } else {
        gpio_set_pin(miso_a);
    }
}

static void spi_transceive_private(uint8_t txdata, uint8_t* rxdata) {
    // Write the TX data to the SPI output register
    SPDR = txdata;

    // Wait until we've shifted out the bits and shifted in new ones
    while (!(SPSR & (1 << SPIF)))
        ;

    // Read out result
    *rxdata = SPDR;
}

void spi_transceive(uint8_t* txdata, uint8_t* rxdata, uint8_t len) {
    for (uint8_t i = 0; i < len; i++) {
        spi_transceive_private(txdata[i], &rxdata[i]);
    }
}

void spi_receive(uint8_t* rxdata, uint8_t len) {
    spi_transceive(NULL, rxdata, len);
}

void spi_cs_low(void) {
    gpio_clear_pin(cs);
}

void spi_cs_high(void) {
    gpio_set_pin(cs);
}
