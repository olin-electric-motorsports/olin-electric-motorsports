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
    check_expected(frame);
    return 0;
}

int can_receive(can_frame_t* frame, can_filter_t filter) {
    check_expected(frame);
    return 0;
}

int can_poll_complete(can_frame_t* frame) {
    check_expected(frame);
    return mock();
}
