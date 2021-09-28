#include "projects/btldr/libs/flash/api.h"

#include <avr/boot.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <inttypes.h>

void flash_write(uint8_t* data, uint8_t length, uint16_t* current_addr) {
    static uint16_t buf_address = 0;
    uint8_t sreg = SREG;

    uint16_t wr_data = 0xFFFF;

    uint8_t even_length = (length % 2 == 0) ? length : length + 1;

    for (int i = 0; i < even_length; i++) {
        if (i % 2 == 0) {
            wr_data = data[i];
        } else {
            if (i == length) {
                wr_data |= 0xFF00;
            } else {
                wr_data |= data[i + 1] << 8;
            }
            boot_page_fill_safe(buf_address, wr_data);
        }
    }

    buf_address += length;

    // If the buffer is full
    if (buf_address % SPM_PAGESIZE == 0) {
        // Must erase the page before writing
        boot_page_erase_safe(*current_addr);

        // Write the memory stored in the temp buffer
        boot_page_write_safe(*current_addr);

        *current_addr += SPM_PAGESIZE;
    }

    SREG = sreg;
}

void flash_read(uint16_t address, uint8_t* data, uint8_t size) {
    for (uint8_t i = 0; i < size; i++) {
        *data = pgm_read_byte(address + i);
        data++;
    }
}
