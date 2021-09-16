#include "libs/can/api.h"
#include "libs/can/mock/mock.h"

#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
// clang-format off
#include <setjmp.h>
#include <cmocka.h>
// clang-format on

static void test_init(void** state) {
    expect_value(can_init, baud, BAUD_500KBPS);

    can_init(BAUD_500KBPS);
}

static void test_receive_exact(void** state) {
    will_return(can_receive, 0);

    can_frame_t frame = {
        .mob = 0,
    };

    can_filter_t filter = {
        .id = 0x12,
        .mask = 0x7FF,
    };

    (void)can_receive(&frame, filter);

    can_mock_receive_message(0x11, NULL, 0);
    assert_int_equal(can_poll_receive(&frame), -1);

    can_mock_receive_message(0x12, NULL, 0);
    assert_int_equal(can_poll_receive(&frame), 0);
}

static void test_receive_range(void** state) {
    will_return(can_receive, 0);

    can_frame_t frame = {
        .mob = 0,
    };

    can_filter_t filter = {
        .id = 0x10,
        .mask = 0x7f8,
    }; // Received messages must be 00000010xxx

    (void)can_receive(&frame, filter);

    can_mock_receive_message(0x18, NULL, 0);
    assert_int_equal(can_poll_receive(&frame), -1);

    can_mock_receive_message(0x12, NULL, 0);
    assert_int_equal(can_poll_receive(&frame), 0);

    will_return(can_receive, 0);
    (void)can_receive(&frame, filter);

    can_mock_receive_message(0x17, NULL, 0);
    assert_int_equal(can_poll_receive(&frame), 0);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_init),
        cmocka_unit_test(test_receive_exact),
        cmocka_unit_test(test_receive_range),
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
