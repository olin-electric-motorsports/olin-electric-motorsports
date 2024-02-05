/*
Header:
    Code for the Sensing Controller Board located in the nostril motherboard and
the rear sensing box Author:
    @author Richard Li
    @date   03/25/2023
*/

/*----- Includes -----*/
#include "vehicle/mkvi/software/sensing/can_api.h"
#include "sensing_config.h"
#include "libs/timer/api.h"
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <util/delay.h>

volatile bool send_can = false;

void timer1_isr(void) {
    send_can = true;
};


void pcint0_callback() {
    // Left wheel speed sensor is in pin PB2 -> PORTB
    front_sensing.wsl = !gpio_get_pin(WHEEL_SPEED_LEFT);
    if (front_sensing.wsl) {
        front_sensing.left_wheel_counter += 1;
    }
}
void pcint2_callback() {
    // Right wheel speed sensor is in pin PD6 -> PORTD
    front_sensing.wsr = !gpio_get_pin(WHEEL_SPEED_RIGHT);
    if (front_sensing.wsr) {
        front_sensing.right_wheel_counter += 1;
    }
}

int main(void) {
    can_init_sensing();
    gpio_set_mode(DEBUG_LED, OUTPUT);
    gpio_set_mode(WHEEL_SPEED_LEFT, INPUT);
    gpio_set_mode(WHEEL_SPEED_RIGHT, INPUT);

    sei(); // Initializes interrupts
    gpio_enable_interrupt(WHEEL_SPEED_LEFT);
    gpio_enable_interrupt(WHEEL_SPEED_RIGHT);

    timer_init(&timer1_cfg);

    // Interrupts for both wheel speed sensors to increment counter
    pcint0_callback();
    pcint2_callback();

    // Timer every 1 second
    timer1_isr();

    while (true) {
        // If timer is at 1 second
        if (send_can) {
            // Log how many times we saw metal
            can_send_front_sensing();

            // Reset all counters
            front_sensing.left_wheel_counter = 0;
            front_sensing.right_wheel_counter = 0;
            send_can = false;
        }
    }
}
