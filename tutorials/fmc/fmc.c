#include "fmc.h"
#include "libs/adc/api.h"
#include "libs/timer/api.h"
#include "tutorials/fmc/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdio.h>

volatile bool run_50hz = false;

void timer0_callback(void) {
    run_50hz = true;
}

void set_duty_cycle(int torque_request) {
    float duty_cycle = (float)torque_request / 255.0;
    OCR1B = (int16_t)(duty_cycle * 80.0);
}

int main(void) {
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);
    adc_init();

    sei();
    int implausibility_timer = 0;
    bool implausibility = false;

    can_receive_motor_command();
    while (1) {
        fmc.adc_value = adc_read(adc_pin);

        if (run_50hz) {
            // Over 2.5V for over one second but less than two
            if (implausibility && implausibility_timer < 100) {
                set_duty_cycle(0);
                implausibility_timer++;
                continue;
            }

            if (fmc.adc_value > 512) {
                implausibility_timer++;
                if (implausibility_timer >= 50) {
                    // Over 2.5V for more than 1 second
                    implausibility = true;
                    continue; // if there's implausibility, don't set duty cycle
                }
            } else {
                implausibility_timer = 0;
                implausibility = false;
            }

            if (can_poll_receive_motor_command() == 0) {
                set_duty_cycle(motor_command.torque_request);

                can_receive_motor_command();
            }

            can_send_fmc();
            run_50hz = false;
        }
    }
}
