#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

// implausibility constants according to rule T.4.2
#define IMPLAUSIBILITY_TIME_LIMIT 100

#define TORQUE_REQUEST_SCALE 5

#define MOTOR_CLOCKWISE     (0)
#define MOTOR_ANTICLOCKWISE (1)

#define MIN_THROTTLE_POS 0
#define MAX_THROTTLE_POS 255

/*
Represents value for 25% pedal travel to check for brake implausibility
Set as 25% of 255
*/
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD (0.25 * MAX_THROTTLE_POS)

/*
Represents value for 5% pedal travel to check for brake implausibility
Set as 5% of 255
*/
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW (0.05 * MAX_THROTTLE_POS)

/*
Represents value for 10% deviation between throttle sensors
Set as 10% of 255
*/
#define APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD (0.1 * MAX_THROTTLE_POS)

/*
buffer here to make sure we don't request torque when small deviations
in potentiometer happen and we aren't pressing pedal
*/
#define THROTTLE_BUFFER (5)

/*
Minimum and maximum ADC counts representing 0% and 100% pedal travel
Last calibrated 11-30-2023 for MKVI
*/
#define THROTTLE_R_MIN_COUNTS (int16_t)((64 + THROTTLE_BUFFER) >> 2)
#define THROTTLE_R_MAX_COUNTS (int16_t)((833 - THROTTLE_BUFFER) >> 2)
#define THROTTLE_L_MIN_COUNTS (int16_t)((112 + THROTTLE_BUFFER) >> 2)
#define THROTTLE_L_MAX_COUNTS (int16_t)((877 - THROTTLE_BUFFER) >> 2)

// Pin definitions
gpio_t SS_IS = PB6;

typedef struct {
    // represents a throttle poteniometer
    adc_pin_e adc_pin;
    int16_t throttle_min; // Minimum position (0%) in raw ADC
    int16_t throttle_max; // Maximum position (100%) in raw ADC
} throttle_potentiometer_s;

const throttle_potentiometer_s throttle_l = {
    // left throttle pot
    .adc_pin = ADC5,
    .throttle_min = THROTTLE_L_MIN_COUNTS,
    .throttle_max = THROTTLE_L_MAX_COUNTS
};

const throttle_potentiometer_s throttle_r = {
    // right throttle pot
    .adc_pin = ADC6,
    .throttle_min = THROTTLE_R_MIN_COUNTS,
    .throttle_max = THROTTLE_R_MAX_COUNTS
};

/*
 * Timer config
 */

void timer0_isr(void);
/*
 * 10ms timer (100 Hz)
 *
 * F_CPU / prescalar / output_compare_match
 * 4000000 / 1024 / 39 = 100
 */
timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 0x27, // 100 Hz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};

void timer1_isr(void);
/*
 * 1ms timer (1kHz)
 *
 * F_CPU / prescalar / output_compare_match
 * 4000000 / 1 / 4000 = 1000
 */
timer_cfg_s timer1_cfg = {
    .timer = TIMER1,
    .timer1_mode = TIMER1_MODE_CTC,
    .prescalar = CLKIO_DIV_1,
    .channel_a = {
        .channel = CHANNEL_A,
        .output_compare_match = 4000, // 1 kHz
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer1_isr,
    },
};
