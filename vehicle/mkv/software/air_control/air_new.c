#include <stdlib.h>

#include "libs/state_machine/api.h"
#include "libs/can/api.h"

#define STATE_IDLE (0)
#define STATE_PRECHARGE (1)
#define STATE_CLOSE_AIR_P (2)
#define STATE_TRACTIVE_ACTIVE (3)
#define STATE_DISCHARGE (4)
#define STATE_FAULT (5)

state_t transition_idle(void) {
    // Read digital from AIR sensor
    // Read shutdown sense
    return STATE_PRECHARGE;
}

transition_t transitions[] = {
    [STATE_IDLE] = transition_idle,
    [STATE_PRECHARGE] = transition_precharge,
    [STATE_CLOSE_AIR_P] = transition_close_air_p,
    [STATE_TRACTIVE_ACTIVE] = transition_tractive_active,
    [STATE_DISCHARGE] = transition_discharge,
    [STATE_FAULT] = transition_fault,
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
