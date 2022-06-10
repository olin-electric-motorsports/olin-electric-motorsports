#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

/*
 * GPIO
 */
// Outputs
gpio_t BMS_RELAY_LSD = PC7; // Shutdown circuit relay
gpio_t RJ45_LEDG = PB3; // Unused
gpio_t RJ45_LEDO = PB4; // Unused
gpio_t CHARGER_DETECT_OUT = PD0;
gpio_t CHARGER_DETECT_IN = PC0;
gpio_t GENERAL_LED = PD6;
gpio_t FAULT_LED = PD7;
gpio_t SPI_CS = PB6;
gpio_t FAN_PWM = PC1;

// Inputs
gpio_t nOCD = PB2; // Over-current detect
gpio_t BSPD_CURRENT_SENSE = PD1;

adc_pin_e CURRENT_SENSE_VREF = ADC8;
adc_pin_e CURRENT_SENSE_VOUT = ADC9;

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

// ~10ms / 100 Hz tick timer
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

// Fan PWM config (25 kHz)
timer_cfg_s timer1_fan_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_PHASE_CORRECT_PWM_10_BIT,
    .prescalar = CLKIO_DIV_8,
    .channel_a = {
        .output_compare_match = 0x50,
    },
    .channel_b = {
        .channel = CHANNEL_B,
        .output_compare_match = 0x20, // 40% duty cycle
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = false,
    },
};
