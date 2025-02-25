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

// #include "projects/btldr/btldr_lib.h"
// #include "projects/btldr/git_sha.h"
// #include "projects/btldr/libs/image/api.h"
// #include "projects/can_print/can_print.h"

// /*
//  * Required for btldr
//  */
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };

// all possible throttle states

struct sus_travel_state_s {
    volatile bool send_can;
    uint16_t implausibility_fault_counter;
} sus_travel_state = { 0 };

enum State {
    SUS_TRAVEL_RUN,
    SUS_TRAVEL_L_OUT_OF_RANGE,
    SUS_TRAVEL_R_OUT_OF_RANGE,
    SUS_TRAVEL_POSITION_IMPLAUSIBILITY
};

/**
 * Timer 0 for sending Lin_Pot data over CAN
 */
void timer_0_isr(void) {
    sus_travel_state.send_can = true;
}

/**
 * Timer 1 for the LED heartbeat
 */
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    led_heartbeat = true;
}

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

/**
 * Initialize 16m1 hardware peripherals
 */
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
    //sus_travel_raw >>= 2; // TODO: ask why this is here
    int16_t range = sus_travel->sus_travel_max - sus_travel->sus_travel_min;
    float position_pct
        = (float)(sus_travel_raw - sus_travel->sus_travel_min) / (float)range;
    return floor(position_pct * MAX_SUS_TRAVEL_POS);
}

/*
    Check if sensors return a value out of range (<0 or >255)
    Args:
        pos_l: int16_t sensor value of sus_travel pot 1eft
        pos_r: int16_t sensor value of sus_travel pot right
    Returns:
        implausibility: boolean if sus_travel out of range or not
*/
static bool check_out_of_range(int16_t* pos_l, int16_t* pos_r) {
    bool implausibility = false;

    // Check 1st pot
    if (*pos_l > MAX_SUS_TRAVEL_POS) {
        *pos_l = MAX_SUS_TRAVEL_POS;
        sus_travel.sus_travel_status = SUS_TRAVEL_L_OUT_OF_RANGE;
        sus_travel_debug.sus_travel_l_out_of_range = true;
        implausibility = true;
    } else if (*pos_l < MIN_SUS_TRAVEL_POS) {
        *pos_l = MIN_SUS_TRAVEL_POS;
        sus_travel.sus_travel_status = SUS_TRAVEL_L_OUT_OF_RANGE;
        sus_travel_debug.sus_travel_l_out_of_range = true;
        implausibility = true;
    } else {
        sus_travel_debug.sus_travel_l_out_of_range = false;
    }

    // Check 2nd pot
    if (*pos_r > MAX_SUS_TRAVEL_POS) {
        *pos_r = MAX_SUS_TRAVEL_POS;
        sus_travel.sus_travel_status = SUS_TRAVEL_R_OUT_OF_RANGE;
        sus_travel_debug.sus_travel_r_out_of_range = true;
        implausibility = true;
    } else if (*pos_r < MIN_SUS_TRAVEL_POS) {
        *pos_r = MIN_SUS_TRAVEL_POS;
        sus_travel.sus_travel_status = SUS_TRAVEL_R_OUT_OF_RANGE;
        sus_travel_debug.sus_travel_r_out_of_range = true;
        implausibility = true;
    } else {
        // Will be reset if Ready to Drive is not on
        sus_travel.sus_travel_status = SUS_TRAVEL_RUN;
        sus_travel_debug.sus_travel_r_out_of_range = false;
    }
    return implausibility;
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
            //int16_t pos_min = MIN(pos_l, pos_r);
            //int16_t pos_max = MAX(pos_l, pos_r);

            sus_travel.sus_travel_l_pos = pos_l;
            sus_travel.sus_travel_r_pos = pos_r;

            bool oor_implausibility = check_out_of_range(&pos_l, &pos_r);
            if (oor_implausibility) {
                
            } else {
                sus_travel.sus_travel_status = SUS_TRAVEL_RUN;
            }
        }

        if (sus_travel_state.send_can) {
            // can_send_sus_travel();
            can_send_sus_travel_debug();
            //can_send_m192_command_message();
            sus_travel_state.send_can = false;
        }
    }
}
