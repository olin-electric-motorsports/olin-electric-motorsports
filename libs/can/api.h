/*
 * Copyright 2021 Olin Electric Motorsports
 */
#pragma once
#include <stdint.h>
#include <stdbool.h>

typedef enum {
    BAUD_250KBPS,
    BAUD_500KBPS,
} baud_rate_t;

typedef struct {
    uint16_t id;
    uint8_t dlc;
    uint8_t* data;
    uint8_t mob;
} can_frame_t;

typedef struct {
    uint16_t id;
    uint16_t mask;
} can_filter_t;

#define MAX_DLC (8)

/*
 * Each function that uses a specific Message Object (MOb) is responsible for
 * setting the MOb number in the CANPAGE function
 */

/*
 * Initializes CAN peripheral
 *
 * @param[in] baud - Baud rate
 *
 * @returns Nothing
 */
void can_init(baud_rate_t baud);

/*
 * Enables interrupts for the given MOb
 */
void can_enable_interrupt(uint8_t mob);

/*
 * Sends a CAN message
 *
 * @param[in] frame - CAN frame struct
 *
 * @returns
 *   0: No error
 */
int can_send(can_frame_t* frame);

/*
 * Receives a CAN message
 *
 * @param[out] frame - CAN frame struct
 * @param[in] filter - CAN filter struct
 *
 * @note Should be used with can_poll_receive to determine when msg is received
 *
 * @see can_poll_receive
 *
 * @returns
 *   0: No error
 */
int can_receive(can_frame_t* frame, can_filter_t filter);

/*
 * Polls for a CAN message
 *
 * @returns
 *   0: Message ready
 *  -1: Message not ready
 *   1: Message error
 */
int can_poll_complete(can_frame_t* frame);
