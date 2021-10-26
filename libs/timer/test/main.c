#include "libs/timer/api.h"
#include "libs/uart/api.h"

#include "config.h"
#include <avr/interrupt.h>
#include <avr/io.h>

// volatile uint8_t tick = 0;

// void timer0_callback(void) {
//     tick++;
// }

int main(void) {
    // sei();

    // PWM
    DDRD |= _BV(PD3);
    timer_init(&timer0_pwm_cfg);

    for (;;) {}
}
