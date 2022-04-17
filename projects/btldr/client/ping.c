#include "client.h"

char* chip_id_to_name[4] = {
    [CHIP_NONE] = "unknown",
    [CHIP_AVR_ATMEGA16M1] = "atmega16m1",
    [CHIP_AVR_ATMEGA328P] = "atmega328p",
    [CHIP_ARM_STM32F103C8T6] = "stm32f103c8t6",
};

static struct ping_response ping_unpack_response(uint64_t current_time,
                                                 uint8_t ecu_id,
                                                 uint8_t* data) {
    struct ping_response pr;

    pr.version = data[0];
    pr.ecu_id = ecu_id;
    pr.mcu = data[1];
    pr.current_image = data[2];

    uint32_t time_delta;
    memcpy(&time_delta, data + 4, sizeof(uint32_t));

    const time_t timer = current_time - time_delta;
    struct tm flash_time;
    gmtime_r(&timer, &flash_time);

    pr.flash_time = flash_time;

    return pr;
}

void ping_print_response(struct ping_response resp) {
    char* mcu = chip_id_to_name[resp.mcu];
    char* current_image
        = (resp.current_image == CURRENT_IMAGE_APP) ? "app" : "updater";

    uint8_t version_maj = (resp.version & 0xF0) >> 4;
    uint8_t version_min = (resp.version & 0x0F);

    char flash_time[64];
    (void)strftime(flash_time, 64, "%x %H:%M", &resp.flash_time);

    printf(
        "PING 8 bytes from 0x%X: chip=%s version=%i.%i image=%s flashed=%s\n",
        resp.ecu_id, mcu, version_maj, version_min, current_image, flash_time);
}

int cmd_ping(uint8_t ecu_id, struct ping_response* response) {
    int rc = 0;

    // Receive response
    uint16_t recv_can_id;
    uint8_t recv_can_dlc;
    uint8_t recv_can_data[8];

    int num_tries = 0;

    uint64_t current_time = 0;

    struct can_filter rfilter[1] = {0};

    if (ecu_id == PING_BROADCAST) {
        rfilter[0].can_id = CAN_ID_QUERY_RESPONSE;
        rfilter[0].can_mask = 0x00F;  // 0bxxxxxxx0001 to match ping responses
    } else {
        rfilter[0].can_id = (ecu_id << 4) | CAN_ID_QUERY_RESPONSE;
        rfilter[0].can_mask = 0x7FF;
    }

    do {
        // Send ping command
        uint16_t can_id = (ecu_id << 4) | CAN_ID_QUERY;

        // Get current time to transmit in ping
        current_time = time(NULL);
        uint8_t can_time[8];
        memcpy(can_time, &current_time, sizeof(uint64_t));

        rc = can_send(can_id, can_time, sizeof(uint64_t));
        if (rc != 0) {
            goto bail;
        }

        rc = can_receive(rfilter, &recv_can_id, &recv_can_dlc,
                         (uint8_t*)recv_can_data, POLLTIMEOUT);
        // if verbose
        printf("PING 0x%X\n", can_id);
        // endif
        num_tries++;
    } while ((rc == -1) && (num_tries < MAX_RETRIES));

    if ((num_tries == MAX_RETRIES) && (rc == -1)) {
        fprintf(stderr, "Failed to receive ping response. Device unreachable.\n");
        rc = 2;  // timeout
        goto bail;
    }

    if (rc == 0) {
        *response = ping_unpack_response(current_time, ecu_id, recv_can_data);
    }


bail:
    return rc;
}
