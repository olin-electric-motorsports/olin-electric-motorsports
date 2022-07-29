#include "fmc.h"
#include "libs/timer/api.h"
#include "libs/adc/api.h"
#include "tutorials/fmc/can_api.h"

#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>

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
    int adc_counter = 0;

    can_receive_motor_command();
    while (1) {
        fmc.adc_value = adc_read(adc_pin);

        if (run_50hz) {

            if (fmc.adc_value > 512) {
                adc_counter++;

                if (adc_counter >= 50) { // Over 2.5V for more than 1 second
                    set_duty_cycle(0);

                    // Haven't passed one second clearance threshold
                    if (adc_counter < 100) {
                        continue;
                    } else if (fmc.adc_value <= 512) {
                        // Voltage is below threshold and we've waited 1 second
                        adc_counter = 0;
                    }
                }

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
