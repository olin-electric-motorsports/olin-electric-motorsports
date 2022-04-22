#pragma once

#include <stdbool.h>
#include <stdint.h>

typedef enum {
    TIMER0, // 8-bit
    TIMER1, // 16-bit
} timer_e;

typedef enum {
    CHANNEL_A,
    CHANNEL_B,
} timer_channel_e;

/*
 * Enum containing the operation mode of the timer. The order is important as it
 * is used to set the WGM0n bits of the TCCRnx register. Values derived from
 * table 15-9 in the complete datasheet.
 */
typedef enum {
    TIMER0_MODE_NORMAL = 0x0,
    TIMER0_MODE_PHASE_CORRECT_PWM = 0x1,
    TIMER0_MODE_CTC = 0x2,
    TIMER0_MODE_FAST_PWM = 0x3,
    TIMER0_MODE_PHASE_CORRECT_PWM_OCRA = 0x5,
    TIMER0_MODE_FAST_PWM_OCRA = 0x7,
} timer0_mode_e;

/*
 * These are the modes for timer1. Values that are commented out use input
 * capture trigger, which is not implemented in this library. The comments are
 * included for completeness of table 16-6 in the complete datasheet.
 */
typedef enum {
    TIMER1_MODE_NORMAL = 0x0,
    TIMER1_MODE_PHASE_CORRECT_PWM_8_BIT = 0x1,
    TIMER1_MODE_PHASE_CORRECT_PWM_9_BIT = 0x2,
    TIMER1_MODE_PHASE_CORRECT_PWM_10_BIT = 0x3,
    TIMER1_MODE_CTC = 0x4,
    TIMER1_MODE_FAST_PWM_8_BIT = 0x5,
    TIMER1_MODE_FAST_PWM_9_BIT = 0x6,
    TIMER1_MODE_FAST_PWM_10_BIT = 0x7,
    PHASE_FREQUENCY_CORRECT_PWM = 0x8,
    TIMER1_MODE_PHASE_FREQUENCY_CORRECT_PWM_OCRA = 0x9,
    PHASE_CORRECT_PWM = 0xA,
    TIMER1_MODE_PHASE_CORRECT_PWM_OCRA = 0xB,
    CTC_ICR1 = 0xC,
    _RESERVED = 0xD,
    FAST_PWM = 0xE,
    TIMER1_MODE_FAST_PWM_OCR1A = 0xF,
} timer1_mode_e;

/*
 * Defines the behavior of specific hardware pins connected to the timer, OCnx.
 * It is possible to have pins toggle, clear (set to 0), or set (set to 1) when
 * the timer reaches a certain value, so this enum defines what the pin behavior
 * should be.
 *
 * Refer to tables 15-3, 15-4, and 15-5 of the complete datasheet.
 *
 * If using timer 0b and mode fast-PWM or phase-correct PWM, toggle is not a
 * valid option.
 *
 * TODO: Add static assert
 */
typedef enum {
    DISCONNECTED = 0x0,
    TOGGLE = 0x1,
    CLEAR = 0x2,
    SET = 0x3,
} timer_pin_behavior_e;

/*
 * Determines the clock source that is used when comparing. The order of these
 * enums is important as it sets the CSnn bits of the TCCRnB register.
 */
typedef enum {
    DISABLED = 0x0,
    CLKIO_DIV_1,
    CLKIO_DIV_8,
    CLKIO_DIV_64,
    CLKIO_DIV_256,
    CLKIO_DIV_1024,
    EXTERNAL_FALLING,
    EXTERNAL_RISING,
} timer_source_prescalar_e;

typedef struct {
    timer_channel_e channel; // A or B

    uint16_t output_compare_match; // OCRnx

    timer_pin_behavior_e pin_behavior; // COMnx bits of TCCRnx

    bool interrupt_enable;
    void (*interrupt_callback)(void);
} timer_channel_config_s;

typedef struct {
    timer_e timer;

    // Only one will be set per-config, based on which timer is used
    union {
        timer0_mode_e timer0_mode;
        timer1_mode_e timer1_mode;
    };

    timer_source_prescalar_e prescalar;

    timer_channel_config_s channel_a;
    timer_channel_config_s channel_b;

    bool timer_overflow_interrupt_enable;
    void (*timer_overflow_interrupt_enable_callback)(void);
} timer_cfg_s;

/*
 * Initializes timer based on configuration struct passed in.
 *
 * This function can be called multiple times if different structs are passed in
 * (i.e. timer_init(CONFIG_FOR_TIMER_0); timer_init(CONFIG_FOR_TIMER_1);)
 */
void timer_init(timer_cfg_s* timer_cfg);

/*
 * Gets the raw value of the timer from TCNTn bit
 *
 * For timer0, value will only use the lower 8 bits
 */
void timer_get_raw_value(timer_cfg_s* timer_cfg, uint16_t* value);

/*
 * Registers a timer interrupt callback
 */
void timer_register_callback(timer_cfg_s* timer_cfg, timer_channel_e ch,
                             void (*callback)(void));

/*
 * Notes
 *
 * - Current implementation will ignore the FOCnx bits in the TCCRnx registers
 *   as their functionality isn't needed (force output compare)
 * - GTCCR register is ignored in this implementation as it is not used by our
 *   team
 * - Inputer capture trigger source (ICRA) is not implemented as it is not used
 *   by our team.
 */
