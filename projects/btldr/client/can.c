/*
 * Author: Jack Greenberg <j@jackgreenberg.co>
 * Copyright 2021
 */
#include "can.h"

#include <linux/can.h>
#include <linux/can/raw.h>
#include <net/if.h>
#include <poll.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

int s;

// CAN address
struct sockaddr_can addr;

// CAN frame
struct can_frame frame;

// IF device instance
struct ifreq ifr;

int can_client_create(char* if_device) {
    if ((s = socket(PF_CAN, SOCK_RAW, CAN_RAW)) < 0) {
        perror("socket() failed");
        return 1;
    }

    addr.can_family = AF_CAN;

    // Set up the Linux device name (i.e. vcan0, can0) and connect the socket
    // to it
    strncpy(ifr.ifr_name, if_device, IFNAMSIZ - 1);
    ifr.ifr_name[IFNAMSIZ - 1] = '\0';

    if (ioctl(s, SIOCGIFINDEX, &ifr) < 0) {
        perror("ioctl() failed");
        fprintf(stderr, "Did you forget to setup the CAN device?\n");
        return 1;
    }

    addr.can_ifindex = ifr.ifr_ifindex;

    // Set up max transmission unit (mtu)
    // "Maximum transmission unit (MTU) determines the maximum payload size of a
    // packet that is sent."
    if (ioctl(s, SIOCGIFMTU, &ifr) < 0) {
        perror("ioctl() failed");
        return 1;
    }

    // After the socket is initialized and the device is found, we bind to the
    // socket to enable us to read and write to it. `bind` could fail if the
    // port is already in use.
    if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        perror("bind() failed");
        return 1;
    }

    return 0;
}

int can_send(uint16_t id, uint8_t* data, uint8_t dlc) {
    // IDs are 11-bits, so enforce that limit
    frame.can_id = id & 0x7FF;

    // DLC is at most 8
    if (dlc > 8) {
        dlc = 8;
    }

    frame.can_dlc = dlc;
    memcpy(frame.data, data, dlc);

    // Write to the socket to send the message
    int nbytes = write(s, &frame, sizeof(struct can_frame));

    if (nbytes < 0) {
        perror("write() failed");
        return 1;
    }

    if (nbytes < dlc) {
        fprintf(stderr,
                "Incomplete frame send: sent %i bytes, wanted %i bytes\n",
                nbytes, dlc);
    }

    return 0;
}

int can_receive(struct can_filter* filter, uint16_t* can_id, uint8_t* can_dlc,
                uint8_t* data, int timeout) {
    // Set up socket to receive the CAN message
    setsockopt(s, SOL_CAN_RAW, CAN_RAW_FILTER, filter, sizeof(filter));

    // Sets up polling interface
    struct pollfd fds = {
        .fd = s,
        .events = POLLIN,
    };

    // Poll for the specified amount of time
    if (poll(&fds, 1, timeout) < 0) {
        perror("poll() failed");
        return 1;
    }

    // If the event hasn't happened yet, return -1
    if ((fds.revents & POLLIN) == 0) {
        return -1;
    }

    // Poll was successful, so read from the socket
    int nbytes = read(s, &frame, sizeof(struct can_frame));
    if (nbytes < 0) {
        perror("read() failed");
        return 1;
    }

    // Fill in the appropriate data
    *can_id = frame.can_id;
    *can_dlc = frame.can_dlc;
    memcpy(data, frame.data, frame.can_dlc);

    return 0;
}

void can_client_destroy(void) {
    static int i = 0;

    // Will only happen once
    if (i == 0) {
        close(s);
        i++;
    }
}
