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
#include "vehicle/mkv/software/bms/utils/can.h"
#include "vehicle/mkv/software/bms/utils/fault.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

enum State {
    INIT = 0,
    IDLE,
    DISCHARGING,
    CHARGING,
    FAULT,
};

enum AIR_State {
    AIR_STATE_IDLE,
    AIR_STATE_SHUTDOWN_CIRCUIT_CLOSED,
    AIR_STATE_PRECHARGE,
    AIR_STATE_TS_ACTIVE,
    AIR_STATE_DISCHARGE,
    AIR_STATE_FAULT,
} air_state = AIR_STATE_IDLE;

/*
 * Represents all of LTC6811 chips used in the BMS. Contains cell voltages,
 * auxiliary readings (i.e. temperatures), and configs 
 */
cell_asic ICS[NUM_ICS] = {0};

/* uint16_t TEMPERATURES[NUM_TEMPERATURE_ICS][NUM_MUXES * NUM_MUX_CHANNELS]; */

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

    if (bms_core.overcurrent_detect) {
        bms_core.bms_state = FAULT;
        set_fault(BMS_FAULT_OVERCURRENT);
    }
}

/*
 * Interrupt for BSPD_CURRENT_SENSE
 */
void pcint2_callback(void) {
    bms_core.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
}

static void configure_ics(void) {
    LTC6811_init_cfg(NUM_ICS, ICS);

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // Configure over/undervoltage thresholds for each chip
        LTC6811_set_cfgr_uv(ic, ICS, UNDERVOLTAGE_THRESHOLD);
        LTC6811_set_cfgr_ov(ic, ICS, OVERVOLTAGE_THRESHOLD);
    }

    LTC6811_reset_crc_count(NUM_ICS, ICS);
    LTC6811_init_reg_limits(NUM_ICS, ICS);

    // Write the configured values to the chips
    LTC6811_wrcfg(NUM_ICS, ICS);

    // TODO: read cfg back and make sure no errors
}

/*
 * Perform initial startup checks on the BMS.
 *
 * - Runs BIST (built-in self test) in all the ICs
 * - Checks all temperatures and voltages and ensures they are in range
 */
static int initial_checks(void) {
    int rc = 0;

    wakeup_idle(NUM_ICS);
    wakeup_sleep(NUM_ICS);
    /* LTC6811_diagn(); */
    /*  */
    /* for (uint8_t ic = 0; ic < NUM_ICS; ic++) { */
    /*     if (ICS[ic].stat.mux_fail[0] == 1) { */
    /*         set_fault(BMS_FAULT_DIAGNOSTICS_FAIL); */
    /*         rc = 1; */
    /*         goto bail; */
    /*     } */
    /* } */

    /*
     * Run all LTC6811 self-tests
     *
     * TODO: not working
     */
    // wakeup_sleep(NUM_ICS);
    // rc += LTC6811_run_cell_adc_st(CELL, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    // can_send_bms_debug();
    // 
    // wakeup_sleep(NUM_ICS);
    // rc += LTC6811_run_cell_adc_st(AUX, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    // can_send_bms_debug();
    // 
    // wakeup_sleep(NUM_ICS);
    // rc += LTC6811_run_cell_adc_st(STAT, NUM_ICS, ICS, MD_7KHZ_3KHZ, 0);
    // can_send_bms_debug();
    // 
    // 
    // if (rc != 0) {
    //     set_fault(BMS_FAULT_DIAGNOSTICS_FAIL);
    //     goto bail;
    // }

    // read all voltages
    uint32_t ov = 0;
    uint32_t uv = 0;

    uint16_t pack_voltage = 0;
    rc = voltage_task(&pack_voltage, &ov, &uv);
    bms_core.pack_voltage = pack_voltage;

    bms_debug.dbg_4 = rc;

    /* bms_debug.dbg_1++; */
    can_send_bms_debug();
    can_send_bms_core();

    // if (rc != 0) {
    //     set_fault(); // TODO: maybe we should keep track of metrics, and if we
    //                  // start seeing a lot of failures, we should fault
    //     goto bail;
    // }

    if (uv > 0) {
        set_fault(BMS_FAULT_UNDERVOLTAGE);
        rc = 1;
        goto bail;
    } else if (ov > 0) {
        set_fault(BMS_FAULT_OVERVOLTAGE);
        rc = 1;
        goto bail;
    }

    // read all temperatures
    // uint32_t ot = 0;
    // uint32_t ut = 0;
    // 
    // uint16_t pack_temperature = 0;
    // rc = temperature_task(&pack_temperature, &ot, &ut);
    // bms_core.pack_temperature = pack_temperature;
    // 
    // bms_debug.dbg_1++;
    // can_send_bms_debug();

    // if (rc != 0) {
    //     set_fault(); // TODO: maybe we should keep track of metrics, and if
    //     we
    //                  // start seeing a lot of failures, we should fault
    //     rc = 1;
    //     goto bail;
    // }

    // if (ut > 0) {
    //     set_fault(BMS_FAULT_UNDERTEMPERATURE);
    //     rc = 1;
    //     goto bail;
    // } else if (ot > 0) {
    //     set_fault(BMS_FAULT_OVERTEMPERATURE);
    //     rc = 1;
    //     goto bail;
    // }

    // check for open-circuit
    // openwire_task();
    
    // bms_debug.dbg_1++;
    // can_send_bms_debug();

    // if (bms_core.bms_fault_state) {
    //     rc = 1;
    //     goto bail;
    // }
    //
    // bms_debug.dbg_1++;
    // can_send_bms_debug();

bail:
    return rc;
}

/*
 * Primary state machine function
 */
// static void state_machine_run(void) {
//     if (bms_core.bms_fault_state != BMS_FAULT_NONE) {
//         bms_core.bms_state = FAULT;
//         gpio_clear_pin(BMS_RELAY_LSD);
//     }
// 
//     // Wake up all LTC6811s
//     wakeup_sleep(NUM_ICS);
// 
//     /*
//      * Read voltages
//      */
//     uint32_t ov = 0;
//     uint32_t uv = 0;
// 
//     uint16_t pack_voltage = 0;
//     int rc = voltage_task(&pack_voltage, &ov, &uv);
//     bms_core.pack_voltage = pack_voltage;
// 
//     // X in a row per amoun of time.
//     // We might get a failure mode where one of the isoSPI wires gets loose
//     // Consider it safe if we still get data once per second
//     //
//     // As long as we can get data once per second, we're safe (we don't need to
//     // shut down the car)
//     (void)rc;
// 
//     /*
//      * Read temperatures
//      */
//     uint32_t ot = 0;
//     uint32_t ut = 0;
// 
//     uint16_t pack_temperature;
//     rc = temperature_task(&pack_temperature, &ot, &ut);
//     bms_core.pack_temperature = pack_temperature;
// 
//     /*
//      * Check for open-wires
//      */
//     rc = openwire_task(); // TODO test
// 
//     int16_t current = 0;
//     current_task(&current);
// 
//     if (ut > 0) {
//         set_fault(BMS_FAULT_UNDERTEMPERATURE);
//         bms_core.bms_state = FAULT;
//         return;
//     } else if (ot > 0) {
//         set_fault(BMS_FAULT_OVERTEMPERATURE);
//         bms_core.bms_state = FAULT;
//         return;
//     }
// 
//     switch (bms_core.bms_state) {
//         case IDLE: {
//             if (uv > 0) {
//                 set_fault(BMS_FAULT_UNDERVOLTAGE);
//                 bms_core.bms_state = FAULT;
//             } else if (ov > 0) {
//                 set_fault(BMS_FAULT_OVERVOLTAGE);
//                 bms_core.bms_state = FAULT;
//             }
// 
//             if (air_state != AIR_STATE_IDLE) {
//                 bms_core.bms_state = DISCHARGING;
//             }
// 
//             if (can_poll_receive_bms_charging() == 0) {
//                 can_receive_bms_charging();
//                 if (bms_charging.charge_enable == true) {
//                     bms_core.bms_state = CHARGING;
//                 }
//             }
//         } break;
//         case DISCHARGING: {
//             if (air_state == AIR_STATE_IDLE) {
//                 bms_core.bms_state = IDLE;
//             }
// 
//             if (uv > 0) {
//                 set_fault(BMS_FAULT_UNDERVOLTAGE);
//                 bms_core.bms_state = FAULT;
//             } else if (ov > 0) {
//                 set_fault(BMS_FAULT_OVERVOLTAGE);
//                 bms_core.bms_state = FAULT;
//             }
//         } break;
//         case CHARGING: {
//             gpio_set_pin(BMS_RELAY_LSD);
//             gpio_set_pin(CHARGE_ENABLE1);
//             gpio_set_pin(CHARGE_ENABLE2);
// 
//             if (ov > 0) {
//                 gpio_clear_pin(CHARGE_ENABLE1);
//                 gpio_clear_pin(CHARGE_ENABLE2);
//                 bms_core.bms_state = IDLE;
//             }
// 
//             if (can_poll_receive_bms_charging() == 0) {
//                 can_receive_bms_charging();
//                 if (bms_charging.charge_enable == false) {
//                     bms_core.bms_state = IDLE;
//                     gpio_clear_pin(CHARGE_ENABLE1);
//                     gpio_clear_pin(CHARGE_ENABLE2);
//                 }
//             }
//         } break;
//         case FAULT: {
//             gpio_clear_pin(CHARGE_ENABLE1);
//             gpio_clear_pin(CHARGE_ENABLE2);
//             gpio_clear_pin(BMS_RELAY_LSD);
//             gpio_set_pin(FAULT_LED);
// 
//             /*
//              * We can ONLY exit fault state if the fault is under-voltage,
//              and
//              * we do so by entering CHARGING. Charging begins once we receive
//              * the bms_charging message with charge_enable set to true.
//              */
//             if (bms_core.bms_fault_state == BMS_FAULT_UNDERVOLTAGE) {
//                 if (can_poll_receive_bms_charging() == 0) {
//                     if (bms_charging.charge_enable == true) {
//                         bms_core.bms_state = CHARGING;
//                     }
//                     can_receive_bms_charging();
//                 }
//             }
//         } break;
//         default: {
//             // Just to be safe. This shouldn't happen
//             bms_core.bms_state = FAULT;
//         } break;
//     }
// }

int main(void) {
    sei();

    can_init_bms();
    can_send_bms_debug();

    gpio_set_mode(BMS_RELAY_LSD, OUTPUT);
    gpio_set_mode(RJ45_LEDO, OUTPUT);
    gpio_set_mode(RJ45_LEDG, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE1, OUTPUT);
    gpio_set_mode(CHARGE_ENABLE2, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);

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

    configure_ics();

    // Check state of cells
    if (!initial_checks()) {
        goto fault;
    }

    // Turn off GENERAL_LED to indicate checks passed
    gpio_clear_pin(GENERAL_LED);

    bms_core.bms_state = IDLE;

    // Close the BMS shutdown circuit relay
    gpio_set_pin(BMS_RELAY_LSD);

    // Set up first receive of AIR Control and BMS charging messages
    can_receive_air_control_critical();
    can_receive_bms_charging();

    // Tracks the number of times the 10ms loop has been run
    uint8_t loop_counter = 0;

    while (true) {

        // Listen for and save tractive system state
        /* int err = can_poll_receive_air_control_critical(); */
        /* if (err == 0) { */
        /*     air_state = air_control_critical.state; */
        /*     can_receive_air_control_critical(); */
        /* } */
        bms_debug.dbg_1 = sizeof(cell_asic);

        if (run_10ms) {
            /* wakeup_sleep(NUM_ICS); */
            // state_machine_run();
            
            // Every 100ms read voltages
            if (loop_counter % 10 == 0) {
                /* uint32_t ov = 0; */
                /* uint32_t uv = 0; */
                /*          */
                /* uint16_t pack_voltage = 0; */
                /* gpio_set_pin(GENERAL_LED); */
                /* int rc = voltage_task(&pack_voltage, &ov, &uv); */
                /* gpio_clear_pin(GENERAL_LED); */
                /* bms_core.pack_voltage = pack_voltage; */
                /* bms_debug.dbg_2 = rc; */
            }

            /* bms_debug.dbg_2 = ov; */
            /* bms_debug.dbg_3 = uv; */

            // read all temperatures
            /* uint32_t ot = 0; */
            /* uint32_t ut = 0; */
            /*  */
            /* uint16_t pack_temperature = 0; */
            /* int rc = temperature_task(&pack_temperature, &ot, &ut); */
            /* bms_core.pack_temperature = pack_temperature; */
            /* (void)rc; */


            /* bms_debug.dbg_1 = ot; */
            /* bms_debug.dbg_3 = ut; */

            can_send_bms_core();
            can_send_bms_debug();
            /* can_send_bms_voltages(NUM_ICS, ICS); */
            /* can_send_bms_temperatures(NUM_ICS, (uint16_t**)TEMPERATURES); */
            
            /* bms_debug.dbg_1++; */
            /* can_send_bms_debug(); */
        
            // if (rc != 0) {
            //     set_fault(); // TODO: maybe we should keep track of metrics, and if
            //     we
            //                  // start seeing a lot of failures, we should fault
            //     rc = 1;
            //     goto bail;
            // }
        
            // if (ut > 0) {
            //     set_fault(BMS_FAULT_UNDERTEMPERATURE);
            //     rc = 1;
            //     goto bail;
            // } else if (ot > 0) {
            //     set_fault(BMS_FAULT_OVERTEMPERATURE);
            //     rc = 1;
            //     goto bail;
            // }

            if (loop_counter == 100) {
                loop_counter = 0;
                /*
                 * TODO: This loop will be incredibly slow. Each 8 byte CAN
                 * message takes approximately 300us. We might want to consider
                 * spacing these out... But it also actually might not be an
                 * issue.
                 */
                // can_send_bms_metrics();
                // Occurs at 4Hz, every 250ms
                
                // can_send_bms_temperatures(NUM_ICS, (uint16_t**)TEMPERATURES);
                // can_send_open_wires(NUM_ICS, ICS);
            
            }

            loop_counter++;
            run_10ms = false;
        }
    }

fault:
    // If fault occurs
    gpio_clear_pin(BMS_RELAY_LSD);
    gpio_set_pin(FAULT_LED);

    while (true) {
        if (run_10ms) {
            can_send_bms_core();
            run_10ms = false;
        }
    };
}
