/*
 * OEM SPI helper library header
 *
 * This SPI header has key definitions and function prototypes for the main SPI
 * helper library file.
 *
 * @author Alex Hoppe '19
 */

#ifndef _SPI_H
#define _SPI_H

#include <stdint.h>
#include <avr/io.h>

// SPI frequencies
#define SPI_FOSC_DIV_4      0b00
#define SPI_FOSC_DIV_16     0b01
#define SPI_FOSC_DIV_64     0b10
#define SPI_FOSC_DIV_128    0b11

// SPI modes
#define SPI_MODE_0_0        0b00
#define SPI_MODE_0_1        0b01
#define SPI_MODE_1_0        0b10
#define SPI_MODE_1_1        0b11

// SPI pin variables
volatile uint8_t *gSPI_cs_port;
uint8_t gSPI_cs_pin;

// SPI functions
void SPI_init(uint8_t clock_frequency, uint8_t spi_mode, volatile uint8_t* cs_port, uint8_t cs_pin);

void SPI_start();

void SPI_transfer(uint8_t txdata, uint8_t *rxdata);

void SPI_transfer_array(uint8_t *txdata, uint8_t *rxdata, uint8_t len);

void SPI_end();

// SPI_A functions for the alternate SPI port
void SPI_A_init();

void SPI_A_start(uint8_t cs_a_port, uint8_t cs_a_pin);

void SPI_A_transfer(uint8_t txdata, uint8_t *rxdata);

void SPI_A_end(uint8_t cs_a_port, uint8_t cs_a_pin);


#endif
