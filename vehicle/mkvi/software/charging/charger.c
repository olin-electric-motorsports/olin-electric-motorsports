#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/charger.h"
#include "vehicle/mkvi/software/charging/can_api.h"
#include <stdint.h>
#include "MCP25625.h"
#include "vehicle/mkvi/software/charging/can_api.h"

#define TARGET_PACK_VOLTAGE (360) // in volts
#define CHARGING_MAX_VOLTAGE (201) // 3201 = 320.1V
#define CHARGING_MAX_CURRENT (582) // 582 = 58.2A

uint8_t rx_msg[5] = { 0 };
uint8_t count = 0;
bool RX_IDE, RX_RTR;
uint32_t EID = 0;


void timer0_isr(void) {
    // doing smth;_
}

void spi_int(){
    mcp25625_init(OPMODE_NORMAL);
}

//bazel build --config=16m1 //vehicle/mkvi/software/charging:charging -c opt

// sending SPI to charger
void spi_send_charger(){
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
//next task: parse data
void spi_receive_charger(){
    if( mcp25625_msg_ready( RXB0 ) )
        {
            mcp25625_msg_read( RXB0, rx_msg, &count, &EID, &RX_IDE, &RX_RTR );
        }
}

//loop
int main(void) {

    //insert extend mode thingy + change baud rate; try use existing can.c thing

    can_init_elcon_hk_j_440_10();

    can_receive_bms_core();
    can_receive_charging_fbk();
    can_receive_bms_charging(); // will be added into bms.yml soon

    while(1) {
        //check status of BMS
        // poll like asking a question is there can data or not; verifying if the message exists or not
        if (can_poll_receive_bms_core() == 0){
            can_receive_bms_core(); // getting can data
        }
        if (can_poll_receive_charging_fbk() == 0){
            can_receive_charging_fbk();
        }
        // values would initialize to 0 if poll receives fail
        if (bms_core.pack_voltage < TARGET_PACK_VOLTAGE){
            if (bms_charging.charge_enable){
                charging_cmd.enable = true;
                charging_cmd.max_voltage = CHARGING_MAX_VOLTAGE; 
                charging_cmd.max_current = CHARGING_MAX_CURRENT; 
            }
            else {
                charging_cmd.enable = false;
            }
        }
        //safety checks
        if (charging_fbk.hardware_fault) {
            charging_cmd.enable = false;
        }
        if (charging_fbk.temperature_protection) {
            charging_cmd.enable = false;
        }
        if (charging_fbk.charging_voltage > charging_cmd.max_voltage || charging_fbk.charging_current > charging_cmd.max_current) {
            charging_cmd.enable = false;
        }

    }
}