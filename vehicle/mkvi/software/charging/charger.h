#include "vehicle/mkvi/software/charging/can_api.h"
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