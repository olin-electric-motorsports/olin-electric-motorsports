#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

//////////////////////// GPIO - DIGITAL ////////////////////////
//These are digital outputs for avr-controlled LED outputs
gpio_t MOTOR_5KW_LED = PB0;
gpio_t BRAKE_LL_LED = PB1;
gpio_t BSPD_TRIP_LED = PB2;

//Monitor Pins connected to the logic-level (LL) side of the LSDs
gpio_t BSPD_LL = PB3;
gpio_t BRAKELIGHT_LL = PB4;

//Digital sense pin for 5kW motor "on" state
gpio_t MOTOR_CURRENT_SENSE = PB5;

//Input for shutdown sense line
//gpio_t BSPD_SHUTDOWN_SENSE = PC0;

//////////////////////// GPIO - ANALOG /////////////////////////
adc_pin_e BRAKE_PRESSURE_SENSE = ADC7;

//Timer config
void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 0x27,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};
