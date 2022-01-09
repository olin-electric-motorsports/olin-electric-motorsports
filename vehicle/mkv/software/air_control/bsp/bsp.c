#include "bsp.h"
#include "timer.h"
#include "vehicle/mkv/software/air_control/can_api.h"

int get_motor_controller_voltage(int16_t* voltage) {
    int rc;

    uint32_t now = get_time();

    do {
        rc = can_receive_m167_voltage_info();

        if (rc == 1) {
            goto bail;
        } else if (get_time() - now > 1000) {
            rc = 2;
            goto bail;
        }
    } while (rc != 0);

    *voltage = m167_voltage_info.d1_dc_bus_voltage;

bail:
    return rc;
}

/*
 * Polls for CAN message from the BMS
 *
 * Returns:
 *   - 0: No error, value is in *voltage
 *   - 1: Fatal error, go into fault
 */
int get_bms_voltage(int16_t* voltage) {
    int rc;

    uint32_t now = get_time();

    do {
        rc = can_receive_bms_core();

        if (rc == 1) {
            goto bail;
        } else if (get_time() - now > 1000) {
            rc = 2;
            goto bail;
        }
    } while (rc != 0);

    *voltage = bms_core.pack_voltage;

bail:
    return rc;
}
