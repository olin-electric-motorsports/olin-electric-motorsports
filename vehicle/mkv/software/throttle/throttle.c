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

#include <math.h>
#include <util/delay.h>

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
    THROTTLE_OUT_OF_RANGE,
    THROTTLE_POSITION_IMPLAUSIBILITY,
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

void pcint0_callback(void) {
    throttle.ss_estop_driver = !gpio_get_pin(SS_ESTOP);
    throttle.ss_is = !gpio_get_pin(SS_IS);
    throttle.ss_bots = !gpio_get_pin(SS_BOTS);
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
    float position_pct
        = (float)(throttle_raw - throttle->throttle_min) / (float)range;

    return floor(position_pct * 255);
}

/*
 * Checks whether either throttle sensor reads an out-of-range value.
 *
 * See 2022 Rules T.4.2.10 and T.4.2.9.
 */
static bool check_out_of_range(int16_t* pos_r, int16_t* pos_l) {
    bool implausibility = false;
    // Check range of positions
    if (*pos_r > 255) {
        // Out of range upper
        *pos_r = 255;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        throttle.state = THROTTLE_OUT_OF_RANGE;
        implausibility = true;
    } else if (*pos_r < 0) {
        // Out of range lower
        *pos_r = 0;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        throttle.state = THROTTLE_OUT_OF_RANGE;
        implausibility = true;
    } else {
        gpio_clear_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
    }

    if (*pos_l > 255) {
        // Out of range upper
        *pos_l = 255;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        throttle.state = THROTTLE_OUT_OF_RANGE;
        implausibility = true;
    } else if (*pos_l < 0) {
        // Out of range lower
        *pos_l = 0;
        gpio_set_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        throttle.state = THROTTLE_OUT_OF_RANGE;
        implausibility = true;
    } else {
        gpio_clear_pin(OUT_OF_RANGE_IMPLAUSIBILITY_LED);
        // Will be reset if Ready to Drive is not on
        throttle.state = THROTTLE_RUN;
    }

    return implausibility;
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
        throttle.state = THROTTLE_POSITION_IMPLAUSIBILITY;
        return true;
    } else {
        gpio_clear_pin(DEVIATION_IMPLAUSIBILITY_LED);
        throttle.state = THROTTLE_RUN;
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
 *
 * If there is an implausibility, torque request is set to zero by the caller
 * (see the `main` function)
 *
 * Returns true if implausibility occurs
 */
static bool check_brake(int16_t pos_min) {
    static bool brake_implausibility_occured = false;

    // If the brake is pressed...
    if (throttle_state.brake_pressed) {
        // ...and pedal travel is greater than 25%
        if (pos_min >= APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD) {
            // A brake implausibility occured
            brake_implausibility_occured = true;
            throttle.state = THROTTLE_BRAKE_PRESSED;
            gpio_set_pin(BRAKE_IMPLAUSIBILTIY_LED);
            return true;
        } else {
            // If brake is pressed but pedal is less than 25%, we can continue
            return false;
        }

        // If a brake implausibility previously occured...
        if (brake_implausibility_occured) {
            // But now the pedal is less than 5% travel
            if (pos_min <= APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW) {
                // No more implausibility
                brake_implausibility_occured = false;
                throttle.state = THROTTLE_RUN;
                gpio_clear_pin(BRAKE_IMPLAUSIBILTIY_LED);
                return false;
            } else {
                // But if the pedal IS greater than 5% travel, still
                // implausibility
                return true;
            }
        } else {
            // If an implausibility didn't previously occur, we're good
            gpio_clear_pin(BRAKE_IMPLAUSIBILTIY_LED);
            throttle.state = THROTTLE_RUN;
            return false;
        }
    } else {
        // If the brake is NOT pressed, but a brake implausibility previously
        // occured...
        if (brake_implausibility_occured) {
            // AND the pedal is further than 5% travel, we still have an
            // implausibility
            if (pos_min > APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD_LOW) {
                return true;
            } else {
                // We finally can get rid of the implausibility once the brake
                // is no longer pressed and the throttle is also not pressed
                brake_implausibility_occured = false;
                gpio_clear_pin(BRAKE_IMPLAUSIBILTIY_LED);
                throttle.state = THROTTLE_RUN;
                return false;
            }
        } else {
            // If the brake isn't pressed, and we didn't previously have an
            // implausibility, we're good
            gpio_clear_pin(BRAKE_IMPLAUSIBILTIY_LED);
            throttle.state = THROTTLE_RUN;
            return false;
        }
    }
}

int main(void) {
    sei();

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

    throttle.state = THROTTLE_IDLE;

    pcint0_callback();

    /*
     * This feature is added so that the inverter cannot be accidentally enabled
     * when first powered up. This feature requires that before sending out an
     * Inverter Enable command, the user must send out an Inverter Disable
     * command. Once the inverter sees a Disable command, the lockout is removed
     * and controller can receive the Inverter Enable command
     */
    m192_command_message.direction_command = MOTOR_ANTICLOCKWISE;
    can_send_m192_command_message();

    can_receive_brakelight();
    can_receive_dashboard();

    while (true) {
        if (run_1ms) {
            run_1ms = false;
            if (can_poll_receive_brakelight() == 0) {
                throttle_state.brake_pressed = brakelight.brake_gate;
                can_receive_brakelight();
            }

            if (can_poll_receive_dashboard() == 0) {
                can_receive_dashboard();

                bool ready_to_drive = dashboard.ready_to_drive;
                if (ready_to_drive) {
                    m192_command_message.inverter_enable = false;
                } else {
                    m192_command_message.inverter_enable = true;
                }
            }

            int16_t pos_l = get_throttle_travel(&throttle_l);
            int16_t pos_r = get_throttle_travel(&throttle_r);

            int16_t pos_min = MIN(pos_r, pos_l);
            int16_t pos_max = MAX(pos_r, pos_l);

            bool oor_implausibility = check_out_of_range(&pos_r, &pos_l);
            bool deviation_implausibility = check_deviation(pos_max, pos_min);

            throttle.throttle_l_pos = pos_l;
            throttle.throttle_r_pos = pos_r;

            if (check_brake(pos_min)) {
                SET_TORQUE_REQUEST(0);
                continue;
            }

            if (!dashboard.ready_to_drive) {
                SET_TORQUE_REQUEST(0);
                throttle.state = THROTTLE_IDLE;
                continue;
            }

            // If we get an implausibility
            if (oor_implausibility || deviation_implausibility) {
                // Increment the timer-counter
                throttle_state.implausibility_fault_counter++;

                // If the timer-counter reaches IMPLAUSIBILITY_TIMEOUT_MS
                // (i.e. we have an implausibility for 100ms
                if (throttle_state.implausibility_fault_counter
                    >= IMPLAUSIBILITY_TIMEOUT_MS) {
                    // Set appropriate state

                    SET_TORQUE_REQUEST(0);
                    throttle_state.implausibility_fault_counter = 0;
                } else {
                    // Maintain previous throttle request
                }

                continue;
            } else {
                // With no implausibility...
                throttle.state = THROTTLE_RUN;
                throttle_state.implausibility_fault_counter = 0;

                // NOTE: If we decide to do a non-linear map, that would go here
                int16_t torque_request = pos_min * TORQUE_REQUEST_SCALE;

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
