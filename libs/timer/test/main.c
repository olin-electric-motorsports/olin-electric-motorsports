#include "libs/timer/api.h"
#include "libs/uart/api.h"

#include <avr/interrupt.h>
#include "config.h"

volatile uint8_t tick = 0;

void timer0_callback(void) {
    tick++;
}

int main(void) {
    sei();

    timer_init(&timer0_cfg);
    timer_register_callback(&timer0_cfg, CHANNEL_A, timer0_callback);

    for (;;) {
        if (
        // if (send_msg) {
        //     uart_puts("Timer tripped\r\n");
        //     send_msg = false;
        // }
    }
}
