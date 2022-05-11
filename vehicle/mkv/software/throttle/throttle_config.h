#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"

// Comes from T.4.2.5
#define IMPLAUSIBILITY_TIMEOUT_MS \
    (100) // 100 milliseconds
          //

#define MOTOR_CLOCKWISE (0)
#define MOTOR_ANTICLOCKWISE (1)

// Set this to lower than 10 to limit torque request (i.e. 5 limits to half of
// max torque)
#define TORQUE_REQUEST_SCALE (5)

// Represents value for 25% pedal travel to check for brake implausibility
// Set as 25% of 255
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD (63)

// Represents value for 5% pedal travel to check for brake implausibility
// Set as 5% of 255
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW (12)

// Represents value for 10% deviation between throttle sensors
// Set as 10% of 255
#define APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD (25)

/*
 * Pin definitions
 */
gpio_t BRAKE_IMPLAUSIBILTIY_LED = PC6;
gpio_t DEVIATION_IMPLAUSIBILITY_LED = PB3;
gpio_t OUT_OF_RANGE_IMPLAUSIBILITY_LED = PB4;

gpio_t RJ45_LED1 = PB0; // orange
gpio_t RJ45_LED2 = PB1; // green

gpio_t SS_ESTOP = PB5;
gpio_t SS_IS = PB6;
gpio_t SS_BOTS = PB7;

/*
 * Represents a throttle potentiometer, or APPS (Accelerator Pedal Position
 * Sensor)
 */
typedef struct {
    adc_pin_e adc_pin;
    int16_t throttle_min; // Minimum position (0%) in raw ADC
    int16_t throttle_max; // Maximum position (100%) in raw ADC
} throttle_potentiometer_s;

/*
 * Buffer is in place to make sure small deviations in the potentiometer reading
 * don't cause us to request torque when the pedal isn't pressed. This means we
 * will get more OUT_OF_RANGE implausibilities, but this won't cause the car to
 * shutdown, so it doesn't matter much.
 */
#define THROTTLE_BUFFER (5)

// Minimum and maximum ADC counts representing 0% and 100% pedal travel
// Last calibrated 4-21
#define THROTTLE_R_MIN_COUNTS (int16_t)((126 + THROTTLE_BUFFER) >> 2)
#define THROTTLE_R_MAX_COUNTS (int16_t)((690 - THROTTLE_BUFFER) >> 2)
#define THROTTLE_L_MIN_COUNTS (int16_t)((178 + THROTTLE_BUFFER) >> 2)
#define THROTTLE_L_MAX_COUNTS (int16_t)((1000 - THROTTLE_BUFFER) >> 2)

const throttle_potentiometer_s throttle_r = {
    .adc_pin = ADC9,
    .throttle_min = THROTTLE_R_MIN_COUNTS,
    .throttle_max = THROTTLE_R_MAX_COUNTS,
};

const throttle_potentiometer_s throttle_l = {
    .adc_pin = ADC8,
    .throttle_min = THROTTLE_L_MIN_COUNTS,
    .throttle_max = THROTTLE_L_MAX_COUNTS,
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
