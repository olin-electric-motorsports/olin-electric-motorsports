#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/utils/mux.h"
#include <string.h>

// Array of mux addresses
const uint8_t MUXES[NUM_MUXES] = { LTC1380_MUX1, LTC1380_MUX2, LTC1380_MUX3 };

#define NUM_TEMPS_PER_IC        (NUM_MUXES * NUM_MUX_CHANNELS)
#define NUM_TEMPS_PER_MESSAGE   (4)
#define NUM_CAN_TEMP_MSG_PER_IC (6)

/*
 * Enables or disables the accumulator fans by turning on or off the PWM pin
 * connected to timer 1.
 */
static void fan_enable(bool enable) {
    timer1_fan_cfg.channel_b.pin_behavior = enable ? TOGGLE : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the
    // timer
    timer_init(&timer1_fan_cfg);
}

/*
 * Here, min and max refer to the voltages of the divider, NOT the actual
 * temperatures. We are using negative-temperature-coefficient thermistors, so
 * the lower the voltage, the higher the temperature. Keep this in mind when
 * reading through the code.
 *
 * We initialize the min_temp to the MAXIMUM value for an int16_t so that the
 * first time it runs, the min voltage will always be smaller. We do the same
 * for the max_temp.
 *
 * TODO: Need to invert logic when we write about it
 */
int16_t min_temperature = INT16_MIN;
int16_t max_temperature = INT16_MAX;

uint8_t can_data[8] = { 0 };

can_frame_t temperature_frame = {
    .id = CAN_TOOLS_BMS_TEMPERATURE_FRAME_ID,
    .mob = 0,
    .dlc = CAN_TOOLS_BMS_TEMPERATURE_LENGTH,
    .data = can_data,
};

int temperature_task(uint32_t* ot, uint32_t* ut, int16_t* min_temp,
                     int16_t* max_temp) {
    int pec_errors = 0;

    static uint8_t mux = 0;
    static uint8_t channel = 0;

    if ((mux == 0) && (channel == 0)) {
        min_temperature = INT16_MIN;
        max_temperature = INT16_MAX;
    }

    // Set mux and channel in CAN message
    can_data[1] = (mux & 0xF) | ((channel & 0xF) << 4);

    // We store temperatures within the CAN data array starting at index 2
    uint16_t* temperatures = (uint16_t*)&can_data[2];

    /*
     * Wake up the LTC6811s
     */
    wakeup_sleep(NUM_ICS);

    {
        enable_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, channel);

        // Read aux gpio voltage (this is what the tmperature sensor is
        // connected to) for temperature
        wakeup_idle(NUM_ICS);
        LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

        // Wait for conversions to finish
        (void)LTC6811_pollAdc();

        // Raw (iso)SPI data
        uint8_t raw_data[NUM_RX_BYT * NUM_ICS];

        wakeup_idle(NUM_ICS);
        LTC681x_rdaux_reg(AUX_CH_GPIO1, NUM_ICS, raw_data);

        // Stores the current temperatures index in the CAN message Used to
        // indicate when a CAN message should be sent: When this number
        // reaches 3, we send the CAN message and reset it to zero
        uint8_t can_temperature_index = 0;

        for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
            if (ic % 2 == 1) {
                // Skip all odd ICs
                continue;
            }

            if (ic < 5) {
                can_data[0] = 0;
            } else {
                can_data[0] = 1;
            }

            // Used to get the value of the ADC from the raw data, since data
            // contains the voltages from all of the LTC6811s
            uint16_t data_counter = ic * NUM_RX_BYT;

            // The voltage value from the ADC is in the zeroth "word" (two
            // bytes) of the response data
            uint16_t temperature
                = raw_data[data_counter] | (raw_data[data_counter + 1] << 8);

            temperatures[can_temperature_index] = temperature;
            can_temperature_index++;

            if (can_temperature_index == 3) {
                can_send(&temperature_frame);
                can_temperature_index = 0;
            }

            /*
             * Update temperature mins and maxes
             *
             * Note: inverted logic
             */
            if (temperature > min_temperature) {
                min_temperature = temperature;
                *min_temp = min_temperature;
            }

            if (temperature < max_temperature) {
                max_temperature = temperature;
                *max_temp = max_temperature;
            }

            // TODO: calc PEC
        }
    }

    // Increment mux and channel as necessary
    channel = (channel + 1) % NUM_MUX_CHANNELS;

    if (channel == 0) {
        enable_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, channel);
        mux = (mux + 1) % NUM_MUXES;
    }

    /*
     * Using negative-temperature-coefficient (NTC) thermistors, so
     * comparisons are reversed (i.e. less than over-temp threshold)
     */
    if (max_temperature < OVERTEMPERATURE_THRESHOLD) {
        *ot += 1;
    }

    /*
     * If temperatures are getting a bit too high, we turn on the
     * fan
     */
    if (max_temperature < SOFT_OVERTEMPERATURE_THRESHOLD) {
        fan_enable(true);
    }

    if (min_temperature > SOFT_OVERTEMPERATURE_THRESHOLD_LOW) {
        fan_enable(false);
    }

    if (min_temperature > UNDERTEMPERATURE_THRESHOLD) {
        *ut += 1;
    }

    return pec_errors;
}
