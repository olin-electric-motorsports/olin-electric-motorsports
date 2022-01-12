#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/can/api.h"

/*
 * Macros
 */
#define NUM_ICS (10) // TODO: Number of ICs in the daisy chain
#define NUM_CELLS (16) // Number of cells that _can_ be measured (we only measure 12)
#define NUM_TEMPS (20) // Number of temperature sensors per segment

// TODO verify these
#define OVERVOLTAGE_THRESHOLD (42000) // 4.2V
#define UNDERVOLTAGE_THRESHOLD (30000) // 3.0V

// Muxes
#define NUM_MUXES (3)

/*
 * GPIO
 */
gpio_t BMS_RELAY_LSD = PC7; // Shutdown circuit relay

gpio_t RJ45_LEDG = PB3;
gpio_t RJ45_LEDO = PB4;

gpio_t CHARGE_ENABLE1 = PD0;
gpio_t CHARGE_ENABLE2 = PC0;

gpio_t GENERAL_LED = PD6;
gpio_t FAULT_LED = PD7;

gpio_t SPI_CS = PB6;

/*
 * SPI
 */
spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = LSB;
    .mode = MAIN;
    .polarity = FALLING_RISING;
    .phase = SETUP_SAMPLE;
    .clock_rate = F_OSC_DIV_4;
    cs_pin_overide = &SPI_CS; // Set as void to use default pins
    pin_redirect = false;
}


/*
 * Timer
 */
void timer0_isr(void);

// ~1ms / 1kHz tick timer
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 4,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
}

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
}
