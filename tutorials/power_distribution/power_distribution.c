#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "tutorials/power_distribution/api.h"

gpio_t DASHBOARD_POWER = PB5;
gpio_t SERVICE_SECTION_POWER = PB6;
gpio_t THROTTLE_POWER = PB7;

void init_devices(void) {
    gpio_set_mode(DASHBOARD_POWER, OUTPUT);
    gpio_set_mode(SERVICE_SECTION_POWER, OUTPUT);
    gpio_set_mode(THROTTLE_POWER, OUTPUT);
}

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
