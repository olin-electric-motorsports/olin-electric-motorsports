/*
 * Copyright 2021 Olin Electric Motorsports
 */
#include "libs/can/api.h"
#include <avr/io.h>

typedef enum {
    CAN_MBOX0,
    CAN_MBOX1,
    CAN_MBOX2,
    CAN_MBOX3,
    CAN_MBOX4,
    CAN_MBOX5,

    // Must be last!
    CAN_NUM_MBOX,
} can_mailbox_t;

// static int get_free_mailbox(void) {
//     return 0;
// }

void can_init(baud_rate_t baud, bool enable_isr) {
    // Reset
    CANGCON = 1 << SWRES;

    // Set baudrate
    // Values taken from data sheet table 20-2 based on 4MHz fclk_io
    switch (baud) {
        case BAUD_250KBPS: {
            CANBT1 = 0x00;
            CANBT2 = 0x0C;
            CANBT3 = 0x36;
        } break;
        case BAUD_500KBPS:
        default: {
            CANBT1 = 0x00;
            CANBT2 = 0x04;
            CANBT3 = 0x12;
        } break;
    };

    // Clear all message objects
    for (uint8_t mob = 0; mob < CAN_NUM_MBOX; mob++) {
        CANPAGE = (mob << 4);
        CANSTMOB = 0x00;
        CANCDMOB = 0x00;
    }

    if (enable_isr) {
        // Enables receive interrupts
        CANGIE |= _BV(ENRX);
    }

    // Enable CAN
    CANGCON = 1 << ENASTB;
}

int can_send(can_frame_t* frame) {
    return 0;
}

int can_receive(can_frame_t* frame, can_filter_t filter, bool is_blocking) {
    return 0;
}
