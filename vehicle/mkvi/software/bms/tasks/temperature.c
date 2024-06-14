#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/mux.h"
#include <stdint.h>
#include <string.h>

const uint8_t MUXES[NUM_MUXES] = { MUX1_ADDRESS, MUX2_ADDRESS, MUX3_ADDRESS };
const uint8_t GPIO_CHANNELS[4] = { 1, 1, 1, 3 };

#define NUM_TEMPS_PER_IC              (NUM_MUXES * NUM_MUX_CHANNELS * DA_BOARDS_PER_IC)
#define NUM_DA_BOARDS                 (4)
#define NUM_MUX_CHANNELS              (8)
#define NUM_BYTES_IN_REG              (6)
#define INVALID_TEMPERATURE_THRESHOLD (0xD555)

#define AUX_REG_GROUP_A (1)
#define AUX_REG_GROUP_C (3)

// static void fan_enable(bool enable) {
//     timer1_cfg.channel_b.pin_behavior = enable ? SET : DISCONNECTED;

//     // No way to update a single part of the config so we just re-init the
//     // timer
//     timer_init(&timer1_cfg);
// }

/*
 * We are using negative-temperature-coefficient thermistors.
 * TL;DR is as the temperature increases, the voltage decreases.
 * These variables refer the the voltages, so the minimum temperature is the
 * highest voltage, and vice versa.
 */
static void update_min_max_temps(uint16_t* min_temp, uint16_t* max_temp,
                                 uint16_t temps[], uint8_t num_temps) {
    for (uint8_t i = 0; i < num_temps; i++) {
        if (temps[i] > *min_temp) {
            *min_temp = temps[i];
        }
        if (temps[i] < *max_temp) {
            *max_temp = temps[i];
        }
    }
}

int temperature_task(uint32_t* ot, uint32_t* ut, uint16_t* min_temp,
                     uint16_t* max_temp) {
    int pec_errors = 0;

    static uint8_t mux = 0;
    static uint8_t channel = 0;

    if (mux == 0 && channel == 7) {
        *min_temp = 0;
        *max_temp = UINT16_MAX;
    }

    bms_temperature.channel = mux * NUM_MUX_CHANNELS + channel;

    wakeup_sleep(NUM_ICS);
    configure_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, channel);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_ALL);
    (void)LTC681x_pollAdc();

    uint8_t aux_reg_a_raw[NUM_RX_BYT * NUM_ICS];
    uint8_t aux_reg_c_raw[NUM_RX_BYT * NUM_ICS];

    wakeup_idle(NUM_ICS);
    LTC681x_rdaux_reg(AUX_REG_GROUP_A, NUM_ICS, aux_reg_a_raw); // for GPIOS 1-3
    LTC681x_rdaux_reg(AUX_REG_GROUP_C, NUM_ICS, aux_reg_c_raw); // for GPIOS 6

    uint8_t num_temps;
    uint16_t temps[4];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        num_temps = 0;
        bms_temperature.ic = ic;
        bms_temperature.da_boards = DA_BOARDS_DA_BOARDS_12;

        uint16_t ic_zero_idx = ic * NUM_RX_BYT;

        bms_temperature.temperature_1 = aux_reg_a_raw[ic_zero_idx + 0]
                                        | (aux_reg_a_raw[ic_zero_idx + 1] << 8);
        // Skip channels 0-6 on Mux 0, DA Board 1 since the thermistors are not
        // connected
        if (mux != 0 || channel == 7) {
            if ((ic != 0 || mux != 0 || channel != 7) && (ic != 0 || mux != 2 || channel != 7)) {
                temps[num_temps] = bms_temperature.temperature_1;
                num_temps++;
            }
        }

        bms_temperature.temperature_2 = aux_reg_a_raw[ic_zero_idx + 2]
                                        | (aux_reg_a_raw[ic_zero_idx + 3] << 8);
        // Thermistor 20 on IC 1, DA Board 2 is broken
        if (ic != 1 || mux != 2 || channel != 4) {
            temps[num_temps] = bms_temperature.temperature_2;
            num_temps++;
        }
        can_send_bms_temperature();

        bms_temperature.da_boards = DA_BOARDS_DA_BOARDS_34;
        bms_temperature.temperature_1 = aux_reg_a_raw[ic_zero_idx + 4]
                                        | (aux_reg_a_raw[ic_zero_idx + 5] << 8);
        // Thermistor 12 on IC 1, DA Board 3 is broken
        if (ic != 1 || mux != 1 || channel != 4) {
            temps[num_temps] = bms_temperature.temperature_1;
            num_temps++;
        }

        bms_temperature.temperature_2 = aux_reg_c_raw[ic_zero_idx + 0]
                                        | (aux_reg_c_raw[ic_zero_idx + 1] << 8);
        // Skip channels 0-3 on Mux 0, DA Board 1 since the thermistors are not
        // connected
        if (mux != 0 || channel >= 4) {
            temps[num_temps] = bms_temperature.temperature_2;
            num_temps++;
        }
        can_send_bms_temperature();

        update_min_max_temps(min_temp, max_temp, temps, num_temps);

        // PEC error handling for register A...
        uint16_t received_pec = (aux_reg_a_raw[ic_zero_idx + 6] << 8)
                                | aux_reg_a_raw[ic_zero_idx + 7];
        uint16_t calculated_pec
            = pec15_calc(NUM_BYTES_IN_REG, &aux_reg_a_raw[ic_zero_idx]);
        if (received_pec != calculated_pec) {
            pec_errors++;
        }

        // and register C
        received_pec = (aux_reg_c_raw[ic_zero_idx + 6] << 8)
                       | aux_reg_c_raw[ic_zero_idx + 7];
        calculated_pec
            = pec15_calc(NUM_BYTES_IN_REG, &aux_reg_c_raw[ic_zero_idx]);
        if (received_pec != calculated_pec) {
            pec_errors++;
        }
    }

    channel += 1;
    // Move on to next mux if we are at the last channel
    if (channel == NUM_MUX_CHANNELS) {
        configure_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, channel);
        mux = (mux + 1) % NUM_MUXES;
        channel = 0;
    }

    // if max is hotter than overtemp threshold, increment overtemp counter
    if (*max_temp < OVERTEMPERATURE_THRESHOLD) {
        *ot += 1;
    }

    // if min is colder than undertemp threshold, increment undertemp counter
    if (*min_temp > UNDERTEMPERATURE_THRESHOLD) {
        *ut += 1;
    }

    // // if max is hotter than soft threshold, enable fan
    // if (*max_temp < SOFT_OVERTEMPERATURE_THRESHOLD) {
    //     fan_enable(true);
    // }

    // // if min is cooler than soft threshold low, disable fan
    // if (*min_temp > SOFT_OVERTEMPERATURE_THRESHOLD_LOW) {
    //     fan_enable(false);
    // }
    return pec_errors;
}
