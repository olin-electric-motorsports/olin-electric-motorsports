#include <avr/io.h>

// This file is specific to the ATMega16m1
// It defines each pin to be a struct containing:
//   - The pin index (0-7)
//   - The memory-mapped register offset of the DDRx register
//   - "   "             "        "      "  "   PORTx register
//   - "   "             "        "      "  "   PINx register
//
// The register offsets are used in the functions with the _SFR_IO8 function
// that sets memory directly

#undef PB0
#define PB0 \
    { 0, 0x04, 0x05, 0x03 }
#undef PB1
#define PB1 \
    { 1, 0x04, 0x05, 0x03 }
#undef PB2
#define PB2 \
    { 2, 0x04, 0x05, 0x03 }
#undef PB3
#define PB3 \
    { 3, 0x04, 0x05, 0x03 }
#undef PB4
#define PB4 \
    { 4, 0x04, 0x05, 0x03 }
#undef PB5
#define PB5 \
    { 5, 0x04, 0x05, 0x03 }
#undef PB6
#define PB6 \
    { 6, 0x04, 0x05, 0x03 }
#undef PB7
#define PB7 \
    { 7, 0x04, 0x05, 0x03 }

#undef PC0
#define PC0 \
    { 0, 0x07, 0x08, 0x06 }
#undef PC1
#define PC1 \
    { 1, 0x07, 0x08, 0x06 }
#undef PC2
#define PC2 \
    { 2, 0x07, 0x08, 0x06 }
#undef PC3
#define PC3 \
    { 3, 0x07, 0x08, 0x06 }
#undef PC4
#define PC4 \
    { 4, 0x07, 0x08, 0x06 }
#undef PC5
#define PC5 \
    { 5, 0x07, 0x08, 0x06 }
#undef PC6
#define PC6 \
    { 6, 0x07, 0x08, 0x06 }
#undef PC7
#define PC7 \
    { 7, 0x07, 0x08, 0x06 }

#undef PD0
#define PD0 \
    { 0, 0x0A, 0x0B, 0x09 }
#undef PD1
#define PD1 \
    { 1, 0x0A, 0x0B, 0x09 }
#undef PD2
#define PD2 \
    { 2, 0x0A, 0x0B, 0x09 }
#undef PD3
#define PD3 \
    { 3, 0x0A, 0x0B, 0x09 }
#undef PD4
#define PD4 \
    { 4, 0x0A, 0x0B, 0x09 }
#undef PD5
#define PD5 \
    { 5, 0x0A, 0x0B, 0x09 }
#undef PD6
#define PD6 \
    { 6, 0x0A, 0x0B, 0x09 }
#undef PD7
#define PD7 \
    { 7, 0x0A, 0x0B, 0x09 }

#undef PE0
#define PE0 \
    { 0, 0x0D, 0x0E, 0x0C }
#undef PE1
#define PE1 \
    { 1, 0x0D, 0x0E, 0x0C }
#undef PE2
#define PE2 \
    { 2, 0x0D, 0x0E, 0x0C }
