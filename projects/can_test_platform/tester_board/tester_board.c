#include "libs/timer/api.h"
#include "tester_board_config.h"
#include "projects/can_test_platform/tester_board/can_api.h"
#include <avr/interrupt.h>
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"

volatile bool send_can;
gpio_t LED = PD5;

void timer0_isr(void) {
    send_can = true;
}

int main(void) {
    sei();
    can_init_can_test_platform();
    timer_init(&timer0_cfg);
    can_receive_throttle();
    gpio_set_mode(LED, OUTPUT);

    if (can_poll_receive_throttle() == 0) {
        can_receive_throttle();
    }
    
    if (send_can) {
        can_send_can_test_platform();
        gpio_toggle_pin(LED);
        send_can = false;
    }
}