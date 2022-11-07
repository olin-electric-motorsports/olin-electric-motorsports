#include "libs/timer/api.h"
#include "tester_board_config.h"
#include "projects/can_test_platform/tester_board/can_api.h"
#include <avr/interrupt.h>
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/can/api.h"

volatile bool send_can;

void timer0_isr(void) {
    send_can = true;
    // gpio_toggle_pin(LED);
}

int main(void) {
    // can_init(BAUD_500KBPS);
    can_init_can_test_platform();
    timer_init(&timer0_cfg);
    // can_receive_throttle();
    gpio_set_mode(LED, OUTPUT);
    gpio_set_pin(LED);
    sei();
    // gpio_set_mode(TEST, OUTPUT);
    // gpio_set_pin(TEST);
    for (;;) {
        // if (can_poll_receive_throttle() == 0) {
        //     can_receive_throttle();
        // }   
        if (send_can) {
            gpio_toggle_pin(LED);
            // can_send_test_message();
            // can_send(&test_msg);
            send_can = false;
        }
    }

}