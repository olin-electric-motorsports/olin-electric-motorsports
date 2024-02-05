#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

/* ATMega 16m1 Pins */
gpio_t DEBUG_LED = PB0;
gpio_t WHEEL_SPEED_LEFT = PB2;
gpio_t WHEEL_SPEED_RIGHT = PD6;

/*
 * Timer config
 */
void timer1_isr(void);

/*
 * 1s timer (1kHz)
 *
 * F_CPU / prescaler / output_compare_match
 * 4000000 / 256 / 15625 = 1
 *
 * Generates an interrupt every second
 */
timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 4000, // 1 kHz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer1_isr,
    },
};
