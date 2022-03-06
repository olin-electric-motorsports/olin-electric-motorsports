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

#define ROLLING_AVG_SIZE          8
#define IMPLAUSIBILITY_TIMEOUT_MS 100

uint8_t deviation_counter = 0; // keeps track of elapsed time of >= 10%
                               // deviation in mapped throttle values

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
    uint16_t throttle0_processed_position;
    uint16_t throttle1_processed_position;
    uint16_t throttle_values[8];
    uint16_t rolling_sum;
    uint8_t implausibility_fault_counter;
    bool brake_pressed;
    bool ready_to_drive;
    air_state_e air_state;
} throttle_state = { 0 };

void timer0_isr(void) {
    // Can timer
    throttle_state.send_can = true;
}

void pcint0_isr(void) {
    // Check if shutdown circuit node states
    throttle.e_stop_sense = !gpio_get_pin(SS_ESTOP);
    throttle.inertia_switch_sense = !gpio_get_pin(SS_IS);
    throttle.bots_sense = !gpio_get_pin(SS_BOTS);
}

uint16_t read_and_process_throttle_pot(throttle_potentiometer_s* throttle) {
    uint16_t throttle_raw_counts = adc_read(throttle->adc_pin);
    if (throttle_raw_counts < throttle->throttle_min) {
        throttle_raw_counts = throttle->throttle_min;
    } else if (throttle_raw_counts > throttle->throttle_max) {
        throttle_raw_counts = throttle->throttle_max;
    }

    return ((throttle_raw_counts - throttle->throttle_min) * 255)
           / (throttle->throttle_max - throttle->throttle_min);
}

/*
 * This function takes in an the mapped throttle voltages, finds their average,
 * and then calculates the rolling average.
 */
void get_average_throttle_position() {
    read_and_process_throttle_pot(&throttle_0);
    read_and_process_throttle_pot(&throttle_1);
    // Get average throttle pos values
    static uint8_t throttle_array_index = 0;

    // Divide by 2 to get average and then by 8 for rolling sum (Shift by 4
    // total)
    uint16_t new_throttle_value
        = ((throttle_state.throttle0_processed_position
            + throttle_state.throttle1_processed_position)
           >> 4);

    // Remove oldest throttle value
    throttle_state.rolling_sum
        -= (uint16_t)throttle_state.throttle_values[throttle_array_index];
    // Add in newest throtlle value and save to buffer
    throttle_state.rolling_sum += new_throttle_value;
    throttle_state.throttle_values[throttle_array_index] = new_throttle_value;

    // Increment throttle_val_index
    throttle_array_index++;
    if (throttle_array_index == ROLLING_AVG_SIZE) {
        throttle_array_index = 0;
    }
}
/*
 * This function detects if there is an implausibility due to a deviation
 * in throttle values.
 *
 * Compare mapping of the two voltages to detect implausibility
 * 	Implausibility is if throttle position between sensors
 * 	deviates more than 10% (T.4.2.4, T.4.2.5)
 * 	If implausility persists more than 100 msec, cut power to throttle
 *
 * returns integer. 0 means good state, 1 means implausible
 */
int check_implausibility() {
    uint8_t throttle_diff = (throttle_state.throttle0_processed_position
                             - throttle_state.throttle1_processed_position)
                            * 10;

    if (throttle_diff > 255 || throttle_diff < 255) {
        throttle_state.implausibility_fault_counter += 1;
    } else {
        throttle_state.implausibility_fault_counter = 0;
    }

    return (int)(throttle_state.implausibility_fault_counter
                 > IMPLAUSIBILITY_TIMEOUT_MS);
}

int main(void) {
    can_init(BAUD_500KBPS);
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

    // Initialize interrupts
    sei();

    // Initialize motor controller
    m192_command_message.torque_command = 0;
    m192_command_message.speed_command = 0;
    m192_command_message.direction_command = 1; // anticlockwise
    m192_command_message.inverter_enable = 0;
    m192_command_message.inverter_discharge = 0;
    m192_command_message.speed_mode_enable = 0;
    m192_command_message.rolling_counter = 0;
    m192_command_message.torque_command = 0;
    can_send_m192_command_message();

    while (1) {
        if (run_1ms) {
            // Faults detects
            // state trap is throttle and brake

            if (can_poll_receive_air_control_critical() == 0) {
                throttle_state.air_state = air_control_critical.state;
                can_receive_air_control_critical();
            }
            if (throttle_state.air_state == AIR_STATE_FAULT) {
                throttle_state.state = THROTTLE_FAULT;
            }

            if (can_poll_receive_brakelight() == 0) {
                throttle_state.brake_pressed = brakelight.brake_gate;
                can_receive_brakelight();
            }

            if (can_poll_receive_dashboard() == 0) {
                throttle_state.ready_to_drive = dashboard.ready_to_drive;
                can_receive_dashboard();
            }

            switch (throttle_state.state) {
                case THROTTLE_IDLE: {
                    m192_command_message.torque_command = 0;
                    if (throttle_state.ready_to_drive) {
                        throttle_state.state = THROTTLE_RUN;
                    }
                    break;
                }
                case THROTTLE_RUN: {
                    get_average_throttle_position();

                    // Brake has precedence over throttle
                    if (throttle_state.brake_pressed) {
                        m192_command_message.torque_command = 0;
                    } else {
                        m192_command_message.torque_command
                            = throttle_state.rolling_sum;
                    }

                    if (!(throttle_state.air_state
                          == AIR_STATE_TS_ACTIVE)) { // Switch to postive enums
                                                     // cases?
                        throttle_state.state = THROTTLE_IDLE;
                    } else if (!check_implausibility()) {
                        throttle_state.state = THROTTLE_IMPLAUSIBILITY;
                    }
                    break;
                }
                // This case could be lumped in with the brake if statment
                // above, but is seperated out for easy debugging
                case THROTTLE_IMPLAUSIBILITY: {
                    // Need to update throttle val to leave implausibility
                    // state
                    get_average_throttle_position();
                    m192_command_message.torque_command = 0;
                    if (!check_implausibility()) {
                        throttle_state.state = THROTTLE_RUN;
                    }
                    break;
                }
                case THROTTLE_FAULT: {
                    m192_command_message.torque_command = 0;
                    // Anything else?
                    break;
                }
            }

            if (throttle_state.send_can) {
                can_send_throttle();
                can_send_m192_command_message();
            }
        }
    }
}

// can timeout?
