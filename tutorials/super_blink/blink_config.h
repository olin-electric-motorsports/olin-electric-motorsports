#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

void timer0_callback(void);

gpio_t LED1 = PB0;
gpio_t LED2 = PB1;

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_64,
    .channel_a = {
        .output_compare_match = 0x822,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};

// Define CAN message
uint8_t OEM_TEXT[3] = { 79, 69, 77 };

can_frame_t super_blink_msg = {
    .id = 0x01,
    .mob = 0,
    .dlc = 3,
    .data = OEM_TEXT,
};
