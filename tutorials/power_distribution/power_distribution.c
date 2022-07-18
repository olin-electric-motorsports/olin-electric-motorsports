#include "api.h"

// Functions

/*
Set power GPIO pin high.
*/
void power_device(gpio_t gpio_pin) {
    gpio_set_pin(gpio_pin);
}

/*
Set dashboard power, service section power, and
throttle power GPIO pins high.
*/
void power_all() {
    gpio_set_pin(DASHBOARD_POWER);
    gpio_set_pin(SERVICE_SECTION_POWER);
    gpio_set_pin(THROTTLE_POWER);
}

/*
Set power GPIO pin low.
*/
void power_off_device(gpio_t gpio_pin) {
    gpio_clear_pin(gpio_pin);
}

/*
Set dashboard power, service section power, and
throttle power GPIO pins low.
*/
void power_off_all() {
    gpio_clear_pin(DASHBOARD_POWER);
    gpio_clear_pin(SERVICE_SECTION_POWER);
    gpio_clear_pin(THROTTLE_POWER);
}
