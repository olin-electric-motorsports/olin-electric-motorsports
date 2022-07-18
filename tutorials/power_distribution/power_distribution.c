#include "tutorials/power_distribution/api.h"

void power_device(gpio_t device) {
    gpio_set_pin(device);
}

void power_all() {
    power_device(DASHBOARD_POWER);
    power_device(SERVICE_SECTION_POWER);
    power_device(THROTTLE_POWER);
}

void power_off_device(gpio_t device) {
    gpio_clear_pin(device);
}

void power_off_all() {
    power_off_device(DASHBOARD_POWER);
    power_off_device(SERVICE_SECTION_POWER);
    power_off_device(THROTTLE_POWER);
}