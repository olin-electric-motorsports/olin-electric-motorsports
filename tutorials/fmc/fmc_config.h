#include "libs/adc/api.h"
#include "libs/timer/api.h"

#define MAX_TORQUE_REQUEST 255.0
#define OVERTEMPERATURE_THRESHOLD 512

adc_pin_e TEMPERATURE_SENSOR = ADC4;

void timer0_callback(void);

// 50hz timer for running main loop
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 0x4D,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};

// PWM timer at 25kHZ for running motor
timer_cfg_s timer1_pwm_cfg  = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_PHASE_CORRECT_PWM_OCRA,
    .prescalar = CLKIO_DIV_1,
    .channel_a = {
        .output_compare_match = 0x50,
    },
    .channel_b = {
        .channel = CHANNEL_B,
        .pin_behavior = SET,
        .interrupt_enable = false,
    },
};
