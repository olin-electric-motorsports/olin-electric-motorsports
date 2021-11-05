#include "libs/gpio/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"

/*
 * GPIO pin definitions
 */
gpio_t SS_PRECHARGECTL = PB2;
gpio_t SS_TSMS = PB3;
gpio_t BMS_SENSE = PC0;
gpio_t AIR_P_WELD_DETECT = PC4;
gpio_t AIR_N_WELD_DETECT = PC5;
gpio_t AIR_P_LSD = PC6;

/*
 * CAN
 */
#define MOB_CRIT (0) // Sending critical message
#define MOB_MOTOR_CONTROLLER (1) // Receive motor controller voltage
#define MOB_BMS (2) // Receive BMS data
#define MOB_SENSE (3) // Send sense data

uint8_t air_ctrl_critical_data[5];
can_frame_t air_ctrl_critical_msg = {
    .mob = MOB_CRIT,
};

uint8_t air_ctrl_sense_data[8];
can_frame_t air_ctrl_sense_msg = {
    .mob = MOB_SENSE,
};

can_filter_t motor_controller_filter = {
    // TODO correct values
    .id = 0x00,
    .mask = 0x7FF,
};

uint8_t motor_controller_data[8];
can_frame_t motor_controller_msg = {
    .mob = MOB_MOTOR_CONTROLLER,
};

can_filter_t bms_filter = {
    // TODO correct values
    .id = 0x00,
    .mask = 0x7FF,
};

uint8_t bms_data[8];
can_frame_t bms_msg = {
    .mob = MOB_BMS,
};

/*
 * Timer
 */
void timer0_irq(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 244, // 16 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_irq,
    },
};
