#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"


/*
 * Pin definitions
 */
gpio_t BRAKE_IMPLAUSIBILTIY_LED = PC6;
gpio_t DEVIATION_IMPLAUSIBILITY_LED = PB3;
gpio_t OUT_OF_RANGE_IMPLAUSIBILITY_LED = PB4;

gpio_t RJ45_LED1 = PD6; // orange
gpio_t RJ45_LED2 = PD5; // green

gpio_t SS_ESTOP = PB5;
gpio_t SS_IS = PB6;
gpio_t SS_BOTS = PB7;

/*
 * Represents a throttle potentiometer, or APPS (Accelerator Pedal Position
 * Sensor)
 */
typedef struct {
    adc_pin_e adc_pin;
    uint16_t throttle_min; // Minimum position (0%) in raw ADC
    uint16_t throttle_max; // Maximum position (100%) in raw ADC
} throttle_potentiometer_s;

// Minimum and maximum ADC counts representing 0% and 100% pedal travel
// TODO: Recheck/set these values
#define THROTTLE_R_MIN_COUNTS (uint16_t)(218)
#define THROTTLE_R_MAX_COUNTS (uint16_t)(654)
#define THROTTLE_L_MIN_COUNTS (uint16_t)(298)
#define THROTTLE_L_MAX_COUNTS (uint16_t)(1016)

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
