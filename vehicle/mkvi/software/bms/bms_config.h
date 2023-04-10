#pragma once // What is this?

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/can/api.h"
#include "libs/spi/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

/*
 * Macros
 */
#define NUM_ICS 6
#define DA_BOARDS_PER_IC 4

/*
 * PIN DEFINITIONS
 */

// Outputs
gpio_t BMS_RELAY_LSD = PC7;
gpio_t COOLING_PUMP_LSD = PD3;
gpio_t SPI_CS = PB6;
gpio_t CHARGE_ENABLE_IN = PB4;
gpio_t CHARGE_ENABLE_OUT = PB3;

gpio_t DEBUG_LED_1 = PD6;
gpio_t DEBUG_LED_2 = PD7;

// Inputs
gpio_t BSPD_CURRENT_THRESH = PB2;
adc_pin_e PRE_DIS_TEMP_1 = ADC8;
adc_pin_e PRE_DIS_TEMP_2 = ADC9;
adc_pin_e PRE_DIS_TEMP_3 = ADC10;

/*
 * TIMERS
 */

void timer0_isr(void);

// 10ms main loop timer
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x27,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};

// Fan PWM (25kHz)
timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_PHASE_CORRECT_PWM_10_BIT,
    .prescalar = CLKIO_DIV_8,
    .channel_a = {
        .output_compare_match = 0x50,
    },
    .channel_b = {
        .channel = CHANNEL_B,
        .pin_behavior = SET,
        .interrupt_enable = false,
    },
};

/*
 * SPI
 */
spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_4,
    .cs_pin = &SPI_CS,
};

