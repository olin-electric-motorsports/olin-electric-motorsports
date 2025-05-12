// TODO: Add Debug LED Functionality - Henry Tejada Deras 05-12-2025
#include "wheel_speed.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/sensing/wheel_speed/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

// INITIALIZATION/VARIABLE/FUNCTION DECLARATIONS
// Variable Declarations
int left_wheel_clicks_counter = 0;
int right_wheel_clicks_counter = 0;

/*
 * Initialize Atmega 16M1 Hardware Peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(DEBUG_LED, OUTPUT); // Debug LED
    gpio_set_mode(HEARTBEAT, OUTPUT); // Heartbeat LED
    can_init_wheel_speed(); // CAN
    sei(); // Interrupts
    timer0_callback(); // Timer
    adc_init(); // ADC
    can_send_wheel_speed(); // Send initial CAN message

    gpio_enable_interrupt(WHEEL_SPEED_SENSE_LEFT);
    gpio_enable_interrupt(WHEEL_SPEED_SENSE_RIGHT);
}

// CAN Interrupt + Callback Function
volatile bool send_can = false;
void timer0_callback(void) {
    send_can = true;
}

// Update Debug LED
void update_leds(void) {
    // Update Heartbeat LED State
    gpio_toggle_pin(HEARTBEAT);

    // Update Debug LED State
    // TODO
}

// Clicks Counters
void pcint0_callback(void) {
    left_wheel_clicks_counter += 1; // Add 1 to Counter
}

void pcint1_callback(void) {
    right_wheel_clicks_counter += 1; // Add 1 to Counter
}

// Wheel Speed Calculations
void calc_wheel_speed(void) {
    // Calculate Wheel Speed
    wheel_speed.wheel_speed_l = (left_wheel_clicks_counter / CLICKS_PER_REV) * TIMER_TIME_ELAPSED;
    wheel_speed.wheel_speed_r = (right_wheel_clicks_counter / CLICKS_PER_REV) * TIMER_TIME_ELAPSED;

    // Reset Counters
    left_wheel_clicks_counter = 0;
    right_wheel_clicks_counter = 0;
}

// WHEEL SPEED LOOP
int main(void) {
    init_peripherals();
    sei();

    // Get Initial Digital Inputs
    pcint0_callback();
    pcint1_callback();

    // Initial Predefined Heartbeat CAN Signal
    wheel_speed.heartbeat = false;

    for (;;) {
        // Triggers Send Can Function 2 times per second
        if (send_can) {
            calc_wheel_speed();
            can_send_wheel_speed();
            send_can = false;
        }
    }
}