#include "sus_travel_config.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"
#include "vehicle/mkvi/software/sus_travel/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

sus_travel_state = 0;

//Timer 0 for sending Lin_Pot data over CAN
void timer_0_isr(void) {
    sus_travel_state.send_can = true;
}

//Timer 1 for the LED heartbeat
volatile bool led_heartbeat = false;
void timer_1_isr(void) {
    led_heartbeat = true;
}

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

//Initialize 16m1 hardware peripherals
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Heartbeat LED
    can_init_sus_travel(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    spi_init(&sus_travel_spi_cfg); // SPI *
    adc_init(); // adc
}

static int16_t get_sus_travel(const sus_travel_potentiometer_s* sus_travel,
                                   bool is_left_sus_travel) {

    int16_t sus_travel_raw = adc_read(sus_travel->adc_pin);
    if (is_left_sus_travel) {
        sus_travel_debug.sus_travel_l_raw = sus_travel_raw;
    } else {
        sus_travel_debug.sus_travel_r_raw = sus_travel_raw;
    }

    sus_travel_raw >>= 2;

    int16_t range = sus_travel->sus_travel_max - sus_travel->sus_travel_min;
    float position_pct
        = (float)(sus_travel_raw - sus_travel->sus_travel_min) / (float)range;
    return floor(position_pct * MAX_SUS_TRAVEL_POS);
}

int main(void) {
    init_peripherals();
    //can_send_m192_command_message(); // *
    switch_register_bank(BANK_0);
    for (;;) {
        if (led_heartbeat) {
            led_heartbeat = false;
            gpio_toggle_pin(debug_led);

            int16_t pos_l = get_sus_travel(&sus_travel_l, true);
            int16_t pos_r = get_sus_travel(&sus_travel_r, false);
 
            sus_travel.sus_travel_l_pos = pos_l;
            sus_travel.sus_travel_r_pos = pos_r;
        }

        if (sus_travel_state.send_can) {
            can_send_sus_travel();
            //can_send_sus_travel_debug();
            //can_send_m192_command_message();
            sus_travel_state.send_can = false;
        }
    }
}
