#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"

#define LENGTH_ADDRESS_SPI 1
#define LENGTH_DATA_SPI 1

#define DECODE_4_DIGITS 0x0F
#define SCAN_4_DIGITS 0x03
#define SET_MAX_BRIGHTNESS 0x0F
#define SHUTDOWN_OFF 0x01
#define DISPLAY_TEST_ON 0x01

enum max7221_address {
    DECODE = 0x09,
    INTENSITY = 0x0A,
    SCAN_LIMIT = 0x0B,
    SHUTDOWN = 0x0C,
    DISPLAY_TEST = 0x0F,
};

// GPIO pin of atmega connected to chip select on display driver
gpio_t MAX7221_CS = PB6; 

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin = &MAX7221_CS,
};