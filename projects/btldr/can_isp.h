#pragma once
#include <stdbool.h>
#include <stdint.h>

/********************
 * CAN ISP Commands *
 ********************/

/*
 * client -> target
 *
 * DLC=8
 * [0..7] => 64-bit current unix timestamp.
 */
#define CAN_ID_QUERY (0x000U)

/*
 * client -> target
 *
 * DLC=1
 * [0] => 0x1 to request update
 */
#define CAN_ID_RESET         (0x002U)
#define RESET_REQUEST_UPDATE (0x1)

/*
 * client -> target
 *
 * DLC = (upload) 3, (download) 1
 * [0]    => 0x0 for download, 0x1 for upload (upload == flash)
 * [1..2] => (upload-only) 16 bit image size
 */
#define CAN_ID_REQUEST   (0x004U) // Upload or download
#define REQUEST_DOWNLOAD (0x000U)
#define REQUEST_UPLOAD   (0x001U)

/*
 * client -> target
 *
 * DLC = 1-8
 * [0..dlc] => Program data to be flashed
 */
#define CAN_ID_DATA (0x006U)

/*************
 * Responses *
 *************/

/*
 * target -> client
 *
 * DLC = 8
 *
 * [0]    => bootloader version (MMMM.mmmm bits)
 * [1]    => chip ID
 * [2]    => current image (0x0 for app, 0x1 for updater)
 * [3]    => reserved
 * [4..7] => Time delta from query unix timestamp and flash timestamp
 */
#define CAN_ID_QUERY_RESPONSE (0x001U)

#define CURRENT_IMAGE_APP     (0x00)
#define CURRENT_IMAGE_UPDATER (0x01)

/*
 * client -> target
 *
 * DLC = 5
 * [0]    => Err code
 * [1..2] => Last programmed address
 * [3..4] => Remaining data
 */
#define CAN_ID_STATUS       (0x003U) // Sends status messages during update
#define STATUS_NO_ERROR     (0x00)
#define ERR_INVALID_COMMAND (0x01)
#define ERR_IMAGE_INVALID   (0x02)

/*
 * Other defines
 */
#define CAN_ISP_MASK \
    (0x000) // No filtering TODO: update this to be more efficient
#define CAN_MAX_MSG_LENGTH (8) // Always accept up to 8 bytes

union Address {
    uint16_t word;
    uint8_t bytes[2];
};

struct session_data {
    bool is_active; // Is in a session (upld or dwld)
    uint8_t type; // 0 for download, 1 for upload
    union {
        // Current unprogrammed address
        uint16_t word;
        uint8_t bytes[2];
    } current_addr;
    union {
        uint16_t word;
        uint8_t bytes[2];
        // Remaining size to download or upload
    } remaining_size;
};

/**
 * Main CAN message task
 *
 * Sets up CAN listening, handles responses and processes them using one of the
 * functions below. Also sends responses to the host.
 *
 * @see
 * @returns
 *   0 - success
 *   1 - Unrecoverable error
 */
int can_isp_task(uint16_t btldr_id);

/*************************************************
 * Handler functions defined in can_isp_commands.c
 **************************************************/

/**
 * Handles query request. Checks to see if node id matches, and if so, returns a
 * message with the bootloader version and flash timestamp
 */
uint8_t handle_query(uint16_t btldr_id, uint8_t* data, uint8_t length);

/**
 * Handles request to reset the ECU. Should NOT return unless there is an error
 */
uint8_t handle_reset(uint16_t btldr_id, uint8_t* data, uint8_t length);

/**
 * Handles request to upload or download software. Upload means the device
 * should send it's flash contents to the host. Download means the device should
 * receive data from the host and update it's flash.
 */
uint8_t handle_request(uint16_t btldr_id, uint8_t* data, uint8_t length);

/**
 * Handles program data coming in from the host. Responsible for sending STATUS
 * messages to relay the progress and status of the update
 */
uint8_t handle_data(uint16_t btldr_id, uint8_t* data, uint8_t length);
