typedef int state_t;
typedef state_t (*transition_t)(void);

typedef struct {
    state_t current_state;
    transition_t* transitions;
} state_machine_t;

void state_machine_step(state_machine_t* sm) {
    sm->current_state = (sm->transitions[sm->current_state])();
}
