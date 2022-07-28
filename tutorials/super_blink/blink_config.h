#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"


gpio_t DEBUG_LED_1 = PD5;
gpio_t DEBUG_LED_2 = PD6;

// timer
void timer1_callback(void);

timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer0_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_64,
    .channel_a = {
        .output_compare_match = 2083,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer1_callback,
    },
};
