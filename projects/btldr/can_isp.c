#include "can_isp.h"

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "can_lib.h"
#include "debug.h"
#include "image.h"

uint8_t can_isp_task(void) {
    uint8_t data[CAN_MAX_MSG_LENGTH];
    can_frame_t msg = {
        .mob = 0,
        .data = data,
    };

    int st = can_poll_receive(&msg);

    if (st == -1) {
        return 0;
    }

    if (st == 1) {
        log_uart("Error!");
        return 1;
    }

    switch (msg.id & 0xF) {
        case CAN_ID_QUERY: {
            st = handle_query(msg.data, msg.dlc);
            break;
        }
        case CAN_ID_RESET: {
            st = handle_reset(msg.data, msg.dlc);
            if (st != 0) {
                // Image is invalid
            }
            break;
        }
        case CAN_ID_REQUEST: {
            st = handle_request(msg.data, msg.dlc);
            break;
        }
        case CAN_ID_DATA: {
            st = handle_data(msg.data, msg.dlc);
            break;
        }
        default: {
            uint8_t data[1] = {
                ERR_INVALID_COMMAND,
            };

            can_frame_t msg = {
                .mob = 0,  // TODO
                .id = (BTLDR_ID << 4) | CAN_ID_STATUS,
                .data = data,
                .dlc = 4,
            };
            st = can_send(&msg);
            break;
        }
    }

    can_filter_t filter = {
        .mask = 0x7F0,
        .id = BTLDR_ID << 4,
    };

    // Receive CAN message. This shouldn't error because we always restore our
    // message objects
    (void)can_receive(&msg, filter);

    return (uint8_t)st;
}
