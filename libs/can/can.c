/*
 * Copyright 2021 Olin Electric Motorsports
 */
#include "libs/can/api.h"
#include "libs/can/mob.h"
#include <avr/io.h>

void can_init(baud_rate_t baud) {
    can_reset();

    // Baud rate settings taken from data sheet table 20-2 based on 4MHz fclk_io
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
    for (uint8_t mob = 0; mob < CAN_NUM_MOB; mob++) {
        select_mob(mob);
        mob_reset();
    }

    can_enable();
}

void can_enable_interrupt(uint8_t mob) {
    // General RX interrupt enable
    CANGIE |= _BV(ENRX);

    // Enable interrupt for the message object
    mob_enable_interrupt(mob);
}

int can_send(can_frame_t* frame) {
    select_mob(frame->mob);
    mob_reset();

    mob_configure(frame->id, 0, frame->dlc);

    // Set the message
    for (uint8_t i = 0; i < frame->dlc; i++) {
        mob_write_data(frame->data[i]);
    }

    mob_enable_tx();

    return 0;
}

int can_receive(can_frame_t* frame, can_filter_t filter) {
    select_mob(frame->mob);
    mob_reset();

    mob_configure(filter.id, filter.mask, MAX_DLC);
    CANIDM4 = (_BV(RTRMSK) | _BV(IDEMSK));

    mob_enable_rx();
    return 0;
}

int can_poll_receive(can_frame_t* frame) {
    select_mob(frame->mob);

    uint8_t canstmob = CANSTMOB;
    uint8_t cancdmob = CANCDMOB;

    if (canstmob & (1 << RXOK)) {
        uint8_t dlc = 0xF & cancdmob;

        for (uint8_t i = 0; i < dlc; i++) {
            frame->data[i] = CANMSG;
        }

        frame->id = (CANIDT1 << 3) | (CANIDT2 >> 5);
        frame->dlc = dlc;

        return 0;
    } else if (canstmob
               & ((1 << BERR) | (1 << SERR) | (1 << CERR) | (1 << FERR))) {
        // TODO: Do we want more fine grain error handling?
        return 1;
    } else {
        // Not ready
        return -1;
    }
}
