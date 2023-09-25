#pragma once

#include "libs/gpio/api.h"

extern gpio_t DASHBOARD_POWER;
extern gpio_t SERVICE_SECTION_POWER;
extern gpio_t THROTTLE_POWER;

/*
 * Initialize power distribution device pins
 */
void init_devices(void);

/*
 * Power a device
 */
void power_device(gpio_t device);

/*
 * Power all devices
 */
void power_all(void);

/*
 * Power off a device
 */
void power_off_device(gpio_t device);

/*
 * Power off all devices
 */
void power_off_all(void);
