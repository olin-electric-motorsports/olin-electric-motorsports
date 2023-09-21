#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"


#define NO_OPEN_WIRES (65535)

int openwire_task(void) {
    static cell_asic ics[NUM_ICS];
    int ret = 0;

    LTC681x_run_openwire_single(NUM_ICS, ics);

    long open_wire;
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        open_wire = ics[ic].system_open_wire;

        if (open_wire != NO_OPEN_WIRES) {
            set_fault(BMS_FAULT_OPEN_WIRE);
            ret = 1;
        }
    }

    return ret;
}