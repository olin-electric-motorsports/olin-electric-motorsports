#include "tasks.h"

#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/utils/mux.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include <string.h>
#include <stdint.h>

const uint8_t MUXES[NUM_MUXES] = { MUX1_ADDRESS, MUX2_ADDRESS, MUX3_ADDRESS };
const uint8_t GPIO_CHANNELS[4] = { AUX_CH_GPIO1, AUX_CH_GPIO2, AUX_CH_GPIO3, AUX_CH_GPIO6 }; // TODO: If something breaks, check GPIO6

#define NUM_TEMPS_PER_IC        (NUM_MUXES * NUM_MUX_CHANNELS * DA_BOARDS_PER_IC)
#define NUM_DA_BOARDS (4)
#define NUM_MUX_CHANNELS (8)

static void fan_enable(bool enable) {
    timer1_cfg.channel_b.pin_behavior = enable ? SET : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the
    // timer
    timer_init(&timer1_cfg);
}

static void update_min_max_temps(int16_t* min_temp, int16_t* max_temp, int16_t* temps[], uint8_t num_temps) {
    for (uint8_t i = 0; i < num_temps; i++) {
        if (*temps[i] < *min_temp) {
            *min_temp = *temps[i];
        }
        if (*temps[i] > *max_temp) {
            *max_temp = *temps[i];
        }
    }
}

int16_t min_temperature = INT16_MAX; // highest voltage
int16_t max_temperature = INT16_MIN; // lowest voltage

int temperature_task(uint32_t* ot, uint32_t* ut, int16_t* min_temp, int16_t* max_temp) {
    int pec_errors = 0;

    static uint8_t mux = 0;
    static uint8_t channel = 0;

    if (mux == 0 && channel == 0) {
        min_temperature = INT16_MIN;
        max_temperature = INT16_MAX;
    }
    
    bms_temperature.ics = SEGMENTS_1_THRU_3;
    bms_temperature.channel = mux * NUM_MUX_CHANNELS + channel;

    wakeup_sleep(NUM_ICS);
    configure_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, channel);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_ALL);
    (void)LTC681x_pollAdc();

    uint8_t raw_data[NUM_RX_BYT * NUM_ICS];

    uint8_t can_temperature_index = 0;
    for (uint8_t da = 0; da < NUM_DA_BOARDS; da++) {

        wakeup_idle(NUM_ICS);
        LTC681x_rdaux_reg(GPIO_CHANNELS[da], NUM_ICS, raw_data);

        bms_temperature.da_board = da;

        for (uint8_t ic = 0; ic < NUM_ICS; ic += 3) {
            uint16_t data_counter = ic * NUM_RX_BYT;
            bms_temperature.temperature_1 = raw_data[data_counter] | (raw_data[data_counter + 1] << 8);

            data_counter += NUM_RX_BYT;
            bms_temperature.temperature_2 = raw_data[data_counter] | (raw_data[data_counter + 1] << 8);

            data_counter += NUM_RX_BYT;
            bms_temperature.temperature_3 = raw_data[data_counter] | (raw_data[data_counter + 1] << 8);

            can_send_bms_temperature();
            bms_temperature.ics = SEGMENTS_4_THRU_6; // for second iteration

            update_min_max_temps(min_temp, max_temp, (int16_t *[]){
                &bms_temperature.temperature_1,
                &bms_temperature.temperature_2,
                &bms_temperature.temperature_3
            }, 3);

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
    if (max_temperature < OVERTEMPERATURE_THRESHOLD) {
        *ot += 1;
    }

    // if min is colder than undertemp threshold, increment undertemp counter
    if (min_temperature > UNDERTEMPERATURE_THRESHOLD) {
        *ut += 1;
    }

    // if max is hotter than soft threshold, enable fan
    if (max_temperature < SOFT_OVERTEMPERATURE_THRESHOLD) {
        fan_enable(true);
    }

    // if min is cooler than soft threshold, disable fan
    if (min_temperature > SOFT_OVERTEMPERATURE_THRESHOLD) {
        fan_enable(false);
    }
}
