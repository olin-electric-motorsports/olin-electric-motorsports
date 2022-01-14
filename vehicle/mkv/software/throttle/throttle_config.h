#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

/*
 * Pin definitions
 */

gpio_t DEBUG_LED1 = PC6;
gpio_t DEBUG_LED2 = PB3;
gpio_t DEBUG_LED3 = PB4;

gpio_t LED1 = PB0; //orange
gpio_t LED2 = PB1; //green

gpio_t SS_ESTOP = PB5;
gpio_t SS_IS = PB6;
gpio_t SS_BOTS = PB7;


/*
 * ADC pins
 */
adc_pin_e THROTTLE1_SENSE = ADC8;
adc_pin_e THROTTLE2_SENSE = ADC9;
adc_pin_e DRIVE_MODE_SENSE = ADC2;


/*
 * Timer config
 */

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

/*
 * CAN messages
 */
#define CAN_MSG_DLC (5)
uint8_t can_data_throttle[CAN_MSG_DLC] = { 0 };

can_frame_t throttle_msg = {
    .id = 0xC,
    .dlc = CAN_MSG_DLC,
    .mob = 0,
};

can_frame_t mc_msg = {
    .id = 0xC0,
    .dlc = CAN_MSG_DLC,
    .mob = 0,
};