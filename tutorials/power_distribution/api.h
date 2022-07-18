#pragma once
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

// pin defs
gpio_t DASHBOARD_POWER = PB0;
gpio_t SERVICE_SECTION_POWER = PB1;
gpio_t THROTTLE_POWER = PB2;

/* Power ON a device
 *
 * warning: board may exhibit unexpected behavior if DEVICE is not
 * DASHBOARD_POWER, SERVICE_SECTION_POWER, or THROTTLE_POWER
 */
void power_device(gpio_t device);

/* Power ON all devices
 */
void power_all();

/* Power OFF a device
 *
 * warning: board may exhibit unexpected behavior if DEVICE is not
 * DASHBOARD_POWER, SERVICE_SECTION_POWER, or THROTTLE_POWER
 */
void power_off_device(gpio_t device);

/* Power OFF all devices
 */
void power_off_all();
