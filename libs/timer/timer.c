#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <avr/io.h>

static bool timer0_compa_interrupt_enabled = false;
static void (*timer0_compa_callback)(void);

static bool timer0_compb_interrupt_enabled = false;
static void (*timer0_compb_callback)(void);

static bool timer0_ovf_interrupt_enabled = false;
static void (*timer0_ovf_callback)(void);

static bool timer1_compa_interrupt_enabled = false;
static void (*timer1_compa_callback)(void);

static bool timer1_compb_interrupt_enabled = false;
static void (*timer1_compb_callback)(void);

static bool timer1_ovf_interrupt_enabled = false;
static void (*timer1_ovf_callback)(void);

ISR(TIMER0_COMPA_vect) {
    if (timer0_compa_interrupt_enabled) {
        (*timer0_compa_callback)();
    }
}

ISR(TIMER0_COMPB_vect) {
    if (timer0_compb_interrupt_enabled) {
        (*timer0_compb_callback)();
    }
}

ISR(TIMER1_COMPA_vect) {
    if (timer1_compa_interrupt_enabled) {
        (*timer1_compa_callback)();
    }
}

ISR(TIMER1_COMPB_vect) {
    if (timer1_compb_interrupt_enabled) {
        (*timer1_compb_callback)();
    }
}

static void timer_0_init(timer_cfg_s* timer_cfg) {
    TCCR0A = ((uint8_t)timer_cfg->pin_behavior_channel_a) << 6
             | ((uint8_t)timer_cfg->pin_behavior_channel_b) << 4
             | ((uint8_t)timer_cfg->timer0_mode & 0x3);

    TCCR0B = ((uint8_t)timer_cfg->timer0_mode & 0x4) << 1
             | ((uint8_t)timer_cfg->prescalar);

    if (timer_cfg->timer_interrupt_enable_channel_a) {
        TIMSK0 |= (1 << 1);
        timer0_compa_interrupt_enabled = true;
        timer0_compa_callback = timer_cfg->timer_interrupt_callback_channel_a;
    }

    if (timer_cfg->timer_interrupt_enable_channel_b) {
        TIMSK0 |= (1 << 2);
        timer0_compb_interrupt_enabled = true;
        timer0_compb_callback = timer_cfg->timer_interrupt_callback_channel_b;
    }

    if (timer_cfg->timer_overflow_interrupt_enable) {
        TIMSK0 |= 1;
        timer0_ovf_interrupt_enabled = true;
        timer0_ovf_callback
            = timer_cfg->timer_overflow_interrupt_enable_callback;
    }
}

static void timer_1_init(timer_cfg_s* timer_cfg) {
    TCCR1A = ((uint8_t)timer_cfg->pin_behavior_channel_a) << 6
             | ((uint8_t)timer_cfg->pin_behavior_channel_b) << 4
             | ((uint8_t)timer_cfg->timer1_mode & 0x3);

    TCCR1B = ((uint8_t)timer_cfg->timer1_mode & 0xC) << 1
             | ((uint8_t)timer_cfg->prescalar);

    if (timer_cfg->timer_interrupt_enable_channel_a) {
        TIMSK1 |= (1 << 1);
        timer1_compa_interrupt_enabled = true;
        timer1_compa_callback = timer_cfg->timer_interrupt_callback_channel_a;
    }

    if (timer_cfg->timer_interrupt_enable_channel_b) {
        TIMSK1 |= (1 << 2);
        timer1_compb_interrupt_enabled = true;
        timer1_compb_callback = timer_cfg->timer_interrupt_callback_channel_b;
    }

    if (timer_cfg->timer_overflow_interrupt_enable) {
        TIMSK1 |= 1;
        timer1_ovf_interrupt_enabled = true;
        timer1_ovf_callback
            = timer_cfg->timer_overflow_interrupt_enable_callback;
    }
}

void timer_init(timer_cfg_s* timer_cfg) {
    switch (timer_cfg->timer) {
        case TIMER0: {
            timer_0_init(timer_cfg);
        } break;
        case TIMER1: {
            timer_1_init(timer_cfg);
        } break;
        default: {
            // No action
        }
    }
}

void timer_get_raw_value(timer_cfg_s* timer_cfg, uint16_t* value) {
    switch (timer_cfg->timer) {
        case TIMER0: {
            *value = TCNT0;
        } break;
        case TIMER1: {
            *value = TCNT1;
        } break;
        default: {
            // No action
        }
    }
}
