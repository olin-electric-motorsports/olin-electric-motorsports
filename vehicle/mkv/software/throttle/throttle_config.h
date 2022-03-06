#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

// Define throttle values to use when mapping
// Values are capped at this range
// Recheck/set these values
#define THROTTLE0_MIN_COUNTS (uint16_t)(218)
#define THROTTLE0_MAX_COUNTS (uint16_t)(654)
#define THROTTLE1_MAX_COUNTS (uint16_t)(298)
#define THROTTLE1_MIN_COUNTS (uint16_t)(1016)

/*
 * Pin definitions
 */

gpio_t DEBUG_LED1 = PC6;
gpio_t DEBUG_LED2 = PB3;
gpio_t DEBUG_LED3 = PB4;

gpio_t LED1 = PB0; // orange
gpio_t LED2 = PB1; // green

gpio_t SS_ESTOP = PB5;
gpio_t SS_IS = PB6;
gpio_t SS_BOTS = PB7;

/*
 * ADC pins
 */
adc_pin_e DRIVE_MODE_SENSE = ADC2;

typedef struct {
    adc_pin_e adc_pin;
    // Min ADC Counts
    uint16_t throttle_min;
    // Max ADC Counts
    uint16_t throttle_max;
} throttle_potentiometer_s;

static throttle_potentiometer_s throttle_0 = {
    .adc_pin = ADC8,
    .throttle_min = THROTTLE0_MIN_COUNTS,
    .throttle_max = THROTTLE0_MAX_COUNTS,
};

static throttle_potentiometer_s throttle_1 = {
    .adc_pin = ADC9,
    .throttle_min = THROTTLE1_MIN_COUNTS,
    .throttle_max = THROTTLE1_MAX_COUNTS,
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
        .output_compare_match = 0x27,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_isr,
    },
};
