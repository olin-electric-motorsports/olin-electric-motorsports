#include "libs/adc/api.h"
#include "libs/timer/api.h"

adc_pin_e adc_pin = ADC0;

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_64,
    .channel_a = { .output_compare_match = 1249,
                   .pin_behavior = DISCONNECTED,
                   .interrupt_enable = true,
                   .interrupt_callback = timer0_callback },
};

timer_cfg_s timer1_fan_cfg
    = { .timer = TIMER1,
        .timer1_mode = TIMER1_MODE_PHASE_CORRECT_PWM_10_BIT,
        .prescalar = CLKIO_DIV_8,
        .channel_a = { .output_compare_match = 80 },
        .channel_b = {
            .channel = CHANNEL_B,
            .pin_behavior = SET,
            .interrupt_enable = false,
        } };