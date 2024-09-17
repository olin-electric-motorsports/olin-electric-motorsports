#include "can_print_example.h"
#include "examples/can_print/can_api.h"

#include <avr/io.h>

#include "projects/can_print/can_print.h"

int main(void) {
    // Initialize CAN
    can_init_can_print_example();

    // Example 0: Regular CAN messages still work
    for (;;) {
        can_send_example_message();
        _can_print(12345);
    }
}
