#include "libs/timer/api.h"
#include "fmc_config.h"
#include "tutorials/fmc/can_api.h"
#include "libs/adc/api.h"

#include <avr/interrupt.h>
#include <avr/io.h>

volatile bool timer_50hz = true;
uint16_t adc_value = 0;
bool high_voltage = false;
uint8_t high_voltage_counter = 0;
uint8_t buffer_counter = 0;

void timer0_callback(void) {
    timer_50hz = true;
}

void change_duty_cycle(uint8_t torque_request_value) {
    float duty_cycle = (float)torque_request_value / 255.0;
    OCR1B = (uint16_t)duty_cycle * 80.0;
}

int main(void) {
    sei();
    timer_init(&timer0_cfg);
    can_init_fmc();
    adc_init();

    can_receive_motor_command();

    while(1) {
        if(timer_50hz) {
            adc_value = adc_read(adc_pin);
            fmc_data[0] = adc_value & 0xFF;
            fmc_data[1] = (adc_value >> 8);
            can_send_fmc();

            if(high_voltage_counter > 49) {
                change_duty_cycle(0);
                buffer_counter++;
                if(buffer_counter > 49) {
                    high_voltage_counter = 0;
                }
            }
            else if(adc_value > 2.5) {
                change_duty_cycle(0);
                if(buffer_counter == 0) {
                    high_voltage_counter++;
                }
            }
            else if(can_poll_receive_motor_command() == 0) {
                change_duty_cycle(motor_command.torque_request);
                can_receive_motor_command();
                high_voltage_counter = 0;
                buffer_counter = 0;
            }
            timer_50hz = false;
        }
    }
}