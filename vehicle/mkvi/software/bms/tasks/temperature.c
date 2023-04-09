#include <stdint.h>
#include "tasks.h"

#include "vehicle/mkv/software/bms/ltc6811/ltc681x.h"
#include "vehicle/mkv/software/bms/utils/mux.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/utils/mux.h"
#include <string.h>

const uint8_t MUXES[NUM_MUXES] = { MUX1_ADDRESS, MUX2_ADDRESS, MUX3_ADDRESS };

#define NUM_TEMPS_PER_IC        (NUM_MUXES * NUM_MUX_CHANNELS * DA_BOARDS_PER_IC)

static void fan_enable(bool enable) {
    timer1_cfg.channel_b.pin_behavior = enable ? SET : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the
    // timer
    timer_init(&timer1_cfg);
}

int16_t min_temperature = INT16_MIN;
int16_t max_temperature = INT16_MAX;

int temperature_task(uint32_t* ot, uint32_t* ut, int16_t* min_temp, int16_t* max_temp) {
    int pec_errors = 0;

    static uint8_t mux = 0;
    static uint8_t channel = 0;

    if (mux == 0 && channel == 0) {
        min_temperature = INT16_MIN;
        max_temperature = INT16_MAX;
    }

    uint8_t mux1_raw[NUM_RX_BYT * NUM_ICS];
    uint8_t mux2_raw[NUM_RX_BYT * NUM_ICS];
    uint8_t mux3_raw[NUM_RX_BYT * NUM_ICS];
    uint8_t mux4_raw[NUM_RX_BYT * NUM_ICS];

    wakeup_sleep(NUM_ICS);

    enable_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, channel);

    wakeup_idle(NUM_ICS);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);
    (void)LTC681x_pollAdc();
    LTC681x_rdaux_reg(AUX_CH_GPIO1, NUM_ICS, mux1_data);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO2);
    (void)LTC681x_pollAdc();
    LTC681x_rdaux_reg(AUX_CH_GPIO2, NUM_ICS, mux2_data);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO3);
    (void)LTC681x_pollAdc();
    LTC681x_rdaux_reg(AUX_CH_GPIO3, NUM_ICS, mux3_data);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO6);
    (void)LTC681x_pollAdc();
    LTC681x_rdaux_reg(AUX_CH_GPIO6, NUM_ICS, mux4_data);

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        uint16_t data_counter = ic * NUM_RX_BYT;

        uint16_t mux1_data = mux1_raw[data_counter] | (mux1_raw[data_counter + 1] << 8);
        uint16_t mux2_data = mux2_raw[data_counter] | (mux2_raw[data_counter + 1] << 8);
        uint16_t mux3_data = mux3_raw[data_counter] | (mux3_raw[data_counter + 1] << 8);
        uint16_t mux4_data = mux4_raw[data_counter] | (mux4_raw[data_counter + 1] << 8);

        if (temperature > min_temperature) {
            min_temperature = temperature;
            *min_temp = min_temperature;
        }

        if (temperature < max_temperature) {
            max_temperature = temperature;
            *max_temp = max_temperature;
        }
    }

    channel = (channel + 1) % NUM_MUX_CHANNELS;
    // Move on to next mux
    if (channel == 0) {
        enable_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, channel);
        mux = (mux + 1) % NUM_MUXES;
    }

}
