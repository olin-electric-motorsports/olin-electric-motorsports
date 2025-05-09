#include "vehicle/mkvii/software/pdu/pdu.h"
#include <util/delay.h>

// Timer 0 setup for main loop
volatile bool run_10ms = false; // Set as volatile to avoid compiler optimization breaking code
void timer_0_isr(void) {
    // The following code runs every 1ms
    run_10ms = true;
}

// Timer 1 setup for software PWM
void timer_1_isr(void) {
    // Toggle pin to simulate 50% duty cycle
    
    // Commented to disable pump. Only uncomment once fluid is in cooling loop.
    //gpio_toggle_pin(PUMP_PWM);
}


// Initialize IO expander
void mcp23S17_init() {
    // Set reset pin
    gpio_set_pin(MCP23S17_RST);

    // Set all GPIO pins' direction to output
    uint8_t txdata[3] = {OP_WRITE, IO_DIRECTION_A, ALL_OUTPUT};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MCP23S17_CS, txdata, &rxdata, 3);
    txdata[0] = OP_WRITE;
    txdata[1] = IO_DIRECTION_B;
    txdata[2] = ALL_OUTPUT;
    rxdata = 0;
    spi_transceive_custom_cs(MCP23S17_CS, txdata, &rxdata, 3);
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

    // Initialize timers
    sei();
    timer_init(&timer_0_cfg); // Initialize main loop timer
    timer_init(&timer_1_cfg); // Initialize water pump PWM timer
}

// Function to test firmware - used for debugging.
void hw_test(){
    // // Illuminate display
    // uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    // uint8_t rxdata = 0;
    // spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Light up all shutdown LEDs
    uint8_t txdata[3] = {OP_WRITE, IO_LATCH_A, 0xff};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MCP23S17_CS, txdata, &rxdata, 3);
    txdata[0] = OP_WRITE;
    txdata[1] = IO_LATCH_B;
    txdata[2] = 0xff;
    rxdata = 0;
    spi_transceive_custom_cs(MCP23S17_CS, txdata, &rxdata, 3);

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

    if (bms_core.bms_state == BMS_STATE_FAULT || air_control_critical.air_fault == AIR_FAULT_IMD_STATUS) {
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
uint16_t adc_read(uint8_t input_pin){
    // 32 clock cycles (4 bytes) are needed to read current on specified channel
    uint8_t txdata[] = {input_pin, 0x00, input_pin, 0x00};
    // Receive 4 bytes of data, but we only care about the last 12 bits
    uint8_t rxdata[4];
    spi_transceive_custom_cs(ADC1283_CS, txdata, rxdata, 4);
    // Return the last 16 bits (only 12 bits contain data)
    uint16_t reading = (rxdata[2] << 8) | rxdata[3];
    // uint32_t reading = (rxdata[0] << 24) | (rxdata[1] << 16) | (rxdata[2] << 8) | rxdata[3];
    return reading;
}

// Transmit current readings over CAN
void transmit_currents() {
    // List of all ADC inputs for current sensors on fuses
    uint8_t adc_inputs[6] = {INPUT_0, INPUT_1, INPUT_2, INPUT_3, INPUT_6, INPUT_7};
    uint8_t current_readings[6];

    for (int i = 0; i < 6; i++){ // Repeat for all 6 inputs
        uint16_t adc_reading = adc_read(adc_inputs[i]); // Read ADC

        int16_t delta = (int16_t)adc_reading - QVO_COUNTS; // signed difference
    
        // Multiply by 10 before dividing to keep precision
        int16_t current_x10 = (delta * 10) / ACS_SENS_COUNTS; 
    
        if (current_x10 < 0) { current_x10 = 0; } // Clip to >0
        current_readings[i] = (uint8_t) MIN(current_x10, 255); // Clip to <255
    }

    // Assign readings to CAN message
    pdu_currents.cooling_x10 = current_readings[0]; // Input 0
    pdu_currents.service_section_x10 = current_readings[1]; // Input 1
    pdu_currents.motor_controller_x10 = current_readings[2]; // Input 2
    pdu_currents.lv_mobo_x10 = current_readings[3]; // Input 3
    pdu_currents.shutdown_x10 = current_readings[4]; // Input 6
    pdu_currents.pdu_x10 = current_readings[5]; // Input 7

    // Send out current readings over CAN
    can_send_pdu_currents();
}

int main(void) {
    hw_init();

    // Turn on pump and enable fans
    gpio_set_pin(COOL_EN);

    uint8_t heartbeat_counter = 0;

    // Temp: Illuminate entire display so it doesn't flicker.
    uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Main loop
    while (true) {
        if (run_10ms) { // Run every 10ms
            // Update tractive system status LED
            update_ts_status();

            // Update shutdown node LEDs
            // TODO: Read CAN messages and GPIO inputs to update the shutdown
            // nodes. Control LEDs through SPI IO Expander. LED on = node
            // closed, LED off = node open.

            // Get current readings from ADC (+ publish to CAN)
            transmit_currents();

            // Update display
            // TODO: display pack voltage (from V_sense ADC input), other things??

            // Cooling logic
            // TODO: route motor controller temp through a shutdown node, read
            // value, then if temp above set fan control pin to high, 
            // otherwise set fan control pin to low. Fan is not PWM.

            // Heartbeat LED
            run_10ms = false; // Set run flag to false

            heartbeat_counter++;
            if (heartbeat_counter == 50) { // Run every 500ms (2Hz)
                heartbeat_counter = 0;
                // Heartbeat LED
                gpio_toggle_pin(HB_LED);
            }
        }
    }
}