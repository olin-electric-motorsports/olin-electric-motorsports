#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include <stdint.h>

/*
 * Macros
 */
#define NUM_ICS             (12)
#define NUM_TEMPERATURE_ICS (6) // Only half the ICs monitor temperatures

// Number of cells that can be measured
#define NUM_CELLS (12)

// TODO verify over/under voltage/temperature thresholds
#define OVERVOLTAGE_THRESHOLD          (42000) // 4.2V
#define UNDERVOLTAGE_THRESHOLD         (30000) // 3.0V
#define OVERTEMPERATURE_THRESHOLD      (728) // 60 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD (1255) // 45 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD_LOW \
    (SOFT_OVER_TEMPERATURE_THRESHOLD + 500) // TODO degC
#define UNDERTEMPERATURE_THRESHOLD (7384) // 0 degC

/*
 * GPIO
 */
// Outputs
gpio_t BMS_RELAY_LSD = PC7; // Shutdown circuit relay
gpio_t RJ45_LEDG = PB3;
gpio_t RJ45_LEDO = PB4;
gpio_t CHARGE_ENABLE1 = PD0;
gpio_t CHARGE_ENABLE2 = PC0;
gpio_t GENERAL_LED = PD6;
gpio_t FAULT_LED = PD7;
gpio_t SPI_CS = PB6;

// Inputs
gpio_t nOCD = PB2; // Over-current detect
gpio_t BSPD_CURRENT_SENSE = PD1;

adc_pin_e CURRENT_SENSE_VREF = ADC8;
adc_pin_e CURRENT_SENSE_VOUT = ADC9;

// TODO
// * CHARGE_ENABLEn

/*
 * SPI
 */
spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = LSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_4,
    .cs_pin_overide = &SPI_CS,
    .pin_redirect = false,
};

/*
 * Timer
 */
void timer0_isr(void);

// ~10ms / 100 Hz tick timer
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 39,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};

// Fan PWM config
timer_cfg_s timer1_fan_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_FAST_PWM_8_BIT,
    .prescalar = CLKIO_DIV_1, // TODO
    .channel_b = {
        .channel = CHANNEL_B,
        .output_compare_match = 10, // TODO
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = false,
    },
};
