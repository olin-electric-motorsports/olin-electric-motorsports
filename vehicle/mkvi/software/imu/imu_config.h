#pragma once

#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/imu/icm20948/icm20948.h"

// IMU data read timer config
void timer_0_isr(void);
timer_cfg_s timer_0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x12, // 326Hz
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

// ICM20948 pins
gpio_t cs = PC4;
gpio_t imu_int = PB7;

// SPI config
spi_cfg_s imu_spi_cfg = { .interrupt_enable = false,
                          .data_order = MSB,
                          .mode = MAIN,
                          .polarity = RISING_FALLING,
                          .phase = SAMPLE_SETUP,
                          .clock_rate = F_OSC_DIV_4, // ICM20948 max: 7MHz
                          .cs_pin = &cs,
                          .spi_channel = ALT_BUS };

// Debug LED
gpio_t debug_led = PD6;

// Binary ID pins, for physically differentiating IMUs on the same CAN bus
gpio_t bin_id_0 = PC7;
gpio_t bin_id_1 = PC6;
gpio_t bin_id_2 = PC5;

/**
 * ICM config
 */
accel_fsr_e accel_fsr = ACCEL_FSR_8G;
gyro_fsr_e gyro_fsr = GYRO_FSR_2000;
