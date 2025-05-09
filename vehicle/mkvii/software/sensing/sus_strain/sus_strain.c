/**
 * Title: Suspension Strain Firmware
 * Author: Aidan Schneider
 * Date: 2025-05-05
 * 
 * Description:
 * 
 * This firmware is designed to recieve changes in voltage from the load-cell (a wheatstone
 * bridge) and send the data over CAN. 
 * 
 * The load cell connects to the Motherboard via an Ampseal connector. The readings are then routed through the 
 * Motherboard to the Suspension Strain PCIe. The raw readings are then sent through the built-in load cell amplifiers
 * on the Suspension Strain board, the design of which based on the Sparkfun HX711 amplifier. These readings are then 
 * sent to the ATMEGA16m1, which then sends the data over CAN using the CAN transciever.
 */


// Including necessary libraries such as header files, GPIO, and CAN API
#include "sus_strain.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/sensing/sus_strain/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>



// Struct defining all the possible states of the load cell 
struct SusStrainState {
    volatile bool send_can;
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
    led_heartbeat = true;
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Debug LED
    gpio_set_mode(heartbeat, OUTPUT); // Heartbeat LED
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
    can_send_sus_strain_l(); // Send initial CAN message
    can_send_sus_strain_r(); // Send initial CAN message
}

/**
 * Function to get the suspension strain data from the load cell
 * 
 * The data from the load cell is 24 bits long. To get this data, the DOUT pin is set to low,
 * and the CLK pin is oscillated (set from low to high to low on regular intervals) to send the data
 * bit by bit. The CLK pin is oscillated a 25th time, resetting the chip and setting DOUT to high. 
 * This process is repeated every time a reading is conducted from the loadcell.
 */
void get_sus_strain(SusStrain *sus_strain) {
        if (!gpio_get_pin(sus_strain->dat_pin)) {
            sus_strain->data = 0;
            for (int i = 0; i < 24; i++) {
                gpio_set_pin(sus_strain->clk_pin);
                _delay_us(1);
                gpio_clear_pin(sus_strain->clk_pin);
                sus_strain->data = (sus_strain->data << 1) | (uint64_t)!!gpio_get_pin(sus_strain->dat_pin);
                _delay_us(1);
                // return sus_strain->data;
            }
            gpio_set_pin(sus_strain->clk_pin);
            _delay_us(1);
            gpio_clear_pin(sus_strain->clk_pin);
            // _delay_us(3);
            // _delay_ms(100);
             
        }
    
}

// Main function
int main(void) {
    init_peripherals();
    sei();

    for (;;) {
        if (led_heartbeat) {
            gpio_toggle_pin(heartbeat);
            led_heartbeat = false;
        }

        // getting suspension strain data from the left load cell 
        get_sus_strain(&SUS_STRAIN_l); // updating struct with new data using function
        uint64_t reading_left = SUS_STRAIN_l.data; // updated data assigned to variable
        
        // Sign Extension: bit shift right by 23 to get 24th bit and extend to 64 bits
        uint64_t signExtensionLeft = 0xFFFFFFFFFF000000 * (reading_left >> 23);
        uint64_t leftSignExtended = reading_left | signExtensionLeft;
        SUS_STRAIN_l.data = leftSignExtended;  
        
        // getting suspension strain data from the right load cell
        get_sus_strain(&SUS_STRAIN_r); // updating struct with new data using function
        uint64_t reading_right = SUS_STRAIN_r.data; // updated data assigned to variable
        uint64_t signExtensionRight = 0xFFFFFFFFFF000000 * (reading_right >> 23);
        uint64_t rightSignExtended = reading_right | signExtensionRight;
        SUS_STRAIN_r.data = rightSignExtended;

        // Inserting readings from load cell to corresponding structs
        sus_strain_l.sus_strain = SUS_STRAIN_l.data;
        sus_strain_r.sus_strain = SUS_STRAIN_r.data;

        // Sending data over CAN
        if (sus_strain_state.send_can) {
            can_send_sus_strain_l(); 
            can_send_sus_strain_r();
            sus_strain_state.send_can = false;
        }
        // _delay_ms(100);
    }
}