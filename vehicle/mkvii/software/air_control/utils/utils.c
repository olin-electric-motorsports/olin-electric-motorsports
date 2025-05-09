#include "utils.h"
#include "timer.h"
#include "vehicle/mkvii/software/air_control/can_api.h"

// int get_tractive_voltage(int16_t* voltage) {
int get_tractive_voltage(int16_t* voltage, uint32_t timeout) {
    int rc;

    uint32_t start_time = get_time();

    (void)can_receive_ivt_msg_result_u1();

    do {
        rc = can_poll_receive_ivt_msg_result_u1();

        if (rc == 1) {
            return rc;
        } else if (get_time() - start_time > timeout) {
            rc = 2;
            return rc;
        }
    } while (rc != 0);

    *voltage = (int16_t)((int64_t)(ivt_msg_result_u1.ivt_result_u1) / 10000);
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

    //BMS Conversion
    *voltage = (int16_t)(((int64_t)(bms_core.pack_voltage) << 8) / 1000); // (x << 8 == x * 256)

bail:
    return rc;
}
