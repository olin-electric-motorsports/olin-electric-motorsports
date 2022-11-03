#include "libs/timer/api.h"

void timer0_isr(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x9b,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};