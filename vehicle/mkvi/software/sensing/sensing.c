/*
Header:
    Code for the Sensing Controller Board located in the nostril motherboard and
the rear sensing box Author:
    @author Richard Li
    @date   03/25/2023
*/

/*----- Includes -----*/
#include "sensing.h"
#include "can_api.h"
#include "log_uart.h"
#include "utils/timer.h"
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <util/delay.h>

volatile uint8_t gTimerFlag = 0x01;
uint8_t gStatusMessage[8] = {};
volatile uint8_t can_recv_msg[8] = {};

void timer1_isr(void) {
    send_can = true;
};

int pcint0_callback(int counter_left) {
    // Left wheel speed sensor is in pin PB2 -> PORTB
    sensing.wsl = !gpio_get_pin(WHEEL_SPEED_LEFT);
    if (sensing.wsl) {
        counter_left += 1;
    }
}
void pcint2_callback(int counter_right) {
    // Right wheel speed sensor is in pin PB2 -> PORTB
    sensing.wsr = !gpio_get_pin(WHEEL_SPEED_RIGHT);
    if (sensing.wsl) {
        counter_right += 1;
    }
}

int main(void) {
    can_init_sensing();
    adc_init();
    CAN_init(CAN_ENABLED);
    gpio_set_mode(DEBUG_LED_0, OUTPUT);
    gpio_set_mode(WHEEL_SPEED_LEFT, INPUT);
    gpio_set_mode(WHEEL_SPEED_RIGHT, INPUT);

    sei(); // Initializes interrupts
    gpio_enable_interrupt(WS1);
    gpio_enable_interrupt(WS2);

    timer_init(&timer1_cfg);

    pcint0_callback();
    pcint2_callback();
    timer1_isr();
    while (true) {
        // Check if the timer is at 1 second (arbitrary)
        // If timer is at 1 second
        if (send_can) {
            // Log how many times we saw metal
            sensing.left_wheel_counter = counter_left;
            sensing.right_wheel_counter = counter_right;
            can_send_sensing();
            counter_left = 0;
            counter_right = 0;
            send_can = false;
        }
    }
}
