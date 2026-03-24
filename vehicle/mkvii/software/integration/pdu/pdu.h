#include <avr/interrupt.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/integration/pdu/can_api.h"

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>

// Macro that returns the minimum between two values
#define MIN(a, b) (((a) < (b)) ? (a) : (b))

/*
Transfer function constants for ACS37010LLZATR-030B5 current sensor and ADC1283 ADC.

The ADC outputs raw digital values from 0–4095 (12-bit ADC). 
Thus, we must convert voltage values into equivalent "ADC counts."

ADC counts per volt for a 5V, 12-bit ADC:
    4095 / 5V = 819 (ADC counts)/V

For V_qvo = 2.5V (zero-current output voltage):
    2.5V × 819 counts/V = 2047 ADC counts

For ACS37010 sensitivity = 0.0667V/A:
    0.0667 V/A × 819 counts/V ≈ 55 (ADC counts)/A
*/
#define QVO_COUNTS 2047 // V_qvo in ADC counts
#define ACS_SENS_COUNTS 55 // ACS sensitivity in (ADC counts) / A

// Cooling thresholds
#define FAN_ON_THRESHOLD  80 // Turn fan on if MC temp >= 80C
#define FAN_OFF_THRESHOLD 40 // Turn fan off if MC temp <= 40C

// Pin definitions
gpio_t MCP23S17_CS = PB3; // mcp23s17 - Chip select
gpio_t ADC1283_CS = PB2; // adc1283 - Chip select
gpio_t MAX7221_CS = PC5; // max7221 - Chip select
gpio_t MCP23S17_RST = PB4; // mcp23s17 - Reset
gpio_t TS_STATUS_G = PB5; // Output for tractive system status green LED
gpio_t TS_STATUS_R = PB6; // Output for tractive system status red LED
gpio_t FAN_PWM = PD0; // Output for PWM signal to fan
gpio_t PUMP_PWM = PD1; // Output for PWM signal to pump
gpio_t COOL_EN = PD5; // Output to enable cooling system
gpio_t HB_LED = PD7; // Output for heartbeat LED
gpio_t SS_ESTOP_L = PC0; // Input for service section left estop
gpio_t SS_ESTOP_R = PC6; // Input for service section right estop
gpio_t SS_MC = PC1; // Input for motor controller high voltage interlock
gpio_t SS_GLVMS = PC7; // Input for main fuse 


// Bitmask definitions for LED Mapping (02/22/25)
#define BIT_ESTOP_L    0  // Map PC0 to Expander Bit 0
#define BIT_MC_INTLK   1  // Map PC1 to Expander Bit 1
#define BIT_ESTOP_R    2  // Map PC6 to Expander Bit 2
#define BIT_GLVMS      3  // Map PC7 to Expander Bit 3

// Opcodes for mcp23s17
typedef enum {
    OP_WRITE = 0x40,
    OP_READ = 0x41,
} mcp23s17_opcode;

// Addresses for mcp23s17 (Assumes IOCON.BANK = 0)
typedef enum {
    IO_DIRECTION_A = 0x00,
    IO_DIRECTION_B = 0x01,
    IO_LATCH_A = 0x14,
    IO_LATCH_B = 0x15, 
} mcp23s17_address;

// Commands for mcp23s17
typedef enum {
    ALL_OUTPUT = 0x00,
} mcp23s17_command;

// Commands for adc1283
typedef enum {
    INPUT_0 = 0x00, // Current at cooling fuse
    INPUT_1 = 0x08, // Current at service section fuse
    INPUT_2 = 0x10, // Current at motor controller fuse
    INPUT_3 = 0x18, // Current at LV motherboard fuse
    INPUT_4 = 0x20, // Voltage at main fuse
    INPUT_5 = 0x28, // Temperature signal from cooling
    INPUT_6 = 0x30, // Current at shutdown fuse (roll hoop)
    INPUT_7 = 0x38, // Current at PDU fuse
} adc1283_command;

// Addresses for max7211
typedef enum {
    DECODE = 0x09,
    INTENSITY = 0x0A,
    SCAN_LIMIT = 0x0B,
    SHUTDOWN = 0x0C,
    DISPLAY_TEST = 0x0F,
} max7221_address;

// Commands for max7221
typedef enum {
    DECODE_4_DIGITS = 0x0F,
    SCAN_4_DIGITS = 0x03,
    SET_MAX_BRIGHTNESS = 0x0F,
    SHUTDOWN_OFF = 0x01,
    DISPLAY_TEST_ON = 0x01,
} max7221_command;

// 10ms main loop timer config
void timer_0_isr(void);
timer_cfg_s timer_0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x27, // 100 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_0_isr,
    },
};

/* 
Water pump PWM config: 100 Hz 50% duty cycle

On MKVII, the pump PWM signal pin is not connected to the pins controlled by 
Timer 1 (PDU design error), which means that we cannot use the hardware PWM to
control the pump. Instead we implement a software PWM by using a compare match
timer with an interrupt.
*/
void timer_1_isr(void);
timer_cfg_s timer_1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x4E, // 100 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_1_isr,
    },
};


// SPI config struct
spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin = &MAX7221_CS, 
    // Ignore the chip select pin since we are using custom transcieve
    // function to interface with multiple periphreal devices
};