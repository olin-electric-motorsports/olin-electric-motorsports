/*
Header:
    Code for the Sensing Controller Board located in the nostril motherboard and
the rear sensing box Author:
    @author Richard Li
    @date   03/25/2023
*/

/*----- Includes -----*/
#include "can_api.h"
#include "sensing_config.h"
#include "utils/timer.h"
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <util/delay.h>

void timer1_isr(void) {
    send_can = true;
};

enum sensing_location {
    FRONT = 0,
    REAR = 1
} location __attribute__((section(".eeprom")))
= SENSING_LOCATION;

can_frame_t sensing_msg = {
    .mob = 0,
    .dlc = 2,
};

int pcint0_callback() {
    // Left wheel speed sensor is in pin PB2 -> PORTB
    sensing.wsl = !gpio_get_pin(WHEEL_SPEED_LEFT);
    if (sensing.wsl) {
        sensing.left_wheel_counter += 1;
    }
}
void pcint2_callback() {
    // Right wheel speed sensor is in pin PD6 -> PORTD
    sensing.wsr = !gpio_get_pin(WHEEL_SPEED_RIGHT);
    if (sensing.wsr) {
        sensing.right_wheel_counter += 1;
    }
}

int main(void) {
    eeprom_busy_wait();
    enum sensing_location location = eeprom_read_dword(&location);
    _delay_ms(2);

    // can_init_sensing(); NEED TO FIND REPLACEMENT
    gpio_set_mode(DEBUG_LED_0, OUTPUT);
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
    switch (location) {
        case FRONT: {
            sensing_msg.id = 0x403;
        } break;
        case REAR: {
            sensing_msg.id = 0x404;
        } break;
    }

    while (true) {
        // If timer is at 1 second
        if (send_can) {
            // Log how many times we saw metal
            // can_send_sensing(); NEED TO WRITE WITH LIBRARY

            // Reset all counters
            sensing.left_wheel_counter = 0;
            sensing.right_wheel_counter = 0;
            send_can = false;
        }
    }
}
