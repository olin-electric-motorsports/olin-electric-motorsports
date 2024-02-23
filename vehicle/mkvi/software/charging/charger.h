#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

void timer0_isr(void);

gpio_t LED1 = PC1;
gpio_t LED2 = PC2;
#define can_init_charger (250000)
#define can_init_vehicle (500000)

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 156, // 16 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
    .timer_overflow_interrupt_enable = false,
};