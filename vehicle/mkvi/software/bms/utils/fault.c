#include "fault.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"

#include "libs/gpio/api.h"

void set_fault(enum bms_fault the_fault) {
    gpio_clear_pin(BMS_RELAY_LSD);

    bms_core.bms_fault_code |= (1 << the_fault);
}

void clear_fault(enum bms_fault the_fault) {
    bms_core.bms_fault_code &= ((1 << the_fault) ^ UINT16_MAX);
}

int check_fault_state(void) {
    if (bms_core.bms_fault_code == 0) {
        bms_core.bms_fault = BMS_FAULT_NONE;
        return 0;
    } else {
        bms_core.bms_fault = BMS_FAULT_FAULT;
        return 1;
    }
}
