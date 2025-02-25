#include "examples/16M1/display_test/display_driver.h"

// Initialize SPI communication with display driver
void spi_bus_init(){
    spi_init(&spi_cfg);
}

// Write to display driver register
void max7221_write(uint8_t address, uint8_t data){
    gpio_clear_pin(MAX7221_CS);  // Activate chip select
    spi_transmit(&address, LENGTH_ADDRESS_SPI);
    spi_transmit(&data, LENGTH_DATA_SPI);
    gpio_set_pin(MAX7221_CS);   // Deactivate chip select
}

// Initialize display driver
void max7221_init() {
    gpio_set_mode(MAX7221_CS, OUTPUT);
    gpio_set_pin(MAX7221_CS);

    // Leave shutdown
    max7221_write(SHUTDOWN, SHUTDOWN_OFF);
    
    // Enable decoding on digits 3-0
    max7221_write(DECODE, DECODE_4_DIGITS);

    // Set scan limit to display digits 3-0
    max7221_write(SCAN_LIMIT, SCAN_4_DIGITS);

    // Set intensity to max brightness
    max7221_write(INTENSITY, SET_MAX_BRIGHTNESS);

    

    // Illuminate all segments
    max7221_write(DISPLAY_TEST, DISPLAY_TEST_ON);
}

void max7221_test(){
    max7221_write(0x01, 0x00);
}

int main(void) {
    spi_bus_init();
    max7221_init();  


    // while(1){
    //     max7221_test();
    // }
}
