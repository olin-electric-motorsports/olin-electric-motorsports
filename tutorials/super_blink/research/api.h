#pragma once
#include <stdint.h>

#define AS_VOLTAGE(raw) (float)raw*(0.004882813)

typedef enum {
    ADC0,
    ADC1,
    ADC2,
    ADC3,
    ADC4,
    ADC5,
    ADC6,
    ADC7,
    ADC8,
    ADC9,
    ADC10,
} adc_pin_e;

void adc_init(void);

void adc_start_convert(adc_pin_e pin);

int adc_poll_complete(uint16_t* result);

void adc_read_results(uint16_t* result);

void adc_interrupt_enable(void (*callback)(void));

uint16_t adc_read(adc_pin_e pin);