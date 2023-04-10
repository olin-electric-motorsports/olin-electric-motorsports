#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/utils/mux.h"
#include <string.h>
#include <stdint.h>

const uint8_t MUXES[NUM_MUXES] = { MUX1_ADDRESS, MUX2_ADDRESS, MUX3_ADDRESS };
const uint8_t GPIO_CHANNELS[4] = { AUX_CH_GPIO1, AUX_CH_GPIO2, AUX_CH_GPIO3, AUX_CH_GPIO6 }; // TODO: If something breaks, check this number

#define NUM_TEMPS_PER_IC        (NUM_MUXES * NUM_MUX_CHANNELS * DA_BOARDS_PER_IC)
#define NUM_DA_BOARDS (4)

uint8_t can_data[8] = { 0 };
can_frame_t temperature_frame = {
    .id = CAN_TOOLS_BMS_TEMPERATURE_FRAME_ID,
    .mob = 0,
    .dlc = CAN_TOOLS_BMS_TEMPERATURE_LENGTH,
    .data = can_data,
};

static void fan_enable(bool enable) {
    timer1_cfg.channel_b.pin_behavior = enable ? SET : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the
    // timer
    timer_init(&timer1_cfg);
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
    
    /*
        * S: Segments 1-3 or 4-6
        * D: DA Board 1-4
        * C: Mux and channel 1-24
        *
        * SDDCCCCC
    */
    can_data[1] = (mux * 8 + channel);

    // We store temperatures within the CAN data array starting at index 2
    uint16_t* temperatures = (uint16_t*)&can_data[2];

    wakeup_sleep(NUM_ICS);
    configure_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, channel);

    LTC681x_adax(MD_7KHZ_3KHZ, AUX_CH_ALL);
    (void)LTC681x_pollAdc();

    uint8_t raw_data[NUM_RX_BYT * NUM_ICS];

    uint8_t can_temperature_index = 0;
    for (uint8_t da = 0; da < NUM_DA_BOARDS; da++) {

        wakeup_idle(NUM_ICS);
        LTC681x_rdaux_reg(GPIO_CHANNELS[da], NUM_ICS, raw_data);

        for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
            uint16_t data_counter = ic * NUM_RX_BYT;
            uint16_t temperature = raw_data[data_counter] | (raw_data[data_counter + 1] << 8);

            temperatures[can_temperature_index] = temperature;
            can_temperature_index++;

            if (can_temperature_index == 3) {
                can_temperature_index = 0;
                can_send(&temperature_frame);
            }

            // coldest, highest voltage
            if (temperature > min_temperature) {
                min_temperature = temperature;
                *min_temp = min_temperature;
            }

            // hottest, lowest voltage
            if (temperature < max_temperature) {
                max_temperature = temperature;
                *max_temp = max_temperature;
            }
        }

    }

    channel = (channel + 1) % NUM_MUX_CHANNELS;
    // Move on to next mux if we are at the last channel
    if (channel == 0) {
        configure_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, channel);
        mux = (mux + 1) % NUM_MUXES;
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
