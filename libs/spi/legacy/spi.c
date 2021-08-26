/*
 * OEM SPI helper library
 *
 * This SPI library has basic init, start, shift in/out, and end functions for SPI and SPI_A
 *
 * @author Alex Hoppe '19
 */

#include "spi.h"

// SPI functions
void SPI_init(uint8_t clock_frequency, uint8_t spi_mode, volatile uint8_t *cs_port, uint8_t cs_pin){
    // Set data direction of MOSI and MISO and SCK as output
    DDRB |= _BV(PB0) | _BV(PB1) | _BV(PB7);

    // Set /SS as output as per 19.3.2 in Atmega datasheet
    DDRD |= _BV(PD3);

    // Set SPI CPOL and CPHA mode
    SPCR |= (spi_mode << 2);

    // Enable SPI, set SPI mode to master, set clock transmitted
    SPCR |= _BV(SPE) | _BV(MSTR) | clock_frequency;


    // Set global cs_port pointer and cs_pin
    gSPI_cs_port = cs_port;
    gSPI_cs_pin = cs_pin;

    // Set up pin as output
    if (cs_port == &PORTB) {
        DDRB |= _BV(cs_pin);
    } else if (cs_port == &PORTC) {
        DDRC |= _BV(cs_pin);
    } else if (cs_port == &PORTD) {
        DDRD |= _BV(cs_pin);
    } else if (cs_port == &PORTE) {
        DDRE |= _BV(cs_pin);
    }

    // Hold /CS high until we start a transaction.
    *gSPI_cs_port |= _BV(gSPI_cs_pin);
}

void SPI_start() {
    // Lower the CS pin
    *gSPI_cs_port &= ~_BV(gSPI_cs_pin);
}

void SPI_transfer(uint8_t txdata, uint8_t *rxdata) {
    // Write the TX data to the SPI output register
    SPDR = txdata;

    // Wait until we've shifted out the bits and shifted in new ones
    while(!(SPSR & _BV(SPIF)));

    // Read back the SPI MISO buffer into rxdata
    *rxdata = SPDR;
}

void SPI_transfer_array(uint8_t *txdata, uint8_t *rxdata, uint8_t len) {
    for (uint8_t i = 0; i < len; i++) {
        SPI_transfer(txdata[i], &rxdata[i]);
    }
}

void SPI_end() {
    // Raise the CS pin
    *gSPI_cs_port |= _BV(gSPI_cs_pin);
}

// SPI_A functions for the alternate SPI port
// void SPI_A_init();
//
// void SPI_A_start(uint8_t cs_a_port, uint8_t cs_a_pin);
//
// void SPI_A_transfer(uint8_t txdata, uint8_t *rxdata);
//
// void SPI_A_end(uint8_t cs_a_port, uint8_t cs_a_pin);
