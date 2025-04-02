#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>
#include <avr/io.h>

#define RTD_BUZZ_TIME 400 // hundredths of a second
#define DASHBOARD_TIME 100
// Pin definitions - old, def change
gpio_t IMD_LED = PC7;
gpio_t BMS_LED = PC6;
gpio_t HV_LED = PD5;

gpio_t START_BTN = PD1; 

gpio_t RTD_BUZZER_LSD = PC4;
gpio_t RTD_BUTTON_LED= PC5;
gpio_t HEARTBEAT_LED= PC1;

gpio_t BOTS_SS= PB2;
gpio_t ESTOP_SS= PB3;

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
