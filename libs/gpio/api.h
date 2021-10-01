// Example pin definition
// #define BRAKELIGHT_LSD (DDRB, PORTB, PB1)

#define INPUT (0)
#define OUTPUT (1)

/*
 * define structs to capture all DDRD, PORTD, and PIND, etc
 */

// typedef struct {
//     uint8_t num;
//     uint8_t ddr;
//     uint8_t port;
//     uint8_t pin;
// } gpio_t;

#define define_pin(port, pin_num) (gpio_t) { \
    .num = pin_num, \
    .ddr = DDR ## port, \
    .port = PORT ## port, \
    .pin = PIN ## port \
    };


#define gpio_set_mode(gpio_ddr, gpio_port, gpio_pin, mode) \
    do { \
        if (mode == INPUT) { \\
            gpio_ddr ^= ~(1 << gpio_pin); \\
        } else { \\
            gpio_ddr |= (1 << gpio_pin); \\
        } \\
    } while (0)

#define gpio_set_pin(gpio_ddr, gpio_port, gpio_pin)    (gpio_port |= (1 << gpio_pin))

#define gpio_clear_pin(gpio_ddr, gpio_port, gpio_pin)  (gpio_port &= ~(1 << gpio_pin))

#define gpio_toggle_pin(gpio_ddr, gpio_port, gpio_pin) (gpio_port ^= (1 << gpio_pin))

#define gpio_get_pin(gpio_ddr, gpio_port, gpio_pin)    (!(!(gpio_port & (1 << gpio_pin))))

// TODO interrupts
