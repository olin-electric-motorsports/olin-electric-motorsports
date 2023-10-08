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
    ADCSRB &= (1 << AREFEN); // What does this do? Clear all bits but AREFEN?
    ADMUX |= (1 << REFS0); // Bits: 01000000; ADC reference voltage is AV_CC
}

// Starts ADC converting on a pin
void adc_start_convert(
    adc_pin_e pin) { // Takes a type adc_pin_e named pin, maps back to an enum
    ADMUX &= ~0x1F; // In binary: 11100000. Clears all bits but the 3 MSBs
    // Clears bits MUX[4:0] in prep for setting the device to convert
    ADMUX |= (pin & 0x1F); // Sets the pin/device to convert
    ADCSRA |= (1 << ADSC); // Starts conversion
}

// Check if an ADC conversion is done, and if so reads the result and sets it to
// result
int adc_poll_complete(uint16_t* result) { // Takes a pointer to a 16 bit int
    // Checks if the ADIF bit is 0
    if (!(ADCSRA & (1 << ADIF))) {
        return -1;
    } else { // If ADIF is 1
        ADCSRA |= 1 << ADIF; // If ADIF is already 1, why do we need this?
        *result
            = ADC; // Reads the result of the conversion from the ADC register
        return 0;
    }
}

// Reads the ADC register and set it to a 16-bit variable
void adc_read_results(uint16_t* result) {
    *result = ADC;
}

// Interupts the current ADC conversion
void adc_interrupt_enable(
    void (*callback)(void)) { // Takes a callback function as an input
    ADCSRA |= (1 << ADIE); // Sets the ADIE bit to 1 to interupt the conversion
    interrupt_callback = callback; // Interupt callback?
}

// Main function to read an ADC conversion
uint16_t adc_read(adc_pin_e pin) {
    adc_start_convert(pin); // Starts ADC conversion on a pin
    uint16_t ret = 0; // 16-bit int to store result
    while (adc_poll_complete(&ret) == -1) {
    }; // Waits until the conversion is complete, then sets the result

    return ret;
}
