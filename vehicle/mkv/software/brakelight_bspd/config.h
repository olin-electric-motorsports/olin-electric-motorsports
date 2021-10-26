#include "libs/adc/api.h"
#include "libs/gpio/api.h"

/*
 * Pin definitions
 */
gpio_t BSPD_RELAY_INTENTION = PD5;
gpio_t SHUTDOWN_SENSE_BSPD_PIN = PC7;
gpio_t BSPD_CURRENT_SENSE = PC4;
gpio_t BRAKELIGHT_GATE = PC5;
gpio_t DEBUG_LED_1 = PB5;
gpio_t DEBUG_LED_2 = PB6;
gpio_t DEBUG_LED_3 = PB7;
gpio_t RJ45_LED_G = PB0;
gpio_t RJ45_LED_O = PB1;

/*
 * ADC pins
 */
adc_pin_e BRAKE_PRESSURE_SENSE = ADC10;

/*
 * Timer config
 */


/*
 * CAN messages
 */
