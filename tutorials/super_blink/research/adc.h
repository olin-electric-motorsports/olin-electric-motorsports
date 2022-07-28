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

void adc_init(void);

void adc_start_convert(adc_pin_e pin);

int adc_poll_complete(uint16_t* result);

void adc_read_results(uint16_t* result);

void adc_interrupt_enable(void (*callback)(void));

uint16_t adc_read(adc_pin_e pin);