#include "tutorials/adc_bare/api.h"
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
    // Set the ADC Enable pin and setting the prescaler to 32 (125kHz)
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS0);
    // Preserve the state of the Analog Reference bit and clear all other bits
    ADCSRB &= (1 << AREFEN);
    // Set voltage reference to AVcc with an external capacitor connected to
    // AREF pin
    ADMUX |= (1 << REFS0);
}

void adc_start_convert(adc_pin_e pin) {
    // Clear pins 0 to 4 of the ADMUX
    ADMUX &= ~0x1F;
    // Set the pin from which to read the signal in the last 5 bits
    ADMUX |= (pin & 0x1F);
    // Set the ADC start conversion bit to start the conversion
    ADCSRA |= (1 << ADSC);
}

int adc_poll_complete(uint16_t* result) {
    // Return -1 if the ADC Interrupt Flag is 0...
    if (!(ADCSRA & (1 << ADIF))) {
        return -1;
    } else {
        // Or set the flag to 1
        ADCSRA |= 1 << ADIF;
        // And save the result in result from (what I'm assuming) is ADCH and
        // ADCL
        *result = ADC;
        return 0;
    }
}

void adc_read_results(uint16_t* result) {
    // Save the result in result, similarly to adc_poll_complete
    *result = ADC;
}

void adc_interrupt_enable(void (*callback)(void)) {
    // Set the ADC Interrupt Enable pin
    ADCSRA |= (1 << ADIE);
    interrupt_callback = callback;
}

uint16_t adc_read(adc_pin_e pin) {
    // Start a conversion on a pin
    adc_start_convert(pin);
    uint16_t ret = 0;
    // Wait until the conversion completes
    while (adc_poll_complete(&ret) == -1) {};
    // return the result
    return ret;
}
