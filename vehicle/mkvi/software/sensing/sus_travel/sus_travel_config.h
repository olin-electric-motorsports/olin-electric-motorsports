#pragma once

#include "libs/adc/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"

#define MIN_SUS_TRAVEL_POS 0
#define MAX_SUS_TRAVEL_POS 75

/*
Minimum and maximum ADC counts representing 0% and 100% pedal travel
Last calibrated 11-30-2023 for MKVI
*/

#define SUS_TRAVEL_MIN_COUNTS_L (int16_t)((0) >> 2)
#define SUS_TRAVEL_MAX_COUNTS_L (int16_t)((1023) >> 2)
#define SUS_TRAVEL_MIN_COUNTS_R (int16_t)((0) >> 2)
#define SUS_TRAVEL_MAX_COUNTS_R (int16_t)((1023) >> 2)

// Travel data read timer config
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
    // represents a suspension travel poteniometer
    adc_pin_e adc_pin;
    int16_t sus_travel_min; // Minimum position (0%) in raw ADC
    int16_t sus_travel_max; // Maximum position (100%) in raw ADC
} sus_travel_potentiometer_s;

const sus_travel_potentiometer_s sus_travel_l = {
    .adc_pin = ADC8,
    .sus_travel_min = SUS_TRAVEL_MIN_COUNTS_L,
    .sus_travel_max = SUS_TRAVEL_MAX_COUNTS_L
};

const sus_travel_potentiometer_s sus_travel_r = {
    .adc_pin = ADC9,
    .sus_travel_min = SUS_TRAVEL_MIN_COUNTS_R,
    .sus_travel_max = SUS_TRAVEL_MAX_COUNTS_R
};


// SPI config
spi_cfg_s sus_travel_spi_cfg = { .interrupt_enable = false,
                          .data_order = MSB,
                          .mode = MAIN,
                          .polarity = RISING_FALLING,
                          .phase = SAMPLE_SETUP,
                          .clock_rate = F_OSC_DIV_4, // ICM20948 max: 7MHz
                          .spi_channel = ALT_BUS };

// Debug LED
gpio_t debug_led = PB0;

// Interrupt pin
gpio_t sus_travel_int = PB7;
