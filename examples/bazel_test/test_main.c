#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>
#include <cmocka.h>
#include "examples/bazel_test/library.h"

static void test_sum(void** state) {
    assert_int_equal(sum(1, 2), 3);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_sum),
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
