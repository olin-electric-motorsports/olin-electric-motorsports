#include "bms_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>
#include <stdbool.h>

#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/tasks/tasks.h"
#include "vehicle/mkv/software/bms/utils/fault.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

enum State {
    INIT = 0,
    ACTIVE,
    DISCHARGING,
    CHARGING,
    FAULT,
};

enum AIR_State {
    AIR_STATE_INIT = 0,
    AIR_STATE_IDLE,
    AIR_STATE_SHDN_CLOSED,
    AIR_STATE_PRECHARGE,
    AIR_STATE_TS_ACTIVE,
    AIR_STATE_DISCHARGE,
    AIR_STATE_FAULT,

    AIR_STATE_CHARGING_IDLE,
    AIR_STATE_CHARGING_SHDN_CLOSED,
    AIR_STATE_CHARGING_ACTIVE,
} air_state
    = AIR_STATE_IDLE;

/*
 * Interrupts
 */
static volatile bool run_10ms = false;

void timer0_isr(void) {
    run_10ms = true;
}

/*
 * Interrupt for nOCD
 */
void pcint0_callback(void) {
    bms_core.overcurrent_detect = !gpio_get_pin(nOCD);
}

/*
 * Interrupt for BSPD_CURRENT_SENSE
 */
void pcint2_callback(void) {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
}

/*
 * Perform initial startup checks on the BMS.
 *
 * - Checks all temperatures and voltages and ensures they are in range
 */
static int initial_checks(void) {
    int rc = 0;

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;
    uint8_t retry = 0;

    do {
        uint16_t pack_voltage = 0;
        rc = voltage_task(&pack_voltage, &ov, &uv);
        bms_core.pack_voltage = pack_voltage;
        bms_metrics.voltage_pec_error_count += rc;

        if (retry >= MAX_PEC_RETRY) {
            rc = 1;
            set_fault(BMS_FAULT_PEC);
            goto bail;
        } else {
            retry++;
        }
    } while (rc != 0);

    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
        rc = 1;
        goto bail;
    } else if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        rc = 1;
        goto bail;
    }

    // Read all temperatures
    uint32_t ot = 0; // Over-temperature
    uint32_t ut = 0; // Under-temperature
    int16_t min_temp, max_temp;

    for (uint16_t i = 0; i < NUM_MUXES * NUM_MUX_CHANNELS; i++) {
        rc = temperature_task(&ot, &ut, &min_temp, &max_temp);
        bms_metrics.temperature_pec_error_count += rc;
    }

    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

    // TODO: openwire_task();
    // TODO: current_task();

bail:
    return rc;
}

/*
 * Primary state machine function
 */
static void state_machine_run(void) {
    if (bms_core.bms_fault_state != BMS_FAULT_NONE) {
        bms_core.bms_state = FAULT;
        gpio_clear_pin(BMS_RELAY_LSD);
    }

    /*
     * Read voltages
     */
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    int rc = voltage_task(&pack_voltage, &ov, &uv);
    bms_core.pack_voltage = pack_voltage;

    if (rc) {
        bms_metrics.voltage_pec_error_count += rc;

        if (bms_metrics.voltage_pec_error_count >= MAX_PEC_IN_A_ROW) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = FAULT;
        }
        return;
    } else {
        bms_metrics.voltage_pec_error_count = 0;
    }

    /*
     * Read temperatures
     */
    uint32_t ot = 0;
    uint32_t ut = 0;
    int16_t min_temp, max_temp;

    // uint16_t pack_temperature;
    rc = temperature_task(&ot, &ut, &min_temp, &max_temp);

    bms_sense.min_temperature = min_temp;
    bms_sense.max_temperature = max_temp;

    if (ut > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_UNDERTEMPERATURE);
        bms_core.bms_state = FAULT;
        return;
    } else if (ot > MAX_EXTRANEOUS_TEMPERATURES) {
        set_fault(BMS_FAULT_OVERTEMPERATURE);
        bms_core.bms_state = FAULT;
        return;
    }

    /*
     * Check for PEC errors
     */
    if (rc) {
        bms_metrics.temperature_pec_error_count += rc;

        if (bms_metrics.temperature_pec_error_count >= MAX_PEC_IN_A_ROW) {
            set_fault(BMS_FAULT_PEC);
            bms_core.bms_state = FAULT;
        }
    } else {
        bms_metrics.temperature_pec_error_count = 0;
    }

    /*
     * Check for open-wires
     */
    // TODO: rc = openwire_task();

    int16_t current = 0;
    uint16_t vref = 0;
    uint16_t vout = 0;
    current_task(&current, &vref, &vout);
    bms_core.pack_current = current;
    bms_sense.current_vref = vref;
    bms_sense.current_vout = vout;

    switch (bms_core.bms_state) {
        case ACTIVE: {
            gpio_set_pin(BMS_RELAY_LSD);

            if (uv > 0) {
                set_fault(BMS_FAULT_UNDERVOLTAGE);
                bms_core.bms_state = FAULT;
            } else if (ov > 0) {
                set_fault(BMS_FAULT_OVERVOLTAGE);
                bms_core.bms_state = FAULT;
            }
        } break;
        case CHARGING: {
            gpio_set_pin(BMS_RELAY_LSD);

            if (ov > 0) {
                gpio_clear_pin(BMS_RELAY_LSD);
                set_fault(BMS_FAULT_OVERVOLTAGE);
                bms_core.bms_state = FAULT;
            }
        } break;
        case FAULT: {
            gpio_clear_pin(BMS_RELAY_LSD);
            gpio_set_pin(FAULT_LED);
        } break;
        default: {
            // Just to be safe. This shouldn't happen
            bms_core.bms_fault_state = BMS_FAULT_DIAGNOSTICS_FAIL;
            bms_core.bms_state = FAULT;
        } break;
    }
}

int main(void) {
    sei();

    can_init_bms();
    updater_init(BTLDR_ID, 5);

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(RJ45_LEDO, OUTPUT);
    gpio_set_mode(RJ45_LEDG, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);
    gpio_set_mode(FAN_PWM, OUTPUT);

    gpio_set_mode(CHARGER_DETECT_OUT, OUTPUT);
    gpio_clear_pin(CHARGER_DETECT_OUT);

    gpio_set_mode(CHARGER_DETECT_IN, INPUT);
    gpio_set_pin(CHARGER_DETECT_IN); // Enable pullup

    gpio_set_mode(nOCD, INPUT);
    gpio_set_mode(BSPD_CURRENT_SENSE, INPUT);

    gpio_set_pin(BMS_RELAY_LSD);

    gpio_enable_interrupt(nOCD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    adc_init();

    spi_init(&spi_cfg);

    timer_init(&timer0_cfg);
    timer_init(&timer1_fan_cfg);

    // Turn on GENERAL_LED to indicate checks will run
    gpio_set_pin(GENERAL_LED);

    pcint0_callback();
    pcint2_callback();

    // if (!!gpio_get_pin(CHARGER_DETECT_IN) == 0) {
    //     bms_core.bms_state = CHARGING;
    //     bms_core.charger_connected = true;
    // }

    // Check state of cells
    if (initial_checks() != 0) {
        if ((bms_core.bms_fault_state == BMS_FAULT_UNDERVOLTAGE)
            && (!!gpio_get_pin(CHARGER_DETECT_IN) == 0)) {
            bms_core.bms_state = CHARGING;
            gpio_set_pin(BMS_RELAY_LSD);
        } else {
            bms_core.bms_state = FAULT;
            gpio_set_pin(FAULT_LED);
        }
    } else {
        // Close the BMS shutdown circuit relay
        bms_core.bms_state = ACTIVE;
        gpio_set_pin(BMS_RELAY_LSD);
    }

    can_send_bms_core();
    can_send_bms_sense();

    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    // Set up first receive of AIR Control and BMS charging messages
    can_receive_air_control_critical();

    // Tracks the number of times the 10ms loop has been run
    uint8_t loop_counter = 0;

    while (true) {
        // Listen for and save tractive system state
        if (can_poll_receive_air_control_critical() == 0) {
            air_state = air_control_critical.air_state;
            can_receive_air_control_critical();
        }

        updater_loop(); // TODO: Can we always update BMS?

        if (run_10ms) {
            can_send_bms_core();
            can_send_bms_sense();
            can_send_bms_metrics();
            state_machine_run();

            // Every 500ms send sensing and debug data
            if (loop_counter == 50) {
                can_send_bms_debug();
                can_send_bms_metrics();

                loop_counter = 0;
            }

            loop_counter++;
            run_10ms = false;
        }
    }
}
