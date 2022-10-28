#include "libs/timer/api.h"
#include "tester_board_config.h"
#include "projects/can_test_platform/tester_board/can_api.h"
#include <avr/interrupt.h>

volatile bool send_can;

void timer0_isr(void) {
    send_can = true;
}

int main(void) {
    sei();
    can_init_can_test_platform();
    timer_init(&timer0_cfg);
    can_receive_throttle();

    if (can_poll_receive_throttle() == 0) {
        can_receive_throttle();
    }
    
    if (send_can) {
        send_can = false;
        can_send_can_test_platform();
    }
}