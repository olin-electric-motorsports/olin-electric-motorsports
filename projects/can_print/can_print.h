/**
 * Bit packing for a can print message.
 *
 *        lsb                                                                msb
 * chars: | c_0 | c_1 | c_2 | c_3 | c_4 | c_5 | c_6 | c_7 | c_8 |uint16| multi |
 * bits:  | 0-4 | 5-9 |10-14|15-19|20-24|25-29|30-34|35-39|40-44|45-60 | 61-64 |
 *
 * c_x: An [a-z] character to print.
 * uint16:
 * multi:
 *
 */

// TODO: Check if char can be char instead of char_
// clang-format off
#define atoi(char_) (char_ == a) ? 0b00000 \
                  : (char_ == b) ? 0b00001 \
                  : (char_ == c) ? 0b00010 \
                  : (char_ == d) ? 0b00011 \
                  : (char_ == e) ? 0b00100 \
                  : (char_ == f) ? 0b00101 \
                  : (char_ == g) ? 0b00110 \
                  : (char_ == h) ? 0b00111 \
                  : (char_ == i) ? 0b01000 \
                  : (char_ == j) ? 0b01001 \
                  : (char_ == k) ? 0b01010 \
                  : (char_ == l) ? 0b01011 \
                  : (char_ == m) ? 0b01100 \
                  : (char_ == n) ? 0b01101 \
                  : (char_ == o) ? 0b01110 \
                  : (char_ == p) ? 0b01111 \
                  : (char_ == q) ? 0b10000 \
                  : (char_ == r) ? 0b10001 \
                  : (char_ == s) ? 0b10010 \
                  : (char_ == t) ? 0b10011 \
                  : (char_ == u) ? 0b10100 \
                  : (char_ == v) ? 0b10101 \
                  : (char_ == w) ? 0b10110 \
                  : (char_ == x) ? 0b10111 \
                  : (char_ == y) ? 0b11000 \
                  : (char_ == z) ? 0b11001 \
                  : UNSUPPORTED_CHAR //TODO: Test
// clang-format on
#define S(string)                                                  \
    atoi(string[0]) + atoi(string[1] << 5 + atoi(string[2] << 10)) \
        + atoi(string[3] << 15) + atoi(string[4] << 20)            \
        + atoi(string[5] << 25) + atoi(string[6] << 30)            \
        + atoi(string[7] << 35) + atoi(string[8] << 40)
// void can_print(){}