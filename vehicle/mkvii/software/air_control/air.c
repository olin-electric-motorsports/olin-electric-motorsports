#include <avr/interrupt.h>
#include <stdbool.h>
#include <stdlib.h>
#include <util/delay.h>

#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include "air_config.h"
#include "vehicle/mkvii/software/air_control/can_api.h"

// question: wtf does the bootloader do?
#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
main updates:
- update gpio pins
- condense prev 2 precharge states into 1
- listen to g meter
- change order of initial checks


Tasks
* Hear CAN from G-meter
* Hear CAN from BMS
* Read shutdown node status
* Actuate AIR+
* monitor welding
* monitor IMD status
* Precharge control

State Machine
* Idle - nothing
* Precherge start
  * air closed within 200ms
  * Close precharge realy
  * make sure we hit votlage and time target
* TS active
  * read for shutdown node fault
* Discharge
  * open AIR+ lsd
  * monitor TS voltage
* Error
  * clear all LSDs
  * merge precharge; 200ms, make sure relay is actually closed; after 5 seconds
  * precharge: reaches 90% voltage or times out (then error state)

Keep track these events:
* BMS CAN
* G-meter CAN
* precharge start time
* discharge start time
- also: timer
*/

/*
running list of changes from mkvi airs firmware:
- got rid of set_charger_connected
*/

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

volatile bool send_can = false;

void timer0_isr(void) {
    send_can = true;
}

// interrupts for various gpio pins (for ss nodes and errors)
void pcint0_callback(void) {
    air_control_critical.ss_tsms = !gpio_get_pin(SS_TSMS);
    air_control_critical.ss_imd = !gpio_get_pin(SS_IMD_LATCH);
    air_control_critical.ss_mpc = !gpio_get_pin(SS_MPC);
    air_control_critical.ss_tsmps = !gpio_get_pin(SS_TSMP);
    air_control_critical.ss_emeter = !gpio_get_pin(SS_EMETER);
}

void pcint1_callback(void) {
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);
    air_control_critical.ss_bms = !gpio_get_pin(SS_BMS);
}

void pcint2_callback(void) {
    air_control_critical.ss_hvd = !gpio_get_pin(SS_HVD);
    air_control_critical.imd_status = !!gpio_get_pin(IMD_SENSE);
    if (!air_control_critical.imd_status) {
        set_fault(AIR_FAULT_IMD_STATUS);
    }
}

static bool set_fault(enum air_fault_e the_fault) {
    // dual purpose: update CAN fault + return true for fault
    gpio_set_pin(ERROR_LED);

    if (air_control_critical.air_fault == AIR_FAULT_NONE) {
        // Only update fault state for the first fault to occur
        air_control_critical.air_fault = the_fault;
    }
    return true; // returning true for fault state checking
}

static bool initial_checks(void) {
    /*
     * INitial Checks -- make sure all nodes are fine
      1) BMS can talk to + battery voltage
      2) TSMS check
      3) G-meter readings
      4) AIR weld check (check if AIR+ or AIR- can't open)
      5) IMD latch check
    */
    int rc = 0;
    bool fault = false;

    // 1) BMS check
    // Will poll for 1 second, if the CAN msg not received, will fault

    int16_t bms_voltage = 0;
    // TODO: look into function and return values of this function
    rc = get_bms_voltage(&bms_voltage);

    if (rc == 1) {
        fault = set_fault(AIR_FAULT_CAN_ERROR);
        can_send_air_control_critical();
        return fault;
    } else if (rc == 2) {
        fault = set_fault(AIR_FAULT_CAN_BMS_TIMEOUT);
        can_send_air_control_critical();
        return fault;
    }
    if (tractive_sys == MOTOR_CONTROLLER) {
        if (bms_voltage < BMS_VOLTAGE_THRESHOLD_LOW) {
            fault = set_fault(AIR_FAULT_BMS_VOLTAGE);
            can_send_air_control_critical();
            return fault;
        }
    }

    // 2) TSMS check
    if (!gpio_get_pin(SS_TSMS)) {
        // SS_TSMS should start high
        air_control_critical.ss_tsms = true;
        fault = set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
        can_send_air_control_critical();
        return fault;
    }

    // 3) TODO: change this to g meter calls
    int16_t mc_voltage = 0;
    rc = get_tractive_voltage(&mc_voltage, tractive_sys, 1000);

    if (rc == 1) {
        fault = set_fault(AIR_FAULT_CAN_ERROR);
        return fault;
    } else if (rc == 2) {
        set_fault(AIR_FAULT_CAN_MC_TIMEOUT);
        fault = true;
        return fault;
    }

    if (tractive_sys == MOTOR_CONTROLLER) {
        if (mc_voltage > TRACTIVE_THRESHOLD_LOW_dV) {
            set_fault(AIR_FAULT_TRACTIVE_VOLTAGE);
            fault = true;
            return fault;
        }
    }

    can_send_air_control_critical();

    // 4) AIR Weld check
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);

    if (air_control_critical.air_p_status) {
        fault = set_fault(AIR_FAULT_AIR_P_WELD);
        can_send_air_control_critical();
        return fault;
    }

    can_send_air_control_critical();

    if (air_control_critical.air_n_status) {
        fault = set_fault(AIR_FAULT_AIR_N_WELD);
        can_send_air_control_critical();
        return fault;
    }

    // 5) IMD latch check

    // Wait for IMD to stabilize
    _delay_ms(IMD_STABILITY_CHECK_DELAY_MS);

    if (!air_control_critical.ss_imd) {
        fault = set_fault(AIR_FAULT_IMD_STATUS);
        can_send_air_control_critical();
        return fault;
    }

    // might as well send here at end for redundancy? eh minor
    can_send_air_control_critical();
}

// TODO: state machine to run through sequence
// --> thinking can pull from old state_machine_run
// --> architecture of old firmware decent

int main(void) {
    can_init_air_control();
    timer_init(&timer0_cfg);
    // timer_init(&timer1_cfg); add back
    // updater_init(BTLDR_ID, 5); add back maybe

    gpio_set_mode(PRECHARGE_CTL, OUTPUT);
    gpio_set_mode(AIR_N_LSD, OUTPUT);
    gpio_set_mode(HEARTBEAT_LED, OUTPUT);
    gpio_set_mode(ERROR_LED, OUTPUT);

    gpio_set_mode(IMD_SENSE, INPUT);
    gpio_set_mode(SS_TSMS, INPUT);
    gpio_set_mode(SS_IMD_LATCH, INPUT);
    gpio_set_mode(SS_BMS, INPUT);
    gpio_set_mode(SS_MPC, INPUT);
    gpio_set_mode(SS_TSMP, INPUT);
    gpio_set_mode(SS_HVD, INPUT);

    gpio_enable_interrupt(SS_TSMS);
    gpio_enable_interrupt(SS_IMD_LATCH);
    gpio_enable_interrupt(SS_BMS);
    gpio_enable_interrupt(SS_MPC);
    gpio_enable_interrupt(SS_TSMP);
    gpio_enable_interrupt(SS_HVD);

    gpio_enable_interrupt(AIR_N_WELD_DETECT);
    gpio_enable_interrupt(AIR_P_WELD_DETECT);

    // Ensure pull-ups are disabled
    gpio_clear_pin(SS_TSMS);
    gpio_clear_pin(SS_BMS);
    gpio_clear_pin(SS_IMD_LATCH);
    gpio_clear_pin(SS_MPC);
    gpio_clear_pin(SS_TSMP);
    gpio_clear_pin(SS_HVD);

    sei();
    air_control_critical.air_state = AIR_STATE_INIT;

    can_send_air_control_critical();

    set_charger_connected();

    can_send_air_control_critical();

    gpio_set_pin(GENERAL_LED);

    pcint0_callback();
    pcint1_callback();
    pcint2_callback();

    // IMD takes a while to warm up, so just set it to work
    air_control_critical.imd_status = true;
    if (initial_checks()) {
        goto fault;
    }

    // Now enable the IMD
    gpio_enable_interrupt(IMD_SENSE);

    // Clear general LED to indicate that initialization has completed
    gpio_clear_pin(GENERAL_LED);

    // Get initial states of pins
    pcint0_callback();
    pcint1_callback();
    pcint2_callback();

    can_send_air_control_critical();

    air_control_critical.air_state = AIR_STATE_IDLE;

    while (1) {
        if (run_1ms) {
            state_machine_run();
            run_1ms = false;
        }

        // Updates can only occur when the AIR control state machine is in IDLE
        if (air_control_critical.air_state == AIR_STATE_IDLE) {
            updater_loop();
        }

        if (send_can) {
            can_send_air_control_critical();
            send_can = false;
        }
    }

fault:
    gpio_set_pin(FAULT_LED);

    while (1) {
        // Allow updates in the event of a fault
        updater_loop();

        /*
         * Continue senging CAN messages
         */
        if (send_can) {
            can_send_air_control_critical();
            send_can = false;
        }
    };
}
