/*
 * Spi library for atmega 16m1
 */
#include <stdlib.h>

#include <avr/interrupt.h>
#include <avr/io.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"

uint8_t txdata_receive = 0x00;

// CS Pins
gpio_t cs = PD3;
gpio_t cs_a = PC1;

// Spi pins
typedef struct {
    gpio_t mosi;
    gpio_t miso;
    gpio_t sck;
    gpio_t* cs;
} spi_pins_s;

spi_pins_s spi_pins = {
    .mosi = PB1,
    .miso = PB0,
    .sck = PB7,
    .cs = &cs,
};

spi_pins_s spi_pins_a = {
    .mosi = PD3,
    .miso = PD2,
    .sck = PD4,
    .cs = &cs_a,
};

struct {
    spi_pins_s* spi_pin_defs;
    spi_mode_e mode;
} spi_state;

static bool spi_interrupt_enabled = false;
static void (*spi_callback)(void);

ISR(SPI_STC_vect) {
    if (spi_interrupt_enabled) {
        (*spi_callback)();
    }
}

void spi_init(spi_cfg_s* spi_cfg) {
    // https://www.avrfreaks.net/forum/atmega1284p-atmel-studio-62-wrong-spi-register-names
    // Datasheet say SPCR0 and SPSR0, however, these are not he actual
    // registers. See link for more info.

    SPCR |= (((uint8_t)spi_cfg->interrupt_enable << 7)
             | ((uint8_t)1 << 6) // SPI Enable
             | ((uint8_t)spi_cfg->data_order << 5)
             | ((uint8_t)spi_cfg->mode << 4) | ((uint8_t)spi_cfg->polarity << 3)
             | ((uint8_t)spi_cfg->phase << 2)
             | (((uint8_t)spi_cfg->clock_rate & 0x3)));
    SPSR |= (((uint8_t)spi_cfg->clock_rate & 0x4) >> 2);
    spi_interrupt_enabled = spi_cfg->interrupt_enable;

    // Redirect SPI is needed
    if (spi_cfg->pin_redirect) {
        MCUCR |= 1 << SPIPS;
        spi_state.spi_pin_defs = &spi_pins_a;
        gpio_set_mode(cs_a, OUTPUT);
    } else {
        MCUCR &= ~(1 << SPIPS);
        spi_state.spi_pin_defs = &spi_pins;
        gpio_set_mode(cs, OUTPUT);
    }

    // Overide CS pin if provided
    if (spi_cfg->cs_pin_overide) {
        spi_state.spi_pin_defs->cs = (spi_cfg->cs_pin_overide);
    }

    // Set data direction of MOSI, MISO, SCK, and CS
    uint8_t main_direction = (spi_cfg->mode == MAIN) ? OUTPUT : INPUT;
    uint8_t seco_direction = (spi_cfg->mode == MAIN) ? INPUT : OUTPUT;
    gpio_set_mode(spi_state.spi_pin_defs->mosi, main_direction);
    gpio_set_mode(spi_state.spi_pin_defs->miso, seco_direction);
    gpio_set_mode(spi_state.spi_pin_defs->sck, main_direction);
    gpio_set_mode(*(spi_state.spi_pin_defs->cs), main_direction);

    // Save mode
    spi_state.mode = spi_cfg->mode;
    // Set CS_pin high - active low signal
    gpio_set_pin(*(spi_state.spi_pin_defs->cs));
}

static void spi_transceive_private(uint8_t txdata, uint8_t* rxdata) {
    // Write the TX data to the SPI output register
    SPDR = txdata;
    // Wait until we've shifted out the bits and shifted in new ones
    while (!(SPSR & _BV(SPIF)))
        ;
    if (rxdata) {
        // Read back the SPI MISO buffer into rxdata
        *rxdata = SPDR;
    }
}

void spi_transceive(uint8_t* txdata, uint8_t* rxdata, uint8_t len) {
    if (spi_state.mode == MAIN) {
        gpio_clear_pin(*(spi_state.spi_pin_defs->cs));
    }
    for (uint8_t i = 0; i < len; i++) {
        spi_transceive_private((txdata) ? txdata[i] : txdata_receive,
                               &rxdata[i]);
    }
    if (spi_state.mode == MAIN) {
        gpio_set_pin(*(spi_state.spi_pin_defs->cs));
    }
}

void spi_receive(uint8_t* rxdata, uint8_t len) {
    uint8_t* txdata = 0;
    spi_transceive(txdata, rxdata, len);
}

void spi_cs_low(void) {
    gpio_clear_pin(*(spi_state.spi_pin_defs->cs));
}

void spi_cs_high(void) {
    gpio_set_pin(*(spi_state.spi_pin_defs->cs));
}
