#include "wheel_speed.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/wheel_speed/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>



volatile bool send_can = true;
volatile uint16_t timer_ticks = 0;
void timer_0_isr(void){
    timer_ticks++;
    send_can = true;
}

// Timer 1 for Heartbeat LED
volatile bool toggle_heartbeat = true;

void timer_1_isr(void){
    toggle_heartbeat = true;
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Debug LED
    gpio_set_mode(heartbeat_led, OUTPUT); // Heartbeat LED
   
    can_init_wheel_speed(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    adc_init(); // ADC
}

int elapsed_ticks = 0;

uint16_t get_wheel_speed(WheelSpeed* wheel_speed) {
    uint16_t adc_value = adc_read(wheel_speed->adc_pin);
    bool current_state = adc_value >= READING_THRESHOLD;

    if (current_state != wheel_speed->last_state){
        static uint16_t last_tick = 0;
        uint16_t tick_diff = (timer_ticks >= last_tick) ? (timer_ticks - last_tick) : (UINT32_MAX - last_tick + timer_ticks + 1);

        if (elapsed_ticks > 0){
            wheel_speed->current_speed = (NUM_HOLES * 217000) / tick_diff;
        }
        last_tick = timer_ticks;
        wheel_speed->last_state = current_state;
    }
    return wheel_speed->current_speed;

}



int main(void){

    init_peripherals();

    while(true){

        if (toggle_heartbeat){
            gpio_toggle_pin(heartbeat_led);
            gpio_toggle_pin(debug_led);
            toggle_heartbeat = false;
        }

        if(send_can){
            //uint16_t speed_l = get_wheel_speed(&WHEEL_SPEED_l);
            //uint16_t speed_r = get_wheel_speed(&WHEEL_SPEED_r);
            wheel_speed.wheel_speed_l++; //speed_l;
            wheel_speed.wheel_speed_r++; // speed_r;
            can_send_wheel_speed();
            send_can = false;
        }
    }

}
