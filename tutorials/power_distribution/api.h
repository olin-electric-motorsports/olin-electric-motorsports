#pragma once

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

extern gpio_t DASHBOARD_POWER;
extern gpio_t SERVICE_SECTION_POWER;
extern gpio_t THROTTLE_POWER;

void init_devices();
void power_device();
void power_all();
void power_off_device();
void power_off_all();
