#include "libs/gpio/api.h"

#define DASHBOARD_POWER (PB0);
#define SERVICE_SECTION_POWER (PB1);
#define THROTTLE_POWER (PB2);

void power_device(gpio_t pin);

void power_all();

void power_off_device(gpio_t pin);

void power_off_all();