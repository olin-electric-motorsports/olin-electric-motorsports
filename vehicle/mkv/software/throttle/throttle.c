#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "throttle_config.h"
#include "libs/gpio/api.h"

#include <stdbool.h>
#include <stdint.h>

/*
 * Interrupts
 */
 volatile bool send_can = false;

 void timer0_isr(void) {
    send_can = true;
}

void pcint0_isr(void){
	/*
	   Check if shutdown Circuit nodes are open or closed. 
	 */
	// Check value of SS_IS, SS_ESTOP, and SS_BOTS pins

}

int main(void) {
	// TODO: initalize motor controller by sending CAN msg
    can_init(BAUD_500KBPS);
    adc_init();
    timer_init(&timer0_cfg);

    gpio_set_mode(DEBUG_LED1, OUTPUT);
    gpio_set_mode(DEBUG_LED2, OUTPUT);
    gpio_set_mode(DEBUG_LED3, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);
    

    gpio_set_mode(SS_ESTOP, INPUT);
    gpio_set_mode(SS_IS, INPUT);
    gpio_set_mode(SS_BOTS, INPUT);

    gpio_enable_interrupt(SS_ESTOP);
    gpio_enable_interrupt(SS_IS);
    gpio_enable_interrupt(SS_BOTS);

	// Initialize interrupts
	sei();

	// Wait for start up sequence
	// 	completed precharge, brakes engaged, start button pressed
	// TODO: call receive functions for the above

    while (1) {
		if (run_1ms) {
    	// Do 1 millisecond loop stuff

		/* TODO
		 *
		 * - Read ADCS
		 * 		- read the two throttle potentiometers
		 * - Map
		 *		- map the values from the pots to 0-255
		 *		- if the voltage is out of range, set to min or max
		 * - Plausibility
		 *		- compare mapping of the two voltages
		 *		- implausibility is if throttle position between sensors
		 *			deviates more than 10% (IC.4.4.2, IC 4.4.3)
		 *		- if implausibility persists more than 100 msec, cut power to throttle
		 * - Average
		 *		- average throttle pos values
		 *
		 * - check if brake is activated (don't send throttle if so)
		 * - check CAN panic message
		 */

    }

		if (send_can) {
			// send_can

			// Send out Motor Controller info
			// Send out throttle info
		}

	}
}