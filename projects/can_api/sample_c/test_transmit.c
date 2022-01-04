#include "can_api.h"
#include "shutdown_generated.h"
#include <stdio.h>
#include <stdlib.h>

struct shutdown_brakelight_bspd_shutdown_t BRAKELIGHT_BSPD_SHUTDOWN_MSG;

int main() {
    test_struct
    // shutdown_CAN_init();
    // int countdown = 150;
    // uint8_t value = 0x00;
    // uint8_t second = 0xAA;
    // while (1) {
    //     if (countdown <= 0) {
    //         return 0;
    //     }
    //     //something happens and we need to update a particular message
    //     if (countdown == 70) {
    //         value = ~value; // flip all bits
    //         int s = set_brakelight_bspd_shutdown_error_code(value);
    //     }
    //     if (countdown == 30) {
    //         int s =
    //         set_brakelight_bspd_shutdown_brake_analog_voltage_msb(second);
    //     }
    //     countdown--;
    // }
}

void test_struct() {
    BRAKELIGHT_BSPD_SHUTDOWN_MSG = {
        .error_code = OxFF,
        .brake_analog_voltage_msb = OxFF,
        .brake_analog_voltage_lsb = OxFF,
        .brake_gate = OxFF,
        .bspdsense = OxFF,
    };
}