/*
Header:
	Code for the Shutdown Sense Board located in the low-voltage box
Author:
	@author Jack Greenberg
    @date   01/23/2020
*/

/*----- Includes -----*/
#include <stdio.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "can_api.h"
#include "log_uart.h"

/*----- Macro Definitions -----*/
/* ATMega 16m1 Pins */
#define GLVMS 					PD6
#define ESTOP 					PD7
#define BSPD 					PB3
#define CRASH_SENSOR 			PB4
#define BOTS 					PC7
#define ESTOP_DRIVER 			PB5
#define HVD 					PB6
#define CONNECTOR_2_HVD 		PB7
#define MAIN_PACK_CONNECTOR 	PD0
#define BMS						PC0
#define IMD 					PD1
#define TSMS 					PC1

/* CAN Message Positions */
#define CAN_ERROR				0
#define CAN_BRAKE_ANALOG_MSB	1
#define CAN_BRAKE_ANALOG_LSB	2
#define CAN_BRAKE_GATE			3
#define CAN_BSPD				4
#define CAN_TSMS				5
#define CAN_ESTOP				6
#define CAN_GLVMS				7

// CAN Mailboxes
#define MBOX_0 					0
#define MBOX_1 					1
#define MBOX_2 					2
#define MBOX_3 					3

#define UPDATE_STATUS 			0

volatile uint8_t gTimerFlag = 0x01;
uint8_t gStatusMessage[8] = {};
volatile uint8_t can_recv_msg[8] = {};

void initTimer(void) {
	TCCR0A = _BV(WGM01); // Set up 8-bit timer in CTC mode

	TCCR0B = 0x05; // Set clock prescaler to (1/1024) - page 89

	TIMSK0 |= _BV(OCIE0A); // Enable Match A interupts - page 90

	OCR0A = 0x27; //Makes the timer reset everytime it hits 39 (~100 Hz) - page 90
}

ISR(TIMER0_COMPA_vect) {
	gTimerFlag = _BV(UPDATE_STATUS);
}

ISR(CAN_INT_vect) {
	CANPAGE = (MBOX_1 << MOBNB0);
	if (bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG;   // brake analog voltage MSB
        can_recv_msg[1] = CANMSG;   // brake analog voltage LSB
        can_recv_msg[2] = CANMSG;   // brake switch
        can_recv_msg[3] = CANMSG;   // BSPD
        can_recv_msg[4] = CANMSG;   // TSMS
        can_recv_msg[5] = CANMSG;   // left_e_stop
        can_recv_msg[6] = CANMSG;   // GLVMS sense

		if (can_recv_msg[4] == 0xFF) {
			// OPTIONAL _delay_ms(50) before every turn on will make the lights look a little nicer
			PORTB |= _BV(BSPD);
		}

		if (can_recv_msg[5] == 0xFF) {
			// OPTIONAL _delay_ms(50) before every turn on will make the lights look a little nicer
			PORTC |= _BV(TSMS);
		}

		// Setup to receive again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(MBOX_1, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, 0xFF);
	}

	CANPAGE = (MBOX_2 << MOBNB0);
	if (bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[1] = CANMSG;   // throttle position
        can_recv_msg[2] = CANMSG;   // BOTS sense
        can_recv_msg[3] = CANMSG;   // Inertia switch sense
        can_recv_msg[4] = CANMSG;   // Driver Estop sense

		if (can_recv_msg[2] == 0xFF) {
			PORTC |= _BV(BOTS);
		}
		if (can_recv_msg[3] == 0xFF) {
			PORTB |= _BV(CRASH_SENSOR);
		}
		if (can_recv_msg[4] == 0xFF) {
			PORTB |= _BV(ESTOP_DRIVER);
		}

		// Setup to receive again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(MBOX_2, CAN_ID_THROTTLE, CAN_LEN_THROTTLE, 0xFF);
	}

	CANPAGE = (MBOX_3 << MOBNB0);
	if (bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG;   // Main Pack Sense
        can_recv_msg[1] = CANMSG;   // HVD Sense
        can_recv_msg[2] = CANMSG;   // IMD Sense
        can_recv_msg[3] = CANMSG;   // BMS Sense
        can_recv_msg[3] = CANMSG;   // BMS Status
        can_recv_msg[3] = CANMSG;   // IMD Status

		if (can_recv_msg[1] == 0xFF) {
			PORTC |= _BV(BOTS);
		}
		if (can_recv_msg[2] == 0xFF) {
			PORTB |= _BV(CRASH_SENSOR);
		}
		if (can_recv_msg[3] == 0xFF) {
			PORTB |= _BV(ESTOP_DRIVER);
		}

		// Setup to receive again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(MBOX_3, CAN_ID_BMS_CORE, CAN_LEN_BMS_CORE, 0xFF);
	}
}

/*
Listen for interrupts for shutdown sense circuits for GLVMS and ESTOP
and set can message bytes
*/
ISR(PCINT2_vect) {
	gStatusMessage[CAN_GLVMS] = (bit_is_clear(PIND, GLVMS) ? 0xFF : 0x00);
	gStatusMessage[CAN_ESTOP] = (bit_is_clear(PIND, ESTOP) ? 0xFF : 0x00);
}

int main(void) {
	sei(); // Initializes interrupts
	initTimer();

	// Pin Change Interrupt Control Register
	// Allow pin interupts on PCIE2
	PCICR |= _BV(PCIE2);

	// Enable interupts on PCINT22 and 23
	PCMSK2 |= _BV(PCINT22) | _BV(PCINT23);

	CAN_init(CAN_ENABLED);

	CAN_wait_on_receive(MBOX_1, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, 0xFF);
	CAN_wait_on_receive(MBOX_2, CAN_ID_THROTTLE, CAN_LEN_THROTTLE, 0xFF);
	CAN_wait_on_receive(MBOX_3, CAN_ID_BMS_CORE, CAN_LEN_BMS_CORE, 0xFF);

	while(1) {
		
		if (bit_is_set(gTimerFlag, UPDATE_STATUS)) {
			gTimerFlag &= ~_BV(UPDATE_STATUS);
			CAN_transmit(MBOX_0, CAN_ID_SHUTDOWN_SENSE, CAN_LEN_SHUTDOWN_SENSE, gStatusMessage);
		}

	}
}
/*
	while(1) {
		PORTB |= _BV(BSPD);
		PORTB |= _BV(CRASH_SENSOR);
		PORTC |= _BV(BOTS);
		PORTB |= _BV(ESTOP_DRIVER);
		PORTB |= _BV(HVD);
		PORTB |= _BV(CONNECTOR_2_HVD);
		PORTD |= _BV(MAIN_PACK_CONNECTOR);
		PORTC |= _BV(BMS);
		PORTD |= _BV(IMD);
		PORTC |= _BV(TSMS);
*/
