#pragma once

#include <stdint.h>
/**
 * Bit packing for a can print message.
 *
 *       lsb                                                           msb
 * field: |c_0|c_1| c_2 | c_3 | c_4 | c_5 | c_6 | c_7 |value|multi|resv |
 * bits:  |0-4|5-9|10-14|15-19|20-24|25-29|30-34|35-39|40-55|56-59|60-63|
 *
 * c_x: An [a-z] character to print.
 * int16: A int16 value to print.
 * multi: The multiplier to apply to the value.
 * resv: Reserved bits. Do not access.
 */
#define VALUE_SHIFT      40
#define MULTIPLIER_SHIFT 56

/**
 * Main can print macro.
 *
 * @param string (char[8]) The string to print.
 * @param value (int16) Optional, the value to print.
 * @param multiplier (int4) Optional, the power of ten to multiply the value by.
 */
#define can_print(...) \
    SELECT_CAN_PRINT(COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1, 0), __VA_ARGS__)

/**
 * Count the number of args in a variadic macro.
 *
 * Additionally, require one or two arguments and throw a compiler error if
 * otherwise.
 *
 * @param _x Parameters are shifted according to how many inputs are provided.
 */
#define COUNT_ARGS(_1, _2, _3, _4, _5, count, ...) CHECK_ARGS(count)
#define CHECK_ARGS(select)                         CHECK_##select
#define CHECK_0                                    (#error "Not enough args provided in use of can_print.")
#define CHECK_1                                    0 // For CAN_PRINT_0
#define CHECK_2                                    1 // For CAN_PRINT_1
#define CHECK_3                                    2 // For CAN_PRINT_2
#define CHECK_4                                    (#error "Too many args provided in use of can_print.")
#define CHECK_5                                    (#error "Too many args provided in use of can_print.")

/**
 * Select CAN_PRINT_0, CAN_PRINT_1, or CAN_PRINT_2 based on the number of
 * arguments provided.
 *
 * CAN_PRINT_0: Can print text only.
 * CAN_PRINT_1: Can print text and a number with the default multiplier of 1.
 * CAN_PRINT_2: Can print text and a number with a custom multiplier.
 */
#define _SELECT_CAN_PRINT(select, ...) CAN_PRINT_##select(__VA_ARGS__)
#define SELECT_CAN_PRINT(select, ...)  _SELECT_CAN_PRINT(select, __VA_ARGS__)

/**
 * Can print text only.
 */
#define CAN_PRINT_0(...) CAN_PRINT(__VA_ARGS__, INT16_MAX, 0x7)

/**
 * Can print text and a number with the default multiplier of 1 (10^0).
 */
#define CAN_PRINT_1(...) CAN_PRINT(__VA_ARGS__, 0)

/**
 * Can print text and a number with a custom multiplier.
 */
#define CAN_PRINT_2(...) CAN_PRINT(__VA_ARGS__)

/**
 * Wrapper macro for _can_print to ensure proper padding for string and bit
 * offsets.
 *
 * @param string The string to print.
 * @param value The value to print.
 * @param multiplier The multiplier to apply to the value.
 */
#define CAN_PRINT(string, value, multiplier)                      \
    (_can_print(STOI(PAD_STRING(string))                          \
                + ((((uint64_t)(value)) & 0xFFFF) << VALUE_SHIFT) \
                + (((((uint64_t)(multiplier)) & 0xF)) << MULTIPLIER_SHIFT)))

/**
 * Print a string (0-9 characters) and value (uint16_t) over can in 8 bytes.
 *
 * Do not call directly. Call can_print instead to ensure string padding and bit
 * offsets.
 *
 * @param print_value (uint64_t) The string and value to print, packed into 8
 * bytes.
 */
void _can_print(uint64_t print_value);

#define UNSUPPORTED_CHAR 0x1F
// clang-format off
/**
 * Convert an upper or lower case character into the smallest bitwise 
 * representation.
 * 
 * @param char The character to convert.
 * @return (uint64_t) An uint64_t representing the character.  
*/
#define ATOI(char) (uint64_t) \
                   ((char == ' ') ? 0x00 \
                  : (char == 'a' || char == 'A') ? 0x01 \
                  : (char == 'b' || char == 'B') ? 0x02 \
                  : (char == 'c' || char == 'C') ? 0x03 \
                  : (char == 'd' || char == 'D') ? 0x04 \
                  : (char == 'e' || char == 'E') ? 0x05 \
                  : (char == 'f' || char == 'F') ? 0x06 \
                  : (char == 'g' || char == 'G') ? 0x07 \
                  : (char == 'h' || char == 'H') ? 0x08 \
                  : (char == 'i' || char == 'I') ? 0x09 \
                  : (char == 'j' || char == 'J') ? 0x0A \
                  : (char == 'k' || char == 'K') ? 0x0B \
                  : (char == 'l' || char == 'L') ? 0x0C \
                  : (char == 'm' || char == 'M') ? 0x0D \
                  : (char == 'n' || char == 'N') ? 0x0E \
                  : (char == 'o' || char == 'O') ? 0x0F \
                  : (char == 'p' || char == 'P') ? 0x10 \
                  : (char == 'q' || char == 'Q') ? 0x11 \
                  : (char == 'r' || char == 'R') ? 0x12 \
                  : (char == 's' || char == 'S') ? 0x13 \
                  : (char == 't' || char == 'T') ? 0x14 \
                  : (char == 'u' || char == 'U') ? 0x15 \
                  : (char == 'v' || char == 'V') ? 0x16 \
                  : (char == 'w' || char == 'W') ? 0x17 \
                  : (char == 'x' || char == 'X') ? 0x18 \
                  : (char == 'y' || char == 'Y') ? 0x19 \
                  : (char == 'z' || char == 'Z') ? 0x1A \
                  : (char == '-') ? 0x1B \
                  : (char == '_') ? 0x1C \
                  : UNSUPPORTED_CHAR)

/**
 * Convert a string into an integer.
 * 
 * @param string The string to convert. 
 * @return (uint64_t) An integer representation of the string.
*/
#define STOI(string) (uint64_t) \
              (ATOI(string[0]) \
            + (ATOI(string[1]) << 5)  \
            + (ATOI(string[2]) << 10) \
            + (ATOI(string[3]) << 15) \
            + (ATOI(string[4]) << 20) \
            + (ATOI(string[5]) << 25) \
            + (ATOI(string[6]) << 30) \
            + (ATOI(string[7]) << 35))
// clang-format on

/**
 * Count the length of a string, minus the null terminator.
 *
 * @param string The string to count the length of.
 * @return (uint8_t) An integer of the length of the string.
 */
#define STRLEN(string) (uint8_t)((sizeof(string) / sizeof(char)) - 1)

/**
 * Pad a string with additional characters.
 *
 * For use with the can_print library for printing over can.
 * Does not include the null terminator.
 *
 * @param string The string to pad.
 * @return The padded string, to length STRING_LENGTH.
 */
#define STRING_LENGTH (8)
#define PAD_1         " "
#define PAD_2         "  "
#define PAD_3         "   "
#define PAD_4         "    "
#define PAD_5         "     "
#define PAD_6         "      "
#define PAD_7         "       "
#define PAD_8         "        "
#define PAD_9         "         "
// clang-format off
#define PAD_STRING(string) \
    ((STRLEN(string) == 0) ? (string PAD_8) \
   : (STRLEN(string) == 1) ? (string PAD_7) \
   : (STRLEN(string) == 2) ? (string PAD_6) \
   : (STRLEN(string) == 3) ? (string PAD_5) \
   : (STRLEN(string) == 4) ? (string PAD_4) \
   : (STRLEN(string) == 5) ? (string PAD_3) \
   : (STRLEN(string) == 6) ? (string PAD_2) \
   : (STRLEN(string) == 7) ? (string PAD_1) \
   : string)
// clang-format on

/**
 * Extract the sign of a value.
 *
 * @param value The value to extract the sign of.
 * @return 0 if positive, 1 if negative.
 */
#define VALUE_TO_SIGN(value) (uint64_t)((value < 0) ? (1) : (0))

/**
 * Take the absolute value of a value.
 *
 * @param value The input value.
 * @return The absolute value of the input value.
 */
#define ABS(value) (uint64_t)((value < 0) ? (value * -1) : (value))
