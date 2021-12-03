#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"



//Pin definitions
gpio_t IMD_LED = PB3
gpio_t START_LED = PB4
gpio_t AMS_LED = PD0
gpio_t START_BTN = PC6
gpio_t HV_LED = PD7
gpio_t LV_LED = PD6
gpio_t BRAKE_LED = PB2
gpio_t STEERING_POS = PD5

//ADC PIN
adc_pin_e STEERING_POS = ADC2

//Timer setup

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 0x27,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};


//CAN things

//Define MOBs and DLCs
#define BRAKELIGHT_MBOX 0
#define BMS_CORE_MBOX 1
#define AIRCTRL_CRITICAL_MBOX 2
#define AIRCTRL_SENSE_MBOX 3
#define THROTTLE_MBOX 4

#define BRAKELIGHT_DLC (5)
#define BMS_CORE_DLC (8)
#define AIRCTRL_CRITICAL_DLC (5)
#define AIRCTRL_SENSE_DLC (8)
#define THROTTLE_DLC (5)

//Define frames
can_frame_t BRAKELIGHT_CAN_FRAME = {
    .mob = BRAKELIGHT_MBOX,
    .id = 0xB,
    .dlc = BRAKELIGHT_DLC,
}

can_frame_t BMS_CORE_FRAME = {
    .mob = BMS_CORE_MBOX,
    .id = 0x10,
    .dlc = BMS_CORE_DLC,
}

can_frame_t AIRCTRL_CRITICAL_FRAME = {
    .mob = AIRCTRL_CRITICAL_MBOX,
    .id = 0xD,
    .dlc = AIRCTRL_CRITICAL_DLC,
}

can_frame_t AIRCTRL_SENSE_FRAME = {
    .mob = AIRCTRL_SENSE_MBOX,
    .id = 0xE,
    .dlc = AIRCTRL_SENSE_DLC,
}

can_frame_t THROTTLE_FRAME = {
    .mob = THROTTLE_MBOX,
    .id = 0xC,
    .dlc = THROTTLE_DLC,
}

//Define Filters
can_filter_t BRAKELIGHT_FILTER = {
    .mask = 0x7FF,
    .id = 0xB,
}

can_filter_t BMS_CORE_FILTER = {
    .mask = 0x7FF,
    .id = 0x10,
}

can_filter_t AIRCTRL_CRITICAL_FILTER = {
    .mask = 0x7FF,
    .id = 0xD,
}

can_filter_t AIRCTRL_SENSE_FILTER = {
    .mask = 0x7FF,
    .id = 0xE,
}

can_filter_t THROTTLE_FILTER = {
    .mask = 0x7FF,
    .id = 0xC,
}

//Define message to send
#define DASHBOARD_DLC (5)
uint8_t can_data = { 0 };

can_frame_t dashboard_msg = {
    .id = 0xF,
    .dlc = DASHBOARD_DLC,
    .mob = 5
}

