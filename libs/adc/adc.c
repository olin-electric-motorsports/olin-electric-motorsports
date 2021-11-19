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

void adc_init(void) {
    // Enables ADC
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS0);

    // Sets voltage reference to AVCC with external capacitor connected (page
    // 321 of complete datasheet, table 22-4)
    ADMUX |= (1 << REFS0);
}

void adc_start_convert(adc_pin_e pin) {
    // Set the correct pin in the multiplexer
    ADMUX |= (pin & 0x1F);

    // Enable conversion
    ADCSRA |= (1 << ADSC);
}

int adc_poll_complete(uint16_t* result) {
    if (ADCSRA & (1 << ADSC)) {
        return -1;
    } else {
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
