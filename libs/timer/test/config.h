#include "libs/timer/api.h"

/*
 * clkio = 4000000
 * clk_prescaled = clkio / 1024 = 3906
 * timer = clk_prescaled / 0x27 = 100Hz
 */
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .output_compare_match_value_channel_a = 0x27,
    .prescalar = CLKIO_DIV_1024,
    .pin_behavior_channel_a = DISCONNECTED,
    .timer_overflow_interrupt_enable = true,
};
