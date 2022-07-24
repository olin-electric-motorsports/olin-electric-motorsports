#include "libs/timer/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
// #include "libs/can/api.h"

/*
 * LED_1 should blink at 30 hz
 */
gpio_t LED_1 = PB0;

/*
 * LED_2 should blink at 5 hz
 */
gpio_t LED_2 = PB1;

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 64,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};

uint8_t can_data[] = { 0xF };

can_frame_t can_msg = {
    .id = 0,
    .dlc = 1,
    .mob = 0,
    .data = can_data,
};