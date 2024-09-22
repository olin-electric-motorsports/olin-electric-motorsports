#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"


gpio_t LED_PIN = PD7; 

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMERO,
    .timer0_mode = TIMERO_MODE_CTC,
    .prescaler = CLKIO_DIV_1024
    .channel_a = {
        .output_compare_match = 200,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback
    }
};