#include "vehicle/mkvii/software/pdu/pdu.h"
#include <util/delay.h>

// Timer 0 setup for main loop
volatile bool run_1ms = false; // Set as volatile to avoid compiler optimization breaking code
void timer_0_isr(void) {
    // The following code runs every 1ms
    run_1ms = true;
}

// Timer 1 setup for LED heartbeat
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    led_heartbeat = true;
}

// Initialize IO expander
void mcp23S17_init() {
    // Clear reset pin
    gpio_set_mode(MCP23S17_RST, OUTPUT);
    gpio_set_pin(MCP23S17_RST);

    // Set all GPIO pins' direction to output
    uint8_t tx_io[3] = {OP_WRITE, IO_DIRECTION_A, ALL_OUTPUT};
    uint8_t rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 3);
    tx_io[0] = OP_WRITE;
    tx_io[1] = IO_DIRECTION_B;
    tx_io[2] = ALL_OUTPUT;
    rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 3);
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

// Initialize hardware
void hw_init() {
    // Configure chip select pins as OUTPUT and set to high (disable for SPI)
    gpio_set_mode(MCP23S17_CS, OUTPUT);
    gpio_set_pin(MCP23S17_CS);
    gpio_set_mode(ADC1283_CS, OUTPUT);
    gpio_set_pin(ADC1283_CS);
    gpio_set_mode(MAX7221_CS, OUTPUT);
    gpio_set_pin(MAX7221_CS);

    // Configure other output GPIO pins and set to low
    gpio_set_mode(MCP23S17_RST, OUTPUT);
    gpio_clear_pin(MCP23S17_RST);
    gpio_set_mode(TS_STATUS_G, OUTPUT);
    gpio_clear_pin(TS_STATUS_G);
    gpio_set_mode(TS_STATUS_R, OUTPUT);
    gpio_clear_pin(TS_STATUS_R);
    gpio_set_mode(FAN_PWM, OUTPUT);
    gpio_clear_pin(FAN_PWM);
    gpio_set_mode(PUMP_PWM, OUTPUT);
    gpio_clear_pin(PUMP_PWM);
    gpio_set_mode(COOL_EN, OUTPUT);
    gpio_clear_pin(COOL_EN);
    gpio_set_mode(HB_LED, OUTPUT);
    gpio_clear_pin(HB_LED);

    // Configure input GPIO pins
    gpio_set_mode(SS_ESTOP_L, INPUT);
    gpio_set_mode(SS_ESTOP_R, INPUT);
    gpio_set_mode(SS_MC, INPUT);
    gpio_set_mode(SS_GLVMS, INPUT);

    // Initialize SPI bus
    spi_init(&spi_cfg);

    // Initialize CAN
    can_init_pdu();
    can_receive_dashboard();
    can_receive_throttle();
    can_receive_bspd();
    can_receive_air_control_critical();
    can_receive_bms_core();

    // Initialize IO expander
    mcp23S17_init();

    // Initialize display driver
    max7221_init();

    // Initialize main loop timer
    sei();
    timer_init(&timer_0_cfg); // Initialize main loop timer
    timer_init(&timer_1_cfg); // Initialize heartbeat timer
}

// Function to test firmware
void hw_test(){
    // // Illuminate display
    // uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    // uint8_t rxdata = 0;
    // spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Light up all shutdown LEDs
    uint8_t tx_io[3] = {OP_WRITE, IO_LATCH_A, 0xff};
    uint8_t rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 3);
    tx_io[0] = OP_WRITE;
    tx_io[1] = IO_LATCH_B;
    tx_io[2] = 0xff;
    rx_io = 0;
    spi_transceive_custom_cs(MCP23S17_CS, tx_io, &rx_io, 3);

    // Perform current reading of ADC input 1 (service section)
    // uint16_t reading = adc_read(INPUT_1);
    // pdu_test.input1_current = reading;

    // // Send CAN message
    // can_send_pdu_test();
}

// Update tractive system status LEDs
void update_ts_status(){
    // Check CAN messages for BMS or AIR control faults
    if (can_poll_receive_bms_core() == 0) {
        // Check BMS for faults
        can_receive_bms_core();
    }
    if (can_poll_receive_air_control_critical() == 0) {
        // Check AIR control for faults
        can_receive_air_control_critical();
    }

    if (bms_core.bms_state == BMS_STATE_FAULT || air_control_critical.air_state == AIR_STATE_FAULT) {
        // Set TS status light to red if there is fault from either BMS or AIR control
        gpio_clear_pin(TS_STATUS_G); // Turn off green light
        gpio_set_pin(TS_STATUS_R); // Turn on red light
    } else {
        // Otherwise, set TS status light to green
        gpio_clear_pin(TS_STATUS_R); // Turn off red light
        gpio_set_pin(TS_STATUS_G); // Turn on green light
    }
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

int main(void) {
    hw_init();
    // hw_test();

    // Main loop
    while (true) {
        if (led_heartbeat){
            // Heartbeat LED
            gpio_toggle_pin(HB_LED);
            led_heartbeat = false;
        }
        if (run_1ms) { // Run every 1ms
            // Update tractive system status LED
            update_ts_status();

            // Update shutdown node LEDs

            // Get current readings from ADC (+ publish to CAN)
            // uint16_t reading = 0xffff;
            // pdu_test.input1_current = reading;

            // // Send CAN message
            // can_send_pdu_test();

            // Update display

            // Cooling logic

            run_1ms = false; // Set run flag to false
        }
    }
}