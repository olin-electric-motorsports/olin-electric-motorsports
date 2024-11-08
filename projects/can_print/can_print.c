#include "can_print.h"
#include "can_api.h"
#include <stdint.h>

/**
 * Call the can api with the message and value to print.
 *
 * @param print_value See can_print.h for bit packing.
 */
void _can_print(uint64_t print_value) {
    can_print.can_print = print_value;
    can_send_can_print();
}
