#include "libs/timer/api.h"
#include <avr/interrupt.h>

volatile uint32_t time;
volatile bool run_1ms;
volatile uint32_t start_time;

void timer1_isr(void);

timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 4000,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer1_isr,
    },
};

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