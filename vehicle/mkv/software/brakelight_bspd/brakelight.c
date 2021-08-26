/*
Header:
	Code for the Brakelight/BSPD Board located in the low-voltage box
Author:
	@author Jack Greenberg
    @date   11/07/2019
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
/* Shutdown */
#define GLOBAL_SHUTDOWN         0

#define BSPD_RELAY_INTENTION    PB1
#define SHUTDOWN_SENSE_BSPD_PIN PD5
#define BSPD_CURRENT_SENSE      PC4
#define BRAKELIGHT_GATE         PC5
#define BRAKE_PRESSURE_SENSE    PC6

/* LEDs */
#define DEBUG_LED_1             PD6
#define DEBUG_LED_2             PD7
#define DEBUG_LED_3             PB2
#define RJ45_LED_G              PB3
#define RJ45_LED_O              PB4

/* CAN Message Positions */
#define CAN_BRAKE_ANALOG_MSB	1
#define CAN_BRAKE_ANALOG_LSB	2
#define CAN_BRAKE_GATE		    3
#define CAN_BSPD		        4

/* CAN Message Objects */
#define MOB_PANIC		        0
#define MOB_BRAKELIGHT		    1

/* Fault Codes */
#define FAULT_CODE_BSPD 	    0x10

#define UPDATE_STATUS           0

uint8_t gStatusMessage[8] = {0, 0, 0, 0, 0xFF, 0, 0, 0};

volatile uint8_t gTimerFlag = 0x01;

void initTimer(void) {
	TCCR0A = _BV(WGM01); // Set up 8-bit timer in CTC mode

	TCCR0B = 0x05; // Set clock prescaler to (1/1024) - page 89

	TIMSK0 |= _BV(OCIE0A); // Enable Match A interupts - page 90

	OCR0A = 0x27; //Makes the timer reset everytime it hits 39 (~100 Hz) - page 90
}

ISR(TIMER0_COMPA_vect) {
	gTimerFlag = _BV(UPDATE_STATUS);
}

ISR(PCINT1_vect) {
    gStatusMessage[CAN_BRAKE_GATE] = (bit_is_set(PINC, BRAKELIGHT_GATE) ? 0xFF : 0x00);
}

ISR(PCINT2_vect) {
    gStatusMessage[CAN_BSPD] = (bit_is_set(PIND, SHUTDOWN_SENSE_BSPD_PIN) ? 0xFF: 0x00);
}

void initADC(void) {
	//Get the Analog to Digital Converter started (ADC)
    ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS0);

    //Enable interal reference voltage
    ADCSRB &= _BV(AREFEN);

    //Set internal reference voltage as AVCC
    ADMUX |= _BV(REFS0);

    //Reads by default from ADC0 (pin 11)
    ADMUX |= _BV(0x00);
}

void readBrakePressure(void){
	/*
	 * Read values from the brake pressure sensor
	 * to send over CAN to the rest of the vehicle
	 */

	ADMUX = _BV(REFS0);
	ADMUX |= 10; // ADC10
	ADCSRA |= _BV(ADSC);
	loop_until_bit_is_clear(ADCSRA,ADSC);
	uint16_t brakeValue = ADC;

	gStatusMessage[CAN_BRAKE_ANALOG_MSB] = (uint8_t) (brakeValue >> 2);
	gStatusMessage[CAN_BRAKE_ANALOG_LSB] = (uint8_t) brakeValue;
}

int main(void) {
	// Set up LEDs
	DDRB |= _BV(DEBUG_LED_3) | _BV(RJ45_LED_G) | _BV(RJ45_LED_O);
	DDRD |= _BV(DEBUG_LED_1) | _BV(DEBUG_LED_2);

	sei(); // Initializes interrupts
	initTimer();

	// Pin Change Interrupt Control Register
	PCICR |= _BV(PCIE1) | _BV(PCIE2); // | _BV(PCIE0);
	// PCIE0 enables interrupts on PCINT23..16. Each pin is enabled by PCMSK0
	// PCIE1 enables interrupts on PCINT41..8. Each pin is enabled by PCMSK1
	// PCIE2 enables interrupts on PCINT7..0. Each pin is enabled by PCMSK2

	PCMSK2 |= _BV(PCINT21); // SHUTDOWN_SENSE_BSPD_PIN
	PCMSK1 |= _BV(PCINT13); // BRAKELIGHT_GATE
	// PCMSK0 |= _BV(PCINT1); // BSPD_RELAY_INTENTION // BSPD_RELAY_INTENTION

	initADC();
	CAN_init(CAN_ENABLED);

	while(1) {
		if (bit_is_set(gTimerFlag, UPDATE_STATUS)) {
			gTimerFlag &= ~_BV(UPDATE_STATUS);
			readBrakePressure();
			CAN_transmit(0, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, gStatusMessage);
		}
	}
}
