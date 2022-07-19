#include "tutorials/power_distribution/api.h"

void power_device(gpio_t device) {
    gpio_set_pin(device);
}

void power_all(void) {
    gpio_set_pin(DASHBOARD_POWER);
    gpio_set_pin(SERVICE_SECTION_POWER);
    gpio_set_pin(THROTTLE_POWER);
}

void power_off_device(gpio_t device) {
    gpio_clear_pin(device);
}

void power_off_all(void) {
    gpio_clear_pin(DASHBOARD_POWER);
    gpio_clear_pin(SERVICE_SECTION_POWER);
    gpio_clear_pin(THROTTLE_POWER);
}
