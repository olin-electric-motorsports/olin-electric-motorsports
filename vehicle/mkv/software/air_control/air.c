#include <stdlib.h>

#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
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
};

volatile enum State current_state = IDLE;

void timer0_isr(void) {
    // can_send();
}

/*
 * Interrupts
 */
void pcint0_callback(void) {
    // SS_TSMS closed
    if (gpio_get_pin(SS_TSMS)) {
        current_state = SS_CLOSED;
    }
}

void pcint1_callback(void) {
    if (gpio_get_pin(BMS_SENSE)) {

    }
}

void pcint2_callback(void) {
    if (gpio_get_pin(IMD_SENSE)) {

    }
}

static void state_machine_run(void) {
    switch (current_state) {
        case IDLE: {
            /*
             * Do nothing. The state will be updated in the pcint0_callback when
             * the TSMS shutdown sense is triggered.
             */
        } break;
        case SS_CLOSED: {
            if (gpio_get_pin()) {

            }
        } break;


        case FAULT: {

        } break;
        default: {
            // Shouldn't happen, but just in case
            current_state = FAULT:
        } break;
    }
}

int main(void) {
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);

    gpio_set_mode(PRECHARGE_CTL, OUTPUT);
    gpio_set_mode(AIR_P_LSD, OUTPUT);

    gpio_enable_interrupt(SS_TSMS);
    gpio_enable_interrupt(BMS_SENSE);
    gpio_enable_interrupt(IMD_SENSE);

    for (;;) {
        state_machine_run();
    }
}
