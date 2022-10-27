#include "libs/timer/api.h"
#include "tester_board_config.h"

volatile bool send_can;

void timer0_isr(void) {
    send_can = true;
}

int main(void) {
    sei();
}