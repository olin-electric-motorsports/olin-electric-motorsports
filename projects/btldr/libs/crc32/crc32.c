#include "projects/btldr/libs/crc32/api.h"

#include <stdint.h>
#include <stdlib.h>

void crc32(uint8_t* data, size_t n_bytes, uint32_t* crc) {
    *crc = ~0;
    for (size_t i = 0; i < n_bytes; i++) {
        crc32_step(*data++, crc);
    }
    *crc = ~*crc;
}

void crc32_step(uint8_t data, uint32_t* crc) {
    *crc = *crc ^ data;
    for (uint8_t j = 0; j < 8; j++) {
        *crc = (*crc >> 1) ^ (0xEDB88320 & -(*crc & 1));
    }
}
