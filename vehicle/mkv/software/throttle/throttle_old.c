/*
   Code for the OEM MKIV Throttle Board
   Author: awenstrup
 */

//Includes
#include <stdio.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "can_api.h"
#include "log_uart.h"

#include <util/delay.h>

//Macro Definitinos

//Pin and Port Macros
#define THROTTLE_1 PC4
#define THROTTLE_2 PC5
#define THROTTLE_PORT PORTC

#define THROTTLE1_ADC_NUM 0b01000 //ADC8
#define THROTTLE2_ADC_NUM 0b01001 //ADC9
#define DRIVE_MODE_ADC    0b00010 //ADC2

#define DRIVE_MODE PD5
#define DRIVE_MODE_PORT PORTD

#define SS_ESTOP PB5
#define SS_IS PB6
#define SS_BOTS PB7
#define SS_PORT PORTB

#define PLED1 PC6
#define PLED1_PORT PORTC
#define PLED2 PB3
#define PLED2_PORT PORTB
#define PLED3 PB4
#define PLED3_PORT PORTB

#define LED1 PB0 //orange
#define LED2 PB1 //green
#define EXT_LED_PORT PORTB

//CAN Macros
#define CAN_THROTTLE 0
#define CAN_BOTS 1
#define CAN_IS 2
#define CAN_ESTOP 3
// #define CAN_DRIVE_MODE 1




//Mailbox Macros
//Input
#define MOB_BRAKELIGHT 0
#define MOB_DASHBOARD 1
#define MOB_PANIC 2
//Output
#define MOB_BROADCAST 3
#define MOB_MOTORCONTROLLER 4

//Flags
#define FLAG_BRAKE 0
#define FLAG_THROTTLE_BRAKE 1
#define FLAG_ESTOP 2
#define FLAG_IS 3
#define FLAG_BOTS 4
#define FLAG_MOTOR_ON 5
#define FLAG_THROTTLE_10 6
#define FLAG_PANIC 7

//Voltage Reference for Drive Mode Select
#define STANDARD_LOWER_BOUND 0
#define ACCELERATION_LOWER_BOUND 0
#define SKIDPAD_LOWER_BOUND 0
#define AUTOCROSS_LOWER_BOUND 0
#define ENDURANCE_LOWER_BOUND 0

#define ROLLING_AVG_SIZE 8

#define UPDATE_STATUS 1

#define ADC_ERROR 6
#define DEAD_ZONE 64

//********************Global variables***************
uint8_t gFlag = 0;
uint8_t gTimerFlag = 0;

uint16_t gDriveModeVoltage = 0;
uint8_t gDriveMode = 0;
/* Drive modes:
   0 = error (no signal recieved, default to standard)
   1 = standard (linear torque request)
   2 = acceleration
   3 = skid pad
   4 = autocross
   5 = endurance
 */
char uart_buf[64];
uint8_t gError = 0b00000000;
/* Error definitions:
   0 = No errors
   1 = Drive mode error
 */

uint16_t gThrottle1Voltage = 0;
uint16_t gThrottle2Voltage = 0;
uint16_t gThrottle1In = 0;
uint16_t gThrottle2In = 0;
uint8_t gThrottle1Out = 0;
uint8_t gThrottle2Out = 0;

uint8_t gThrottleArrayIndex = 0;
//uint8_t gAverageSize = 8;
uint8_t gThrottleArray[ROLLING_AVG_SIZE];
uint16_t gRollingSum = 0;
uint8_t gThrottleOut = 0;
volatile uint8_t msg;

// Throttle mapping values
//Values set last on Oct 12 by Alex Wenstrup
const uint16_t throttle1_HIGH = 654;
const uint16_t throttle1_LOW = 154 + DEAD_ZONE;
const uint16_t throttle2_HIGH = 1016;
const uint16_t throttle2_LOW = 234 + DEAD_ZONE;

uint8_t throttle10Counter = 0;
const uint8_t throttle10Ticks = 6; //number of measurements that corespond to an implausibility error

uint8_t gCANMessage[4] = {0, 0, 0, 0};
uint8_t gCANMotorController[8] = {0, 0, 0, 0, 0, 0, 0, 0};

uint8_t gBrakeLightCan[7] = {0, 0, 0, 0, 0, 0, 0};

uint8_t clock_prescale = 0;

uint8_t timer_max = 0; //SET TO 0 BEFORE GOING HV

//********************Functions*************************

//*************ISRs*****************

ISR(TIMER0_COMPA_vect) {
	/*
	   Use the internal timer to control how quickly code is executed
	   by setting a flag used in the main loop
	 */

	clock_prescale++;
	if(clock_prescale>timer_max) {
		gTimerFlag |= _BV(UPDATE_STATUS);
		clock_prescale = 0;
	}
}

ISR(CAN_INT_vect) {
	/*
	   CAN Interupt
	   Listens for CAN messages from the brakes,
	   start button (through the dashboard), and panic
	 */

	// Brakelight
	CANPAGE = (MOB_BRAKELIGHT << MOBNB0);
	if (bit_is_set(CANSTMOB,RXOK)) {

		//Gets the third value of of the message
		gBrakeLightCan[0] = CANMSG;
		gBrakeLightCan[1] = CANMSG;
		gBrakeLightCan[2] = CANMSG;
		gBrakeLightCan[3] = CANMSG;
		gBrakeLightCan[4] = CANMSG;
		gBrakeLightCan[5] = CANMSG;
		gBrakeLightCan[6] = CANMSG;

		if(gBrakeLightCan[2] == 0xFF) {   //if true, brake is activated
			gFlag |= _BV(FLAG_BRAKE); // _BV(thing) = (1 << thing) 00000001
		}

		else if ((gThrottle1Out == 0x00 || gThrottle2Out == 0x00) && gBrakeLightCan[2] == 0x00) {
			gFlag &= ~_BV(FLAG_BRAKE);
		}

		CANSTMOB = 0x00;
		CAN_wait_on_receive(MOB_BRAKELIGHT,
		                    CAN_ID_BRAKE_LIGHT,
		                    CAN_LEN_BRAKE_LIGHT,
		                    0xFF);
	}

	//Start button
	CANPAGE = (MOB_DASHBOARD << MOBNB0);
	if (bit_is_set(CANSTMOB,RXOK)) {
		volatile uint8_t msg = CANMSG;

		if (msg == 0xFF) {
			gFlag |= _BV(FLAG_MOTOR_ON);
			// PLED1_PORT |= _BV(PLED1);
			PLED2_PORT ^= _BV(PLED2);
		} else {
			gFlag &= ~_BV(FLAG_MOTOR_ON);
			PLED1_PORT ^= _BV(PLED1);
		}

		CANSTMOB = 0x00;
		CAN_wait_on_receive(MOB_DASHBOARD,
		                    CAN_ID_DASHBOARD,
		                    CAN_LEN_DASHBOARD,
		                    0xFF);
	}

	//Panic
	CANPAGE = (MOB_PANIC << MOBNB0);
	if (bit_is_set(CANSTMOB,RXOK)) {
		volatile uint8_t msg = CANMSG;

		if(msg == 0xFF) {
			gFlag |= _BV(FLAG_PANIC);

		} else {
			gFlag &= ~_BV(FLAG_PANIC);
		}

		CANSTMOB = 0x00;
		CAN_wait_on_receive(MOB_PANIC,
		                    CAN_ID_PANIC,
		                    CAN_LEN_PANIC,
		                    0xFF);
	}
}

ISR(PCINT0_vect) {
	/*
	   Checks if the shutdown circuit
	   nodes are open or closed, and sets flags accordingly
	 */
	if(bit_is_clear(PINB,SS_IS)) {
		gFlag |= _BV(FLAG_IS);
	} else {
		gFlag &= ~_BV(FLAG_IS);
	}

	if(bit_is_clear(PINB,SS_ESTOP)) {
		gFlag |= _BV(FLAG_ESTOP);
	} else {
		gFlag &= ~_BV(FLAG_ESTOP);
	}

	if(bit_is_clear(PINB,SS_BOTS)) {
		gFlag |= _BV(FLAG_BOTS);
	} else {
		gFlag &= ~_BV(FLAG_BOTS);
	}
}

//****************Initializers*****************
void initTimer(void) {
	// Set up 8-bit timer in CTC mode
	TCCR0A = _BV(WGM01);

	// Set clock prescaler to (1/1024) - page 89
	TCCR0B = 0b101;

	// Enable Match A interupts - page 90
	TIMSK0 |= _BV(OCIE0A);

	//Makes the timer reset everytime it hits 39 (~100 Hz)
	// - page 90
	OCR0A = 39;
}

void initADC(void) {
	// Enable Analog Digital Converter with
	// frequency (1/32) * system clock - page 212
	ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS0);

	//Enable interal reference voltage
	ADCSRB &= _BV(AREFEN);

	//Set internal reference voltage as AVcc
	ADMUX |= _BV(REFS0);

	//Reads by default from ADC0 (pin 11)
	//This line is redundant. The timer
	ADMUX |= _BV(0x00);
}

void initMC(void) {
	gCANMotorController[0] = 0;
	gCANMotorController[1] = 0;
	gCANMotorController[2] = 0;
	gCANMotorController[3] = 0;
	gCANMotorController[4] = 1; // anticlockwise
	gCANMotorController[5] = 0;
	gCANMotorController[6] = 0;
	gCANMotorController[7] = 0;

	CAN_transmit(MOB_MOTORCONTROLLER,
	             CAN_ID_MC_COMMAND,
	             CAN_LEN_MC_COMMAND,
	             gCANMotorController);
}

void setPledOut(void) {
	//Sets the programming LEDs as output
	DDRC |= _BV(PLED1);
	DDRB |= _BV(PLED2);
	DDRB |= _BV(PLED3);

	DDRB |= _BV(LED1);
	DDRB |= _BV(LED2);
}

void enablePCINT(void) {
	//Enables interupts on shutdown sense pins
	PCICR |= _BV(PCIE0);
	PCMSK0 |= _BV(PCINT5) | _BV(PCINT6) | _BV(PCINT7);
}

void initDriveMode(void) {
	//Sets the drive mode (only call once, when RTD)
	ADMUX = _BV(REFS0);
	ADMUX |= DRIVE_MODE_ADC;
	ADCSRA |= _BV(ADSC);
	loop_until_bit_is_clear(ADCSRA, ADSC);
	uint16_t dm = ADC;

	if(dm < STANDARD_LOWER_BOUND) {
		gDriveMode = 0;
		gError = 1;
	}
	else if(dm < ACCELERATION_LOWER_BOUND) {
		gDriveMode = 1;
	}
	else if(dm < SKIDPAD_LOWER_BOUND) {
		gDriveMode = 2;
	}
	else if(dm < AUTOCROSS_LOWER_BOUND) {
		gDriveMode = 3;
	}
	else if(dm < ENDURANCE_LOWER_BOUND) {
		gDriveMode = 4;
	}
	else {
		gDriveMode = 5;
	}
}

//***************Error Checking*************

void checkShutdownState(void)   {
	//Sets the value of the CANMessage array
	//at the correct position
	//to 255 if the shutdown sense is triggered
	if(bit_is_set(gFlag,FLAG_ESTOP)) {
		gCANMessage[CAN_ESTOP] = 0xFF;
	} else {
		gCANMessage[CAN_ESTOP] = 0x00;
	}

	if(bit_is_set(gFlag,FLAG_IS)) {
		gCANMessage[CAN_IS]= 0xFF;
	} else {
		gCANMessage[CAN_IS] = 0x00;
	}

	if(bit_is_set(gFlag,FLAG_BOTS)) {
		gCANMessage[CAN_BOTS] = 0xFF;
	} else {
		gCANMessage[CAN_BOTS] = 0x00;
	}
}

void checkPanic(void) {
	if(bit_is_set(gFlag,FLAG_PANIC)) {
		gThrottle1Out = 0;
		gThrottle2Out = 0;
		gThrottleOut = 0;
		// PLED1_PORT ^= _BV(PLED1);
		// PLED2_PORT ^= _BV(PLED2);
		// PLED3_PORT ^= _BV(PLED3);
	}
}

void checkPlausibility(void) {
	if (gThrottle1Voltage * 50 > gThrottle2Voltage * 35 || gThrottle1Voltage * 55 < gThrottle2Voltage * 32) {
		throttle10Counter += 1;
	}
	//else if ((gThrottle1Voltage > (throttle1_HIGH + ADC_ERROR)) || gThrottle1Voltage < throttle1_LOW - ADC_ERROR) {
	else if (gThrottle1Voltage > 1022 || gThrottle1Voltage < 16) {
		throttle10Counter += 1;
	}
	//else if ((gThrottle2Voltage > (throttle2_HIGH + ADC_ERROR)) || gThrottle2Voltage < throttle2_LOW - ADC_ERROR) {
	else if (gThrottle2Voltage > 1022 || gThrottle2Voltage < 16) {
		throttle10Counter += 1;
	}
	else {
		throttle10Counter = 0;
	}

	if (throttle10Counter > throttle10Ticks) {
		gFlag |= _BV(FLAG_THROTTLE_10);
	}
	else {
		gFlag &= ~_BV(FLAG_THROTTLE_10);
	}
}

//***************Read and map throttle***********

void readPots(void) {
	/*
	   Read values from ADC and store them
	   in their appropriate variables
	   Reads: throttle1 and throttle2
	 */

	ADMUX = _BV(REFS0);
	ADMUX |= THROTTLE1_ADC_NUM;
	ADCSRA |= _BV(ADSC);
	loop_until_bit_is_clear(ADCSRA, ADSC);
	uint16_t t1 = ADC;

	ADMUX = _BV(REFS0);
	ADMUX |= THROTTLE2_ADC_NUM;
	ADCSRA |= _BV(ADSC);
	loop_until_bit_is_clear(ADCSRA, ADSC);
	uint16_t t2 = ADC;

	gThrottle1Voltage = t1;
	gThrottle2Voltage = t2;
	// sprintf(uart_buf, "TV: %u, %u", t1, t2);
	// LOG_println(uart_buf, strlen(uart_buf));

}

void mapThrottle(void) {
	//Map ADC to 0-255
	uint32_t map1;
	uint32_t map2;

	uint16_t v1 = gThrottle1Voltage >> 2;
	uint16_t v2 = gThrottle2Voltage >> 2;

	uint16_t t1h = throttle1_HIGH >> 2;
	uint16_t t1l = throttle1_LOW >> 2;
	uint16_t t2h = throttle2_HIGH >> 2;
	uint16_t t2l = throttle2_LOW >> 2;

	//If the voltage is out of range, set to min or max
	if (v1 < t1l) {
		v1 = t1l;
	}
	else if (v1 > t1h) {
		v1 = t1h;
	}

	if (v2 < t2l) {
		v2 = t2l;
	}
	else if (v2 > t2h) {
		v2 = t2h;
	}

	//Map from 0-255
	map1 = ((v1 - t1l) * 255) / (t1h - t1l);
	map2 = ((v2 - t2l) * 255) / (t2h - t2l);
	gThrottle1In = map1;
	gThrottle2In = map2;

	gThrottle1Out = gThrottle1In;
	gThrottle2Out = gThrottle2In;

	/*
	   //---------Map based on drive mode------------
	   if (gDriveMode == 0) { //error, default to standard
	   gThrottle1Out = gThrottle1In;
	   gThrottle2Out = gThrottle2In;
	   }
	   else if (gDriveMode == 1) { //standard
	   gThrottle1Out = gThrottle1In;
	   gThrottle2Out = gThrottle2In;
	   }
	   else if (gDriveMode == 2) { //acceleration
	   gThrottle1Out = gThrottle1In;
	   gThrottle2Out = gThrottle2In;
	   }
	   else if (gDriveMode == 3) { //skid pad
	   if (gThrottle1In < 128) {
	    gThrottle1Out = gThrottle1In;
	    gThrottle2Out = gThrottle2In;
	   }
	   else {
	    gThrottle1Out = 128 + ((gThrottle1In - 128) >> 1);
	    gThrottle2Out = 128 + ((gThrottle2In - 128) >> 1);
	   }
	   }
	   else if (gDriveMode == 4) { //autocross
	   gThrottle1Out = gThrottle1In;
	   gThrottle2Out = gThrottle2In;
	   }
	   else if (gDriveMode == 5) { //endurance
	   gThrottle1Out = gThrottle1In;
	   gThrottle2Out = gThrottle2In;
	   }
	 */
}

void storeThrottle(void) {
	readPots();
	mapThrottle();
	checkPlausibility();

	uint16_t new = (gThrottle1Out + gThrottle2Out) >> 1;
	uint8_t old = gThrottleArray[gThrottleArrayIndex];

	gRollingSum -= old;
	gRollingSum += new;

	gThrottleArray[gThrottleArrayIndex] = new;

	gThrottleArrayIndex = gThrottleArrayIndex + 1;

	if (gThrottleArrayIndex == ROLLING_AVG_SIZE) {
		gThrottleArrayIndex = 0;
	}

	// sprintf(uart_buf, "NEW: %u", new);
	// LOG_println(uart_buf, strlen(uart_buf));
	// sprintf(uart_buf, "OLD: %u", old);
	// LOG_println(uart_buf, strlen(uart_buf));
}

void getAverage(void) {
	uint32_t temp = gRollingSum;
	temp /= ROLLING_AVG_SIZE;
	gThrottleOut = temp;
}


//*************Testing*****************
void printThrottle1(void) {
	char uart_buf[64];
	sprintf(uart_buf, "tout: %d", gThrottleOut);
	LOG_println(uart_buf, strlen(uart_buf));

	sprintf(uart_buf, "v1: %d", gThrottle1Voltage);
	LOG_println(uart_buf, strlen(uart_buf));

	sprintf(uart_buf, "v2: %d", gThrottle2Voltage);
	LOG_println(uart_buf, strlen(uart_buf));

	sprintf(uart_buf, " ");
	LOG_println(uart_buf, strlen(uart_buf));
}

void printThrottle(void) {
	char uart_buf[32];
	sprintf(uart_buf, "t10ticks: %d", throttle10Counter);
	LOG_println(uart_buf, strlen(uart_buf));
}

void testStartup(void) {
	if (bit_is_set(gFlag, FLAG_MOTOR_ON)) {
		// PLED1_PORT |= _BV(PLED1);
		// PLED2_PORT |= _BV(PLED2);
		// PLED3_PORT |= _BV(PLED3);
	}
	else {
		// PLED1_PORT &= ~_BV(PLED1);
		// PLED2_PORT &= ~_BV(PLED2);
		// PLED3_PORT &= ~_BV(PLED3);
	}
}

void throttleLights(void) {
	// if (gThrottleOut > 64) {
	//  PLED1_PORT |= _BV(PLED1);
	// }
	// else {
	//  PLED1_PORT &= ~_BV(PLED1);
	// }

	// if (gThrottleOut > 128) {
	//  PLED2_PORT |= _BV(PLED2);
	// }
	// else {
	//  PLED2_PORT &= ~_BV(PLED2);
	// }

	// if (gThrottleOut > 192) {
	//  PLED3_PORT |= _BV(PLED3);
	// }
	// else {
	//  PLED3_PORT &= ~_BV(PLED3);
	// }
}

void showError(void) {
	// uint8_t temp = gError;

	// if (temp % 2 == 1) {
	//  PLED1_PORT |= _BV(PLED1);
	// }
	// else {
	//  PLED1_PORT &= ~_BV(PLED1);
	// }

	// temp /= 2;
	//
	// if (temp % 2 == 1) {
	//  PLED2_PORT |= _BV(PLED2);
	// }
	// else {
	//  PLED2_PORT &= ~_BV(PLED2);
	// }

	// temp /= 2;
	//
	// if (temp % 2 == 1) {
	//  PLED3_PORT |= _BV(PLED3);
	// }
	// else {
	//  PLED3_PORT &= ~_BV(PLED3);
	// }
}

//******************Send CAN Messages************
void sendCanMessages(int viewCan){
	//FOR TESTING ONLY
	//gFlag |= _BV(FLAG_MOTOR_ON);

	gCANMessage[0] = bit_is_set(gFlag, FLAG_MOTOR_ON) ? gThrottleOut : 0;
	gCANMessage[1] = bit_is_set(gFlag,FLAG_BOTS) ? 0xFF : 0x00;
	gCANMessage[2] = bit_is_set(gFlag,FLAG_IS) ? 0xFF : 0x00;
	gCANMessage[3] = bit_is_set(gFlag,FLAG_ESTOP) ? 0xFF : 0x00;

	if (bit_is_set(gFlag, FLAG_THROTTLE_10) || bit_is_set(gFlag, FLAG_BRAKE)) {
		gCANMessage[0] = 0;
	}

	CAN_transmit(MOB_BROADCAST,
	             CAN_ID_THROTTLE,
	             CAN_LEN_THROTTLE,
	             gCANMessage);

	// Send out Motor controller info
	// REMAP

	uint16_t thrott = bit_is_clear(gFlag, FLAG_THROTTLE_10) ? (uint16_t) gThrottleOut : 0;
	uint16_t mc_remap = (uint16_t)(thrott * 9);
	gCANMotorController[0] = mc_remap;      //torque command
	gCANMotorController[1] = mc_remap >> 8; //torque command
	gCANMotorController[2] = 0x00;      //speed command (unused)
	gCANMotorController[3] = 0x00;      //speed command (unused)
	gCANMotorController[4] = 0x00;      //direction command (0=reverse,,,1=forward)
	gCANMotorController[5] = bit_is_set(gFlag,FLAG_MOTOR_ON) ? 0x01 : 0x00; //inverter on or off
	gCANMotorController[6] = 0x00;      // commanded torque limit, if 0, uses EEPROM set value
	gCANMotorController[7] = 0x00;      // commanded torque limit, ^

	if (bit_is_set(gFlag, FLAG_THROTTLE_10) || bit_is_set(gFlag, FLAG_BRAKE) || bit_is_clear(gFlag, FLAG_MOTOR_ON)) {
		gCANMotorController[0] = 0x00;
		gCANMotorController[1] = 0x00;
		gCANMotorController[5] = 0x00;
	}

	CAN_transmit(MOB_MOTORCONTROLLER,
	             CAN_ID_MC_COMMAND,
	             CAN_LEN_MC_COMMAND,
	             gCANMotorController);




	if(viewCan) {
		// char msg1[128];
		// char msg2[128];
		// sprintf(msg1,"CAN message one to all:\nThrottle:%d\nSteering:%d\nBOTS:%d\nInertia:%d\nEstop:%d",
		//         gCANMessage[0],gCANMessage[1],gCANMessage[2],gCANMessage[3],gCANMessage[4]);
		// LOG_println(msg1,strlen(msg1));
		// sprintf(msg2,"CAN message to motorcontroller:\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d",
		//         gCANMotorController[0],gCANMotorController[1],gCANMotorController[2],gCANMotorController[3],
		//         gCANMotorController[4],gCANMotorController[5],gCANMotorController[6],gCANMotorController[7]);
		// LOG_println(msg2,strlen(msg2));

	}
}

//******************Main Loop*****************
int main(void) {
	initTimer();
	initADC();
	sei(); // interrupt init
	CAN_init(CAN_ENABLED);
	setPledOut(); // gpio init
	LOG_init(); // initializes UART (can ignore for now)
	enablePCINT(); //enables interrupts for gpio pins
	initMC();

	CAN_wait_on_receive(MOB_DASHBOARD,
	                    CAN_ID_DASHBOARD,
	                    CAN_LEN_DASHBOARD,
	                    0xFF);

	CAN_wait_on_receive(MOB_BRAKELIGHT,
	                    CAN_ID_BRAKE_LIGHT,
	                    CAN_LEN_BRAKE_LIGHT,
	                    0xFF);

	CAN_wait_on_receive(MOB_PANIC,
	                    CAN_ID_PANIC,
	                    CAN_LEN_PANIC,
	                    0xFF);

	// PLED3_PORT |= _BV(PLED3);


	while(1) {
		if(bit_is_set(gTimerFlag,UPDATE_STATUS)) { //everytime timer goes off, clear flag, store throttle, etc.
			gTimerFlag &= ~_BV(UPDATE_STATUS); 
			storeThrottle();
			getAverage();
			checkPanic();
			// checkShutdownState();
			// testStartup();
			printThrottle1();
			sendCanMessages(0);

			// gError = 5;
			// showError();
		}
	}
}
