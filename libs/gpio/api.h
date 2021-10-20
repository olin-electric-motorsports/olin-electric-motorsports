#include <stdint.h>

#define INPUT  (0)
#define OUTPUT (1)

typedef struct {
    uint8_t num;
    uint8_t ddr;
    uint8_t port;
    uint8_t pin;
} gpio_t;

#define gpio_set_mode(gpio_pin, mode)                       \
    do {                                                    \
        if (mode == OUTPUT) {                               \
            _SFR_IO8(gpio_pin.ddr) |= (1 << gpio_pin.num);  \
        } else {                                            \
            _SFR_IO8(gpio_pin.ddr) &= ~(1 << gpio_pin.num); \
        }                                                   \
    } while (0)

#define gpio_set_pin(gpio_pin) (_SFR_IO8(gpio_pin.port) |= (1 << gpio_pin.num))
#define gpio_clear_pin(gpio_pin) \
    (_SFR_IO8(gpio_pin.port) &= ~(1 << gpio_pin.num))
#define gpio_toggle_pin(gpio_pin) \
    (_SFR_IO8(gpio_pin.port) ^= (1 << gpio_pin.num))
#define gpio_get_pin(gpio_pin) \
    (!(!(_SFR_IO8(gpio_pin.port) & (1 << gpio_pin.num))))

void gpio_attach_interrupt(gpio_t pin, void (*callback)(void));
