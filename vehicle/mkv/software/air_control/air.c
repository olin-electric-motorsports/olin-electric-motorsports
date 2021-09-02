/*

   AIR Control Board


*/

/*----- Includes -----*/
#include <stdio.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "can_api.h"
#include "log_uart.h"

/*----- Outputs (PORTs because we write them)-----*/
#define LED1				PD5
#define LED2				PD6
#define LED3        PD7
#define LED_PORT	PORTD

#define RJ45_LED1				PB0
#define RJ45_LED2				PB1
#define RJ45_LED_PORT	PORTB

#define PRECHARGE_CTRL			PB2
#define PRECHARGE_PORT		PORTB
#define AIRMINUS_LSD			  	PC6
#define AIRMINUS_PORT			PORTC

/*----- Inputs (PINs because we read them) -----*/
#define PIN_AIRPLUS_WELD_DET				 PC4 // PCINT12
#define INREG_AIRPLUS_WELD_DET			PINC
#define PIN_AIRMINUS_WELD_DET			   PC5 // PCINT13
#define INREG_AIRPMINUS_WELD_DET	 	PINC // INREG -> input register

#define PIN_BMS_SENSE		  	PC0 // PCINT8
#define INREG_BMS_SENSE	   PINC
#define PIN_IMD_SENSE			  PD0 // PCINT16
#define INREG_IMD_SENSE	   PIND
#define PIN_SS_HVD					PB7 // PCINT7
#define INREG_SS_HVD			 PINB
#define PIN_SS_TSCONN				PB5 // PCINT5
#define INREG_SS_TSCONN		 PINB
#define PIN_SS_IMD					PB4 // PCINT4
#define INREG_SS_IMD			 PINB
#define PIN_SS_BMS					PC7 // PCINT9
#define INREG_SS_BMS			 PINC
#define PIN_SS_TSMS					PB3 // PCINT3
#define INREG_SS_TSMS			 PINB


/*----- Fault Codes -----*/
#define FAULT_CODE_GENERAL										0X00
#define FAULT_CODE_BMS_IMPLAUSIBILITY 				0x01
#define FAULT_CODE_IMD_IMPLAUSIBILITY 				0x02
#define FAULT_CODE_AIRPLUS_WELD 							0x03
#define FAULT_CODE_AIRMINUS_WELD		 					0x04
#define FAULT_CODE_AIRPLUS_CONTROL_LOSS 			0x05
#define FAULT_CODE_AIRMINUS_CONTROL_LOSS 			0x06
#define FAULT_CODE_PRECHARGE_STUCK						0X07
#define FAULT_CODE_PRECHARGE_CONTROL_LOSS			0X08
#define FAULT_CODE_DISCHARGE_STUCK						0X09 // unused because of difficulty of detection
#define FAULT_CODE_DISCHARGE_CONTROL_LOSS			0X0A
#define FAULT_CODE_PRECHARGE_INCOMPLETE				0X0B // if precharge is too slow or stopping below MINIMUM_VOLTAGE_AFTER_PRECHARGE

/*----- gFlag -----*/
#define UPDATE_STATUS       	 0
#define FLAG_AIRPLUS_WELD_DET  1
#define FLAG_AIRMINUS_WELD_DET 2
#define FLAG_IMD_STATUS      	 3
#define FLAG_BMS_STATUS      	 4
#define FLAG_TSMS_STATUS		   5
#define FLAG_CAR_CHARGING			 6

/*----- sFlag -----*/
#define FLAG_SS_HVD       0
#define FLAG_SS_TSCONN    1
#define FLAG_SS_IMD       2
#define FLAG_SS_BMS       3
#define FLAG_SS_TSMS      4
#define FLAG_SS_HVD_CONN  5

/*----- TS Statuses -----*/
#define TS_STATUS_DEENERGIZED 		0x00
#define TS_STATUS_PRECHARGE_DELAY 0x01
#define TS_STATUS_PRECHARGING 		0x02
#define TS_STATUS_ENERGIZED 			0x03
#define TS_STATUS_DISCHARGING 		0x04
#define TS_STATUS_PANIC						0x05

/*----- MOBs (CAN message offsets)-----*/
#define MOB_BROADCAST_CRITICAL	0 // Broadcasts precharge sequence complete
#define MOB_BMS 								1 //Reading BMS for charging
#define MOB_BROADCAST_PANIC 		2 // Panic MOB for BMS to open shutdown circuit
#define MOB_BROADCAST_SS				3
#define	MOB_BRAKELIGHT					4
#define	MOB_IBH									5 // TODO change this to panic message? probably should listen for panics

/*----- Overflow Counts for TS Status Delays -----*/
// Timer1 is running at ~7.63 Hz
#define OVF_COUNT_PRECHARGE_DELAY		0x17 // roughly 3 seconds per FMEA
#define OVF_COUNT_PRECHARGING 			0x10 // roughly 2 seconds -> 3 time constants (1/(2*pi*1k*440uF))*3 = 1.08ish
#define OVF_COUNT_DISCHARGING 			0x1F // roughly 4 seconds -> 3 times as long as precharge (3k res vs 1k res) -> 3.24ish

volatile uint8_t gFlag = 0x00; // Global Flag. Tells us that gFlag will change and to assign it to an unsigned 8bit integer
volatile uint8_t sFlag = 0x00; // Shutdown Sense Flag
volatile uint8_t LEDtimer = 0x00;
uint8_t tractiveSystemStatus = 0;
volatile uint8_t timer1OverflowCount = 0;

char uart_buf[64];
// put these 2 variables into CAN interrupt function
uint8_t msgBL[5];
uint8_t msgMC[2];
uint8_t msgBMS[8]; //will change when can code is updated

uint8_t msgCritical[6] = {0,0,0,0,0,0};
#define MSG_INDEX_ERROR_CODE				0
#define MSG_INDEX_PRECHARGE_STATUS  1
#define MSG_INDEX_AIRPLUS_AUX			  2
#define MSG_INDEX_AIRMINUS_AUX		  3
#define MSG_INDEX_HV_CHECK					4
#define MSG_INDEX_DEBUGGING				  5

uint8_t msgShutdownSense[6] = {0,0,0,0,0,0};
#define MSG_INDEX_SS_TSCONN					0
#define MSG_INDEX_SS_HVD				1
#define MSG_INDEX_SS_BMS				2
#define MSG_INDEX_SS_IMD				3
#define MSG_INDEX_BMS_STATUS		4
#define MSG_INDEX_IMD_STATUS		5
#define MSG_INDEX_SS_TSMS		    6 // might change

ISR(TIMER0_COMPA_vect) {
    /*
    Timer/Counter0 compare match A
    If the clock frequency is 4MHz then this is called 16 times per second
    MATH: (4MHz/1024)/255 = ~16
    */

		gFlag |= _BV(UPDATE_STATUS);
		LEDtimer++;
		if(LEDtimer > 100){
			LEDtimer = 0;
			LED_PORT ^= _BV(LED2);
		}
}

ISR(TIMER1_OVF_vect) {
		timer1OverflowCount++;
}

ISR(PCINT0_vect) { // PCINT0-7 -> BMS_STATUS, IMD_STATUS, SS_HVD, SS_TSMS
    if(bit_is_set(INREG_BMS_SENSE,PIN_BMS_SENSE)){
		 gFlag |= _BV(FLAG_BMS_STATUS);
		} else {
		 gFlag &= ~_BV(FLAG_BMS_STATUS);
		}

		if(bit_is_set(INREG_IMD_SENSE,PIN_IMD_SENSE)){
		 gFlag |= _BV(FLAG_IMD_STATUS);
		} else {
		 gFlag &= ~_BV(FLAG_IMD_STATUS);
		}

		if(bit_is_clear(INREG_SS_HVD,PIN_SS_HVD)){
		 sFlag |= _BV(FLAG_SS_HVD);
		 char hvd_good[]="hvd_good";
		 LOG_println(hvd_good, strlen(hvd_good));
		} else {
		 sFlag &= ~_BV(FLAG_SS_HVD);
		 char hvd_bad[]="hvd_bad";
		 LOG_println(hvd_bad, strlen(hvd_bad));
		}

		if(bit_is_clear(INREG_SS_TSMS,PIN_SS_TSMS)){
		 gFlag |= _BV(FLAG_SS_TSMS);
		} else {
		 gFlag &= ~_BV(FLAG_SS_TSMS);
		}
}

ISR(PCINT1_vect) { // PCINT14, 15, 8, 9 -> AIRPLUS_AUX, AIRMINUS_AUX, SS_IMD, SS_BMS
		if(bit_is_set(INREG_AIRPLUS_WELD_DET,PIN_AIRPLUS_WELD_DET)){
		 gFlag |= _BV(FLAG_AIRPLUS_WELD_DET);
		 char plus[]="plus";
		 LOG_println(plus, strlen(plus));
		} else {
		 gFlag &= ~_BV(FLAG_AIRPLUS_WELD_DET);
		}

		if(bit_is_set(INREG_AIRPMINUS_WELD_DET,PIN_AIRPMINUS_WELD_DET)){
		 gFlag |= _BV(FLAG_AIRMINUS_WELD_DET);
		} else {
		 gFlag &= ~_BV(FLAG_AIRMINUS_WELD_DET);
		}

		if(bit_is_clear(INREG_SS_IMD,PIN_SS_IMD)){
		 sFlag |= _BV(FLAG_SS_IMD);
		} else {
		 sFlag &= ~_BV(FLAG_SS_IMD);
		}

		if(bit_is_clear(INREG_SS_BMS,PIN_SS_BMS)){
		 sFlag |= _BV(FLAG_SS_BMS);
		} else {
		 sFlag &= ~_BV(FLAG_SS_BMS);
		}
}

ISR(PCINT2_vect) { // PCINT16 -> SS_TSCONN
		if(bit_is_clear(INREG_SS_TSCONN,PIN_SS_TSCONN)){
		 sFlag |= _BV(FLAG_SS_TSCONN);
		} else {
		 sFlag &= ~_BV(FLAG_SS_TSCONN);
		}
}
//
ISR(CAN_INT_vect) {
		CANPAGE = (MOB_BMS << MOBNB0);
	  if (bit_is_set(CANSTMOB,RXOK)) {
			// unsure which message it will be, check can_api
	      msgBMS[0] = CANMSG;
				msgBMS[1] = CANMSG;
				msgBMS[2] = CANMSG;
				msgBMS[3] = CANMSG;
				msgBMS[4] = CANMSG;

	      if(msgBMS[4]==0xff){
					gFlag |= _BV(FLAG_CAR_CHARGING);
					//RJ45_LED_PORT |= _BV(RJ45_LED2);
				} else {
					gFlag &= ~_BV(FLAG_CAR_CHARGING);
					//RJ45_LED_PORT &= ~_BV(RJ45_LED2);
				}

	      CANSTMOB = 0x00;
	      CAN_wait_on_receive(MOB_BMS,
	                          CAN_ID_BMS_CORE,
	                          CAN_LEN_BMS_CORE,
	                          CAN_MSK_SINGLE);
}

void initTimer0(void) {
    TCCR0A = _BV(WGM01);    // Set up 8-bit timer in CTC mode
    TCCR0B = 0x05;          // clkio/1024 prescaler
    TIMSK0 |= _BV(OCIE0A);  // Every 1024 cycles, OCR0A increments
    OCR0A = 0xff; //dec 39  // until 0xff, 255, which then calls for
                            // the TIMER0_COMPA_vect interrupt
			    // currently running at 100Hz
}

void initTimer1(void) {
		// Normal operation so no need to set TCCR1A
		TCCR1B |= _BV(CS11); // prescaler set to 8
		// 4MHz CPU, prescaler 8, 16-bit timer overflow -> (4000000/8)/(2^16-1) =  7.63 Hz
		TIMSK1 = 0x01; // enable interrupt on overflow
}

void resetTimer1(void) {
		cli();
		TCNT1H = 0x00; // write timer count to 0, high byte must be written first per datasheet
		TCNT1L = 0x00;
		sei();
		timer1OverflowCount = 0x00;
}

void setOutputs(void) {
		//Sets these pins at outputs
		DDRB |= _BV(PRECHARGE_CTRL) | _BV(RJ45_LED1) | _BV(RJ45_LED2);
		DDRC |= _BV(AIRMINUS_LSD);
		DDRD |= _BV(LED1) | _BV(LED2) | _BV(LED3);
}

void readAllInputs(void){
		PCINT0_vect();
		PCINT1_vect();
		PCINT2_vect();
}


void checkBMSPowerStagePlausibility (void) { // tested and working. needs some type of delay as to when the check is made so it's not too soon
		if ( (bit_is_set(gFlag, FLAG_BMS_STATUS) && bit_is_set(sFlag, FLAG_SS_TSCONN) && bit_is_clear(sFlag, FLAG_SS_BMS))
		|| (bit_is_clear(gFlag, FLAG_BMS_STATUS) && bit_is_set(sFlag, FLAG_SS_BMS)) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_BMS_IMPLAUSIBILITY;
		}
}

void checkIMDPowerStagePlausibility (void) { // tested and working
		if ( (bit_is_set(gFlag, FLAG_IMD_STATUS) && bit_is_set(sFlag, FLAG_SS_BMS) && bit_is_clear(sFlag, FLAG_SS_IMD))
		|| (bit_is_clear(gFlag, FLAG_IMD_STATUS) && bit_is_set(sFlag, FLAG_SS_IMD)) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_IMD_IMPLAUSIBILITY;
		}
}

void checkAIRPLUS (void) {
		if ( bit_is_set(gFlag, FLAG_AIRPLUS_WELD_DET) && bit_is_clear(gFlag, FLAG_TSMS_STATUS) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_AIRPLUS_WELD;
		} else if ( bit_is_clear(gFlag, FLAG_AIRPLUS_WELD_DET) && bit_is_set(gFlag, FLAG_TSMS_STATUS) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_AIRPLUS_CONTROL_LOSS;
		}
}

void checkAIRMINUS (void) {
		if ( bit_is_clear(AIRMINUS_PORT, AIRMINUS_LSD) && bit_is_set(gFlag, FLAG_AIRMINUS_WELD_DET) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_AIRMINUS_WELD;
		} else if ( bit_is_set(AIRMINUS_PORT, AIRMINUS_LSD) && bit_is_clear(gFlag, FLAG_AIRMINUS_WELD_DET) ) {
			msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_AIRMINUS_CONTROL_LOSS;
		}
}

void conditionalMessageSet (uint8_t reg, uint8_t bit, uint8_t msg[], uint8_t index, uint8_t condHigh, uint8_t condLow) {
		if(bit_is_set(reg,bit)){
		 msg[index] = condHigh;
		} else {
		 msg[index] = condLow;
		}
}

void sendShutdownSenseCANMessage (void) {
	msgShutdownSense[MSG_INDEX_SS_TSCONN] = bit_is_set(sFlag, FLAG_SS_TSCONN) ? 0xff : 0x00;
	msgShutdownSense[MSG_INDEX_SS_HVD] = bit_is_set(sFlag, FLAG_SS_HVD) ? 0xff : 0x00;
	msgShutdownSense[MSG_INDEX_SS_IMD] = bit_is_set(sFlag, FLAG_SS_IMD) ? 0xff : 0x00;
	msgShutdownSense[MSG_INDEX_SS_BMS_STATUS] = bit_is_set(sFlag, FLAG_SS_BMS_STATUS) ? 0xff : 0x00;
	msgShutdownSense[MSG_INDEX_SS_IMD_STATUS] = bit_is_set(sFlag, FLAG_SS_IMD_STATUS) ? 0xff : 0x00;
	msgShutdownSense[MSG_INDEX_SS_TSMS] = bit_is_set(sFlag, FLAG_SS_TSMS) ? 0xff : 0x00;
	CAN_transmit(MOB_BROADCAST_SS,
								CAN_ID_AIR_CONTROL_SENSE,
								CAN_LEN_AIR_CONTROL_SENSE,
								msgShutdownSense);
}

void sendCriticalCANMessage (void) {
	// TODO -> hv check?
	conditionalMessageSet(gFlag, FLAG_AIRPLUS_WELD_DET, msgCritical, MSG_INDEX_AIRPLUS_AUX, 0xff, 0x00);
	conditionalMessageSet(gFlag, FLAG_AIRMINUS_WELD_DET, msgCritical, MSG_INDEX_AIRMINUS_AUX, 0xff, 0x00);
	CAN_transmit(MOB_BROADCAST_CRITICAL,
								CAN_ID_AIR_CONTROL_CRITICAL,
								CAN_LEN_AIR_CONTROL_CRITICAL,
								msgCritical);

int main (void) {
    initTimer0();
		initTimer1();
    sei(); //Inititiates interrupts for the ATMega
    CAN_init(CAN_ENABLED);
		LOG_init();
		CAN_wait_on_receive(MOB_BRAKELIGHT, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT, CAN_MSK_SINGLE);

    // Enable interrupt
    PCICR |= _BV(PCIE0) | _BV(PCIE1) | _BV(PCIE2);
		PCMSK0 |= _BV(PCINT3) | _BV(PCINT4) | _BV(PCINT5) | _BV(PCINT6) | _BV(PCINT7);
		PCMSK1 |= _BV(PCINT8) | _BV(PCINT12) | _BV(PCINT13) | _BV(PCINT15);
		PCMSK2 |= _BV(PCINT16);

		setOutputs();

		readAllInputs(); // in case they are set high before micro starts up and therefore won't trigger an interrupt

	 // add a way to tell if car is charging or not
	  uint8_t charging = ;
		uint8_t chargingStartupComplete = 0;

		while(charging) {
			if(bit_is_set(gFlag, UPDATE_STATUS)){
				char chrg[]="charging";
		  	LOG_println(chrg, strlen(chrg));

				gFlag &= ~_BV(UPDATE_STATUS); // TODO IMD STATUS PIN TURNS OFF SLOW DEBUG
				RJ45_LED_PORT |= _BV(RJ45_LED1);

				/*if(bit_is_set(INREG_AIRPLUS_WELD_DET,PIN_AIRPLUS_WELD_DET)){
				 gFlag |= _BV(FLAG_AIRPLUS_WELD_DET);
				 char plus[]="plus closed";
				 LOG_println(plus, strlen(plus));
				} else {
				 gFlag &= ~_BV(FLAG_AIRPLUS_WELD_DET);
				 char op[]="plus open";
				 LOG_println(op, strlen(op));
			 }*/

				if(bit_is_set(gFlag, FLAG_AIRPLUS_WELD_DET) && ~chargingStartupComplete){
					//_delay_ms(2000);
					RJ45_LED_PORT |= _BV(RJ45_LED2);
					PRECHARGE_PORT |= _BV(PRECHARGE_CTRL);
					_delay_ms(2000);
					AIRMINUS_PORT |= _BV(AIRMINUS_LSD);
					PRECHARGE_PORT &= ~_BV(PRECHARGE_CTRL);
					chargingStartupComplete = 1;
					RJ45_LED_PORT &= ~_BV(RJ45_LED2);
				}

			}
		}

    while(1) {
			if(bit_is_set(gFlag, UPDATE_STATUS)){

				gFlag &= ~_BV(UPDATE_STATUS); // TODO IMD STATUS PIN TURNS OFF SLOW DEBUG

				checkBMSPowerStagePlausibility();
				checkIMDPowerStagePlausibility(); // delay this for IMD startup time
				//checkAIRPLUS(); // TODO think about charging, currently compares AIR plus to TSMS can message, won't work in charging
				//checkAIRMINUS();
				sendShutdownSenseCANMessage();
				sendCriticalCANMessage();

				if(tractiveSystemStatus==TS_STATUS_DEENERGIZED){
						PRECHARGE_PORT &= ~_BV(PRECHARGE_CTRL); // open precharge relay, sanity check
						RJ45_LED_PORT &= ~_BV(RJ45_LED1);
						AIRMINUS_PORT &= ~_BV(AIRMINUS_LSD); // open air minus, sanity check
						RJ45_LED_PORT &= ~_BV(RJ45_LED2);
						if(bit_is_set(gFlag, FLAG_AIRPLUS_WELD_DET)){ // if tsms closed
							char tsms_closed[]="tsms_closed";
							LOG_println(tsms_closed, strlen(tsms_closed));
							char precharge_delay[]="precharge_delay";
							LOG_println(precharge_delay, strlen(precharge_delay));
							tractiveSystemStatus = TS_STATUS_PRECHARGE_DELAY; // set status to precharge delay
							resetTimer1(); // reset timer 1
						}
				} else if(tractiveSystemStatus==TS_STATUS_PRECHARGE_DELAY) {
						if(bit_is_clear(gFlag, FLAG_AIRPLUS_WELD_DET)){ //IS THIS RIGHT??? last year was FLAG_TSMS_STATUS
							tractiveSystemStatus = TS_STATUS_DEENERGIZED;
							char tsms_open[]="tsms_open";
							LOG_println(tsms_open, strlen(tsms_open));
							char deenergized[]="deenergized";
							LOG_println(deenergized, strlen(deenergized));
						} else if(timer1OverflowCount>OVF_COUNT_PRECHARGE_DELAY){ // if precharge delay time elapsed
							char precharge_delay_over[]="precharge_delay_over";
							LOG_println(precharge_delay_over, strlen(precharge_delay_over));
							tractiveSystemStatus = TS_STATUS_PRECHARGING; // set status to precharging
							msgCritical[MSG_INDEX_PRECHARGE_STATUS] = 0x0f; // update critical can message to precharge started
							PRECHARGE_PORT |= _BV(PRECHARGE_CTRL); // close precharge relay
							RJ45_LED_PORT |= _BV(RJ45_LED1);
							resetTimer1(); // reset timer 1
							char precharging[]="precharging";
							LOG_println(precharging, strlen(precharging));
						}
				} else if(tractiveSystemStatus==TS_STATUS_PRECHARGING) {
					if(bit_is_clear(gFlag, FLAG_TSMS_STATUS)){
						char tsms_open[]="tsms_open";
						LOG_println(tsms_open, strlen(tsms_open));
						char discharging[]="discharging";
						LOG_println(discharging, strlen(discharging));
						tractiveSystemStatus = TS_STATUS_DISCHARGING;
						PRECHARGE_PORT &= ~_BV(PRECHARGE_CTRL); // open precharge relay
						RJ45_LED_PORT &= ~_BV(RJ45_LED1);
						msgCritical[MSG_INDEX_PRECHARGE_STATUS] = 0x00; // update critical can message to precharge not started
						resetTimer1();
					} else if(timer1OverflowCount>OVF_COUNT_PRECHARGING){
						char precharge_over[]="precharge_over";
						LOG_println(precharge_over, strlen(precharge_over));// if precharging time elapsed
						AIRMINUS_PORT |= _BV(AIRMINUS_LSD); // close air minus
						RJ45_LED_PORT |= _BV(RJ45_LED2);
						_delay_ms(100); // let air minus close before we do stuff
						//checkAIRMINUS(); // confirm closure
						PRECHARGE_PORT &= ~_BV(PRECHARGE_CTRL); // open precharge relay
						RJ45_LED_PORT &= ~_BV(RJ45_LED1);
						tractiveSystemStatus = TS_STATUS_ENERGIZED; // set status to energized
						msgCritical[MSG_INDEX_PRECHARGE_STATUS] = 0xff; // update critical can message to precharge complete
						char energized[]="energized";
						LOG_println(energized, strlen(energized));
					}
				} else if(tractiveSystemStatus==TS_STATUS_ENERGIZED) {
						if(bit_is_clear(gFlag, FLAG_TSMS_STATUS)){ //|| bit_is_clear(gFlag, FLAG_COOLING_PRESSURE)){ // if tsms node no longer has shutdown voltage
							char tsms_open[]="tsms_open";
							LOG_println(tsms_open, strlen(tsms_open));
							char discharging[]="discharging";
							LOG_println(discharging, strlen(discharging));
							AIRMINUS_PORT &= ~_BV(AIRMINUS_LSD); // open air minus
							RJ45_LED_PORT &= ~_BV(RJ45_LED2);
							msgCritical[MSG_INDEX_PRECHARGE_STATUS] = 0x00; // update critical can message to precharge not started
							tractiveSystemStatus = TS_STATUS_DISCHARGING; // set status to discharging
							resetTimer1(); // reset timer 1
						}
				} else if(tractiveSystemStatus==TS_STATUS_DISCHARGING) {
						if(timer1OverflowCount>OVF_COUNT_DISCHARGING){ // if discharging time elapsed
							char discharge_over[]="discharge_over";
							LOG_println(discharge_over, strlen(discharge_over));
							tractiveSystemStatus = TS_STATUS_DEENERGIZED; // set status to deenergized
							char deenergized[]="deenergized";
							LOG_println(deenergized, strlen(deenergized));
						}
				} else if(tractiveSystemStatus==TS_STATUS_PANIC) {
						char discharge_panic[]="panic";
						LOG_println(discharge_panic, strlen(discharge_panic));
						AIRMINUS_PORT &= ~_BV(AIRMINUS_LSD); // open air minus and precharge
						RJ45_LED_PORT &= ~_BV(RJ45_LED2);
						PRECHARGE_PORT &= ~_BV(PRECHARGE_CTRL);
						RJ45_LED_PORT &= ~_BV(RJ45_LED1);
						msgCritical[MSG_INDEX_ERROR_CODE] = FAULT_CODE_GENERAL; // see that panic keeps being sent...
				}

			}

    }
}
