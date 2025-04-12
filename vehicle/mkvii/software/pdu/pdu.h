#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/pdu/can_api.h"

// Pin definitions
gpio_t MCP23S17_CS = PB3; // mcp23s17 - Chip select
gpio_t MCP23S17_RST = PB4; // mcp23s17 - Reset
gpio_t ADC1283_CS = PB2; // adc1283 - Chip select
gpio_t MAX7221_CS = PC5; // max7221 - Chip select

gpio_t TS_STATUS_G = PB5; // Tractive system status green LED
gpio_t TS_STATUS_R = PB6; // Tractive system status red LED

// Opcodes for mcp23s17
typedef enum {
    OP_WRITE = 0x40,
    OP_READ = 0x41,
} mcp23s17_opcode;

// Addresses for mcp23s17 (Assumes IOCON.BANK = 0)
typedef enum {
    IO_DIRECTION_A = 0x00,
    IO_DIRECTION_B = 0x01,
    IO_GPIO_A = 0x12,
    IO_GPIO_B = 0x13, 
} mcp23s17_address;

// Commands for mcp23s17
typedef enum {
    ALL_OUTPUT = 0x00,
} mcp23s17_command;

// Commands for adc1283
typedef enum {
    INPUT_0 = 0x00,
    INPUT_1 = 0x08,
    INPUT_2 = 0x10,
    INPUT_3 = 0x18,
    INPUT_4 = 0x20,
    INPUT_5 = 0x28,
    INPUT_6 = 0x30,
    INPUT_7 = 0x38,
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

// Heartbeat timer config
void timer_0_isr(void);
timer_cfg_s timer_0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x7A1, // 2 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_0_isr,
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