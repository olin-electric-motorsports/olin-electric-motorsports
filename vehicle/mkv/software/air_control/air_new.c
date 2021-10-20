#include <stdlib.h>

#include "libs/state_machine/api.h"
#include "libs/can/api.h"
#include "config.h"

#define STATE_IDLE (0)
#define STATE_SS_CLOSED (1)
#define STATE_PRECHARGE (2)
#define STATE_PRECHARGE_WAIT (3)
#define STATE_CLOSE_AIR_N (4)
#define STATE_TRACTIVE_ACTIVE (5)
#define STATE_DISCHARGE (6)
#define STATE_FAULT (7)

/*
 * IDLE state will always remain in IDLE. The only way to change state is with
 * an interrupt to the SS_TSMS pin
 */
state_t transition_idle(void) {
    return STATE_IDLE;
}

/*
 * Shutdown circuit closed with TSMS.
 *
 * AIR+ is closed AND motor controller voltage < 5V -> STATE_PRECHARGE
 * else -> STATE_FAULT
 */
state_t transition_ss_closed(void) {
    if (gpio_get_pin(AIR_P_WELD_DETECT) && mc_voltage < 5.0f) {
        return STATE_PRECHARGE;
    } else {
        return STATE_FAULT;
    }
}

transition_t transitions[] = {
    [STATE_IDLE] = transition_idle,
    [STATE_SS_CLOSED] = transition_ss_closed,
};

state_machine_t sm;

int main(void) {
    can_init(BAUD_500KBPS);

    sm.current_state = STATE_IDLE;
    sm.transitions = transitions;

    for (;;) {
        state_machine_step(&sm);    
    }
}
