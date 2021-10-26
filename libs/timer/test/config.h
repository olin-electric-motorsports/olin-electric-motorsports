#include "libs/timer/api.h"

/*
 * clkio = 4000000
 * clk_prescaled = clkio / 1024 = 3906
 * timer = clk_prescaled / 0x27 = 100Hz
 */
timer_cfg_s timer0_pwm_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_FAST_PWM,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 64,
        .pin_behavior = CLEAR,
    },
    // .output_compare_match_value_channel_a = 64,
    // .pin_behavior_channel_a = CLEAR,
};
