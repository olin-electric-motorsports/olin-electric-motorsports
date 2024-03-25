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
        bms_core.bms_state = BMS_STATE_ACTIVE;
        return 0;
    } else {
        bms_core.bms_state = BMS_STATE_FAULT;
        return 1;
    }
}

void set_csc_mia(enum csc_mia the_csc) {
    bms_metrics.csc_status |= (1 << the_csc);
}

void clear_csc_mia(enum csc_mia the_csc) {
    bms_metrics.csc_status &= ((1 << the_csc) ^ UINT8_MAX);
}

int check_csc_state(void) {
    if (bms_metrics.csc_status == 0) {
        return 0;
    } else {
        return 1;
    }
}
