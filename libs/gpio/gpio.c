#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdlib.h>

#include "libs/gpio/api.h"

/*
 * Placeholder functions for interrupt callbacks for the pin change interrupt
 * vectors.
 *
 * The string `__attribute__((weak))` tells the compiler that there are default
 * functions that are defined here, but if someone implements them elsewhere,
 * use the other ones.
 *
 * So we have these defined as weak so that the code will always compile, and
 * then in your code file (like `air_control.c`), you can define a function with
 * the same name:
 *
 * ```
 * void pcint0_callback(void) {
 *     // Decide which pin changed, and do something
 * }
 * ```
 *
 * This is how interrupts work in this library.
 */
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
    switch ((pin).port) {
        case 0x05: {
            PCICR |= (1 << PCIE0);
            PCMSK0 |= (1 << pin.num);
        } break;
        case 0x08: {
            PCICR |= (1 << PCIE1);
            PCMSK1 |= (1 << pin.num);
        } break;
        case 0x0B: {
            PCICR |= (1 << PCIE2);
            PCMSK2 |= (1 << pin.num);
        } break;
        case 0x0E: {
            PCICR |= (1 << PCIE3);
            PCMSK3 |= (1 << pin.num);
        } break;
    }
}
