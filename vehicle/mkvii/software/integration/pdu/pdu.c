#include "vehicle/mkvii/software/pdu/pdu.h"

// Initialize hardware
void hw_init() {
    // Initialize SPI bus
    spi_init(&spi_cfg);
    // Set chip select pins as OUTPUT and set to high (disabled)
    gpio_set_mode(MCP23S17_CS, OUTPUT);
    gpio_set_pin(MCP23S17_CS);
    gpio_set_mode(ADC1283_CS, OUTPUT);
    gpio_set_pin(ADC1283_CS);
    gpio_set_mode(MAX7221_CS, OUTPUT);
    gpio_set_pin(MAX7221_CS);

    mcp23S17_init();

    max7221_init();
}

// Initialize IO expander
void mcp23S17_init() {
    // Set GPIO pins' direction to output
    spi_transceive_custom_cs(MCP23S17_CS, (uint8_t[]){IO_DIRECTION_A, ALL_OUTPUT}, (uint8_t[]){0, 0}, 2);
    spi_transceive_custom_cs(MCP23S17_CS, (uint8_t[]){IO_DIRECTION_B, ALL_OUTPUT}, (uint8_t[]){0, 0}, 2);
}

// Initialize display driver
void max7221_init() {
    // Leave shutdown mode
    spi_transceive_custom_cs(MAX7221_CS, (uint8_t[]){SHUTDOWN, SHUTDOWN_OFF}, (uint8_t[]){0, 0}, 2);
    // Enable decoding on digits 3-0
    spi_transceive_custom_cs(MAX7221_CS, (uint8_t[]){DECODE, DECODE_4_DIGITS}, (uint8_t[]){0, 0}, 2);
    // Set scan limit to display digits 3-0
    spi_transceive_custom_cs(MAX7221_CS, (uint8_t[]){SCAN_LIMIT, SCAN_4_DIGITS}, (uint8_t[]){0, 0}, 2);
    // Set intensity to max brightness
    spi_transceive_custom_cs(MAX7221_CS, (uint8_t[]){INTENSITY, SET_MAX_BRIGHTNESS}, (uint8_t[]){0, 0}, 2);
}

void hw_test(){
    //// Test firmware
    // Illuminate display
    spi_transceive_custom_cs(MAX7221_CS, (uint8_t[]){DISPLAY_TEST, DISPLAY_TEST_ON}, (uint8_t[]){0, 0}, 2);
    // Light up all shutdown LEDs
    // Send CAN message with current readings
}

int main(void) {
    hw_init();
    hw_test();

    // Main Loop: 
    //  - Update shutdown node LEDs
    //  - Display HV voltage/current on display
    //  - Send CAN messages with current readings
    //  - Cooling (???)
}