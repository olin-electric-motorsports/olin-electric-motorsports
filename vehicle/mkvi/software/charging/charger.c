#include "vehicle/mkvi/software/charging/charger.h"
#include "MCP25625.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/can_api.h"
#include <stdint.h>
#include <stdio.h>

#define TARGET_PACK_VOLTAGE  (360) // in volts
#define CHARGING_MAX_VOLTAGE (201) // 3201 = 320.1V
#define CHARGING_MAX_CURRENT (582) // 582 = 58.2A

uint8_t rx_msg[5] = { 0 };
uint8_t count = 0;
bool RX_IDE, RX_RTR;
uint32_t EID = 0;

float charging_voltage = 0;
float charging_current = 0;
bool hardware_fault = false;
bool temperature_protection = false;
bool input_voltage = false;
bool starting_state = false;
bool communication_state = false;
bool* checks[] = { &hardware_fault, &temperature_protection, &input_voltage,
                   &starting_state, &communication_state };

// helper function
uint16_t binaryToDecimal(uint16_t binaryNumber) {
    uint16_t decimalNumber = 0;
    uint16_t base = 1;

    while (binaryNumber > 0) {
        // Extract the rightmost bit of the binary number
        uint16_t bit = binaryNumber % 10;

        // Add the bit multiplied by the base to the decimal number
        decimalNumber += bit * base;

        // Move to the next bit and update the base
        binaryNumber /= 10;
        base *= 2;
    }

    return decimalNumber;
}

volatile bool send_can = false;
void timer0_isr(void) {
    send_can = true;
}

void charger_can_init() {
    spi_init(&spi_cfg);
    mcp25625_init(OPMODE_NORMAL);
}

// bazel build --config=16m1 //vehicle/mkvi/software/charging:charging -c opt

// sending SPI to charger
void spi_send_charger() {
    uint8_t bytes[5] = { 0 };
    bytes[0] = (charging_cmd.max_voltage * 10) & 0b11111111;
    bytes[1] = (charging_cmd.max_voltage * 10) >> 8;
    bytes[2] = (charging_cmd.max_current * 10) & 0b11111111;
    bytes[3] = (charging_cmd.max_current * 10) >> 8;
    bytes[4] = charging_cmd.enable;
    mcp25625_msg_load(TXB0, bytes, 5, 0x80, true, false);
    mcp25625_msg_send(TXB0);
}

// receiving SPI from charger
// parse data from charger
void spi_receive_charger() {
    if (mcp25625_msg_ready(RXB0)) {
        mcp25625_msg_read(RXB0, rx_msg, &count, &EID, &RX_IDE, &RX_RTR);
        // assigning spi data to variables
        charging_voltage
            = binaryToDecimal((uint16_t)rx_msg[0] << 8 | rx_msg[1]) * 0.1;
        charging_current
            = binaryToDecimal((uint16_t)rx_msg[2] << 8 | rx_msg[3]) * 0.1;
        for (int i = 0; i < 5; i++) {
            *checks[i] = (bool)((rx_msg[4] >> i) & 0x01);
        }
    }
}

// 3/4 note: changed MCP25625_hw.c delay function (commented lib out & put empty
// for loops instead)

// loop
int main(void) {
    // insert extend mode thingy + change baud rate; try use existing can.c
    // thing

    charger_can_init();

    // modify while loop to include a clock / delay
    while (1) {
        // check status of BMS
        //  poll like asking a question is there can data or not; verifying if
        //  the message exists or not
        if (send_can) {
            if (can_poll_receive_bms_core() == 0) {
                can_receive_bms_core(); // getting can data
            }
            if (can_poll_receive_bms_charging() == 0) {
                can_receive_bms_charging(); // will be added into bms.yml soon
            }
            spi_receive_charger();
            // values would initialize to 0 if poll receives fail
            if (bms_core.pack_voltage < TARGET_PACK_VOLTAGE) {
                if (bms_charging.charge_enable) {
                    charging_cmd.enable = true;
                    charging_cmd.max_voltage = CHARGING_MAX_VOLTAGE;
                    charging_cmd.max_current = CHARGING_MAX_CURRENT;
                } else {
                    charging_cmd.enable = false;
                }
            }
            // safety checks
            if (hardware_fault) {
                charging_cmd.enable = false;
            }
            if (temperature_protection) {
                charging_cmd.enable = false;
            }
            if (charging_voltage > charging_cmd.max_voltage
                || charging_current > charging_cmd.max_current) {
                charging_cmd.enable = false;
            }
            spi_send_charger();
            send_can = false;
        }
    }
}