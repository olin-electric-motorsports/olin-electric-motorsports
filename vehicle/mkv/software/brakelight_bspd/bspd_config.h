#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

/*
 * Pin definitions
 */
gpio_t BSPD_RELAY_INTENTION = PD5;
gpio_t SHUTDOWN_SENSE_BSPD = PC7;
gpio_t BSPD_CURRENT_SENSE = PC4;
gpio_t BRAKELIGHT_GATE = PC5;
gpio_t DEBUG_LED_1 = PB5;
gpio_t DEBUG_LED_2 = PB6;
gpio_t DEBUG_LED_3 = PB7;
gpio_t RJ45_LED_G = PB0;
gpio_t RJ45_LED_O = PB1;

/*
 * ADC pins
 */
adc_pin_e BRAKE_PRESSURE_SENSE = ADC10;

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
uint8_t can_data_bspd[CAN_MSG_DLC] = { 0 };

can_frame_t bspd_msg = {
    .id = 0xB,
    .dlc = CAN_MSG_DLC,
    .mob = 0,
};
