#include "client.h"

int cmd_flash(uint8_t ecu_id, FILE* fp) {
    int rc = 0;

    uint16_t can_msg_id;
    uint8_t can_data[8];
    uint8_t can_dlc;

    // Find device in app
    struct ping_response ping;
    rc = cmd_ping(ecu_id, &ping);
    if (rc != 0) {
        goto bail;
    }

    log_trace("Resetting target device");

    can_msg_id = (ecu_id << 4) | CAN_ID_RESET;
    can_data[0] = RESET_REQUEST_UPDATE;
    can_send(can_msg_id, can_data, 1);

    // Find device again
    rc = cmd_ping(ecu_id, &ping);
    if (rc != 0) {
        goto bail;
    }
    if (ping.current_image != CURRENT_IMAGE_UPDATER) {
        log_error("Device was not able to be placed in updater");
        rc = 1;
        goto bail;
    }

    // Device in updater mode, starting session

    // Get image size to report to target
    fseek(fp, 0, SEEK_END);
    size_t image_size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    can_msg_id = (ecu_id << 4) | CAN_ID_REQUEST;
    can_data[0] = REQUEST_UPLOAD;
    memcpy(can_data + 1, &image_size, 2);
    can_send(can_msg_id, can_data, 3);

    // Wait for session response
    struct can_filter rfilter[1] = {0};
    rfilter[0].can_id = (ecu_id << 4) | CAN_ID_STATUS;
    rfilter[0].can_mask = 0x7FF;

    rc = can_receive(rfilter, &can_msg_id, &can_dlc, can_data, 1000);
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

    rfilter[0].can_id = (ecu_id << 4) | CAN_ID_STATUS;
    rfilter[0].can_mask = 0x7FF;  // Exact match

    while ((nbytes = fread(can_data, 1, 8, fp)) != 0) {
        can_msg_id = (ecu_id << 4) | CAN_ID_DATA;

        can_send(can_msg_id, can_data, nbytes);

        rc = can_receive(rfilter, &can_msg_id, &can_dlc, can_data,
                         1000);  // Timeout 1000ms

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
        memcpy(&remaining_data, can_data + 3, sizeof(uint16_t));

        uint16_t file_remaining_data = image_size - ftell(fp);

        if (file_remaining_data != remaining_data) {
            log_warn("Mismatch in amount of data remaining, flash may fail");
            printf("Local remaining: %i\nRemote remaining: %i\n",
                   file_remaining_data, remaining_data);
        } else {
            double percent_complete
                = 100.0f * ((double)image_size - (double)remaining_data)
                  / (double)image_size;
            printf("\r%.2f%% complete", percent_complete);
            fflush(stdout);
        }
    }

    printf("\n");
    fclose(fp);

    // Do reset
    log_trace("Resetting target device");

    can_msg_id = (ecu_id << 4) | CAN_ID_RESET;
    can_data[0] = 0x00;
    can_send(can_msg_id, can_data, 1);

    // TODO need to implement "reset success message" or something
    rc = cmd_ping(ecu_id, &ping);
    if (rc != 0) {
        goto bail;
    }
    if (ping.current_image != CURRENT_IMAGE_APP) {
        log_error("Update failed");
        rc = 1;
        goto bail;
    } else {
        log_info("Update successful!");
    }

bail:
    return rc;
}
