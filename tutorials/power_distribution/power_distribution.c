#include "libs/gpio/api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

// Variable Declarations
str DASHBOARD_POWER_PIN = PB0;
str SERVICE_SECTION_POWER_PIN = PB1;
str THROTTLE_POWER_PIN = PB2;

int power_device(device_name) {
    /* 
    Power On Certain Device Function
    
    Arguments:
        device_name - Name of device requested to be turned on. Available options: dashboard, service_section, throttle

    Returns:
        The selected device's power is switched on.
    */

    // Goes through and determines which pin to turn on
    if (device_name == dashboard) {
        gpio_set_pin(DASHBOARD_POWER_PIN)}
        else if (device_name == service_section) {
            gpio_set_pin(SERVICE_SECTION_POWER_PIN)}
            else if (drvice_name == throttle) {
                gpio_set_pin(THROTTLE_POWER_PIN)}
                else {
                    return} 
}

int power_all(void) {
    /*
    Power On All Devices Function
    
    Arguments:
        None; Runs if function is called
    
    Returns:
        All device's power is switched on.
    */

    // Turn on all device's power
    gpio_set_pin(DASHBOARD_POWER_PIN)
    gpio_set_pin(SERVICE_SECTION_POWER_PIN)
    gpio_set_pin(THROTTLE_POWER_PIN)
}

power_off_device(device_name) {
    /* 
    Power Off Certain Device Function
    
    Arguments:
        device_name - Name of device requested to be turned on. Available options: dashboard, service_section, throttle

    Returns:
        The selected device's power is switched off.
    */

    // Goes through and determines which pin to turn off
    if (device_name == dashboard) {
        gpio_clear_pin(DASHBOARD_POWER_PIN)}
        else if (device_name == service_section) {
            gpio_clear_pin(SERVICE_SECTION_POWER_PIN)}
            else if (drvice_name == throttle) {
                gpio_clear_pin(THROTTLE_POWER_PIN)}
                else {
                    return} 
}

int power_off_all(void) {
    /*
    Power Off All Devices Function
    
    Arguments:
        None; Runs if function is called
    
    Returns:
        All device's power is switched off.
    */

    // Turn off all device's power
    gpio_clear_pin(DASHBOARD_POWER_PIN)
    gpio_clear_pin(SERVICE_SECTION_POWER_PIN)
    gpio_clear_pin(THROTTLE_POWER_PIN)
}