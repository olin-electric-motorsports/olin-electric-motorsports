#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/utils/fault.h"

/*
 * ic.system_open_wire is a 16 bit number. Each bit is an open wire (1: no
 * openwire, 0: openwire)
 */
#define NO_OPEN_WIRES \
    (65335) // ic.system_open_wire is a 16 bit number. Each
            // bit is an open wire (1: no openwire, 0: openwire)

int openwire_task(void) {
    // Run open wire test on all cells
    // LTC6811_run_openwire_single(NUM_ICS, ICS);

    // long open_wire;
    // for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
    //     open_wire = ICS[ic].system_open_wire;

    //     /*
    //      * If system_open_wire is 0xFFFF, there are no open wires. Otherwise,
    //      * the value is set to the first pin that has an open wire.
    //      */
    //     if (open_wire != NO_OPEN_WIRES) {
    //         return true;
    //         // set_fault(BMS_FAULT_OPEN_WIRE);
    //     }
    // }

    return false;
}
