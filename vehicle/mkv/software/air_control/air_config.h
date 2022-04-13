#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

/*
 * GPIO pin definitions
 */

gpio_t PRECHARGE_CTL = PB2;
gpio_t AIR_N_LSD = PC6;

// Inputs
gpio_t SS_TSMS = PB3;
gpio_t SS_IMD_LATCH = PB4;
gpio_t SS_MPC = PB5;
gpio_t SS_HVD_CONN = PB6;
gpio_t SS_HVD = PB7;

gpio_t BMS_SENSE = PC0;
gpio_t AIR_P_WELD_DETECT = PC4;

gpio_t IMD_SENSE = PD0;

#ifdef BOARD_HACKERBOARD

gpio_t FAULT_LED = PD6;
gpio_t GENERAL_LED = PD7;
gpio_t AIR_N_WELD_DETECT = PC5;

#else

gpio_t FAULT_LED = PB7;
gpio_t GENERAL_LED = PD6;
gpio_t AIR_N_WELD_DETECT = PC7;

#endif

// BMS voltage is reported as 100uV * 16 * voltage. We do the (<< 4) elsewhere
// to get rid of the factor of 16, so this value is in 100s of uV
#define BMS_VOLTAGE_THRESHOLD_LOW     (20000)
#define MOTOR_CONTROLLER_THRESHOLD_LOW_dV (50) // 50 decivolts (5 volts)
#define PRECHARGE_THRESHOLD               (0.95) // 95% of pack voltage

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
