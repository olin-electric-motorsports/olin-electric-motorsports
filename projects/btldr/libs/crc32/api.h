/*
 * CRC32 from http://home.thep.lu.se/~bjorn/crc/
 */
#pragma once
#include <stdint.h>
#include <stdlib.h>

/*
 * Generate CRC32
 */
void crc32(uint8_t *data, size_t n_bytes, uint32_t *crc);

/*
 * One step of CRC32 function
 *
 * Usage:
 *
 * // Data is uint8_t*, n_bytes is the size of the data
 * uint32_t crc = ~0;  // 0xFFFFFFFF
 * for (size_t i = 0; i < n_bytes; i++) {
 *     crc32_step(data[i], &crc);
 * }
 * crc = ~crc;
 */
void crc32_step(uint8_t data, uint32_t *crc);
