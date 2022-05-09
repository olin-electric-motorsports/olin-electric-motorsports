#include "btldr_lib.h"

#include <string.h>

#include "libs/can/api.h"

#include "projects/btldr/can_isp.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"
#include "projects/btldr/libs/shmem/api.h"

static can_frame_t can_msg = { 0 };

static uint16_t btldr_id = 0x00;

void updater_init(uint16_t ecu_id, uint8_t mob) {
    can_msg.mob = mob;

    // Save btldr_id
    btldr_id = ecu_id;

    can_filter_t filter = {
        .id = ecu_id << 4,
        .mask = 0x7f0,
    };

    can_receive(&can_msg, filter);
}

static void do_reset(uint8_t* data, uint8_t dlc) {
    if (data[0] == RESET_REQUEST_UPDATE) {
        bootflag_set(UPDATE_REQUESTED);
    }

    asm("jmp 0x3000");
}

static void do_query(uint8_t* data, uint8_t dlc) {
    // Return bootloader version from EEPROM
    uint8_t version = shmem_get_version();
    uint8_t chip = CHIP_AVR_ATMEGA16M1;

    // Current timestamp from data
    uint64_t timestamp = (uint64_t)*data;
    uint64_t flash_timestamp = image_get_timestamp();
    uint64_t delta = timestamp - flash_timestamp;
    uint32_t delta_32 = (uint32_t)delta;

    uint8_t resp_data[8] = { version, chip, CURRENT_IMAGE_APP, 0 };

    memcpy((resp_data + 4), &delta_32, sizeof(delta_32));

    can_msg.id = (btldr_id << 4) | CAN_ID_QUERY_RESPONSE;
    can_msg.data = resp_data;
    can_msg.dlc = 8;

    (void)can_send(&can_msg);
}

void updater_loop(void) {
    int rc = can_poll_receive(&can_msg);

    if (rc == -1) {
        return;
    } else if (rc == 1) {
        // log_uart("Error in updater loop!");
        return;
    }

    // What CAN ID was received
    switch (can_msg.id & 0xF) {
        case CAN_ID_QUERY: {
            do_query(can_msg.data, can_msg.dlc);
        } break;
        case CAN_ID_RESET: {
            do_reset(can_msg.data, can_msg.dlc);
        } break;
        default: {
            // Ignore all other messages in application
        } break;
    }

    can_filter_t filter = {
        .id = btldr_id << 4,
        .mask = 0x7f0,
    };

    can_receive(&can_msg, filter);
}
