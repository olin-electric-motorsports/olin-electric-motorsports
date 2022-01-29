#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>
#include <avr/io.h>

#define RTD_BUZZ_TIME 4000 // milliseconds

// Pin definitions
gpio_t IMD_LED = PB3;
gpio_t START_LED = PB4;
gpio_t AMS_LED = PD0;
gpio_t START_BTN = PC6;
gpio_t HV_LED = PD7;
gpio_t LV_LED = PD6;
gpio_t BRAKE_LED = PB2;
gpio_t RTD_BUZZER_LSD = PC5;

// ADC PIN
adc_pin_e STEERING_POS = ADC2;

// Timer setup
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
