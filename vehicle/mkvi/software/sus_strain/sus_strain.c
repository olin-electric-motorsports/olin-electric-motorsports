#include "sus_strain.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"
#include "vehicle/mkvi/software/sus_strain/can_api.h"

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


/**
 * Timer 1 for the LED heartbeat
 */
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    // led_heartbeat = true;
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Debug LED
    gpio_set_mode(heartbeat, OUTPUT); // Heartbeat LED
    // gpio_set_mode(SUS_STRAIN_int, INPUT); // Interrupt pin
    gpio_set_mode(SUS_STRAIN_l.clk_pin, OUTPUT); // CLK pin 1
    gpio_set_mode(SUS_STRAIN_l.dat_pin, INPUT); // DAT pin 1
    gpio_set_mode(SUS_STRAIN_r.clk_pin, OUTPUT); // CLK pin 2
    gpio_set_mode(SUS_STRAIN_r.dat_pin, INPUT); // DAT pin 2

    gpio_clear_pin(SUS_STRAIN_l.clk_pin);
    gpio_clear_pin(SUS_STRAIN_r.clk_pin);
    can_init_sus_strain(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    adc_init(); // ADC
    can_send_sus_strain(); // Send initial CAN message
}

void get_sus_strain(SusStrain *sus_strain) {

    
        if (!!gpio_get_pin(sus_strain->dat_pin)) {
                gpio_set_pin(sus_strain->clk_pin);
                _delay_ms(1);
                gpio_clear_pin(sus_strain->clk_pin);
                _delay_ms(60);
            sus_strain->data = 0;
            for (int i = 0; i < 24; i++) {
                gpio_set_pin(sus_strain->clk_pin);
                _delay_us(3);
                gpio_clear_pin(sus_strain->clk_pin);
                sus_strain->data = (sus_strain->data << 1) | (uint32_t)!!gpio_get_pin(sus_strain->dat_pin);
                _delay_us(3);
                // return sus_strain->data;
            }
            gpio_set_pin(sus_strain->clk_pin);
            _delay_us(3);
            gpio_clear_pin(sus_strain->clk_pin);
            // _delay_ms(100);
             
        }
}
int main(void) {
    init_peripherals();
    sei();

    for (;;) {
        if (led_heartbeat) {
            gpio_toggle_pin(heartbeat);
            led_heartbeat = false;
        }
        // int16_t sus_l = get_sus_strain(&SUS_STRAIN_l, true);
        // int16_t sus_r = get_sus_strain(&SUS_STRAIN_r, false);
        
        //error here!
        //get_sus_strain(&SUS_STRAIN_r);
        get_sus_strain(&SUS_STRAIN_l);

        sus_strain.sus_strain_l = SUS_STRAIN_l.data;
        sus_strain.sus_strain_r = SUS_STRAIN_r.data;
        
        if (sus_strain_state.send_can) {
            if (SUS_STRAIN_r.data == 0x000000) {
                can_send_sus_strain();
            }
            // can_send_sus_strain();
            sus_strain_state.send_can = false;
        }
    }
}