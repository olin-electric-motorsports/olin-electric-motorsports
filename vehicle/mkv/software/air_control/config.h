#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"

/*
 * GPIO pin definitions
 */
// Outputs
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
gpio_t AIR_N_WELD_DETECT = PC5;

gpio_t IMD_SENSE = PD0;

/*
 * CAN
 */
#define MOB_CRIT (0) // Sending critical message
#define MOB_MOTOR_CONTROLLER (1) // Receive motor controller voltage
#define MOB_BMS (2) // Receive BMS data
#define MOB_SENSE (3) // Send sense data

#define AIR_FAULT_CODE (0)
#define AIR_STATE (1)
#define AIR_STATUS (2)

#define AIR_P_STATUS (0)
#define AIR_N_STATUS (1)
#define TSMS_SENSE (2)
#define IMD_STATUS (3)
#define MAIN_PACK_CONNECTOR_SENSE (4)
#define HVD_CONNECTOR_SENSE (5)
#define HVD_SENSE (6)
#define BMS_STATUS (7)

uint8_t air_ctrl_critical_data[5] = { 0 };
can_frame_t air_ctrl_critical_msg = {
    .mob = MOB_CRIT,
    .data = air_ctrl_critical_data,
};

can_filter_t motor_controller_filter = {
    .id = 0xA7, // Motor controller voltage
    .mask = 0x7FF, // Exact match
};

uint8_t motor_controller_data[8] = {0};
can_frame_t motor_controller_msg = {
    .mob = MOB_MOTOR_CONTROLLER,
    .data = motor_controller_data,
};

can_filter_t bms_filter = {
    .id = 0x00,
    .mask = 0x7FF,
};

uint8_t bms_data[8] = {0};
can_frame_t bms_msg = {
    .mob = MOB_BMS,
    .data = bms_data,
};

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
