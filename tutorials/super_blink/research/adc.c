#include "libs/adc/api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdlib.h>

void (*interrupt_callback)(void) = NULL;

ISR(ADC_vect) {
    if (interrupt_callback != NULL) {
        (*interrupt_callback)();
    }
}

// initialize the ADC peripheral
void adc_init(void) {
    // set enable bit and set the prescaler bits to 101 (division of 32 for rate of 125kHz)
    // "By default, the successive approximation circuitry requires an input clock frequency between 50kHz and 2MHz to get maximum resolution."
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS0);
    // set the voltage reference (refs[1:0] are 01 and AREFEN is 1 which is for AV_cc with external capacitor)
    ADCSRB &= (1 << AREFEN);
    ADMUX |= (1 << REFS0);
}

// begin a conversion
void adc_start_convert(adc_pin_e pin) {
    // clear everything except first 3 bits (voltage reference settings)
    ADMUX &= ~0x1F;
    // set the mux to select the desired pin (while preserving REF bits)
    ADMUX |= (pin & 0x1F);
    // set the "start conversion" bit to kick off conversion
    ADCSRA |= (1 << ADSC);
}

int adc_poll_complete(uint16_t* result) {
    if (!(ADCSRA & (1 << ADIF))) {
        return -1;
    } else {
        ADCSRA |= 1 << ADIF;
        *result = ADC;
        return 0;
    }
}

void adc_read_results(uint16_t* result) {
    *result = ADC;
}

void adc_interrupt_enable(void (*callback)(void)) {
    ADCSRA |= (1 << ADIE);
    interrupt_callback = callback;
}

uint16_t adc_read(adc_pin_e pin) {
    adc_start_convert(pin);
    uint16_t ret = 0;
    while (adc_poll_complete(&ret) == -1) {};
    return ret;
}