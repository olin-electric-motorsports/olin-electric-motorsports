#include "utils.h"
#include "timer.h"
#include "vehicle/mkvi/software/air_control/can_api.h"

// int get_tractive_voltage(int16_t* voltage) {
int get_tractive_voltage(int16_t* voltage, enum tractive_system sys,
                         uint32_t timeout) {
    int rc;

    uint32_t start_time = get_time();

    switch (sys) {
        case MOTOR_CONTROLLER: {
            (void)can_receive_m167_voltage_info();

            do {
                rc = can_poll_receive_m167_voltage_info();

                if (rc == 1) {
                    goto bail;
                } else if (get_time() - start_time > timeout) {
                    rc = 2;
                    goto bail;
                }
            } while (rc != 0);

            *voltage = m167_voltage_info.d1_dc_bus_voltage;
        } break;
        case CHARGER: {
            (void)can_receive_charging_fbk();

            do {
                rc = can_poll_receive_charging_fbk();

                if (rc == 1) {
                    goto bail;
                } else if (get_time() - start_time > timeout) {
                    rc = 2;
                    goto bail;
                }
            } while (rc != 0);

            *voltage = charging_fbk.charging_voltage;
        } break;
        default: {
            return 1;
        } break;
    }

bail:
    return rc;
}

int get_bms_voltage(int16_t* voltage) {
    int rc;

    uint32_t start_time = get_time();

    (void)can_receive_bms_core();

    do {
        rc = can_poll_receive_bms_core();

        if (rc == 1) {
            goto bail;
        } else if (get_time() - start_time > 1000) {
            rc = 2;
            goto bail;
        }
    } while (rc != 0);

    *voltage = bms_core.pack_voltage;

bail:
    return rc;
}
