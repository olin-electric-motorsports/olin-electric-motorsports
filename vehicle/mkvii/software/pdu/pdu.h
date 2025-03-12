#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"

// Chip Select Pins
gpio_t MCP23S17_CS = PB3; 
gpio_t ADC1283_CS = PB2; 
gpio_t MAX7221_CS = PC5; 

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_16,
    .cs_pin = PB3, 
    // Ignore the chip select pin since we are using custom transcieve
    // function to interface with multiple periphreal devices
};