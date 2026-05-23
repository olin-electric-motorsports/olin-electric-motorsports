#include "vehicle/mkvii/software/integration/charging/can_api.h"
#include "third_party/MCP25625/MCP25625.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "libs/spi/api.h"


#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <util/delay.h>

#include <avr/interrupt.h>
void timer0_isr(void);
void timer2_isr(void);

#define LENGTH_ADDRESS_SPI 1
#define LENGTH_DATA_SPI 1

#define DECODE_4_DIGITS 0x0F
#define SCAN_4_DIGITS 0x03
#define SET_MAX_BRIGHTNESS 0x0F
#define SET_MIN_BRIGHTNESS 0x01
#define SHUTDOWN_OFF 0x01
#define DISPLAY_TEST_ON 0x01


gpio_t LED1 = PB3;
gpio_t LED2 = PB4;
gpio_t MCP25625_CS = PC4;
gpio_t MCP25625_RST = PC5;
gpio_t MCP25625_STBY = PC6;

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

//Two second timer
timer_cfg_s timer2_cfg = {
    .timer = TIMER1,
    .timer0_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 7000, 
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer2_isr,
    },
};


// FYI - parameter values still need to be tested on hardware
spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_4,
    .cs_pin = &MCP25625_CS,
};

MCP25625 charger_CAN_converter = {
    .speed = 250000,
    .spi_struct = &spi_cfg,
    .rst = &MCP25625_RST,
    .stby = &MCP25625_STBY,
};

enum max7221_address {
    DECODE = 0x09,
    INTENSITY = 0x0A,
    SCAN_LIMIT = 0x0B,
    SHUTDOWN = 0x0C,
    DISPLAY_TEST = 0x0F,
};

// GPIO pin of atmega connected to chip select on display driver
gpio_t MAX7221_CS = PC5;

spi_cfg_s MAX7221_spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin = &MAX7221_CS,
};