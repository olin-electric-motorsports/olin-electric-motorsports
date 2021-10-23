#include <stdint.h>

typedef void (*callback_f)(void);

typedef enum {
    TIMER0, // 8-bit
    TIMER1, // 16-bit
    TIMER2, // 8-bit
} timer_e;

/*
 * Enum containing the operation mode of the timer. The order is important as it
 * is used to set the WGM0n bits of the TCCRnx register. Values derived from
 * table 15-9 in the complete datasheet.
 */
typedef enum {
    NORMAL = 0x0,
    PHASE_CORRECT_PWM = 0x1,
    CTC = 0x2,
    FAST_PWM = 0x3,
    PHASE_CORRECT_PWM_OCRA = 0x5,
    FAST_PWM_OCRA = 0x7;
} timer_0_mode_e;

/*
 * These are the modes for timer1. Values that are commented out use input
 * capture trigger, which is not implemented in this library. The comments are
 * included for completeness of table 16-6 in the complete datasheet.
 */
typedef enum {
    NORMAL = 0x0,
    PHASE_CORRECT_PWM_8_BIT = 0x1,
    PHASE_CORRECT_PWM_9_BIT = 0x2,
    PHASE_CORRECT_PWM_10_BIT = 0x3,
    CTC = 0x4,
    FAST_PWM_8_BIT = 0x5,
    FAST_PWM_9_BIT = 0x6,
    FAST_PWM_10_BIT = 0x7,
    // PHASE_FREQUENCY_CORRECT_PWM = 0x8,
    PHASE_FREQUENCY_CORRECT_PWM_OCRA = 0x9,
    // PHASE_CORRECT_PWM = 0xA,
    PHASE_CORRECT_PWM_OCRA = 0xB,
    // CTC_ICR1 = 0xC,
    // FAST_PWM = 0xE,
    FAST_PWM_OCR1A = 0xF,
} timer_1_mode_e;

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
    timer_e timer;

    // Only one will be set per-config, based on which timer is used
    timer_0_mode_e timer0_mode;
    timer_1_mode_e timer1_mode;

    // Value of OCRnx, 15.9.6 and 15.9.7
    // For Timer0 , it will only use the lower 8 bits. Timer1 will
    // use all 16 bits
    uint16_t output_compare_match_value_channel_a;
    uint16_t output_compare_match_value_channel_b;

    timer_source_prescalar_e prescalar;
    timer_pin_behavior_e pin_behavior_channel_a;
    timer_pin_behavior_e pin_behavior_channel_b;

    bool timer_interrupt_enable_channel_a;
    callback_f* timer_interrupt_callback_channel_a;

    bool timer_interrupt_enable_channel_b;
    callback_f* timer_interrupt_callback_channel_b;

    bool timer_overflow_interrupt_enable;
    callback_f* timer_overflow_interrupt_enable_callback;
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
 */
void timer_get_raw_value(timer_cfg_s* timer_cfg);

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
