#include "examples/bazel_test/library.h"
#include "libs/can/api.h"

int main(void) {
    // Setup
    can_init(BAUD_500KBPS);

    while(1) {
        (void)sum(1, 2);
    }
}
