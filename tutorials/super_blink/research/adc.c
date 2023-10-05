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

/*
 * Initialize the adc on the MCU
 *
 * ADCSRA = ADC register A containing configuration bits (ADC Control and Status
 * Register A)
 *
 * ADCSRB = ADC register B containing more configuration bits
 *
 * ADEN = ADC enable bit
 *
 * ADPS2:0 = ADC prescaler select - division factor between
 * system clock fq and input clock to ADC
 *
 * AREFEN = Analog reference pin enable
 *
 * ADMUX = Register for muxing to various ADC inputs
 *
 * REFS0 = REFSn: Selects reference for the ADC
 */

// Initializes the ADC on the MCU
void adc_init(void) {
    ADCSRA = (1 << ADEN) | (1 << ADPS2)
             | (1 << ADPS0); // Sets the ADEN, ADPS2, and ADPS0 bits to 1.
                             // Enables the ADC, sets the prescaler to 32
    ADCSRB &= (1 << AREFEN); // Sets the AREFEN bit to 1.

    ADMUX |= (1 << REFS0); // Bits: 01000000; ADC reference voltage is AV_CC
}

// Starts ADC converting on a pin
void adc_start_convert(
    adc_pin_e pin) { // Takes a type adc_pin_e named pin, maps back to an enum
    ADMUX &= ~0x1F; // In binary: 11100000
    ADMUX |= (pin & 0x1F);

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
