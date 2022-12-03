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

static enum can_id_mode_e id_mode = ID_MODE_STANDARD;

void can_set_id_mode(enum can_id_mode_e mode) {
    id_mode = mode;
}

static inline void mob_configure(uint32_t id, uint32_t mask, uint8_t dlc) {
    switch (id_mode) {
        case ID_MODE_STANDARD: {
            CANIDT1 = id >> 3;
            CANIDT2 = id << 5;
            CANIDT3 = 0;
            CANIDT4 = 0;
            CANIDM1 = mask >> 3;
            CANIDM2 = mask << 5;
            CANIDM3 = 0;
            CANIDM4 = (1 << RTRMSK) | (1 << IDEMSK);
            CANCDMOB &= ~(1 << IDE);
            CANCDMOB |= ((dlc & 0xF) << DLC0);
        } break;
        case ID_MODE_EXTENDED: {
            CANIDT1 = id >> 21;
            CANIDT2 = id >> 13;
            CANIDT3 = id >> 5;
            CANIDT4 = id << 3;
            CANIDM1 = mask >> 21;
            CANIDM2 = mask >> 13;
            CANIDM3 = mask >> 5;
            CANIDM4 = (mask << 3) | (1 << RTRMSK) | (1 << IDEMSK);
            CANCDMOB |= (1 << IDE) | ((dlc & 0xF) << DLC0);
        } break;
    }
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
