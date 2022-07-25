#pragma once
#include <stdint.h>

#define AS_VOLTAGE(raw) (float)raw*(0.004882813)

typedef enum {
    ADC0 = 0x00,
    ADC1 = 0x01,
    ADC2 = 0x02,
    ADC3 = 0x03,
    ADC4 = 0x04,
    ADC5 = 0x05,
    ADC6 = 0x06,
    ADC7 = 0x07,
    ADC8 = 0x08,
    ADC9 = 0x09,
    ADC10 = 0x0A,
} adc_pin_e;

// Initialize the analog to digital converter peripheral on the MCU
void adc_init(void);

// Start a conversion with a given ADC pin
void adc_start_convert(adc_pin_e pin);

// Retireve the status of an ADC conversion, and return the result if complete
// (-1 if not)
int adc_poll_complete(uint16_t* result);

// Retreive the result of an ADC conversion
void adc_read_results(uint16_t* result);

// Enable interrupts when an ADC conversion is complete
void adc_interrupt_enable(void (*callback)(void));

// Read the value of given ADC pin. Wraps the adc_start_convert and
// adc_poll_complete functions
uint16_t adc_read(adc_pin_e pin);
