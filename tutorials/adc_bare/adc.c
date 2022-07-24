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
    // Sets bits 7, 2, and 0 of the ADCSRA to 1. Setting ADEN to 1
    // enables the ADC. Setting ADPS2 and ADSP0 sets the division factor
    // between the system clock frequency and input clock to 32.
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS0);
    // Setting AREFEN to 1 connects the internal AREF circuit to the AREF pin, 
    // if it is already connected and clears all the other pins.
    ADCSRB &= (1 << AREFEN);
    // Set the ADC voltage reference to AVCC with external capacitor connected
    // on the AREF pin.
    ADMUX |= (1 << REFS0);
}

void adc_start_convert(adc_pin_e pin) {
    // Clears pins 0-4 of the ADMUX
    ADMUX &= ~0x1F;
    // This determines which analog input is connected to the ADC input based
    // on the inputted ADC pin
    ADMUX |= (pin & 0x1F);
    // Sets the ADSC bit to 1, which starts each conversion.
    ADCSRA |= (1 << ADSC);
}

int adc_poll_complete(uint16_t* result) {
    // If the ADIF bit is not 1, return -1, meaning that the ADC conversion
    // has not completed
    if (!(ADCSRA & (1 << ADIF))) {
        return -1;
    } else {
        // Sets ADIF bit to 1
        ADCSRA |= 1 << ADIF;
        // Reads the ADC result and populates it to result
        *result = ADC;
        return 0;
    }
}

void adc_read_results(uint16_t* result) {
    // Reads the ADC results into result
    *result = ADC;
}

void adc_interrupt_enable(void (*callback)(void)) {
    // This enables the ADC Conversion Complete Interrupt
    ADCSRA |= (1 << ADIE);
    interrupt_callback = callback;
}

uint16_t adc_read(adc_pin_e pin) {
    // Starts ADC conversion for the inputted pin
    adc_start_convert(pin);

    // Waits for the conversion to complete and sets ret to the ADC result
    // once complete.
    uint16_t ret = 0;
    while (adc_poll_complete(&ret) == -1) {};

    // returns the read ADC pin value
    return ret;
}