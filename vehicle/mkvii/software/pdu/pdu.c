#include "vehicle/mkvii/software/pdu/pdu.h"

// Initialize IO expander
void mcp23S17_init() {
    // Set all GPIO pins' direction to output
    uint8_t tx_io[3] = {OP_WRITE, IO_DIRECTION_A, ALL_OUTPUT};
    uint8_t rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 2);

    tx_io[0] = OP_WRITE;
    tx_io[1] = IO_DIRECTION_B;
    tx_io[2] = ALL_OUTPUT;
    rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 2);
}

// Initialize display driver
void max7221_init() {
    // Leave shutdown mode
    uint8_t txdata[2] = {SHUTDOWN, SHUTDOWN_OFF};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Enable decoding on digits 3-0
    txdata[0] = DECODE;
    txdata[1] = DECODE_4_DIGITS;
    rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);
    
    // Set scan limit to display digits 3-0
    txdata[0] = SCAN_LIMIT;
    txdata[1] = SCAN_4_DIGITS;
    rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Set intensity to max brightness
    txdata[0] = INTENSITY;
    txdata[1] = SET_MAX_BRIGHTNESS;
    rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

}

// ADC Read
uint16_t adc_read(adc1283_command input_pin){
    // 32 clock cycles (4 bytes) are needed to read current on specified channel
    uint8_t tx_data[] = {input_pin, 0x00, input_pin, 0x00};
    // Receive 4 bytes of data, but we only care about the last 12 bits
    uint8_t rx_data[4];
    spi_transceive_custom_cs(ADC1283_CS, tx_data, rx_data, 4);
    // Return the last 16 bits (first 4 bits are zero, so returning last 12 bits in effect)
    uint16_t reading = (rx_data[2] << 8) | rx_data[3];
    return reading;
}

// Initialize hardware
void hw_init() {
    // Initialize SPI bus
    spi_init(&spi_cfg);

    // Configure chip select pins as OUTPUT and set to high (disabled)
    gpio_set_mode(MCP23S17_CS, OUTPUT);
    gpio_set_pin(MCP23S17_CS);
    gpio_set_mode(ADC1283_CS, OUTPUT);
    gpio_set_pin(ADC1283_CS);
    gpio_set_mode(MAX7221_CS, OUTPUT);
    gpio_set_pin(MAX7221_CS);

    // Initialize IO expander
    mcp23S17_init();

    // Initialize display driver
    max7221_init();

    // Initialize CAN
    can_init_pdu();
}

// Test firmware
void hw_test(){
    // Illuminate display
    uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Light up all shutdown LEDs
    uint8_t tx_io[3] = {OP_WRITE, IO_GPIO_A, 0xff};
    uint8_t rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 2);
    tx_io[0] = OP_WRITE;
    tx_io[1] = IO_GPIO_B;
    tx_io[2] = 0xff;
    rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 2);

    // Perform current reading of ADC input 1 (service section)
    uint16_t reading = adc_read(INPUT_1);
    pdu_test.input1_current = reading;

    // Send CAN message
    can_send_pdu_test();
}

int main(void) {
    hw_init();
    hw_test();

    //// Main Loop: 
    //  - Update shutdown node LEDs
    //  - Display HV voltage/current on display
    //  - Send CAN messages with current readings
    //  - Cooling (???)
}