#include "sus_travel.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/sensing/sus_travel/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>


// all possible strain states
struct SusStrainState {
    volatile bool send_can;
    uint16_t implausibility_fault_counter;
} sus_strain_state = { 0 };

/**
 * Timer 0 for sending Load_Cell data over CAN
 */
void timer_0_isr(void) {
    sus_strain_state.send_can = true;
}

volatile bool run_1ms = true; 

/**
 * Timer 1 for the LED heartbeat
 */
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    led_heartbeat = true;
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Debug LED
    gpio_set_mode(heartbeat, OUTPUT); // Heartbeat LED
    can_init_sus_strain(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    adc_init(); // ADC
    can_send_sus_strain(); // Send initial CAN message
}

int16_t get_sus_strain(SusStrain *sus_strain, bool is_left_sus_strain) {
    int16_t sus_strain_raw = adc_read(sus_strain->gpio_pin); // Access the gpio_pin correctly
    if (is_left_sus_strain) {
        sus_strain->data = sus_strain_raw;
    } else {
        sus_strain->data = sus_strain_raw;
    }
    return sus_strain_raw;
}

int main(void) {
    init_peripherals();
    sei();

    for (;;) {
        if (run_1ms) {
            run_1ms = false;

            if (led_heartbeat) {
                gpio_toggle_pin(heartbeat);
                led_heartbeat = false;
            }

            int16_t sus_l = get_sus_strain(&SUS_STRAIN_l, true);
            int16_t sus_r = get_sus_strain(&SUS_STRAIN_r, false);

            sus_strain.sus_strain_l = sus_l;
            sus_strain.sus_strain_r = sus_r;


            if (sus_strain_state.send_can) {
                can_send_sus_strain();
                sus_strain_state.send_can = false;
            }
        }
    }
}