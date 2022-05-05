#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <avr/io.h>

__attribute__((weak)) void timer0_compa_callback(void) {};

__attribute__((weak)) void timer0_compb_callback(void) {};

__attribute__((weak)) void timer0_ovf_callback(void) {};

__attribute__((weak)) void timer1_compa_callback(void) {};

__attribute__((weak)) void timer1_compb_callback(void) {};

__attribute__((weak)) void timer1_ovf_callback(void) {};

ISR(TIMER0_COMPA_vect) {
    timer0_compa_callback();
}

ISR(TIMER0_COMPB_vect) {
    timer0_compb_callback();
}

ISR(TIMER0_OVF_vect) {
    timer0_ovf_callback();
}

ISR(TIMER1_COMPA_vect) {
    timer1_compa_callback();
}

ISR(TIMER1_COMPB_vect) {
    timer1_compb_callback();
}

ISR(TIMER1_OVF_vect) {
    timer1_ovf_callback();
}

static void timer_0_init(timer_cfg_s* timer_cfg) {
    TCCR0A |= (((uint8_t)timer_cfg->channel_a.pin_behavior) << 6)
              | (((uint8_t)timer_cfg->channel_b.pin_behavior) << 4)
              | ((uint8_t)timer_cfg->timer0_mode & 0x3);

    TCCR0B |= (((uint8_t)timer_cfg->timer0_mode & 0x4) << 1)
              | ((uint8_t)timer_cfg->prescalar & 0x7);

    OCR0A = timer_cfg->channel_a.output_compare_match;
    OCR0B = timer_cfg->channel_b.output_compare_match;

    if (timer_cfg->channel_a.interrupt_enable) {
        TIMSK0 |= (1 << OCIE0A);
        // timer0_compa_interrupt_enabled = true;
        // timer0_compa_callback = timer_cfg->channel_a.interrupt_callback;
    }

    if (timer_cfg->channel_b.interrupt_enable) {
        TIMSK0 |= (1 << OCIE0B);
        // timer0_compb_interrupt_enabled = true;
        // timer0_compb_callback = timer_cfg->channel_b.interrupt_callback;
    }

    if (timer_cfg->timer_overflow_interrupt_enable) {
        TIMSK0 |= (1 << TOIE0);
        // timer0_ovf_interrupt_enabled = true;
        // timer0_ovf_callback
        //     = timer_cfg->timer_overflow_interrupt_enable_callback;
    }
}

static void timer_1_init(timer_cfg_s* timer_cfg) {
    TCCR1A |= (((uint8_t)timer_cfg->channel_a.pin_behavior) << 6)
              | (((uint8_t)timer_cfg->channel_b.pin_behavior) << 4)
              | ((uint8_t)timer_cfg->timer1_mode & 0x3);

    TCCR1B |= (((uint8_t)timer_cfg->timer1_mode & 0xC) << 1)
              | ((uint8_t)timer_cfg->prescalar & 0x7);

    OCR1A = timer_cfg->channel_a.output_compare_match;
    OCR1B = timer_cfg->channel_b.output_compare_match;

    if (timer_cfg->channel_a.interrupt_enable) {
        TIMSK1 |= (1 << OCIE1A); // Enable interrupt
        // timer1_compa_interrupt_enabled = true;
        // timer1_compa_callback = timer_cfg->channel_a.interrupt_callback;
    }

    if (timer_cfg->channel_b.interrupt_enable) {
        TIMSK1 |= (1 << OCIE1B); // Enable interrupt
        // timer1_compb_interrupt_enabled = true;
        // timer1_compb_callback = timer_cfg->channel_b.interrupt_callback;
    }

    if (timer_cfg->timer_overflow_interrupt_enable) {
        TIMSK1 |= (1 << TOIE1); // Enable overflow interrupt
        // timer1_ovf_interrupt_enabled = true;
        // timer1_ovf_callback
        //     = timer_cfg->timer_overflow_interrupt_enable_callback;
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
    }
}

void timer_get_raw_value(timer_cfg_s* timer_cfg, uint16_t* value) {
    switch (timer_cfg->timer) {
        case TIMER0: {
            *value = TCNT0;
        } break;
        case TIMER1: {
            /*
             * Because we are using an 8-bit microcontroller, we can only access
             * memory 8-bits at a time. This means that when we are accessing a
             * 16-bit register like TCNT1, we need to be careful about how we
             * access it. To ensure atomicity (to make sure nothing interrupts
             * the read), we disable interrupts when we read, and re-enable them
             * once we're done.
             */
            uint8_t sreg = SREG; // Store global interrupt settings
            cli(); // Disable interrupts
            *value = TCNT1;
            SREG = sreg; // Restore global interrupt settings
        } break;
    }
}

// void timer_register_callback(timer_cfg_s* timer_cfg, timer_channel_e ch,
//                              void (*callback)(void)) {
//     switch (ch) {
//         case CHANNEL_A: {
//             timer_cfg->channel_a.interrupt_enable = true;
//             timer_cfg->channel_a.interrupt_callback = callback;
//         } break;
//         case CHANNEL_B: {
//             timer_cfg->channel_b.interrupt_enable = true;
//             timer_cfg->channel_b.interrupt_callback = callback;
//         } break;
//     }
// }
