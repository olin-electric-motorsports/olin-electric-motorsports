#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>

#include "libs/gpio/api.h"

#define NUM_PIN_INTERRUPTS (26)

/*
 * List of function pointers to store the callbacks
 */
void (*callbacks[NUM_PIN_INTERRUPTS])(void);

ISR(PCINT0_vect) {
    static uint8_t prev_vals = 0;
    uint8_t vals = PINB;

    uint8_t changed = prev_vals ^ vals;

    for (uint8_t i = 0; i < 8; i++) {
        if ((changed & (1 << i)) && (callbacks[i] != NULL)) {
            (*callbacks[i])();
        }
    }

    prev_vals = vals;
}

ISR(PCINT1_vect) {
    static uint8_t prev_vals = 0;
    uint8_t vals = PINC;

    uint8_t changed = prev_vals ^ vals;

    for (uint8_t i = 0; i < 8; i++) {
        if ((changed & (1 << i)) && (callbacks[i + 8] != NULL)) {
            (*callbacks[i + 8])();
        }
    }

    prev_vals = vals;
}

ISR(PCINT2_vect) {
    static uint8_t prev_vals = 0;
    uint8_t vals = PIND;

    uint8_t changed = prev_vals ^ vals;

    for (uint8_t i = 0; i < 8; i++) {
        if ((changed & (1 << i)) && (callbacks[i + 16] != NULL)) {
            (*callbacks[i + 16])();
        }
    }

    prev_vals = vals;
}

ISR(PCINT3_vect) {
    static uint8_t prev_vals = 0;
    uint8_t vals = PINE;

    uint8_t changed = prev_vals ^ vals;

    for (uint8_t i = 0; i < 3; i++) {
        if ((changed & (1 << i)) && (callbacks[i + 24] != NULL)) {
            (*callbacks[i + 24])();
        }
    }

    prev_vals = vals;
}

void gpio_attach_interrupt(gpio_t pin, void (*callback)(void)) {
    switch (pin.port) {
        case 0x05: {
            PCICR |= (1 << PCIE0);
            PCMSK0 |= (1 << pin.num);
            callbacks[pin.num] = callback;
        } break;
        case 0x08: {
            PCICR |= (1 << PCIE1);
            PCMSK1 |= (1 << pin.num);
            callbacks[pin.num << 4] = callback;
        } break;
        case 0x0B: {
            PCICR |= (1 << PCIE2);
            PCMSK2 |= (1 << pin.num);
            callbacks[pin.num << 8] = callback;
        } break;
        case 0x0E: {
            PCICR |= (1 << PCIE3);
            PCMSK3 |= (1 << pin.num);
            callbacks[pin.num << 12] = callback;
        } break;
        default: {
            // Nothing
        } break;
    }
}
