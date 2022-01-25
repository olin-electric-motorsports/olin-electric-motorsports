#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "libs/gpio/api.h"
#include "throttle_config.h"

#include <stdbool.h>
#include <stdint.h>

// Define throttle values to use when mapping
// Values are capped at this range
// Recheck/set these values
#define throttle1_min_voltage (218)
#define throttle1_max_voltage (654)
#define throttle2_min_voltage (298)
#define throttle2_max_voltage (1016)


/*
 * Interrupts
 */
volatile bool send_can = false;

void timer0_isr(void) {
    send_can = true;
}

void pcint0_isr(void) {
    /*
       Check if shutdown Circuit nodes are open or closed.
     */
    // Check value of SS_IS, SS_ESTOP, and SS_BOTS pins
}

int main(void) {
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

    // Initialize motor controller
    can_motor_controller[4] = 1; // anticlockwise


    mc_msg.data = can_motor_controller;

    can_send(&mc_msg)

        can_receive(&rx_dashboard_msg, rx_dashboard_filter);

    while (1) {
        if (run_1ms) {
            // Do 1 millisecond loop stuff

            // read both throttle potentiometers
            uint16_t throttle1_voltage = 0;
            uint16_t throttle2_voltage = 0;
            uint16_t throttle1_mapped;
            uint16_t throttle2__mapped;

            throttle1_voltage = adc_read(THROTTLE1_SENSE);
            throttle2_voltage = adc_read(THROTTLE2_SENSE);

            // map the values from the pots to 0-255 (8 bits)
            throttle1_mapped = ((throttle1_voltage - throttle1_min_voltage) * 255) / (throttle1_max_voltage - throttle1_min_voltage;
			throttle2_mapped = ((throttle2_voltage - throttle2_min_voltage) * 255) / (throttle2_max_voltage - throttle2_min_voltage;

			// TODO: - if the voltage is out of range, 
		    // 	"we might want to throw a fault. Or maybe if it's out of range for too long"
			//   or just set the values to the min and max values depending on if its below or above the range

			// Get average throttle pos values

			// get average of two throttle positions

			uint8_t throttle_array_index = 0;
			uint8_t throttle_array[8];
			uint16_t rolling_sum = 0;

			uint16_t new_throttle_value = (throttle1_mapped + throttle2_mapped) >> 1;
			uint8_t old_throttle_value = throttle_array[throttle_array_index];

			rolling_sum -= old; 
			rolling_sum += new;

			throttle_array[throttle_array_index] = new;

			throttle_array_index = throttle_array_index + 1;

			// Start back at the first index if at the last index
			if (throttle_array_index == 8) {
                throttle_array_index = 0;

                // Take the rolling average of the past 8 throttle values
                uint32_t temp = rolling_sum;
                temp /= 8;
                uint8_t throttle_out = temp;

                /* TODO
                 * - Plausibility
                 *		- compare mapping of the two voltages
                 *		- implausibility is if throttle position between sensors
                 *			deviates more than 10% (T.4.2.4, T.4.2.5)
                 *		- if implausibility persists more than 100 msec, cut power
                 *to throttle
                 * - check if brake is activated (don't send throttle if so)
                 */

    }

		if (send_can) {
            can_send(&throttle_msg);
            can_send(&mc_msg);
		}
        }
    }