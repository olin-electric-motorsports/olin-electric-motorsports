#include "fault.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"

#include "libs/gpio/api.h"

void set_fault(enum FaultCode the_fault) {
    gpio_clear_pin(BMS_RELAY_LSD);

    if (bms_core.bms_fault_state == BMS_FAULT_NONE) {
        bms_core.bms_fault_state = the_fault;
    }
}
