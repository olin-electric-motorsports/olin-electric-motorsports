/*
 * Demo of start button
 *
 * This program is designed for Olin Unfiltered at Candidates' Weekends.
 * The button blinks an LED
 *
 * All reference info is pulled from
 * https://www.nongnu.org/avr-libc/user-manual/index.html
 * http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf
 *
 * @author Manu Patil '22
 */

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "can_api.h"
#include "log_uart.h"
#include <string.h>
#include <stdio.h>

#define LED1_PIN    PD5
#define LED2_PIN    PD6
#define LED3_PIN    PD7

#define LED1_OUT    PB5
#define LED2_OUT    PB6
#define LED3_OUT    PB7

#define PINOUT_1    PB2
#define PINOUT_2    PB4


// for gTimerFlag
#define UPDATE_STATUS 0

// CAN Mailboxes
#define MBOX_0 0
#define MBOX_1 1
#define MBOX_2 2
#define MBOX_3 3

//gFlag Positions
#define PRECHARGE                    1
#define BRAKE_PRESSED                2
#define READY                        3
#define LEZGOOOO                     4

uint8_t msg[1]= {0};
volatile uint8_t gFlag = 0x00;  // Global Flag
volatile uint8_t gTimerFlag = 0x01; // Timer Flag
int count = 0;
uint8_t can_recv_msg[8] = {};
uint8_t gCAN_MSG[8] = {0, 0, 0, 0, 0, 0, 0, 0};

ISR(PCINT0_vect) {
    /* If button is pressed, turn the light on */
    if (bit_is_clear(PINB, PINOUT_1)) {
        gCAN_MSG[0] = 0x00;
        PORTD &= ~_BV(LED2_PIN);
    } else {
        gCAN_MSG[0] = 0xFF;
        PORTD |= _BV(LED2_PIN);
    }
}

/*----- Interrupt(s) -----*/
ISR(CAN_INT_vect) {
    CANPAGE = (MBOX_1 << MOBNB0);
    if(bit_is_set(CANSTMOB, RXOK)) {
        can_recv_msg[0] = CANMSG;   // brake analog voltage MSB
        can_recv_msg[1] = CANMSG;   // brake analog voltage LSB
        can_recv_msg[2] = CANMSG;   // brake switch
        can_recv_msg[3] = CANMSG;   // BSPD
        can_recv_msg[4] = CANMSG;   // TSMS
        can_recv_msg[5] = CANMSG;   // left_e_stop
        can_recv_msg[6] = CANMSG;   // GLVMS sense      //grab the first byte of the CAN message

        if(bit_is_clear(gFlag,LEZGOOOO) && can_recv_msg[2]  == 0xFF) {
            PORTB |= _BV(LED1_OUT);
            gFlag |= _BV(BRAKE_PRESSED);
        }
        else if(can_recv_msg[2] == 0x00) {
            PORTB &= ~_BV(LED1_OUT);
            gFlag &= ~_BV(BRAKE_PRESSED);
        }
        //Setup to Receive Again
        CANSTMOB = 0x00;
        CAN_wait_on_receive(MBOX_1, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, CAN_MSK_SINGLE);

    }
    CANPAGE = (MBOX_2 << MOBNB0);
    if(bit_is_set(CANSTMOB, RXOK)) {
        can_recv_msg[0] = CANMSG;   // Precharge Status
        can_recv_msg[1] = CANMSG;   // High Side AIR
        can_recv_msg[2] = CANMSG;   // Low Side AIR
        can_recv_msg[3] = CANMSG;   // HV Check
        can_recv_msg[4] = CANMSG;   // Debugging

        if(can_recv_msg[0] == 0xFF) {
            PORTB |= _BV(LED2_OUT);
            gFlag |= _BV(PRECHARGE);
        }
        else {
            PORTB &= ~_BV(LED2_OUT);
            gFlag &= ~_BV(PRECHARGE);
            gFlag &= ~_BV(LEZGOOOO);
        }

        //Setup to Receive Again
        CANSTMOB = 0x00;
        CAN_wait_on_receive(MBOX_2, CAN_ID_AIR_CONTROL_CRITICAL, CAN_LEN_AIR_CONTROL_CRITICAL, CAN_MSK_SINGLE);

    }
    CANPAGE = (MBOX_3 << MOBNB0);
    if(bit_is_set(CANSTMOB, RXOK)) {
        can_recv_msg[0] = CANMSG;
        can_recv_msg[1] = CANMSG;
        can_recv_msg[2] = CANMSG;       //grab the first byte of the CAN message

        if(bit_is_clear(gFlag,LEZGOOOO) && can_recv_msg[0] == 0xFF) {
            PORTB |= _BV(LED3_OUT);
            gFlag |= _BV(READY);
        }
        else if(can_recv_msg[0] == 0x00) {
            PORTB &= ~_BV(LED3_OUT);
            gFlag &= ~_BV(READY);
        }

        //Setup to Receive Again
        CANSTMOB = 0x00;
        CAN_wait_on_receive(MBOX_3, CAN_ID_DASHBOARD, CAN_LEN_DASHBOARD, CAN_MSK_SINGLE);
    }
}

ISR(TIMER0_COMPA_vect) {
    // Timer/Counter0 compare match A
    gTimerFlag |= _BV(UPDATE_STATUS);
}

/*----- Functions -----*/
void initTimer(void) {
    TCCR0A = _BV(WGM01);    // Set up 8-bit timer in CTC mode
    TCCR0B = 0x05;          // clkio/1024 prescaler
    TIMSK0 |= _BV(OCIE0A);
    OCR0A = 0xFF;
}

int main (void) {

    /* Set the data direction register so the led pin is output */
    DDRB |= _BV(LED1_OUT) | _BV(LED2_OUT) | _BV(LED3_OUT) | _BV(PINOUT_2);
    DDRD |= _BV(LED1_PIN) | _BV(LED2_PIN) | _BV(LED3_PIN);

    DDRB &= ~_BV(PINOUT_1);     /* Sanity check pin to input */

    sei();
    initTimer();
    /* set up pin change interrupts */
    PCICR |= _BV(PCIE0);
    PCMSK0 |= _BV(PINOUT_1);

    /* Initialize CAN */
    CAN_init(CAN_ENABLED);

    // // LOG_init();
    CAN_wait_on_receive(MBOX_1, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, CAN_MSK_SINGLE);
    CAN_wait_on_receive(MBOX_2, CAN_ID_AIR_CONTROL_CRITICAL, CAN_LEN_AIR_CONTROL_CRITICAL, CAN_MSK_SINGLE);
    CAN_wait_on_receive(MBOX_3, CAN_ID_DASHBOARD, CAN_LEN_DASHBOARD, CAN_MSK_GLOBAL);

    while (1) {
        if(bit_is_set(gTimerFlag,UPDATE_STATUS)){
            // Check Timer
            gTimerFlag &= ~_BV(UPDATE_STATUS);
            // PORTD ^= _BV(LED3_PIN);
            // PORTD ^= _BV(LED2_PIN);
            // PORTD ^= _BV(LED1_PIN);
            // PORTB ^= _BV(LED1_OUT);
            // PORTB ^= _BV(LED2_OUT);
            // PORTB ^= _BV(LED3_OUT);

            if (bit_is_set(gFlag, LEZGOOOO)) {
                PORTD |= _BV(LED1_PIN);
            } else {
                PORTD &= ~_BV(LED2_PIN);
            }


            CAN_transmit(MBOX_0, CAN_ID_STEERING_WHEEL, CAN_LEN_STEERING_WHEEL, gCAN_MSG);
            if(bit_is_clear(gFlag,LEZGOOOO) && bit_is_set(gFlag,PRECHARGE) && bit_is_set(gFlag,BRAKE_PRESSED) && bit_is_set(gFlag,READY)){
                PORTD ^= _BV(LED1_PIN);
                for(int i = 0; i < 20; i++){
                    PORTB ^= _BV(LED1_OUT);
                    PORTB ^= _BV(LED2_OUT);
                    PORTB ^= _BV(LED3_OUT);
                }
              PORTB &= ~_BV(LED1_OUT);
              PORTB &= ~_BV(LED2_OUT);
              PORTB &= ~_BV(LED3_OUT);
              gFlag &= ~_BV(PRECHARGE) & ~_BV(BRAKE_PRESSED) & ~_BV(READY);
              gFlag |= _BV(LEZGOOOO);
            }
        }
    }
}
