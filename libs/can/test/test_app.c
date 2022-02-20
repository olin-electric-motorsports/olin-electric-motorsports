#include "libs/can/api.h"
#include "libs/can/test/can_api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>

#define LED0 (PD6)

uint8_t _bms_core_data[8] = { 0 };

can_frame_t _bms_core_msg = {
    .mob = 1,
    .data = _bms_core_data,
};

can_filter_t _bms_core_filter = {
    .id = 16,

    /*
     * TODO: It would be nice if this was configurable...
     */
    .mask = 0x7FF, // Exact match
};

struct can_tools_bms_core_t _bms_core = { 0 };

void timer0_callback(void);

timer_cfg_s timer0_cfg = {
    .timer = TIMER0,
    .timer0_mode = TIMER0_MODE_CTC,
    .prescalar = CLKIO_DIV_1024,
    .channel_a = {
        .output_compare_match = 0xFF,
        .pin_behavior = DISCONNECTED,
        .interrupt_enable = true,
        .interrupt_callback = timer0_callback,
    },
};

volatile bool send_can = false;

void timer0_callback(void) {
    send_can = true;
}

int main(void) {
    can_init_test_node();
    timer_init(&timer0_cfg);

    sei();

    DDRD |= _BV(LED0);

    int rc = 0;

    can_receive_bms_core();

    while (1) {
        // rc = can_poll_receive(&_bms_core_msg);
        rc = can_poll_receive_bms_core();

        if (rc == 0) {
            test_msg.test_sig = test_msg.test_sig + 1;
            PORTD |= _BV(LED0);
            can_receive_bms_core();
            // can_receive(&_bms_core_msg, _bms_core_filter);
        }

        if (send_can) {
            can_send_test_msg();
            send_can = false;
        }
    }
}
