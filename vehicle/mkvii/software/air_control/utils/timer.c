#include "libs/timer/api.h"
#include <avr/interrupt.h>

volatile uint32_t time_ms;
volatile bool run_1ms;

/*
 * Used for motor controller and BMS voltage timeout in the state machine
 * Allows for "asynchronous" checking because the function can return if the
 * message isn't received, but can maintain the same start_time
 */
volatile uint32_t start_time;

void timer1_isr(void) {
    time_ms++;
    run_1ms = true;
}

uint32_t get_time(void) {
    cli();
    uint32_t t = time_ms;
    sei();
    return t;
}
