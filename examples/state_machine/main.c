#include "libs/state_machine/api.h"
#include <stdlib.h>
#include <stdio.h>

#define INIT (0)
#define SECOND (1)
#define THIRD (2)

state_t init_transition(void) {
    static int i = 0;
    if (i++ == 4) {
        return SECOND;
    } else {
        return INIT;
    }
}

state_t second_transition(void) {
    static int i = 0;
    if (i++ == 2) {
        return THIRD;
    } else {
        return SECOND;
    }
}

transition_t transitions[] = {
    [INIT] = init_transition,
    [SECOND] = second_transition,
    [THIRD] = NULL,
};

state_machine_t sm;

int main(void) {
    sm.current_state = INIT;
    sm.transitions = transitions;

    for (;;) {
        printf("Current state: %i\n", sm.current_state);
        state_machine_step(&sm);
    }
}
