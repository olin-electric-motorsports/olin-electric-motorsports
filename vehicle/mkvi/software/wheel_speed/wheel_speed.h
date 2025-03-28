#pragma once

#include "libs/can/api.h"
#include "libs/adc/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"

#define HIGH 1
#define LOW 0
#define READING_THRESHOLD 175 // Threshold at which sensor is sensing metal
#define NUM_HOLES 16

// init timer
void timer_0_isr(void);
timer_cfg_s timer_0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x12, // 217Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_0_isr,
    },
};

// Heartbeat timer config
void timer_1_isr(void);
timer_cfg_s timer_1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x7A1, // 2 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_1_isr,
    },
};

typedef struct {
    // represents wheel speed sensor
    adc_pin_e adc_pin;
    bool last_state;
    uint32_t current_speed;
} WheelSpeed;

const WheelSpeed WHEEL_SPEED_l = {
    .adc_pin_e = ADC5
    .last_state = 0,
    .current_speed = 0,
};

const WheelSpeed WHEEL_SPEED_r = {
    .adc_pin_e = ADC3,
    .last_state = 0,
    .current_speed = 0,
};

// Debug LED
// TODO: use debug led as a marker for if we are in an expected speed range during testing :)
gpio_t debug_led = PB0;
gpio_t heartbeat = PC4;

// Function prototypes
void init_peripherals(void);
void get_wheel_speed(WheelSpeed *wheel_speed);
