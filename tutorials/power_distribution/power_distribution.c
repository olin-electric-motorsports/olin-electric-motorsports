#include "tutorials/power_distribution/api.h"

void power_device(gpio_t device) {
    // Turn on the specified device
    gpio_set_pin(device);
}

void power_all() {
    // Turn on all devices
    gpio_set_mode(DASHBOARD_POWER);
    gpio_set_mode(SERVICE_SECTION_POWER);
    gpio_set_mode(THROTTLE_POWER);
}

void power_off_device(gpio_t device) {
    // Turn off the specified device
    gpio_set_pin(device);
}

void power_off_all() {
    // Turn off all devices
    gpio_clear_pin(DASHBOARD_POWER);
    gpio_clear_pin(SERVICE_SECTION_POWER);
    gpio_clear_pin(THROTTLE_POWER);

}