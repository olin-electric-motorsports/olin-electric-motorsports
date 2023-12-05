#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/charger.h"
#include "vehicle/mkvi/software/charging/can_api.h"

#define TARGET_PACK_VOLTAGE (360) // in volts
#define CHARGING_MAX_VOLTAGE (201) // 3201 = 320.1V
#define CHARGING_MAX_CURRENT (582) // 582 = 58.2A

void timer0_isr(void) {
    // doing smth;
}

//loop
int main(void) {

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