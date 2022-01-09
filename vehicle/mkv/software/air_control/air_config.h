#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

/*
 * GPIO pin definitions
 */
// Outputs
gpio_t PRECHARGE_CTL = PB2;
gpio_t AIR_N_LSD = PC6;

gpio_t FAULT_LED = PD6;
gpio_t GENERAL_LED = PD7;

// Inputs
gpio_t SS_TSMS = PB3;
gpio_t SS_IMD_LATCH = PB4;
gpio_t SS_MPC = PB5;
gpio_t SS_HVD_CONN = PB6;
gpio_t SS_HVD = PB7;

gpio_t BMS_SENSE = PC0;
gpio_t AIR_P_WELD_DETECT = PC4;
gpio_t AIR_N_WELD_DETECT = PC5;

gpio_t IMD_SENSE = PD0;

#define BMS_VOLTAGE_THRESHOLD_LOW      (200) // 200 V
#define MOTOR_CONTROLLER_THRESHOLD_LOW (5) // 5 V
#define PRECHARGE_THRESHOLD            (0.95) // 95% of pack voltage

/*
 * Timer
 */
void timer0_isr(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 244, // 16 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};

void timer1_isr(void);

timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 4000,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer1_isr,
    },
};
