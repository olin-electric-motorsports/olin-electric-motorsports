/*
 * Copyright 2021 Olin Electric Motorsports
 */
#include "libs/can/api.h"
#include "libs/can/mob.h"
#include <avr/io.h>

void can_init(baud_rate_t baud) {
    // Reset
    can_reset();

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
    for (uint8_t mob = 0; mob < CAN_NUM_MOB; mob++) {
        select_mob(mob);
        mob_reset();
    }

    // Enable CAN
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

    mob_enable_rx();
    return 0;
}

int can_poll_receive(can_frame_t* frame) {
    uint8_t canstmob = CANSTMOB;

    if (canstmob & (1 << RXOK)) {
        return 0;
    } else if (canstmob & ((1 << BERR) 
                         | (1 << SERR)
                         | (1 << CERR)
                         | (1 << FERR))) {
        return 1;
    } else {
        return -1;
    }
}
