#include "can_isp.h"

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "libs/can/api.h"
#include "projects/btldr/libs/image/api.h"

int can_isp_task(uint16_t btldr_id) {
    uint8_t data[CAN_MAX_MSG_LENGTH];
    can_frame_t msg = {
        .mob = 0,
        .data = data,
    };

    can_filter_t filter = {
        .mask = 0x7F0,
        .id = btldr_id,
    };

    can_receive(&msg, filter);

    int rc;

    do {
        rc = can_poll_receive(&msg);

        if (rc == 1) {
            return 1;
        }
    } while (rc != 0);

    switch (msg.id & 0xF) {
        case CAN_ID_QUERY: {
            rc = handle_query(btldr_id, msg.data, msg.dlc);
        } break;
        case CAN_ID_RESET: {
            rc = handle_reset(btldr_id, msg.data, msg.dlc);
        } break;
        case CAN_ID_REQUEST: {
            rc = handle_request(btldr_id, msg.data, msg.dlc);
        } break;
        case CAN_ID_DATA: {
            rc = handle_data(btldr_id, msg.data, msg.dlc);
        } break;
        default: {
            uint8_t data[1] = {
                ERR_INVALID_COMMAND,
            };

            can_frame_t msg = {
                .mob = 0,
                .id = (btldr_id) | CAN_ID_REQUEST_RESPONSE,
                .data = data,
                .dlc = 5,
            };
            rc = can_send(&msg);
        } break;
    }

    return rc;
}
