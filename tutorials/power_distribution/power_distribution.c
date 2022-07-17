#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t DASHBOARD_POWER = PB0;
gpio_t SERVICE_SECTION_POWER = PB1;
gpio_t THROTTLE_POWER = PB2;

void power_device(gpio_t pin) {
    gpio_set_pin(pin);
}

void power_all() {
    gpio_set_pin(DASHBOARD_POWER);
    gpio_set_pin(SERVICE_SECTION_POWER);
    gpio_set_pin(THROTTLE_POWER);
}

void power_off_device(gpio_t pin) {
    gpio_clear_pin(pin);
}

void power_off_all() {
    gpio_clear_pin(DASHBOARD_POWER);
    gpio_clear_pin(SERVICE_SECTION_POWER);
    gpio_clear_pin(THROTTLE_POWER);
}