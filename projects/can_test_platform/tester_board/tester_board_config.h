#include "libs/timer/api.h"
#include "avr/interrupt.h"
#include <avr/io.h>
#include "libs/gpio/pin_defs.h"
#include "libs/gpio/api.h"
#include "libs/can/api.h"

void timer0_isr(void);

gpio_t LED = PD5;

uint8_t can_data[] = {0xF};

can_frame_t test_msg = {
    .id=0xFF,
    .dlc=1,
    .mob=0,
    .data=can_data,
};

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 255,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};