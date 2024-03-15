#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "libs/spi/api.h"

void timer0_isr(void);

gpio_t LED1 = PC1;
gpio_t LED2 = PC2;
#define can_init_charger (250000)
#define can_init_vehicle (500000)

gpio_t MCP25625_CS = PC4;

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 78, // 100 Hz; every 10 milliseconds
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
    .timer_overflow_interrupt_enable = false,
};

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_4,
    .cs_pin = &MCP25625_CS,
};