#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

//////////////////////// VARIABLE DECLARATIONS /////////////////
//////////////////////// GPIO - DIGITAL ////////////////////////
// These are digital outputs for avr-controlled LED outputs
gpio_t BRAKE_LL_LED = PB1;
gpio_t BSPD_TRIP_LED = PB2;
gpio_t MOTOR_5KW_LED = PD5;
gpio_t HEARTBEAT_LED = PC5;

// Monitor Pins connected to the logic-level (LL) side of the LSDs
gpio_t BSPD_LL = PB3;
gpio_t BRAKELIGHT_LL = PB4;

// Digital sense pin for 5kW motor "on" state
gpio_t MOTOR_CURRENT_SENSE = PB5;

// Input for shutdown sense line
gpio_t BSPD_SHUTDOWN_SENSE = PC0;

////////////////////////// ADC - ANALOG ////////////////////////
// Monitor Pins for Brake Pressure Signals
adc_pin_e BRAKE_PRESSURE_SENSE = ADC7;
adc_pin_e BRAKE_PRESSURE_SENSE_FILTERED = ADC4;

//Monitor Pin for RC Circuit, used to see how close RC circuit is to causing a fault, potentially
adc_pin_e RC_TIMER_STATUS = ADC8;

// Timer config (CAN update every 100Hz)
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
