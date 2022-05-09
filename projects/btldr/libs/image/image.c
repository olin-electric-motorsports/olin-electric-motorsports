#include "projects/btldr/libs/image/api.h"

#include <avr/eeprom.h>
#include <avr/pgmspace.h>
#include <stdint.h>

#include "projects/btldr/libs/crc32/api.h"

// Address of image header. To use, cast as void *
extern void* __image_hdr;

#define APP_IMAGE_HEADER_ADDRESS ((void*)0x7c)

// Static variable to store image header in memory
// static image_hdr_t prv_hdr;

const image_hdr_t image_get_header(void) {
    image_hdr_t hdr;
    memcpy_P(&hdr, APP_IMAGE_HEADER_ADDRESS, sizeof(image_hdr_t));
    return hdr;
}

uint8_t image_validate(const image_hdr_t hdr) {
    // Get image start address (after header) and size
    uint16_t image_addr
        = ((uintptr_t)APP_IMAGE_HEADER_ADDRESS) + sizeof(image_hdr_t);
    uint16_t image_size = hdr.image_size;

    // Image must start with `OEM!`
    if (hdr.image_magic != IMAGE_MAGIC) {
        return IMAGE_INVALID_MAGIC;
    }

    // Calculate CRC32 of image
    uint32_t crc = ~0x0;
    uint8_t data = 0x00;
    for (; image_size > 0; image_size--, image_addr++) {
        data = pgm_read_byte(image_addr);
        crc32_step(data, &crc);
    }
    crc = ~crc;

    // Calculated CRC is not the same as the stored CRC
    if (crc != hdr.crc) {
        return IMAGE_INVALID_CRC;
    }

    return IMAGE_VALID;
}

uint64_t image_get_timestamp(void) {
    const image_hdr_t img = image_get_header();
    return (uint64_t)img.flash_timestamp;
}

uint16_t image_get_size(void) {
    const image_hdr_t img = image_get_header();
    return (uint16_t)img.image_size;
}
