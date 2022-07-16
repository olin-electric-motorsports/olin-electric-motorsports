#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

gpio_t DASHBOARD_POWER = PB0;
gpio_t SERVICE_SECTION_POWER = PB1;
gpio_t THROTTLE_POWER = PB2;

/*
 * Power on the given device
 * Args:
 *  device: DASHBOARD_POWER, SERVICE_SECTION_POWER, or THROTTLE_POWER defined
 * above
 */
void power_device(gpio_t device);

/*
 * Power on all devices
 */
void power_all(void);

/*
 * Power off the given device
 * Args:
 *  device: DASHBOARD_POWER, SERVICE_SECTION_POWER, or THROTTLE_POWER defined
 * above
 */
void power_off_device(gpio_t device);

/*
 * Power off all devices
 */
void power_off_all(void);
