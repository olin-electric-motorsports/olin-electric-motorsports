#include <stdlib.h>

#include "libs/state_machine/api.h"
#include "libs/can/api.h"
#include "config.h"

enum State {
    IDLE,
    SS_CLOSED,
    PRECHARGE,
    PRECHARGE_WAIT,
    CLOSE_AIR_N,
    TS_ACTIVE,
    DISCHARGE,
    FAULT,
    NUM_STATES
} current_state;

/*
 * IDLE state will always remain in IDLE. The only way to change state is with
 * an interrupt to the SS_TSMS pin
 */
enum State transition_idle(void) {
    return IDLE;
}

/*
 * Shutdown circuit closed with TSMS.
 *
 * AIR+ is closed AND motor controller voltage < 5V -> PRECHARGE
 * else -> FAULT
 */
enum State transition_ss_closed(void) {
    if (gpio_get_pin(AIR_P_WELD_DETECT) && mc_voltage < 5.0f) {
        return PRECHARGE;
    } else {
        return FAULT;
    }
}

transition_t transitions[] = {
    [IDLE] = transition_idle,
    [SS_CLOSED] = transition_ss_closed,
};

state_machine_t sm;

int main(void) {
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);

    gpio_set_mode(SS_PRECHARGECTL, OUTPUT);
    gpio_set_mode(AIR_P_LSD, OUTPUT);

    sm.current_state = IDLE;
    sm.transitions = transitions;

    for (;;) {
        state_machine_step(&sm);    
    }
}
