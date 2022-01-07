#include <avr/interrupt.h>
#include "libs/timer/api.h"

volatile uint32_t time;
volatile bool run_1ms;

void timer1_isr(void) {
    time++;
    run_1ms = true;
}

uint32_t get_time(void) {
    cli();
    uint32_t t = time;
    sei();
    return t;
}
