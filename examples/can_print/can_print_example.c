#include "can_print_example.h"
#include "examples/can_print/can_api.h"

#include <avr/io.h>

#include "projects/can_print/can_print.h"

int main(void) {
    // Initialize CAN
    can_init_can_print_example();

    // Example 0: Regular CAN messages still work
    example_message.example_message = 0xDEADBEEF;
    can_send_example_message();

    // Example 1: Printing text only
    can_print("oem");

    // Example 2: Printing text and a number
    can_print("oem_num", 240);

    // Example 3: Printing text and a negative number
    can_print("negative_num", -12345);

    // Example 4: Printing text, a number, and a multiplier
    can_print("oem_num", 24, 1);

    // Example 4: Printing text, a number, and a negative multiplier
    can_print("pi", 31415, -4);

    // Example 5: Printing text, a negative number, and a negative multiplier
    can_print("negative_tq", -34085, -1);
}
