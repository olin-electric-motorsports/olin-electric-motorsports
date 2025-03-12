#include "vehicle/mkvii/software/pdu/pdu.h"

// Initialize SPI bus 
void spi_bus_init() {
    spi_init(&spi_cfg);
    
    // Set chip select pins as OUTPUT and set to high
    gpio_set_mode(MCP23S17_CS, OUTPUT);
    gpio_set_pin(MCP23S17_CS);
    gpio_set_mode(ADC1283_CS, OUTPUT);
    gpio_set_pin(ADC1283_CS);
    gpio_set_mode(MAX7221_CS, OUTPUT);
    gpio_set_pin(MAX7221_CS);
}

// Write to display driver register
void max7221_write(uint8_t address, uint8_t data){
    // TODO
}

int main(void) {
    // Main Loop: 
    //  - Update shutdown node LEDs
    //  - Display HV voltage/current on display
    //  - Send CAN messages with current readings
    //  - Cooling (?)
}