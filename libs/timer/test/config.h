#include "libs/can/api.h"
#include "libs/timer/api.h"

#include <stdint.h>

void timer0_callback(void);

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
};

timer_cfg_s timer0_ctc_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_8,
    .channel_a = {
        .output_compare_match = 249,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};

/*
 * CAN message
 */
uint8_t can_data[] = { 0xF };

can_frame_t msg = {
    .id = 0x010,
    .dlc = 1,
    .mob = 0,
    .data = can_data,
};
