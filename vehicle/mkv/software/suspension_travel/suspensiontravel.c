/*

    Suspension Travel Control Board

*/


#include <avr/io.h>
#include "can_api.h"

// Assign names to the three on-board LEDs
#define LED1 PB5
#define LED2 PB6
#define LED3 PB7

/*----- gFlag -----*/
#define UPDATE_STATUS  	0

/*--- CAN Message ---*/
#define MSG_INDEX_ERROR_CODE      	0
#define MSG_INDEX_POTSENSE_HIGHBYTE	1
#define MSG_INDEX_POTSENSE_LOWBYTE  2

// Linear potentiometer linked to suspension travel distance
// More information at the confluence page below
// Including a calibration curve and potentiometer specs
// https://docs.olinelectricmotorsports.com/display/MD/Suspension+Travel
#define POTENTIOMETER_INPUT 8

#define FRONT 0
#define RIGHT 1

#if (FRONT && RIGHT)
    // Specific IDs for CAN messages
    #define CAN_ID CAN_ID_SUS_TRAVEL_FR
    #define CAN_LEN CAN_LEN_SUS_TRAVEL_FR
#elif (FRONT)
    // Specific IDs for CAN messages
    #define CAN_ID CAN_ID_SUS_TRAVEL_FL
    #define CAN_LEN CAN_LEN_SUS_TRAVEL_FL
#elif (RIGHT)
    // Specific IDs for CAN messages
    #define CAN_ID CAN_ID_SUS_TRAVEL_BR
    #define CAN_LEN CAN_LEN_SUS_TRAVEL_BR
#else
    // Specific IDs for CAN messages
    #define CAN_ID CAN_ID_SUS_TRAVEL_BL
    #define CAN_LEN CAN_LEN_SUS_TRAVEL_BL
#endif


uint8_t msg[] = {0,0,0};
volatile uint8_t gFlag = 0;


void ADC_init(void) {
    /* Get the Analog to Digital Converter started (ADC)
     * Set ADC Enable, and set AD Prescaler to 0x101
     * Divides clock frequency by 32 for AD clock */
    ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS0);

    //Enable interal reference voltage
    ADCSRB &= _BV(AREFEN);

    //Set internal reference voltage as AVcc
    ADMUX |= _BV(REFS0);
}

void initTimer0(void) {
    /* 
     * Set up a timer that times out at
     * a rate of 60 Hz
     */
    TCCR0A = _BV(WGM01);    // Set up 8-bit timer in CTC mode
    TCCR0B |= _BV(CS00) | _BV(CS02);          // clkio/1024 prescaler
    TIMSK0 |= _BV(OCIE0A);  // Every 1024 cycles
    OCR0A = 65;  // until 65, 65, which then calls for
                            // the TIMER0_COMPA_vect interrupt
			    // currently running at 60Hz
    // ATMEGA runs at 4MHz, the timer count is prescaled by a factor
    // of 1024, and then the output compare match interrupt is called
    // every 65 counts to reach 60Hz
    // 4M / 1024 / 65 = 60Hz
}

ISR(TIMER0_COMPA_vect) {

		gFlag |= _BV(UPDATE_STATUS);
		// LEDtimer++;
		// if(LEDtimer > 100){
		// 	LEDtimer = 0;
		// 	LED_PORT ^= _BV(LED2);
		// }
}

uint16_t readPotentiometer (void) {

		ADMUX = _BV(REFS0);
		ADMUX |= POTENTIOMETER_INPUT; // Potentiomenter pin is ADC8
		ADCSRA |= _BV(ADSC);
		loop_until_bit_is_clear(ADCSRA, ADSC);
		uint16_t val = ADC;

		// Uncomment when we need it. -Corey
		// Don't forget to uncomment the .h file at the top
		//LOG_init();
		//char uart_buf[64];
  	// sprintf(uart_buf, "Cooling Pressure: %d", val);
  	// LOG_println(uart_buf, strlen(uart_buf));

    return val;
}

void sendCANMessage (uint8_t msg[]) {

  CAN_transmit(0, CAN_ID, CAN_LEN, msg);
}

int main (void) {
    sei();
    ADC_init();
    CAN_init(CAN_ENABLED);
    initTimer0();

    DDRB |= _BV(LED1) | _BV(LED2) | _BV(LED3);
    
    uint16_t potVolt = 0;

    while(1) {
        if(bit_is_set(gFlag, UPDATE_STATUS)) {
            gFlag &= ~_BV(UPDATE_STATUS); // unset UPDATE_STATUS
            // PORTB ^= _BV(LED1);
            potVolt = readPotentiometer();

            msg[MSG_INDEX_ERROR_CODE] = 0;
            msg[MSG_INDEX_POTSENSE_HIGHBYTE] = (potVolt >> 8);
            msg[MSG_INDEX_POTSENSE_LOWBYTE] = (potVolt & 0xff);

            sendCANMessage(msg);

            if(potVolt > 615) {
                PORTB |= _BV(LED2);
            } else {
                PORTB &= ~_BV(LED2);
            }
        }
    }


}
