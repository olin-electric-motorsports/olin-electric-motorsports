/*
   Header:
    This is the functional code for the dashboard-right board.
    Function: Responsible for IMD and BMS LED indicators - get info from those boards
            : Start Button + corresponding LED - Final Check before entering RTD
            : Interface with LED Bars Board
			: Interface with Brake, LV and HV leds on board


    TODO: IMPLEMENT POWER CYCLE LOGIC

   Author:
    Emily Wan
    ewan@olin.edu
    4254999033
 */


/*----- Includes -----*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "can_api.h"
#include "spi.h"

/*----- Macro Definitions -----*/

//spi
#define CS_DDR DDRC
#define CS_PORT PORTC
#define CS_PIN PC4

// LEDs
#define DEBUG_LED1                         PB5
#define DEBUG_LED2                         PB6

#define PORT_DEBUG_LED1                    PORTB
#define PORT_DEBUG_LED2                    PORTB

#define RJ_LED1                            PC0
#define RJ_LED2                            PC1

#define PORT_RJ_LED1                       PORTC
#define PORT_RJ_LED2                       PORTC

#define BRAKE_LED                          PB2
#define LV_LED                             PD6
#define HV_LED                             PD7

#define PORT_BRAKE_LED                     PORTB
#define PORT_LV_LED                        PORTD
#define PORT_HV_LED                        PORTD

// BMS and IMD Button Lights
#define BMS_LED                            PD0
#define PORT_BMS_LED                       PORTD

#define IMD_LED                            PB3
#define PORT_IMD_LED                       PORTB

// Start Button Status + LED
#define START_PIN                          PC6
#define PORT_START                         PORTC

#define START_LED                          PB4
#define PORT_START_LED                     PORTB

/* Ready to Drive */
#define RTD_LSD                            PC5
#define RTD_PORT                           PORTC

/* Steering Pot*/
#define STEERING_POT                       PD5
#define PORT_STEERING_POT                  PORTD


// CAN Positions
#define CAN_READY_TO_DRIVE                 0
#define CAN_STEERING_POS                   1
#define CAN_START_BUTTON                   2


// CAN Mailboxes
#define BRAKE_LIGHT_MBOX                   0
#define BMS_CORE_MBOX                      1
#define AIR_CONTROL_CRITICAL_MBOX          2
#define AIR_CONTROL_SENSE_MBOX             3
#define THROTTLE_MBOX                      4



// gFlag positions
#define STATUS_START                       1
#define BRAKE_PRESSED                      2
#define BUZZED                             3
#define BMS_LIGHT                          4
#define IMD_STATUS                         5
#define PRECHARGE                          6
#define RTD_STATUS                         7


#define UPDATE_STATUS                      0


/*----- Global Variables -----*/
volatile uint8_t gFlag = 0x00;  // Global Flag
volatile uint8_t gTimerFlag = 0x01; // Timer Flag
uint8_t gSteering = 0x00;
uint8_t gCAN_MSG[8] = {0, 0, 0, 0, 0, 0, 0, 0};  // CAN Message
uint8_t can_recv_msg[8] = {};

// Timer counters
uint8_t gClock_prescale = 0x00;  // Used for update timer

// Temp and Voltage Vars
uint8_t curr_temp;      // Temp
uint8_t curr_volt;      // Voltage
uint8_t curr_current;   // Current

// For LED Bars
uint8_t curr_SoC = 0;   // State of charge
uint8_t throttle = 0;   // Throttle




/*----- Interrupt(s) -----*/
// *pg 76 of datasheet*

ISR(CAN_INT_vect) { //pin inturpt vector //notification from the CAN

/*----- Brake Light Mailbox -----*/
	CANPAGE = (BRAKE_LIGHT_MBOX << MOBNB0); //1st mailbox from a certain person/board ... This is all your people on imessage
	if(bit_is_set(CANSTMOB, RXOK)) { //is there something in the mail box to be read
		//different letters
		can_recv_msg[0] = CANMSG;   // PANIC PANIC
		can_recv_msg[1] = CANMSG;   // brake analog voltage MSB       // subjectlines of the letter, have to read the letters in order
		can_recv_msg[2] = CANMSG;   // brake analog voltage LSB
		can_recv_msg[3] = CANMSG;   // is brake pressed? CF
		can_recv_msg[4] = CANMSG;   // BSPD sense
		can_recv_msg[5] = CANMSG;   // TSMS sense
		can_recv_msg[6] = CANMSG;   // left e-stop sense
		can_recv_msg[7] = CANMSG;   // GLVMS sense


		if(can_recv_msg[3] == 0xFF) { //if the specific letter says something
			gFlag |= _BV(BRAKE_PRESSED);           //trip flag // scribbling on your hand
		} else {
			gFlag &= ~_BV(BRAKE_PRESSED);
		}

		if(can_recv_msg[3] == 0xFF) { //if the specific letter says something
			PORT_BRAKE_LED |= _BV(BRAKE_LED);           //trip flag // scribbling on your hand
		} else {
			PORT_BRAKE_LED &= ~_BV(BRAKE_LED);
		}

		//Setup to Receive Again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(BRAKE_LIGHT_MBOX, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, CAN_MSK_SINGLE);
	}


/*----- BMS Core Mailbox -----*/
	CANPAGE = (BMS_CORE_MBOX << MOBNB0);
	if(bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG; // PANICPANIC
		can_recv_msg[1] = CANMSG; // Relay Status
		can_recv_msg[2] = CANMSG; // Temperature
		can_recv_msg[3] = CANMSG; // SoC % Estimate
		can_recv_msg[4] = CANMSG; // BMS OK!
		can_recv_msg[5] = CANMSG; // Regen Enabled
		can_recv_msg[6] = CANMSG; // Current Limiting Enabled
		can_recv_msg[7] = CANMSG; // Cell Balancing Status

		OCR1B = can_recv_msg[3]; //SoC for PWM


		// Grab BMS fault light
		if(can_recv_msg[4] == 0x00) {
			gFlag |= _BV(BMS_LIGHT); // If BMS shutdown is low, turn light pin high

		}
		//Setup to Receive Again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(BMS_CORE_MBOX, CAN_ID_BMS_CORE, CAN_LEN_BMS_CORE, CAN_MSK_SINGLE);
	}


/*----- AIRs Control Sense Mailbox -----*/
	CANPAGE = (AIR_CONTROL_SENSE_MBOX << MOBNB0); //repeat with mailbox 1 to listen for BMS and IMD
	if(bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG; // PANIC PANIC
		can_recv_msg[1] = CANMSG; // Main Pack Sense
		can_recv_msg[2] = CANMSG; // HVD Sense
		can_recv_msg[3] = CANMSG; // IMD Sense
		can_recv_msg[4] = CANMSG; // BMS Sense
		can_recv_msg[5] = CANMSG; // BMS Status
		can_recv_msg[6] = CANMSG; // IMD Status


		// Grab IMD status
		if(can_recv_msg[6] == 0x00) {
			gFlag |= _BV(IMD_STATUS); //If IMD status is low, set light pin high
		}

		// If IMD shutdown is true, make IMD_PIN high (if IMD goes low within 2 seconds of car on)
		// make sure these latch (don't turn off until board is turned off)

		//Setup to Receive Again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(AIR_CONTROL_SENSE_MBOX, CAN_ID_AIR_CONTROL_SENSE, CAN_LEN_AIR_CONTROL_SENSE, CAN_MSK_SINGLE);
	}


/*----- AIRs Control Critical Mailbox -----*/
	CANPAGE = (AIR_CONTROL_CRITICAL_MBOX << MOBNB0); //repeat with mailbox 1 to listen for BMS and IMD
	if(bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG; // error code, can panic PANIC
		can_recv_msg[1] = CANMSG; // Precharge Started/complete
		can_recv_msg[2] = CANMSG; // High Side AIR
		can_recv_msg[3] = CANMSG; // Low Side AIR
		can_recv_msg[4] = CANMSG; // HV Check
		can_recv_msg[5] = CANMSG; // Debugging


		if(can_recv_msg[1] == 0xFF) {
			gFlag |= _BV(PRECHARGE); //
		}
		else {
			gFlag &= ~_BV(PRECHARGE);
			gFlag &= ~_BV(STATUS_START);
			gCAN_MSG[1] = 0x00;
		}

		if(can_recv_msg[4] == 0xFF) {
			PORT_HV_LED |= _BV(HV_LED); //if the HV Check is High then turn on HV LED
		}
		else {
			PORT_HV_LED &= ~_BV(HV_LED); //if the HV Check is 0 then turn the HV LED off
		}

		// If IMD shutdown is true, make IMD_PIN high (if IMD goes low within 2 seconds of car on)
		// make sure these latch (don't turn off until board is turned off)

		//Setup to Receive Again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(AIR_CONTROL_CRITICAL_MBOX, CAN_ID_AIR_CONTROL_CRITICAL, CAN_LEN_AIR_CONTROL_CRITICAL, CAN_MSK_SINGLE);
	}


/*----- Throttle Mailbox -----*/
	CANPAGE = (THROTTLE_MBOX << MOBNB0);
	if(bit_is_set(CANSTMOB, RXOK)) {
		can_recv_msg[0] = CANMSG;   // PANIC PANIC
		can_recv_msg[1] = CANMSG;   // Throttle Position
		can_recv_msg[2] = CANMSG;   // BOTs sense
		can_recv_msg[3] = CANMSG;   // inertia Switch Sense
		can_recv_msg[4] = CANMSG;   // Driver E-Stop Sense

		OCR1A = can_recv_msg[1]; //Throttle for PWM


		//Setup to Receive Again
		CANSTMOB = 0x00;
		CAN_wait_on_receive(THROTTLE_MBOX, CAN_ID_THROTTLE, CAN_LEN_THROTTLE, CAN_MSK_SINGLE);
	}


}

ISR(PCINT1_vect) { //pin inturput, me telling myself something, stepping on a lego and my inclination to say owwww

	if(bit_is_clear(PINC,START_PIN)) { //Pull up resistor. Therefore this should be bit is clear
		gFlag |= _BV(STATUS_START);
		PORT_DEBUG_LED2 |= _BV(DEBUG_LED2);
	} else {
		gFlag &= ~_BV(STATUS_START);
		PORT_DEBUG_LED2 &= ~_BV(DEBUG_LED2);
	}
}

/*ISR(PCINT2_vect){
	if(bit_is_set(PIND,PD2)) {
		PORTC |= _BV(PC0);
	}else{
		PORTC &= ~_BV(PC0);
	}
} */

ISR(TIMER0_COMPA_vect) {
	// Only send CAN msgs every 20 cycles
	// Timer Counter0 compare match A
 gTimerFlag |= _BV(UPDATE_STATUS);
 }

	if(gClock_prescale > 10) {
		gFlag |= _BV(UPDATE_STATUS);
		gClock_prescale = 0;
	}
	gClock_prescale++;
}


/*----- Functions -----*/
void initTimer(void) {
	TCCR0A = _BV(WGM01);    // Set up 8-bit timer in CTC mode
	TCCR0B = 0x05;          // clkio/1024 prescaler
	TIMSK0 |= _BV(OCIE0A);
	OCR0A = 0x27;           //Makes timer run at ~100Hz
}

void initIO(void) {
	/* Initialize all inputs and outputs and interrupts */

	// Enable Interrupts
	sei();

  //Sets each of these pins as Outputs
	DDRB |= _BV(DEBUG_LED1) | _BV(DEBUG_LED2) | _BV(IMD_LED) | _BV(START_LED) | _BV(BRAKE_LED) ;
	DDRC |= _BV(RTD_LSD) | _BV(RJ_LED1) | _BV(RJ_LED2);//| _BV(START_PIN) --> Included below
	DDRD |= _BV(BMS_LED) | _BV(HV_LED) | _BV(LV_LED);//| _BV(STEERING_POT) --> Included below

  //Set the BMS LED as OFF
	PORT_BMS_LED &= ~_BV(BMS_LED);

	//Set start pin as input
	DDRC &= ~_BV(START_PIN);

	//Set Start Pin as input pull up, Turning it on
	PORT_START |= _BV(START_PIN);

	//Set pull up resistor for steering pot
	PORT_STEERING_POT |= _BV(STEERING_POT);

	//PORTC |= _BV(PC0);

	/* Setup pin change interrupt registers for start pin*/
	PCICR |= _BV(PCIE1) | _BV(PCIE2);
	PCMSK1 |= _BV(PCINT14);
	PCMSK2 |= _BV(PCINT18);



	/*----- Setup PWM output -----*/
	//Output compare pin is OC1B, so we need OCR1B as our counter
	DDRC |= _BV(PC0); //Enable output pin
	DDRC |= _BV(PC1); //Enable output pin

	// DDRD |= _BV(PD3);
	DDRD |= _BV(PD2); //PWM is happening on this pin

	// pg 119 and 110 of datasheet
	// currently running on mode 5 for 8-bit resolution timer
	// turns on when counter hits OCRnx and off when hits top (255)
	TCCR1A |= _BV(COM1A1) | _BV(COM1A0) | _BV(COM1B1) | _BV(COM1B0) | _BV(WGM10);
	TCCR1A &= ~_BV(WGM11) & ~_BV(COM1A0) & ~_BV(COM1B0);
	TCCR1B |= _BV(CS10); //Clock prescale set to max speed
	TCCR1B |= _BV(WGM12);
	TCCR1B &= ~_BV(WGM13);


	// OCR1A = (uint8_t) 115;       // Duty Cycle
	// OCR1B = (uint8_t) 127;      // Duty Cycle

}


void updateStateFromFlags(void) {
	/*
	   Based off the state of the flag(s), update components and send CAN
	 */

	// Check BMS light
	if((bit_is_set(gFlag, BMS_LIGHT))) {
		PORT_BMS_LED |= _BV(BMS_LED);
		gCAN_MSG[0] = 0x00;

	}

	// Check IMD light
	if((bit_is_set(gFlag, IMD_STATUS))) {
		PORT_IMD_LED |= _BV(IMD_LED);
		gCAN_MSG[0] = 0x00;
	}
}

void initADC(void) {
	//Get the Analog to Digital Converter started (ADC)
	ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS0);

	//Enable interal reference voltage
	ADCSRB &= _BV(AREFEN);

	//Set internal reference voltage as AVcc
	ADMUX |= _BV(REFS0);

	//Reads by default from ADC0 (pin 11)
	//This line is redundant. The timer
	ADMUX |= _BV(0x00);

}

void readPorts(void){

	ADMUX |= 2;
	ADCSRA |= _BV(ADSC);
	uint8_t steering = (uint8_t) (ADC >> 2);
	gSteering = steering;

}

/*----- MAIN -----*/
int main(void){
	/*
	   -Set up I/O
	   -Set up CAN timer (done)
	   -Initialize external libraries (if applicable)
	   -Wait on CAN
	   -Infinite loop checking shutdown state!
	 */

	 //LV light on while car is on
	 	PORT_LV_LED |= _BV(LV_LED);
		CS_DDR |= _BV(CS_PIN);
		CS_PORT |= _BV(CS_PIN);
		uint8_t response = 0x00;

	_delay_ms(3000);

	// Initialize I/O
	initIO();

	// CAN Enable
	CAN_init(CAN_ENABLED);

	//ADC Enable
	initADC();

	// CBN Enable
	CAN_wait_on_receive(BRAKE_LIGHT_MBOX, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, CAN_MSK_SINGLE);
	CAN_wait_on_receive(BMS_CORE_MBOX, CAN_ID_BMS_CORE, CAN_LEN_BMS_CORE, CAN_MSK_SINGLE);
	CAN_wait_on_receive(AIR_CONTROL_CRITICAL_MBOX, CAN_ID_AIR_CONTROL_CRITICAL, CAN_LEN_AIR_CONTROL_CRITICAL, CAN_MSK_SINGLE);
	CAN_wait_on_receive(AIR_CONTROL_SENSE_MBOX, CAN_ID_AIR_CONTROL_SENSE, CAN_LEN_AIR_CONTROL_SENSE, CAN_MSK_SINGLE);
	CAN_wait_on_receive(THROTTLE_MBOX, CAN_ID_THROTTLE, CAN_LEN_THROTTLE, CAN_MSK_SINGLE);

	initTimer();                        // Initialize Timer
	gFlag |= _BV(UPDATE_STATUS);        // Read ports

SPI_init(SPI_FOSC_DIV_4, SPI_MODE_0_0 /*Todo: CHECK*/, &CS_PORT, CS_PIN);

	while(1) {

		if(bit_is_set(gTimerFlag,UPDATE_STATUS)) {
			// Check Timer
			gTimerFlag &= ~_BV(UPDATE_STATUS);
			// message = 0x00;
			SPI_start();
			for (uint8_t i = 0x00; i < 0x08; i++) {
				SPI_transfer(i, &response);
			}
			SPI_end();
			// _delay_ms(5000);
		}

		if(bit_is_set(gFlag, UPDATE_STATUS)) {
			gFlag &= ~_BV(UPDATE_STATUS);  // Clear Flag
			PORT_DEBUG_LED1 ^= _BV(DEBUG_LED1); //Timing Check

			updateStateFromFlags();
			readPorts();

			gCAN_MSG[1] = gSteering;

			CAN_transmit(5, CAN_ID_DASHBOARD, CAN_LEN_DASHBOARD, gCAN_MSG);

			//COMMENT THIS OUT!!
			//PORT_BMS_LED |= _BV(BMS_LED);
			//PORT_IMD_LED |= _BV(IMD_LED);


			//CHANGE TO PRECHARGE IS SET!!!!!!!!
			if(bit_is_clear(gCAN_MSG,CAN_READY_TO_DRIVE) && bit_is_set(gFlag, BRAKE_PRESSED) && bit_is_set(gFlag, PRECHARGE) && bit_is_set(gFlag,STATUS_START)) {

				RTD_PORT |= _BV(RTD_LSD);
				_delay_ms(1500);
				RTD_PORT &= ~(_BV(RTD_LSD));

				gCAN_MSG[0] = 0xFF;
			}


			if(bit_is_set(gFlag, BRAKE_PRESSED)) {
				PORT_RJ_LED1 |= _BV(RJ_LED1);
			} else{
				PORT_RJ_LED1 &= ~_BV(RJ_LED1);
			}

			if(bit_is_set(gFlag, PRECHARGE)) {
				PORT_RJ_LED2 |= _BV(RJ_LED2);
			} else{
				PORT_RJ_LED2 &= ~_BV(RJ_LED2);
			}

			if(bit_is_clear(gFlag, PRECHARGE) && bit_is_set(gFlag, BRAKE_PRESSED)) {
				PORT_START_LED |= _BV(START_LED);
			} else{
				PORT_START_LED &= ~_BV(START_LED);
			}

			if(bit_is_set(gFlag, STATUS_START)) {
				gCAN_MSG[2] = 0xFF;
			} else{
				gCAN_MSG[2] = 0x00;
			}
		}
	}
}
