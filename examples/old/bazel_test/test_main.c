#include "examples/old/bazel_test/library.h"
// clang-format off
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
#include <setjmp.h>
#include <cmocka.h>
// clang-format on

static void test_sum(void** state) {
    assert_int_equal(sum(1, 2), 3);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_sum),
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
