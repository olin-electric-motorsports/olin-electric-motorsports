#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

gpio_t LED_5Hz = PB3;
gpio_t LED_30Hz = PB4;

void timer_callback_30Hz(void);

timer_cfg_s timer_cfg_30Hz = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_64,
    .channel_a = {
        .output_compare_match = 2083,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer_callback_30Hz,
    },
};
