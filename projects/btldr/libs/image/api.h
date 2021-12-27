#pragma once

#include <stdbool.h>
#include <stdint.h>

#define IMAGE_MAGIC (0x4F454D21) // "OEM!"

#define IMAGE_VALID         (0x0)
#define IMAGE_INVALID_CRC   (0x1)
#define IMAGE_INVALID_MAGIC (0x2)

#define CHIP_NONE              (0x000U)
#define CHIP_AVR_ATMEGA16M1    (0x001U)
#define CHIP_AVR_ATMEGA328P    (0x002U)
#define CHIP_ARM_STM32F103C8T6 (0x003U)

/*
 * Struct prototype for the image header, a piece of data that gets prepended to
 * each firmware image. It includes metadata about the image.
 *
 * The `__attribute__((packed))` means that the compiler won't put padding
 * between variables in the struct. Usually, a struct will have padding put
 * between elements to align them to a common boundary, but when a struct is
 * packed, there will be no alignment, so the size of the struct is equal to the
 * sum of the sizes of the elements.
 *
 * Total size:
 *   bits   bytes
 *   32  -> 4
 *   32  -> 4
 *   16  -> 2
 *   64  -> 8
 *   32  -> 4
 *   8*8 -> 8
 *            = 30 bytes
 */
typedef struct __attribute__((packed)) {
    uint32_t image_magic;
    uint32_t crc;
    uint16_t image_size; // size without header
    uint64_t flash_timestamp;
    uint32_t reserved;
    char git_sha[8];
} image_hdr_t;

/*
 * Fetch the image header from flash into memory and return a pointer to a
 * memory location
 */
image_hdr_t image_get_header(void);

/*
 * Validates the image. Image must have the following correct properties:
 *
 *   IMAGE_MAGIC - Fixed 4-byte data that must be "OEM!"
 *   CRC         - Cyclic redundancy check verifying the correctness of the
 *                 image
 *
 * Returns
 *   IMAGE_VALID (0) if image is valid
 *   IMAGE_INVALID_MAGIC (1) if magic is incorrect
 *   IMAGE_INVLIAD_CRC (2) if crc is incorrect
 */
uint8_t image_validate(const image_hdr_t* hdr);

/*
 * Retrieves the image timestamp by invoking `image_get_header`
 */
uint64_t image_get_timestamp(void);

/*
 * Retrieves the image size by invoking `image_get_header`
 */
uint16_t image_get_size(void);
