#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/can/api.h"

gpio_t LED0 = PB0;
gpio_t LED1 = PB1;

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 129,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};