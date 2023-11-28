#include "api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

void power_device(gpio_t pin) {
    gpio_set_pin(pin);
}

void power_device_all() {
    gpio_set_pin(DASHBOARD_POWER);
    gpio_set_pin(THROTTLE_POWER);
    gpio_set_pin(SERVICE_SECTION_POWER);
}

void power_off(gpio_t pin)
    gpio_clear_pin(pin);

void power_off_all() {
    gpio_clear_pin(DASHBOARD_POWER);
    gpio_clear_pin(THROTTLE_POWER);
    gpio_clear_pin(SERVICE_SECTION_POWER);
}

int main(void) {
    sei();
}