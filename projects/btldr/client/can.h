#pragma once
#include <linux/can.h>
#include <linux/can/raw.h>
#include <net/if.h>
#include <stdint.h>
#include <sys/socket.h>

// typedef struct {
//     // socket instance
//     int s;
//
//     // CAN address
//     struct sockaddr_can addr;
//
//     // CAN frame
//     struct can_frame frame;
//
//     // IF device instance
//     struct ifreq ifr;
// } can_client_t;

/*
 * Initializes the CAN client and sockets
 *
 * Returns a pointer to a statically-allocated can_client_t or else NULL if it
 * fails
 *
 * Should only be called once
 */
int can_client_create(char* if_device);

/*
 * Deinitializes the CAN client, closing the socket and freeing the dynamic
 * memory
 */
void can_client_destroy(void);

/*
 * Sends a single CAN message with an ID, data, and data length (dlc)
 *
 * Returns 0 if successful, 1 if error
 */
int can_send(uint16_t id, uint8_t* data, uint8_t dlc);

/*
 * Receives a CAN message.
 *
 * For timeout:
 *   set positive for milliseconds
 *   set negative to be infinite
 *   set zero to instantly return
 *
 * Returns
 *   0 if successful
 *   1 if error
 *   -1 if message not received
 */
int can_receive(struct can_filter* filter, uint16_t* can_id, uint8_t* can_dlc,
                uint8_t* data, int timeout);
