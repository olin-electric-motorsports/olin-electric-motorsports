#include <avr/boot.h>
#include <avr/io.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "can_isp.h"
#include "can_lib.h"
#include "debug.h"
#include "flash.h"
#include "image.h"
#include "shmem.h"

static struct session_data session = {
    .is_active = false,
    .type = 0,
    .current_addr = {0},
    .remaining_size = {0},
};

/***************************************************
 * Handler functions defined in can_isp_commands.c *
 ***************************************************/

uint8_t handle_query(uint8_t* data, uint8_t length) {
    uint8_t version = shmem_get_version();

    // TODO: Use getter function?
    uint8_t chip = CHIP_AVR_ATMEGA16M1;

    uint64_t timestamp = (uint64_t)*data;
    uint64_t flash_timestamp = image_get_timestamp();
    uint64_t delta = timestamp - flash_timestamp;
    uint32_t delta_32 = (uint32_t)delta & 0xFFFF;

    uint8_t response_data[8] = {version, chip, CURRENT_IMAGE_UPDATER, 0};

    memcpy((response_data + 4), &delta_32, sizeof(delta_32));

    can_frame_t response = {
        .id = (BTLDR_ID << 4) | CAN_ID_QUERY_RESPONSE,
        .mob = 0,
        .data = response_data,
        .dlc = 8,
    };

    return can_send(&response);
}

uint8_t handle_reset(uint8_t* data, uint8_t length) {
    uint8_t st = 0;

    boot_rww_enable();

    session.is_active = false;

    // If update is requested, set the flag and reset
    if (data[0] == RESET_REQUEST_UPDATE) {
        bootflag_set(UPDATE_REQUESTED);
        asm("jmp 0x3000");
    }

    // Validate image
    const image_hdr_t* image_hdr = image_get_header();
    uint8_t valid = image_validate(image_hdr);

    if (valid == IMAGE_VALID) {
        bootflag_clear(UPDATE_REQUESTED);
        bootflag_set(IMAGE_IS_VALID);

        // Back to bootloader
        asm("jmp 0x3000");  // TODO How to get bootstart address?
    } else {
        bootflag_clear(IMAGE_IS_VALID);

        // Transmit error with invalid image and reason for invalid
        uint8_t err_data[2] = {ERR_IMAGE_INVALID, valid};
        can_frame_t response = {
            .mob = 0,
            .id = (BTLDR_ID << 4) | CAN_ID_STATUS,
            .data = err_data,
            .dlc = 2,
        };

        st = can_send(&response);
    }

    // Unreachable if image is valid
    return st;
}

uint8_t handle_request(uint8_t* data, uint8_t length) {
    session.is_active = true;
    session.type = data[0];
    flash_reset_buf_address();

    if (session.type == REQUEST_UPLOAD) {
        session.current_addr.word = 0;
        session.remaining_size.bytes[0] = data[1];
        session.remaining_size.bytes[1] = data[2];
    } else if (session.type == REQUEST_DOWNLOAD) {
        session.current_addr.word = 0;
        session.remaining_size.word = image_get_size();
    } else {
        uint8_t err_data[1] = {ERR_INVALID_COMMAND};

        can_frame_t msg = {
            .mob = 0,
            .id = (BTLDR_ID << 4) | CAN_ID_STATUS,
            .data = err_data,
            .dlc = 1,
        };
        return can_send(&msg);
    }

    uint8_t status_data[5] = {
        STATUS_NO_ERROR,
        session.current_addr.bytes[0],
        session.current_addr.bytes[1],
        session.remaining_size.bytes[0],
        session.remaining_size.bytes[1],
    };

    can_frame_t msg = {
        .mob = 0,
        .id = (BTLDR_ID << 4) | CAN_ID_STATUS,
        .data = status_data,
        .dlc = 5,
    };

    return can_send(&msg);
}

uint8_t handle_data(uint8_t* data, uint8_t length) {
    // Write data to temporary buffer
    flash_write(data, length, &(session.current_addr.word));

    session.remaining_size.word -= length;

    // Status update
    uint8_t status_data[5] = {
        STATUS_NO_ERROR,
        session.current_addr.bytes[0],
        session.current_addr.bytes[1],
        session.remaining_size.bytes[0],
        session.remaining_size.bytes[1],
    };

    can_frame_t msg = {
        .mob = 0,
        .id = (BTLDR_ID << 4) | CAN_ID_STATUS,
        .data = status_data,
        .dlc = 5,
    };

    return can_send(&msg);
}
