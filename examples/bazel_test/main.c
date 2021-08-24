#include "examples/bazel_test/library.h"
#include <avr/io.h>

int main(void) {
    // Setup

    while(1) {
        (void)sum(1, 2);
    }
}
