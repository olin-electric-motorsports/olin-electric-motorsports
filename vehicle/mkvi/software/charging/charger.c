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
        if bms_charging.charger_connected {
            // get_bms_voltage
            bms_charging.charge_enable == 1
            charging_cmd.max_voltage == Vset // 3201 = 320.1V
            charging_cmd.max_current == Iset // 582 = 58.2A
        }
        else {
            set_fault(bms_charging.charge_enable)
        }

        //safety checks
        if bms_charging.hardware_fault {
            set_fault(charge_enable)
        }
        if charging_fbk.temperature_protection {
            set_fault(charge_enable)
        }
        if (charging_fbk.charging_voltage > charging_cmd.max_voltage | charging_fbk.charging_current > charging_cmd.max_current) {
            set_fault(charge_enable)
        }

    }
}