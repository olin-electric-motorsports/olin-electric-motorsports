#pragma once

#include <stdbool.h>
#include <stdint.h>

#define IMAGE_MAGIC (0x4F454D21)  // "OEM!"

#define IMAGE_VALID (0x0)
#define IMAGE_INVALID_CRC (0x1)
#define IMAGE_INVALID_MAGIC (0x2)

#define CHIP_NONE (0x000U)
#define CHIP_AVR_ATMEGA16M1 (0x001U)
#define CHIP_AVR_ATMEGA328P (0x002U)
#define CHIP_ARM_STM32F103C8T6 (0x003U)

typedef struct __attribute__((packed)) {
    uint32_t image_magic;
    uint32_t crc;
    uint16_t image_size;  // size without header
    uint64_t flash_timestamp;
    uint32_t reserved;
    char git_sha[8];
} image_hdr_t;

const image_hdr_t* image_get_header(void);

uint8_t image_validate(const image_hdr_t* hdr);

uint64_t get_image_timestamp(void);

uint16_t get_image_size(void);
