#include "libs/timer/api.h"

#include "config.h"
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>

volatile uint16_t tick = 0;
volatile bool send_can = false;

void timer0_callback(void) {
    tick = (tick + 1) % 2000;
    if (tick == 0) {
        send_can = true;
    }
}

int main(void) {
    sei();

    timer_init(&timer0_ctc_cfg);
    can_init(BAUD_500KBPS);

    for (;;) {
        if (send_can) {
            can_send(&msg);
            send_can = false;
        }
    }
}
