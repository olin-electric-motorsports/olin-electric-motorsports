#pragma once

#include "libs/can/api.h"
#include "libs/adc/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

// PIN DEFINITIONS
// Debug LEDs
gpio_t DEBUG_LED = PB0;
gpio_t HEARTBEAT = PC4;

// Sensor Pins
gpio_t WHEEL_SPEED_SENSE_LEFT = PB2;
gpio_t WHEEL_SPEED_SENSE_RIGHT = PD6;

// CONSTANTS
int CLICKS_PER_REV = 11; // Number of Clicks Detected per Revolution
float TIMER_TIME_ELAPSED = 0.5; // Number of Seconds Elapsed between Timer Triggers

// TIMER CONFIG. (CAN update every 2 Hz)
void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 0x7A1, // 2 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};