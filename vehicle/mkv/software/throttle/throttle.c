#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "libs/gpio/api.h"
#include "throttle_config.h"
#include "utils/timer.h"
#include "vehicle/mkv/software/throttle/can_api.h"

#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#define IMPLAUSIBILITY_TIMEOUT (100) // 10 * 10ms
#define MOTOR_ANTICLOCKWISE    (1)

// Set this to lower than 10 to limit torque request (i.e. 5 limits to half of
// max torque)
#define TORQUE_REQUEST_SCALE (10)

// TODO: comment and add reference to rules
#define APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD (0.25)

#define APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD (0.10)

/*
 * Sets the torque request in the motor controller command message
 */
#define SET_TORQUE_REQUEST(torque) \
    (m192_command_message.torque_command = (torque))

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

typedef enum {
    THROTTLE_IDLE = 0,
    THROTTLE_RUN,
    THROTTLE_IMPLAUSIBILITY,
    THROTTLE_FAULT
} throttle_state_e;

// copied from air.c for now, but really should be made available via CAN api in
// future
typedef enum {
    AIR_STATE_INIT = 0,
    AIR_STATE_IDLE,
    AIR_STATE_SHUTDOWN_CIRCUIT_CLOSED,
    AIR_STATE_PRECHARGE,
    AIR_STATE_TS_ACTIVE,
    AIR_STATE_DISCHARGE,
    AIR_STATE_FAULT,
} air_state_e;

struct throttle_state_s {
    throttle_state_e state;
    volatile bool send_can;
    uint16_t throttle_r_position;
    uint16_t throttle_l_position;
    uint16_t rolling_sum;
    uint16_t implausibility_fault_counter;
    bool brake_pressed;
    bool ready_to_drive;
    air_state_e air_state;
} throttle_state = { 0 };

void timer0_isr(void) {
    throttle_state.send_can = true;
}

void pcint0_isr(void) {
    // Check if shutdown circuit node states
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
static int16_t
get_throttle_travel_pct(const throttle_potentiometer_s* throttle) {
    uint16_t throttle_raw = adc_read(throttle->adc_pin);

    // Voltage range between 0% and 100% pedal travel
    uint16_t range = throttle->throttle_max - throttle->throttle_min;

    // Pedal position percentage (between 0 and 1)
    float position_pct
        = (float)(throttle_raw - throttle->throttle_min) / (float)range;

    return (int16_t)round(position_pct * 255);
}

static bool check_out_of_range(int16_t* pos_r, int16_t* pos_l) {
    // Check range of positions
    if (*pos_r > 255) {
        // Out of range upper
        *pos_r = 255;
        return true;
    } else if (*pos_r < 0) {
        // Out of range lower
        *pos_r = 0;
        return true;
    }

    // At this point we might return even if pos_l is out of range, but that is
    // okay because we will maintain the previous throttle request until 100ms
    // has passed at which point we will set the torque request to zero

    if (*pos_l > 255) {
        // Out of range upper
        *pos_l = 255;
        return true;
    } else if (*pos_l < 0) {
        // Out of range lower
        *pos_l = 0;
        return true;
    }

    return false;
}

static bool check_deviation(int16_t pos_max, int16_t pos_min) {
    // Check implausibility between pedal values (T.4.2.4/5)
    if (pos_max - pos_min > APPS_IMPLAUSIBILITY_DEVIATION_THRESHOLD) {
        return true;
    } else {
        return false;
    }
}

static bool check_brake(int16_t pos_min) {
    // Check brake plausibility (EV.5.7)
    if ((throttle_state.brake_pressed)
        && (pos_min >= APPS_BRAKE_IMPLAUSIBILITY_THRESHOLD)) {
        return true;
    } else {
        return false;
    }
}

int main(void) {
    can_init_throttle();
    adc_init();
    timer_init(&timer0_cfg);

    gpio_set_mode(DEBUG_LED1, OUTPUT);
    gpio_set_mode(DEBUG_LED2, OUTPUT);
    gpio_set_mode(DEBUG_LED3, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);

    gpio_set_mode(SS_ESTOP, INPUT);
    gpio_set_mode(SS_IS, INPUT);
    gpio_set_mode(SS_BOTS, INPUT);

    gpio_enable_interrupt(SS_ESTOP);
    gpio_enable_interrupt(SS_IS);
    gpio_enable_interrupt(SS_BOTS);

    sei();

    // Initialize motor controller direction
    m192_command_message.direction_command = MOTOR_ANTICLOCKWISE;

    can_send_m192_command_message();

    while (true) {
        if (run_1ms) {
            // External CAN messages
            if (can_poll_receive_air_control_critical() == 0) {
                throttle_state.air_state = air_control_critical.state;

                can_receive_air_control_critical();

                if (air_control_critical.state != AIR_STATE_TS_ACTIVE) {
                    continue;
                }
            }

            if (can_poll_receive_brakelight() == 0) {
                throttle_state.brake_pressed = brakelight.brake_gate;
                can_receive_brakelight();
            }

            if (can_poll_receive_dashboard() == 0) {
                can_receive_dashboard();

                if (!dashboard.ready_to_drive) {
                    continue;
                }
            }

            if (!throttle_state.ready_to_drive) {
                SET_TORQUE_REQUEST(0);
                continue;
            }

            int16_t pos_r = get_throttle_travel_pct(&throttle_r);
            int16_t pos_l = get_throttle_travel_pct(&throttle_l);
            int16_t pos_min = MIN(pos_r, pos_l);
            int16_t pos_max = MAX(pos_r, pos_l);

            static bool implausibility = false;
            implausibility |= check_out_of_range(&pos_r, &pos_l);
            implausibility |= check_deviation(pos_max, pos_min);
            implausibility |= check_brake(pos_min);

            if (implausibility) {
                throttle_state.implausibility_fault_counter++;

                if (throttle_state.implausibility_fault_counter
                    >= IMPLAUSIBILITY_TIMEOUT) {
                    SET_TORQUE_REQUEST(0);
                } // else maintain previous throttle request

                continue;
            } else {
                // With no implausibility...
                int16_t torque_request
                    = (int16_t)round(pos_min * TORQUE_REQUEST_SCALE);
                SET_TORQUE_REQUEST(torque_request);
            }

            if (throttle_state.send_can) {
                can_send_throttle();
                can_send_m192_command_message();
            }
        }
    }
}
