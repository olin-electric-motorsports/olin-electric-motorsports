/*
 * Copyright 2021 Olin Electric Motorsports
 */
#include "libs/can/api.h"
#include "libs/can/mob.h"
#include <avr/interrupt.h>
#include <avr/io.h>

__attribute__((weak)) void can_isr(void) {};

ISR(CAN_INT_vect) {
    can_isr();
}

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

int can_mob_has_interrupt(uint8_t mob) {
    return CANSIT & (1 << mob);
}

int can_send(can_frame_t* frame) {
    while (CANGSTA & (1 << TXBSY))
        ;

    select_mob(frame->mob);
    mob_reset();

    mob_configure(frame->id, 0, frame->dlc);

    // Set the message
    for (uint8_t i = 0; i < frame->dlc; i++) {
        mob_write_data(frame->data[i]);
    }

    mob_enable_tx();

    // Wait for TX to finish
    while (!(CANSTMOB & (1 << TXOK)))
        ;
    CANSTMOB &= ~(1 << TXOK);

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
    select_mob(frame->mob);

    if (CANSTMOB & (1 << RXOK)) {
        CANSTMOB &= ~(1 << RXOK);
        uint8_t dlc = 0xF & CANCDMOB;

        for (uint8_t i = 0; i < dlc; i++) {
            frame->data[i] = CANMSG;
        }

        frame->id = (CANIDT1 << 3) | (CANIDT2 >> 5);
        frame->dlc = dlc;

        mob_reset();

        return 0;
    } else if (CANSTMOB
               & ((1 << BERR) | (1 << SERR) | (1 << CERR) | (1 << FERR))) {
        // TODO: Do we want more fine grain error handling?
        return 1;
    } else {
        // Not ready
        return -1;
    }
}

int can_get_message(can_frame_t* can_frame);
