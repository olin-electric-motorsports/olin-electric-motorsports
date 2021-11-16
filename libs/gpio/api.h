#pragma once
#include <stdint.h>

#define INPUT  (0)
#define OUTPUT (1)

typedef struct {
    uint8_t num;
    uint8_t ddr;
    uint8_t port;
    uint8_t pin;
} gpio_t;

/*
 * Set a GPIO pin to be an input or an output
 */
#define gpio_set_mode(gpio_pin, mode)                       \
    do {                                                    \
        if (mode == OUTPUT) {                               \
            _SFR_IO8(gpio_pin.ddr) |= (1 << gpio_pin.num);  \
        } else {                                            \
            _SFR_IO8(gpio_pin.ddr) &= ~(1 << gpio_pin.num); \
        }                                                   \
    } while (0)

/*
 * Set a gpio pin high
 */
#define gpio_set_pin(gpio_pin) (_SFR_IO8(gpio_pin.port) |= (1 << gpio_pin.num))

/*
 * Set a gpio pin low
 */
#define gpio_clear_pin(gpio_pin) \
    (_SFR_IO8(gpio_pin.port) &= ~(1 << gpio_pin.num))

/*
 * Toggle a gpio pin (high becomes low, low becomes high)
 */
#define gpio_toggle_pin(gpio_pin) \
    (_SFR_IO8(gpio_pin.port) ^= (1 << gpio_pin.num))

/*
 * Get the value of a GPIO pin
 */
#define gpio_get_pin(gpio_pin) (_SFR_IO8(gpio_pin.pin) & (1 << gpio_pin.num))

/*
 * Enable interrupts for the given pin. The interrupt function can then be
 * defined like so:
 *
 * ```
 * void pcint0_callback(void) {
 *     // Do interrupt stuff
 * }
 */
void gpio_enable_interrupt(gpio_t pin);
