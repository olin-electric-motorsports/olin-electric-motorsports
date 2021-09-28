#pragma once
#include <inttypes.h>

// Page size in bytes
#define PAGESIZE_B (int)(SPM_PAGESIZE * 2)

/*
 * Handles filling temporary buffer with flash data
 *
 * Keeps track of the size and address of the buffer and will write the buffer
 * when it fills up. Assumes the data will start writing at 0, including the
 * image header.
 *
 * @param [in] data    Pointer to data to write
 * @param [in] length  Length of the data
 */
void flash_write(uint8_t *data, uint8_t length, uint16_t *current_addr);

/*
 * Reads a section of flash memory
 *
 * @param [in]  address  Address to write
 * @param [out] data     Pointer to data where data will be read to
 * @param [in]  size     Amount of data
 */
void flash_read(uint16_t address, uint8_t *data, uint8_t size);
