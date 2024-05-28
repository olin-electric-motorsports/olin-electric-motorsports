#include "vehicle/mkvi/software/charging/charger.h"
//#include "MCP25625.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/can_api.h"
#include <stdint.h>
#include <stdio.h>
#include <util/delay.h>

#include <avr/interrupt.h>

#include <stdbool.h>

#define TARGET_PACK_VOLTAGE  (360) // in volts
#define CHARGING_MAX_VOLTAGE (3201) // 3201 = 320.1V
#define CHARGING_MAX_CURRENT (582) // 582 = 58.2A

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

void charger_can_init() {
    //spi_init(&spi_cfg);
    //mcp25625_init(OPMODE_NORMAL);
}

// bazel build --config=16m1 //vehicle/mkvi/software/charging:charging -c opt

// sending SPI to charger
// void spi_send_charger() {
//     uint8_t bytes[5] = { 0 };
//     bytes[0] = (uint16_t)(charging_cmd.max_voltage * 10) & 0xFF;
//     bytes[1] = (uint16_t)(charging_cmd.max_voltage * 10) >> 8;
//     bytes[2] = (uint16_t)(charging_cmd.max_current * 10) & 0xFF;
//     bytes[3] = (uint16_t)(charging_cmd.max_current * 10) >> 8;
//     bytes[4] = charging_cmd.enable;
//     mcp25625_msg_load(TXB0, bytes, 5, 0x80, true, false);
//     mcp25625_msg_send(TXB0);
// }

// receiving SPI from charger
// parse data from charger
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

// 3/4 note: changed MCP25625_hw.c delay function (commented lib out & put empty
// for loops instead)

// loop
int main(void) {
    sei();
    timer_init(&timer0_cfg);

    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);
    // gpio_set_pin(LED1);
    // insert extend mode thingy + change baud rate; try use existing can.c
    // thing


    can_init_charger();

    // modify while loop to include a clock / delay
    while (1) {
        // check status of BMS
        //  poll like asking a question is there can data or not; verifying if
        //  the message exists or not

        if (send_can) {
            can_send_charging_cmd();
            gpio_set_pin(LED2);
            // gpio_set_pin(LED1);
            if (can_poll_receive_bms_core() == 0) {
                can_receive_bms_core(); // getting can data
                gpio_set_pin(LED1);
            }
            else {
                gpio_clear_pin(LED2);
            }
            // if (can_poll_receive_bms_charging() == 0) {
            //     can_receive_bms_charging(); // will be added into bms.yml soon
            // }
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
            send_can = false;
        }
    }
}