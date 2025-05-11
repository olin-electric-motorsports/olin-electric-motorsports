#include "vehicle/mkvi/software/charging/charger.h"

#define TARGET_PACK_VOLTAGE  (428) // in volts
#define CHARGING_MAX_VOLTAGE (3201) // 3201 = 320.1V
#define CHARGING_MAX_CURRENT (582) // 582 = 58.2A

// Current going through --> IN PROGRESS
// Target voltage --> DONE
// percent charged --> DONE
// current pack charged --> 
// minutes til charged --> MAYBE (IF TIME ALLOWS)

uint8_t rx_msg[5] = { 0 };
uint8_t count = 0;
bool RX_IDE, RX_RTR;
uint32_t EID = 0;

enum checks {
    HARDWARE_FAULT,
    TEMP_PROTECTION,
    INPUT_VOLTAGE,
    STARTING_STATE,
    COMMS_STATE
};
struct chgMsg {
    //Raw RX message
    uint8_t rx_msg[5];

    //See checks enum
    bool checks[5];
    float charging_voltage;
    float charging_current;
} chgMsg;


volatile bool send_can = false;
void timer0_isr(void) {
    send_can = true;
}
// Global flag to toggle display
volatile int flag = 0;
volatile bool display_target_voltage = true;
volatile bool display_target_current = false;
volatile bool display_text_debug = false;
volatile bool display_text = true;

void timer2_isr(void) {
    // Toggle the display state every 2 seconds
    flag = 1;
    if (display_target_voltage) {
        if (display_text) { //display key for value
            display_text = false;
            TIMSK0 &= ~(1 << TOIE0); 
        } else {
            display_text = true;
            display_target_voltage = false;
            display_target_current = true; //switch to display current
            TIMSK0 &= ~(1 << TOIE0); 
        }
    } if (display_target_current) {
        if (display_text) {
            if (display_text_debug) { //run display_text twice through loop, no clue why this works
                display_text = false;
            }
            display_text_debug = true;
            TIMSK0 &= ~(1 << TOIE0); 

        } else {
            display_text_debug = false;
            display_text = true;
            display_target_current = false;
            display_target_voltage = true; //switch back to voltage
            TIMSK0 &= ~(1 << TOIE0); 
        }

    }
}



void charger_can_init() {
    //Initialize the SPI bus
    spi_init(&spi_cfg);
    MCP25625_init(&charger_CAN_converter);
}

//To Program:
//SET_FUSES=1 bazel run --config=16m1 //vehicle/mkvi/software/charging -c opt -- -c usbasp


// sending SPI to charger
void spi_send_charger() {
    uint8_t bytes[8] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
    gpio_toggle_pin(LED2);

    bytes[0] = (uint8_t)((charging_cmd.target_voltage * 10) >> 8);
    bytes[1] = (uint8_t)(charging_cmd.target_voltage * 10);
    bytes[2] = (uint8_t)((charging_cmd.target_current * 6) >> 8);
    bytes[3] = (uint8_t)(charging_cmd.target_current * 6);
    bytes[4] = (uint8_t)(charging_cmd.enable_charging);
    mcp25625_send_message(0x1806E5F4, 8, bytes, true);
}

// Initialize SPI communication with display driver
void spi_bus_init(){
    spi_init(&MAX7221_spi_cfg);
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
    
}

void display_voltage_on_seven_segment(float voltage) {
    uint16_t voltage_int = (uint16_t)(voltage);  // Multiply by 10 before casting to shift the decimal place
    uint8_t ones = voltage_int % 10;  // Get ones place (first digit)
    uint8_t tens = (voltage_int / 10) % 10;  // Get tens place (second digit)
    uint8_t hundreds = (voltage_int/ 100) % 10;  // Get hundreds place (third digit)
    uint8_t thousands = (voltage_int/ 1000) % 10;
    // Update display with hundreds, tens, and ones digits
    max7221_write(0x01, thousands);  // Write thousands place
    max7221_write(0x02, hundreds);  // Write hundreds place
    max7221_write(0x03, tens);      // Write tens place
    max7221_write(0x04, ones);      // Write ones place
}

void display_pack_on_seven_segment() {
    max7221_write(0x01, 15);  // Blank
    max7221_write(0x02, 15);  // Blank
    max7221_write(0x03, 14);  // Write P
    max7221_write(0x04, 10);  // Write -
}

void display_volt_on_seven_segment() {
    max7221_write(0x01, 15);  // Blank
    max7221_write(0x02, 15);  // Blank
    max7221_write(0x03, 13);  // Write L
    max7221_write(0x04, 10);  // Write -
}

// // receiving SPI from charger
// // parse data from charger
// void spi_receive_charger() {
//     if (mcp25625_msg_ready(RXB0)) {
//         mcp25625_msg_read(RXB0, rx_msg, &count, &EID, &RX_IDE, &RX_RTR);
        
//         //Load charger can vars
//         chgMsg.charging_voltage = (float)((uint16_t)rx_msg[0] << 8 | rx_msg[1]) * 0.1;
//         chgMsg.charging_current = (float)((uint16_t)rx_msg[2] << 8 | rx_msg[3]) * 0.1;


//         for (int i = 0; i < 5; i++) {
//             chgMsg.checks[i] = (bool)((rx_msg[4] >> i) & 0x01);
//         }
//     }
// }

uint8_t ten_ms_counter = 0;
uint8_t charger_timeout = 0; // Percentage we want to use? 

// loop
int main(void) {

    spi_bus_init();
    max7221_init();  

    // Enable interrupts
    sei();

    // Enable 100Hz update rate
    timer_init(&timer0_cfg);
    timer_init(&timer2_cfg);

    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);

    // Init SPI/CAN tranciever
    charger_can_init();

    // Init 16M1 CAN tranciever
    can_init_charger();

        _delay_ms(20);

    can_receive_charging_cmd();
    can_receive_bms_core();
    // can_poll_receive_bms_core();
    // can_poll_receive_charging_cmd();
    

    while (1) {

        if (display_target_voltage) {
            if (display_text) {
                display_pack_on_seven_segment(); // bms_core.pack_current swap out to test current
            } 
            else {
                display_voltage_on_seven_segment(bms_core.pack_current/TARGET_PACK_VOLTAGE); //battery percent
            }
        } if (display_target_current) {
            if (display_text) {
                display_volt_on_seven_segment(); //placeholder key name for pack voltage
            } 
            else {
                display_voltage_on_seven_segment(TARGET_PACK_VOLTAGE);
            }
        }
    
        // check status of BMS
        if (send_can) {
            if (can_poll_receive_bms_core() == 0) {
                can_send_charging_fbk();
                gpio_set_pin(LED1);
                charging_fbk.charging_voltage = 4000;
                can_receive_bms_core(); // core data         
            }
            //Broker exchange with the car (get charging targets and OK from BMS core)
            if (can_poll_receive_charging_cmd() == 0) {
                can_receive_charging_cmd(); // charging targets
                
                charger_timeout = 0;
            }
            else {
                //
                if(charger_timeout < 100) {
                    charger_timeout++;
                }
                else {
                    charging_cmd.target_voltage = 0;
                    charging_cmd.target_current = 0;
                    charging_cmd.enable_charging = 0;
                     // gpio_clear_pin(LED1);
                }
            }



            //Handle Elcon charger CAN interaction


            // spi_receive_charger();
            // // values would initialize to 0 if poll receives fail
            // if (bms_core.pack_voltage < TARGET_PACK_VOLTAGE) {
            //     if (bms_charging.charge_enable) {
            //         charging_cmd.enable = true;
            //         charging_cmd.max_voltage = CHARGING_MAX_VOLTAGE;
            //         charging_cmd.max_current = CHARGING_MAX_CURRENT;
            //     } else {
            //         charging_cmd.enable = false;
            //     }
            // }
            // // safety checks
            // if (hardware_fault) {
            //     charging_cmd.enable = false;
            // }
            // if (temperature_protection) {
            //     charging_cmd.enable = false;
            // }
            // if (charging_voltage > charging_cmd.max_voltage
            //     || charging_current > charging_cmd.max_current) {
            //     charging_cmd.enable = false;
            // }
            // spi_send_charger();
            
            // _delay_ms(100);
            
            
            ten_ms_counter++;
            if(ten_ms_counter == 100) {
                spi_send_charger();
                ten_ms_counter = 0;
            }
            send_can = false;
        }
    }
}
