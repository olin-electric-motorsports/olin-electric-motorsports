#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/charging/charger.h"

void timer0_cfg(void) {
    // doing smth;
}

//loop
int main(void) {
    while(1) {
        //check status of BMS
        if charger_connected {
            get_bms_voltage
            charge_enable == 1
            max_voltage == Vset // 3201 = 320.1V
            max_current == Iset // 582 = 58.2A
        }
        else {
            set_fault(charge_enable)
        }

        //safety checks
        if hardware_fault {
            set_fault(charge_enable)
        }
        if temperature_protection {
            set_fault(charge_enable)
        }
        if (charging_voltage > max_voltage | charging_current > max_current) {
            set_fault(charge_enable)
        }

    }
}