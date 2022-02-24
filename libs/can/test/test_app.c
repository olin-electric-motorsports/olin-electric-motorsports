#include "libs/can/api.h"
#include "libs/can/can_api.h"
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>

#define LED0 (PD6)

volatile bool turn_led_off = false;

uint8_t rx_msg_data[MAX_DLC];

can_frame_t rx_msg = {
    .mob = 1,
    .data = rx_msg_data,
};

can_filter_t rx_filter = {
    .mask = 0x7FF,
    .id = 0x011,
};

ISR(TIMER1_COMPA_vect) {
    // Turn off LED
    if (turn_led_off) {
        PORTD &= ~_BV(LED0);
        turn_led_off = false;
    }
}

/*
 * Restart timer at 0
 */
static void start_timer(void) {
    TCNT1 = 0;
    turn_led_off = true;
}

/*
 * f_clk_io = 4'000'000
 * desired frequency = 1Hz
 * counter resolution = 16-bit, so (2^16)-1 is max value
 * prescaler = 256
 *
 * compare value = [f_clk_io / (prescale * freq)] - 1 = 15624
 */
static void timer_init(void) {
    TCCR1B = _BV(WGM12) | 0x4; // CTC mode and prescaler of 256
    TIMSK1 |= _BV(OCIE1A);
    OCR1A = 15624;
}

int main(void) {
    sei();
    can_init(BAUD_500KBPS);
    timer_init();
    DDRD |= _BV(LED0);

    can_frame_t msg = {
        .id = 0x010,
        .dlc = 1,
        .mob = 0,
    };

    uint8_t can_data[1] = { 0x0F };

    msg.data = can_data;

    can_receive(&rx_msg, rx_filter);

    while (1) {
        // Testing transmit
        can_send(&msg);

        int ready = can_poll_receive(&rx_msg);
        if (ready == 0) {
            // When a message is received, turn on the LED for a second
            PORTD |= _BV(LED0);
            start_timer();

            can_receive(&rx_msg, rx_filter);
        }

        _delay_ms(10);
    }
}
