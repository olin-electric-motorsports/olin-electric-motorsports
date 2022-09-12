#pragma once

#include <linux/can.h>
#include <linux/can/raw.h>
#include <poll.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "log.h"
#include "projects/btldr/can_isp.h"
#include "projects/btldr/client/can.h"
#include "projects/btldr/libs/image/api.h"

#define POLLTIMEOUT    (1000)
#define MAX_RETRIES    (5)
#define PING_BROADCAST (0xFF)

extern char* chip_id_to_name[];

struct ping_response {
    uint8_t version;
    uint16_t ecu_id;
    uint8_t mcu;
    uint8_t current_image;
    struct tm flash_time;
};

/*
 * Prints a human-readable ping response
 */
void ping_print_response(struct ping_response resp);

/*
 * Pings a CAN device
 */
int cmd_ping(uint16_t ecu_id, struct ping_response* response);

/*
 * Flashes a binary
 */
int cmd_flash(uint16_t ecu_id, FILE* fp);
