#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdlib.h>

#include "libs/gpio/api.h"

#define NUM_PIN_INTERRUPTS (26)

/*
 * List of function pointers to store the callbacks
 */
// void (*callbacks[NUM_PIN_INTERRUPTS])(void);

__attribute__((weak)) void pcint0_callback(void) {};
__attribute__((weak)) void pcint1_callback(void) {};
__attribute__((weak)) void pcint2_callback(void) {};
__attribute__((weak)) void pcint3_callback(void) {};

ISR(PCINT0_vect) {
    pcint0_callback();
}

ISR(PCINT1_vect) {
    pcint1_callback();
}

ISR(PCINT2_vect) {
    pcint2_callback();
}

ISR(PCINT3_vect) {
    pcint3_callback();
}

void gpio_enable_interrupt(gpio_t pin) {
    sei();
    switch (pin.port) {
        case 0x05: {
            PCICR |= (1 << PCIE0);
            PCMSK0 |= (1 << pin.num);
            // callbacks[pin.num] = callback;
        } break;
        case 0x08: {
            PCICR |= (1 << PCIE1);
            PCMSK1 |= (1 << pin.num);
            // callbacks[pin.num + 8] = callback;
        } break;
        case 0x0B: {
            PCICR |= (1 << PCIE2);
            PCMSK2 |= (1 << pin.num);
            // callbacks[pin.num + 16] = callback;
        } break;
        case 0x0E: {
            PCICR |= (1 << PCIE3);
            PCMSK3 |= (1 << pin.num);
            // callbacks[pin.num + 24] = callback;
        } break;
        default: {
            // Nothing
        } break;
    }
}
