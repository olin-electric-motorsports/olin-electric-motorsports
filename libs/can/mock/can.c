#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
// clang-format off
#include <setjmp.h>
#include <cmocka.h>
// clang-format on

#include "libs/can/mock/mock.h"
#include "libs/can/api.h"

#define CAN_NUM_MOB (6)

#define MOB_MODE_OFF (0)
#define MOB_MODE_RX  (1)
#define MOB_MODE_TX  (2)

#define MOB_STATUS_WAITING  (0)
#define MOB_STATUS_COMPLETE (1)

struct can_mob {
    uint8_t mode; // 0: off, 1: rx, 2: tx
    uint8_t status; // 0: waiting, 1: complete
    can_filter_t filter;
    can_frame_t* frame;
} can_mob;

static struct can_mob mob_list[CAN_NUM_MOB] = { 0 };

void can_init(baud_rate_t baud) {
    check_expected(baud);
}

int can_send(can_frame_t* frame) {
    check_expected(frame->id);
    check_expected(frame->dlc);
    check_expected(frame->data);
    return mock();
}

void can_mock_receive_message(uint8_t id, uint8_t* data, uint8_t dlc) {
    for (uint8_t i = 0; i < CAN_NUM_MOB; i++) {
        struct can_mob mob = mob_list[i];

        if (mob.mode != MOB_MODE_RX) {
            continue;
        }

        // If there's a match
        if ((id & mob.filter.mask) == (mob.filter.id & mob.filter.mask)) {
            mob.mode = MOB_MODE_OFF;
            mob.status = MOB_STATUS_COMPLETE;
            mob.frame->id = id;
            mob.frame->data = data;
            mob.frame->dlc = dlc;
            mob_list[i] = mob;
            break;
        }
    }
}

int can_receive(can_frame_t* frame, can_filter_t filter) {
    struct can_mob mob = {
        .mode = MOB_MODE_RX,
        .status = MOB_STATUS_WAITING,
        .filter = filter,
        .frame = frame,
    };

    mob_list[frame->mob] = mob;

    return mock();
}

int can_poll_complete(can_frame_t* frame) {
    struct can_mob mob = mob_list[frame->mob];

    if (mob.status == MOB_STATUS_WAITING) {
        return -1;
    }

    if (mob.status == MOB_STATUS_COMPLETE) {
        return 0;
    }

    return 1;
}
