#include "vehicle/mkvii/software/integration/pdu/pdu.h"
#include <util/delay.h>

//timing and display flags adapted from charger.c logic
volatile bool display_hv_voltage = true;
uint16_t display_timer = 0;

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
    //gpio_toggle_pin(PUMP_PWM); //uncomment for cooling
}

// 7 Segment display functions adapted from charger.c

/*charger.c uses a dedicated SPI transmit
created max7221_write wrapper because the PDU requires 
spi_transceive_custom_cs to handle multiple devices 
ADC, IO Expander, Display
sharing the same bus.
spi_transceive_custom_cs is a low level tool
w/o wrapper you must manually manage several parameters 
every single time you want to talk to the display
*/
void max7221_write(uint8_t address, uint8_t data) {
    uint8_t txdata[2] = {address, data};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);
}

/* added display_number_on_7_seg because the display needs
numbers to be broken into individual digits -- math from charger.c */
void display_number_on_7_seg(float value) {
    uint16_t val_int = (uint16_t)(value); 
    
    uint8_t ones = val_int % 10;
    uint8_t tens = (val_int / 10) % 10;
    uint8_t hundreds = (val_int / 100) % 10;
    uint8_t thousands = (val_int / 1000) % 10;

    max7221_write(0x01, thousands); // Digit 1 address
    max7221_write(0x02, hundreds);  // Digit 2 address
    max7221_write(0x03, tens);      // Digit 3 address
    max7221_write(0x04, ones);      // Digit 4 address
}

// labels help the driver know what they are looking at (P=Pack, L=Load)
// from charger.c 
void display_hv_label() {
    max7221_write(0x01, 15);  // 15 = Blank
    max7221_write(0x02, 15);  
    max7221_write(0x03, 14);  // 14 = 'P'
    max7221_write(0x04, 10);  // 10 = '-' 
}

// Initialization functions

// Initialize IO expander

// TODO!!!
// read data sheet for MCP23S17_RST
// figure out how to turn on pins
// turn on specific pins on MCP23S17_RST

/* Added mcp23s17_write wrapper 02/22/25
 * handles the 3-byte SPI sequence required by the datasheet:
 * [Control Byte (Opcode)] -> [Register Address] -> [Data Byte].
 */
void mcp23s17_write(uint8_t address, uint8_t data) {
    uint8_t txdata[3] = {OP_WRITE, address, data};
    uint8_t rxdata = 0;
    spi_transceive_custom_cs(MCP23S17_CS, txdata, &rxdata, 3);
}

void mcp23S17_init() {
    // Set reset pin
    /* * RESET PIN 02/22/25
     * Per datasheet Table 1-1, driving RESET HIGH enables the device.
     * datasheet specifies that the Reset pin is active-low. 
     * If it stays low, the chip is frozen.
     */
    gpio_set_pin(MCP23S17_RST); // drives it to 5V, which wakes up the chip and allows it to accept SPI commands

    // Set all GPIO pins' direction to output
    /* DIRECTION CONTROL 02/22/25
     * every pin can be an input or an output
     * setting pin to 0 makes it an output
     * goal is to drive LEDs 
     * so set all bits to 0 (ALL_OUTPUT) during initialization 
     * to ensure the chip can provide power to those lights
     * IODIR bit 0 = Output, bit 1 = Input.
     * ALL_OUTPUT (0x00) makes all pins on Port A and Port B outputs.
     */
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
    /*
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
    */

    /* replace manual spi_transceive calls with max7221_write like in
    charger.c - easier to read 
    NOT SURE IF THIS IS RIGHT
    */
    max7221_write(SHUTDOWN, SHUTDOWN_OFF);
    max7221_write(DECODE, DECODE_4_DIGITS);
    max7221_write(SCAN_LIMIT, SCAN_4_DIGITS);
    max7221_write(INTENSITY, SET_MAX_BRIGHTNESS);

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

// Function to test firmware
void hw_test(){
    // // Illuminate display
    // uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    // uint8_t rxdata = 0;
    // spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Light up all shutdown LEDs
    /* TURNING ON PINS 02/22/25
     * Write a '1' to the OLAT (Output Latch) register bit to drive a pin HIGH.
     * acts as a buffer that holds the state (On/Off) of the LEDs until the next update cycle
     * instead of directly writing to the GPIO register which changes the physical state immediately
     */
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
    // hw_test();

    // Turn on pump and enable fans
    gpio_set_pin(COOL_EN);

    uint8_t heartbeat_counter = 0;

    // Temp: Illuminate entire display (hardcoded test pattern)
    //uint8_t txdata[2] = {DISPLAY_TEST, DISPLAY_TEST_ON};
    //uint8_t rxdata = 0;
    //spi_transceive_custom_cs(MAX7221_CS, txdata, &rxdata, 2);

    // Main loop
    while (true) {
        if (run_10ms) { // Run every 10ms
            // Update tractive system status LED
            update_ts_status();

            // MAPPING SHUTDOWN NODES TO LEDs (02/22/25)
            /* * MAPPING EXPLANATION:
             * This maps the physical input pins on the ATmega to specific bits 
             * on the IO Expander[cite: 147, 149].
             * We use Bitwise OR (|=) to combine these into one byte.
             */
            uint8_t shdn_led_byte = 0; 

            // 1. Read Left E-Stop (Input PC0) -> Map to Bit 0
            if (gpio_get_pin(SS_ESTOP_L)) { shdn_led_byte |= (1 << BIT_ESTOP_L); }

            // 2. Read Right E-Stop (Input PC6) -> Map to Bit 1
            if (gpio_get_pin(SS_ESTOP_R)) { shdn_led_byte |= (1 << BIT_ESTOP_R); }

            // 3. Read MC HV Interlock (Input PC1) -> Map to Bit 2
            if (gpio_get_pin(SS_MC)) { shdn_led_byte |= (1 << BIT_MC_INTLK); }

            // 4. Read Main Fuse / GLVMS (Input PC7) -> Map to Bit 3
            if (gpio_get_pin(SS_GLVMS)) { shdn_led_byte |= (1 << BIT_GLVMS); }

            // Write the mapped states to the IO Expander Port A Output Latch
            /* * TURNING ON PINS: 
             * We write to OLATA (IO_LATCH_A) because it represents the 
             * output register.
             */
            mcp23s17_write(IO_LATCH_A, shdn_led_byte);

            // Read sensors
            uint16_t raw_current = adc_read(INPUT_7); // PDU Fuse 
            float hv_voltage = bms_core.pack_voltage; // From CAN

            /* implemented Multiplexed Display Logic.
             * allows viewing both Voltage and Current on a 4-digit screen.
             * toggles every 1 second (100 ticks of 10ms).
             */
            display_timer++;
            if (display_timer < 100) { // Show Label
                if (display_hv_voltage) display_hv_label();
                else max7221_write(0x03, 13); // Label 'L-' for Current/Load
            } 
            else if (display_timer < 200) { // Show numeric value
                if (display_hv_voltage) display_number_on_7_seg(hv_voltage);
                else display_number_on_7_seg(raw_current);
            } 
            else {
                display_timer = 0;
                display_hv_voltage = !display_hv_voltage; // Swap mode
            }
            
            
            // Get current readings from ADC (+ publish to CAN)
            // transmit_currents();
            pdu_test.pdu_adc_raw = raw_current;
            can_send_pdu_test();

            // Update display

            // COOLING SYSTEM LOGIC 03/19/26
            /* * uses Hysteresis, a gap between on and off, to prevent the fan 
             * from flickering rapidly if the temperature sits exactly at one value.
             */

            // Check if we have received a fresh throttle message containing MC temperature
            if (can_poll_receive_throttle() == 0) {
                can_receive_throttle();
            }

            // High-temperature trigger: Turn fans ON
            if (throttle.mc_temp >= FAN_ON_THRESHOLD) {
                gpio_set_pin(FAN_PWM);
            } 
            // Low-temperature trigger: Turn fans OFF
            else if (throttle.mc_temp <= FAN_OFF_THRESHOLD) {
                gpio_clear_pin(FAN_PWM);
            }

            // TRANSMIT CURRENT READINGS
            /* * Installing proper CAN messages
             * It converts the 6 fuse ADC readings into scaled values and 
             * sends them over the CAN bus (ID 0x540).
             */
            transmit_currents();


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