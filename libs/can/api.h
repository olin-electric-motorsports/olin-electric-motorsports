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
} can_frame_t;

typedef struct {
    uint16_t id;
    uint16_t mask;
} can_filter_t;

/*
 * Initializes CAN peripheral
 *
 * @param[in] baud - Baud rate
 * @param[in] enable_isr - Enables interrupt handling. If used, user should also
 *                         define ISR(CAN_INT_vect)
 *
 * @returns Nothing
 */
void can_init(baud_rate_t baud, bool enable_isr);

/*
 * Sends a CAN message
 *
 * @param[in] frame - CAN frame struct
 *
 * @returns
 *   0: No error
 *   1: Failed to send CAN message
 */
int can_send(can_frame_t* frame);

/*
 * Receives a CAN message
 *
 * @param[out] frame - CAN frame struct
 * @param[in] filter - CAN filter struct
 * @param[in] is_blocking - If true function will block until message received
 *                          If false, function will return immediately
 *
 * @todo We could implement blocking as an int where a positive value is the
 * timeout, zero means the function will return immediately, and a negative
 * number means the function will block until a message is received.
 */
int can_receive(can_frame_t* frame, can_filter_t filter, bool is_blocking);
