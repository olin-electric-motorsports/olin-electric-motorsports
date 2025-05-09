#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

/*
 * GPIO pin definitions
 */

// organized by schematic sections
gpio_t PRECHARGE_CTL = PB2;
gpio_t SS_TSMS = PB3;
gpio_t SS_IMD_LATCH = PB4;
gpio_t SS_MPC = PB5;
gpio_t SS_TSMP = PB6;
gpio_t SS_EMETER = PB7;

gpio_t AIR_N_WELD_DETECT = PC4;
gpio_t AIR_P_WELD_DETECT = PC5;
gpio_t AIR_P_LSD = PC6; // flipped from schematic
gpio_t SS_BMS = PC7;

gpio_t SS_HVD = PD0;
gpio_t IMD_SENSE = PD1;
gpio_t ERROR_LED = PD5;
gpio_t HEARTBEAT_LED = PD6;
gpio_t INIT_LED = PD7;

// This is the raw value we compare. This is the real voltage divided by 256 and
// multiplied by 10000.
#define BMS_VOLTAGE_THRESHOLD_LOW (200) //(200V)
#define TRACTIVE_THRESHOLD_LOW_dV (5) // 5000 mV (5 volts)
#define PRECHARGE_THRESHOLD       (0.95) // 95% of pack voltage

// Time delay during discharge before checking state of AIRs
#define WELD_CHECK_DELAY_MS (100) // milliseconds

// Milliseconds to wait while the IMD output stabilizes before reading the
// output
#define IMD_STABILITY_CHECK_DELAY_MS (4000)

#define PRECHARGE_DELAY_MS (5000) // TS voltage reaches in 5s
#define DISCHARGE_TIMEOUT  (10000)

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
