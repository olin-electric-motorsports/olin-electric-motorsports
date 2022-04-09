#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "libs/gpio/api.h"
#include "throttle_config.h"
#include "utils/timer.h"
#include "vehicle/mkv/software/throttle/can_api.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>

#define IMPLAUSIBILITY_TIMEOUT_MS (100)
#define MOTOR_ANTICLOCKWISE       (1)

// Set this to lower than 10 to limit torque request (i.e. 5 limits to half of
// max torque)
#define TORQUE_REQUEST_SCALE (10)

// Represents value for 25% pedal travel to check for brake implausibility
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD (63)

// Represents value for 5% pedal travel to check for brake implausibility
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW (12)

// Represents value for 10% deviation between throttle sensors
#define APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD (25)

/*
 * Sets the torque request in the motor controller command message
 */
#define SET_TORQUE_REQUEST(torque) \
    (m192_command_message.torque_command = (torque))

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

enum State {
    THROTTLE_IDLE,
    THROTTLE_RUN,
    THROTTLE_FAULT,
    THROTTLE_OUT_OF_RANGE_UPPER,
    THROTTLE_OUT_OF_RANGE_LOWER,
    THROTTLE_POSITION_PLAUSIBILITY,
    THROTTLE_BRAKE_PRESSED
};

struct throttle_state_s {
    volatile bool send_can;
    uint16_t implausibility_fault_counter;
    bool brake_pressed;
} throttle_state = { 0 };

void timer0_isr(void) {
    throttle_state.send_can = true;
}

void pcint0_isr(void) {
    throttle.e_stop_sense = !gpio_get_pin(SS_ESTOP);
    throttle.inertia_switch_sense = !gpio_get_pin(SS_IS);
    throttle.bots_sense = !gpio_get_pin(SS_BOTS);
}

/*
 * Reads value from throttle potentiometer and maps it to a position where 0%
 * travel corresponds to 0 and 100% travel corresponds to 255.
 *
 * Returns an int16_t that represents the pedal travel
 */
static int16_t get_throttle_travel(const throttle_potentiometer_s* throttle) {
    int16_t throttle_raw = adc_read(throttle->adc_pin);

    // Voltage range between 0% and 100% pedal travel
    int16_t range = throttle->throttle_max - throttle->throttle_min;
    int16_t position = (throttle_raw - throttle->throttle_min) * 255 / range;

    return position;
}

/*
 * Checks whether either throttle sensor reads an out-of-range value.
 *
 * See 2022 Rules T.4.2.10 and T.4.2.9.
 */
static bool check_out_of_range(int16_t* pos_r, int16_t* pos_l) {
    // Check range of positions
    if (*pos_r > 255) {
        // Out of range upper
        *pos_r = 255;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        return true;
    } else if (*pos_r < 0) {
        // Out of range lower
        *pos_r = 0;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        return true;
    }

    // At this point we might return even if pos_l is out of range, but that is
    // okay because we will maintain the previous throttle request until 100ms
    // has passed at which point we will set the torque request to zero

    if (*pos_l > 255) {
        // Out of range upper
        *pos_l = 255;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        return true;
    } else if (*pos_l < 0) {
        // Out of range lower
        *pos_l = 0;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        return true;
    }

    return false;
}

/*
 * Checks for deviation between the two positions reported by the throttle
 * sensors. Deviation greater than 10% is defined as an implausibility.
 *
 * See 2022 Rules T.4.2.4 and T.4.2.5.
 */
static bool check_deviation(int16_t pos_max, int16_t pos_min) {
    // Check implausibility between pedal values (T.4.2.4/5)
    if (pos_max - pos_min > APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD) {
        gpio_set_pin(DEVIATION_IMPLAUSIBILITY_LED);
        return true;
    } else {
        return false;
    }
}

/*
 * Checks for plausibility with brake being pressed while throttle is also
 * pressed.
 *
 * See 2022 Rules EV.5.7. When the brake is pressed and the throttle pedal is
 * pressed beyond 25% pedal travel, we immediately set the torque request to
 * zero and maintain that until throttle pedal is pressed less than 5%.
 */
static bool check_brake(int16_t pos_min) {
    // Check brake plausibility (EV.5.7)
    static bool brake_implausibility_occured = false;

    if (throttle_state.brake_pressed) {
        if (pos_min >= APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD) {
            brake_implausibility_occured = true;
            gpio_set_pin(BRAKE_IMPLAUSIBILTIY_LED);
            return true;
        }

        if (brake_implausibility_occured) {
            if (pos_min <= APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW) {
                brake_implausibility_occured = false;
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    } else {
        return false;
    }
}

int main(void) {
    can_init_throttle();
    adc_init();
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);

    gpio_set_mode(BRAKE_IMPLAUSIBILTIY_LED, OUTPUT);
    gpio_set_mode(DEVIATION_IMPLAUSIBILITY_LED, OUTPUT);
    gpio_set_mode(OUT_OF_RANGE_IMPLAUSIBILITY_LED, OUTPUT);
    gpio_set_mode(RJ45_LED1, OUTPUT);
    gpio_set_mode(RJ45_LED2, OUTPUT);

    gpio_set_mode(SS_ESTOP, INPUT);
    gpio_set_mode(SS_IS, INPUT);
    gpio_set_mode(SS_BOTS, INPUT);

    gpio_enable_interrupt(SS_ESTOP);
    gpio_enable_interrupt(SS_IS);
    gpio_enable_interrupt(SS_BOTS);

    sei();
    
    // Initialize motor controller direction
    m192_command_message.direction_command = MOTOR_ANTICLOCKWISE;
    throttle.state = THROTTLE_IDLE;

     /*
     * This feature is added so that the inverter cannot be accidentally enabled
     * when first powered up. This feature requires that before sending out an
     * Inverter Enable command, the user must send out an Inverter Disable
     * command. Once the inverter sees a Disable command, the lockout is removed
     * and controller can receive the Inverter Enable command
     */
    can_send_m192_command_message();

    while (true) {
        if (run_1ms) {
            run_1ms = false;
            if (can_poll_receive_brakelight() == 0) {
                throttle_state.brake_pressed = brakelight.brake_gate;
                can_receive_brakelight();
            }

            if (can_poll_receive_dashboard() == 0) { can_receive_dashboard();

                if (!dashboard.ready_to_drive) {
                    m192_command_message.inverter_enable = false;
                    SET_TORQUE_REQUEST(0);
                    continue;
                } else {
                    m192_command_message.inverter_enable = true;
                }
            }

            int16_t pos_r = get_throttle_travel(&throttle_r);
            int16_t pos_l = get_throttle_travel(&throttle_l);


            int16_t pos_min = MIN(pos_r, pos_l);
            int16_t pos_max = MAX(pos_r, pos_l);

            if (check_brake(pos_min)) {
                SET_TORQUE_REQUEST(0);
                continue;
            }

            bool implausibility = false;
            implausibility |= check_out_of_range(&pos_r, &pos_l);
            implausibility |= check_deviation(pos_max, pos_min);

            if (implausibility) {
                throttle_state.implausibility_fault_counter++;

                if (throttle_state.implausibility_fault_counter
                    >= IMPLAUSIBILITY_TIMEOUT_MS) {
                    SET_TORQUE_REQUEST(0);
                    throttle_state.implausibility_fault_counter = 0;
                } // else maintain previous throttle request

                continue;
            } else {
                // With no implausibility...
                throttle_state.implausibility_fault_counter = 0;

                // NOTE: If we decide to do a non-linear map, that would go here
                int16_t torque_request = pos_min * TORQUE_REQUEST_SCALE;

                throttle.throttle_r_pos = (uint8_t)pos_r;
                throttle.throttle_l_pos = (uint8_t)pos_l;

                SET_TORQUE_REQUEST(torque_request);
            }

        }
        if (throttle_state.send_can) {
            can_send_throttle();
            can_send_m192_command_message();
            throttle_state.send_can = false;
        }
    }
}
