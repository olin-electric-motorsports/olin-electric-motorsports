#include "projects/btldr/libs/flash/api.h"

#include <avr/boot.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

static uint16_t buf_address = 0;

void flash_write(uint8_t* data, uint8_t length, uint16_t* current_addr) {
    uint8_t sreg = SREG;

    for (int i = 0; i < length; i += 2) {
        uint16_t wr_data = data[i];

        // Accounts for odd number of data bytes. Only use i+1 if it exists
        if (i + 1 < length) {
            wr_data += data[i + 1] << 8;
        }

        boot_page_fill_safe(buf_address, wr_data);
        buf_address += 2;
    }

    // If the buffer is full
    if (buf_address % SPM_PAGESIZE == 0) {
        // Must erase the page before writing
        boot_page_erase_safe(*current_addr);
        boot_spm_busy_wait();

        // Write the memory stored in the temp buffer
        boot_page_write_safe(*current_addr);
        boot_spm_busy_wait();

        *current_addr += SPM_PAGESIZE;
    }

    SREG = sreg;
}

void flash_force_write_page(uint16_t* current_addr) {
    uint8_t sreg = SREG;

    boot_page_erase_safe(*current_addr);
    boot_spm_busy_wait();

    // Write the memory stored in the temp buffer
    boot_page_write_safe(*current_addr);
    boot_spm_busy_wait();
    *current_addr += SPM_PAGESIZE;

    SREG = sreg;
}

void flash_read(uint16_t address, uint8_t* data, uint8_t size) {
    for (uint8_t i = 0; i < size; i++) {
        *data = pgm_read_byte(address + i);
        data++;
    }
}

void flash_reset_buf_address(void) {
    buf_address = 0;
}
