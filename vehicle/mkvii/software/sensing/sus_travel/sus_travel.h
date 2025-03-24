#pragma once

#include "libs/can/api.h"
#include "libs/adc/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#define MIN_SUS_STRAIN_POS 0 // In mV/V
#define MAX_SUS_STRAIN_POS_FRONT 6.5 // In mV/V, where excitation is 5V and RO is 1.3 mV/V
#define MAX_SUS_STRAIN_POS_REAR 10 // In mV/V, where excitation is 5V and RO is 2 mV/V

/*
buffer here to make sure we don't request torque when small deviations
in potentiometer happen and we aren't pressing pedal
*/
#define SUS_STRAIN_BUFFER (0.1) // placeholder value, may be less or more dependent on 
                               // how much noise is in the system

/*
Minimum and maximum ADC counts representing 0% and 100% pedal travel
Last calibrated 11-30-2023 for MKVI
*/
// #define SUS_STRAIN_MIN_COUNTS_L (int16_t)((49 + SUS_STRAIN_BUFFER) >> 2)
// #define SUS_STRAIN_MAX_COUNTS_L (int16_t)((876 - SUS_STRAIN_BUFFER) >> 2)
// #define SUS_STRAIN_MIN_COUNTS_R (int16_t)((49 + SUS_STRAIN_BUFFER) >> 2)
// #define SUS_STRAIN_MAX_COUNTS_R (int16_t)((876 - SUS_STRAIN_BUFFER) >> 2)

// IMU data read timer config
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
    // represents a suspensions strain gauge
    int gpio_pin;
    gpio_t clk_pin;
    gpio_t dat_pin;
    int16_t data;
} SusStrain;

SusStrain SUS_STRAIN_l = {
    .gpio_pin = 0, // Initialize with appropriate value
    .clk_pin = PB3,
    .dat_pin = PB2,
    .data = 0,
};

SusStrain SUS_STRAIN_r = {
    .gpio_pin = 1, // Initialize with appropriate value
    .clk_pin = PB5,
    .dat_pin = PB4,
    .data = 0,
};

// SPI config
spi_cfg_s SUS_STRAIN_spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = RISING_FALLING,
    .phase = SAMPLE_SETUP,
    .clock_rate = F_OSC_DIV_4, // ICM20948 max: 7MHz
    // .cs_pin = &cs, // Uncomment and define cs_pin if needed
    .spi_channel = ALT_BUS
};

// Debug LED
gpio_t debug_led = PB0;
gpio_t heartbeat = PB1;

// Interrupt pin
gpio_t SUS_STRAIN_int = PC6;

// Function prototypes
void init_peripherals(void);
int16_t get_sus_strain(SusStrain *sus_strain, bool is_left_sus_strain);