#include "commands.h"

#include <linux/can.h>
#include <linux/can/raw.h>
#include <poll.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "can_client.h"
#include "can_isp.h"
#include "image.h"
#include "log.h"

#define POLLTIMEOUT (1000)
#define MAX_RETRIES (5)
#define PING_BROADCAST (0xFF)

char* chip_id_to_name[4] = {
    [CHIP_NONE] = "unknown",
    [CHIP_AVR_ATMEGA16M1] = "atmega16m1",
    [CHIP_AVR_ATMEGA328P] = "atmega328p",
    [CHIP_ARM_STM32F103C8T6] = "stm32f103c8t6",
};

int cmd_flash(struct CanClient* client, uint8_t ecu_id, char* binary_path) {
    FILE* fp;
    int rc = 0;

    uint16_t can_msg_id;
    uint8_t can_data[8];
    uint8_t can_dlc;

    // Find device in app
    uint8_t current_image;
    rc = cmd_ping(client, ecu_id, &current_image);
    if (rc != 0) {
        goto bail;
    }

    log_trace("Resetting target device");

    can_msg_id = (ecu_id << 4) | CAN_ID_RESET;
    can_data[0] = RESET_REQUEST_UPDATE;
    can_send(client, can_msg_id, can_data, 1);

    // Find device again
    rc = cmd_ping(client, ecu_id, &current_image);
    if (rc != 0) {
        goto bail;
    }
    if (current_image != CURRENT_IMAGE_UPDATER) {
        log_error("Device was not able to be placed in updater");
        rc = 1;
        goto bail;
    }

    // Device in updater mode, starting session

    // Deal with file
    fp = fopen(binary_path, "rb");
    if (fp == NULL) {
        printf("File not found: %s\n", binary_path);
        rc = 2;
        goto bail;
    }

    // Get image size to report to target
    fseek(fp, 0, SEEK_END);
    size_t image_size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    can_msg_id = (ecu_id << 4) | CAN_ID_REQUEST;
    can_data[0] = REQUEST_UPLOAD;
    memcpy(can_data + 1, &image_size, 2);
    can_send(client, can_msg_id, can_data, 3);

    // Wait for session response
    struct can_filter rfilter[1] = { 0 };
    rfilter[0].can_id = (ecu_id << 4) | CAN_ID_STATUS;
    rfilter[0].can_mask = 0x7FF;

    rc = can_receive(client, rfilter, &can_msg_id, &can_dlc, can_data, 1000);
    if (rc == 1) {
        goto bail;
    }
    if (rc == -1) {
        log_error("Failed to start session");
        goto bail;
    }

    if (can_data[0] != STATUS_NO_ERROR) {
        log_error("CAN status error");
        // TODO print error
        rc = can_data[0];
        goto bail;
    }

    size_t nbytes;
    can_msg_id = (ecu_id << 4) | CAN_ID_DATA;

    rfilter[0].can_id = (ecu_id << 4) | CAN_ID_STATUS;
    rfilter[0].can_mask = 0x7FF;  // Exact match

    while ((nbytes = fread(can_data, 1, 8, fp)) != 0) {
        can_send(client, can_msg_id, can_data, nbytes);

        rc = can_receive(client, rfilter, &can_msg_id, &can_dlc, can_data,
                         1000); // Timeout 1000ms

        if (rc == 1) {
            log_error("Fatal error in receiving CAN message");
            break;
        }

        if (rc == -1) {
            // TODO Failed to get response. Resend?
            log_warn("No response to data");
            exit(1);
        }

        if (can_data[0] != STATUS_NO_ERROR) {
            rc = can_data[0];
            goto bail;
        }

        // All is good
        // update status in log
        uint16_t remaining_data;
        memcpy(&remaining_data, can_data+3, sizeof(uint16_t));

        uint16_t file_remaining_data = ftell(fp);

        if (file_remaining_data != remaining_data) {
            log_warn("Mismatch in amount of data remaining, flash may fail");
        } else {
            double percent_complete = (image_size - remaining_data) / image_size;
            printf("%.2f%% complete", percent_complete);
        }
    }

    fclose(fp);

bail:
    return rc;
}

int cmd_ping(struct CanClient* client, uint8_t ecu_id, uint8_t* current_image) {
    struct can_filter rfilter[1] = { 0 };

    if (ecu_id == PING_BROADCAST) {
        rfilter[0].can_id = CAN_ID_QUERY_RESPONSE;
        rfilter[0].can_mask = 0x00F; // 0bxxxxxxx0001 to match ping responses
    } else {
        rfilter[0].can_id = (ecu_id << 4) | CAN_ID_QUERY_RESPONSE;
        rfilter[0].can_mask = 0x7FF;
    }

    // Receive response
    uint16_t recv_can_id;
    uint8_t recv_can_dlc;
    uint8_t recv_can_data[8];

    int rc = 0;
    int num_tries = 0;

    uint64_t current_time = 0;

    do {
        // Send ping command
        uint16_t can_id = (ecu_id << 4) | CAN_ID_QUERY;
        current_time = time(NULL);
        uint8_t can_time[8];
        memcpy(can_time, &current_time, sizeof(uint64_t));
        rc = can_send(client, can_id, can_time, sizeof(uint64_t));
        if (rc != 0) {
            goto bail;
        }

        rc = can_receive(client, rfilter, &recv_can_id,
                         &recv_can_dlc, (uint8_t*)recv_can_data, POLLTIMEOUT);
        num_tries++;
    } while ((rc == -1) && (num_tries < MAX_RETRIES));

    if ((num_tries == MAX_RETRIES) && (rc == -1)) {
        printf("Failed to receive ping response. Device unreachable.\n");
        rc = 2;  // timeout
        goto bail;
    }

    if (rc != 0) {
        goto bail;
    }

    // TODO match received ID to board somehow?
    uint8_t version = recv_can_data[0];
    uint8_t version_maj = (version & 0xF0) >> 4;
    uint8_t version_min = (version & 0x0F);
    char* chip = chip_id_to_name[recv_can_data[1]];
    *current_image = recv_can_data[2];
    char* image_name = (current_image == CURRENT_IMAGE_APP) ? "app" : "updater";

    uint32_t time_delta;
    memcpy(&time_delta, recv_can_data+4, sizeof(uint32_t));

    const time_t timer = current_time - time_delta;
    struct tm flash_time;
    (void)gmtime_r(&timer, &flash_time);

    char flash_time_str[64];
    (void)strftime(flash_time_str, 64, "%x %H:%M", &flash_time);

    printf("8 bytes from 0x%X: chip=%s version=%i.%i image=%s flashed=%s\n",
            ecu_id, chip, version_maj, version_min, image_name, flash_time_str);

bail:
    return rc;
}
