#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/charger.h"
#include "vehicle/mkvi/software/charging/can_api.h"


void timer0_isr(void) {
    // doing smth;
}

//loop
int main(void) {
    while(1) {
        //check status of BMS
        if (bms_charging.charger_connected){
            // get_bms_voltage
            bms_charging.charge_enable = true;
            charging_cmd.max_voltage = 3201; // 3201 = 320.1V
            charging_cmd.max_current = 582; // 582 = 58.2A
        }
        else {
            bms_charging.charge_enable = false;
        }

        //safety checks
        if (charging_fbk.hardware_fault) {
            bms_charging.charge_enable = false;
        }
        if (charging_fbk.temperature_protection) {
            bms_charging.charge_enable = false;
        }
        if (charging_fbk.charging_voltage > charging_cmd.max_voltage || charging_fbk.charging_current > charging_cmd.max_current) {
            bms_charging.charge_enable = false;
        }

    }
}