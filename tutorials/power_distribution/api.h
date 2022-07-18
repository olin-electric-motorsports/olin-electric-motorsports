#pragma once
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

// Pins

gpio_t DASHBOARD_POWER = PB0;
gpio_t SERVICE_SECTION_POWER = PB1;
gpio_t THROTTLE_POWER = PB2;

// Macros

/*
Set power GPIO pin high.
*/
void power_device(gpio_t gpio_pin);

/*
Set dashboard power, service section power, and
throttle power GPIO pins high.
*/
void power_all();

/*
Set power GPIO pin low.
*/
void power_off_device(gpio_t gpio_pin);

/*
Set dashboard power, service section power, and
throttle power GPIO pins low.
*/
void power_off_all();
