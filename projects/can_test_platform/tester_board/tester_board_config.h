#include "libs/timer/api.h"
#include "avr/interrupt.h"
#include <avr/io.h>
#include "libs/gpio/pin_defs.h"
#include "libs/gpio/api.h"

void timer0_isr(void);

gpio_t LED = PD5;

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 132,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};