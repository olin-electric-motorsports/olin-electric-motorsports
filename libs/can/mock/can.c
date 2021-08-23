#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
// clang-format off
#include <setjmp.h>
#include <cmocka.h>
// clang-format on

#include "libs/can/api.h"

void can_init(baud_rate_t baud) {
    check_expected(baud);
}

int can_send(can_frame_t* frame) {
    check_expected(frame->id);
    check_expected(frame->dlc);
    check_expected(frame->data);
    return mock();
}

int can_receive(can_frame_t* frame, can_filter_t filter) {
    (void)frame;
    check_expected(filter.id);
    check_expected(filter.mask);
    return mock();
}

int can_poll_complete(can_frame_t* frame) {
    check_expected(frame);

    uint8_t id = mock_type(uint8_t);
    frame->id = id;

    uint8_t dlc = mock_type(uint8_t);
    frame->dlc = dlc;

    for (uint8_t i = 0; i < dlc; i++) {
        frame->data[i] = mock_type(uint8_t);
    }

    return mock();
}
