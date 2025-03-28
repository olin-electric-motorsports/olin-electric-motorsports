#include "wheel_speed.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"
#include "vehicle/mkvi/software/wheel_speed/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>



struct WheelSpeedState {
    volatile bool send_can;
} wheel_speed_state = { 0 };

volatile uint16_t timer_ticks = 0;
void timer_0_isr(void){
    timer_ticks++;
    wheel_speed_state.send_can = true;
}

// Timer 1 for Heartbeat LED
volatile bool led_heartbeat = true;
void timer_1_isr(void){
    led_heartbeat = true;
};

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Debug LED
    gpio_set_mode(heartbeat, OUTPUT); // Heartbeat LED
    gpio_set_mode(WHEEL_SPEED_l.clk_pin, OUTPUT); // CLK pin 1
    gpio_set_mode(WHEEL_SPEED_l.dat_pin, INPUT); // DAT pin 1
    gpio_set_mode(WHEEL_SPEED_r.clk_pin, OUTPUT); // CLK pin 2
    gpio_set_mode(WHEEL_SPEED_r.dat_pin, INPUT); // DAT pin 2

    gpio_clear_pin(WHEEL_SPEED_l.clk_pin);
    gpio_clear_pin(WHEEL_SPEED_r.clk_pin);

    can_init_wheel_speed(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    adc_init(); // ADC
    can_send_wheel_speed(); // Send initial CAN message
}

static int wheel_speed_count_l = 0
static int wheel_speed_count_r = 0

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

};



int main(void){
    init_peripherals();
    sei();
    can_init_wheel_speed();
    adc_init();

    while(1){
        uint16_t speed_l = get_wheel_speed(&WHEEL_SPEED_l);
        uint16_t speed_r = get_wheel_speed(&WHEEL_SPEED_r);
        wheel_speed.wheel_speed_l = speed_l;
        wheel_speed.wheel_speed_r = speed_r;
    

        if(wheel_speed_state.send_can){
            can_send_wheel_speed();
            wheel_speed_state.send_can = false;

        }
    }
    return 0;
}
