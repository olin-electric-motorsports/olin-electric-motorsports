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

    /**
     * Normal use examples.
     */

    // Example 1: Printing text only
    can_print("oem"); // oem

    // Example 2: Printing text and a number
    can_print("oem_num", 240); // oem_num: 240

    // Example 3: Printing text and a negative number
    can_print("negative", -12345); // negative: -12345

    // Example 4: Printing text, a number, and a multiplier
    can_print("oem_num", 24, 1); // oem: 240

    // Example 4: Printing text, a number, and a negative multiplier
    can_print("pi", 31415, -4); // pi: 3.1415

    // Example 5: Printing text, a negative number, and a negative multiplier
    can_print("regen_tq", -34085, -3); // regen_tq: -34.085

    // Example 6: Decimals are allowed, but will be rounded to ints
    can_print("regen_tq", -34.085); // regen_tq: -34

    // Example 7: Math in value field, rounded to an int
    can_print("math", ((3340 + 189) / 2) * 0.25); // math: 441

    // Example 8: Dynamic values
    uint16_t counter = 0;
    while (counter < 10) {
        can_print("dynamic",
                  counter); // dynamic: 0, dynamic: 1 ... dynamic: 9
        counter++;
    }

    // Example 9: Dynamic negative values
    while (counter > 0) {
        can_print("dynamic",
                  -1 * counter); // dynamic: -9, dynamic: -8 ... dynamic: 0
        counter--;
    }

    /**
     * Breaking use examples. Some cause intentional complier errors.
     */

    // Example 7: Character overflow; truncated to 8 characters.
    can_print("olinelectricmotorsports"); // olinelec

    // // Example 8: Value integer overflow; bounds checking causes compiler
    // error can_print("overflow", 65536); // #error:

    // // Example 9: Multiplier integer overflow; bounds checking causes
    // complier
    // // error
    // can_print("multi_ov", 1, 17); // #error:
}
