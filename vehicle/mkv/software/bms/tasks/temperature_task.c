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
// static void fan_enable(bool enable) {
//     timer1_fan_cfg.channel_b.pin_behavior = enable ? TOGGLE : DISCONNECTED;
//
//     // No way to update a single part of the config so we just re-init the
//     timer timer_init(&timer1_fan_cfg);
// }

int temperature_task(uint16_t* avg_pack_temperature, uint32_t* ot,
                     uint32_t* ut) {
    int pec_errors = 0;
    int32_t cumulative_temperature = 0;

    wakeup_sleep(NUM_ICS);

    for (uint8_t mux = 0; mux < NUM_MUXES; mux++) {
        // For each mux,
        for (uint8_t ch = 0; ch < NUM_MUX_CHANNELS; ch++) {
            // For each mux channel (ch)

            enable_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, ch);

            // Read aux gpio voltage (this is what the tmperature sensor is
            // connected to) for temperature
            wakeup_idle(NUM_ICS);
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

            // Wait for conversions to finish
            (void)LTC6811_pollAdc();

            uint8_t raw_data[NUM_RX_BYT * NUM_ICS]; // raw data read back

            wakeup_idle(NUM_ICS);
            LTC681x_rdaux_reg(AUX_CH_GPIO1, NUM_ICS, raw_data);

            can_frame_t temperature_frame = {
                .id = CAN_TOOLS_BMS_TEMPERATURE_FRAME_ID,
                .mob = 0,
                .dlc = CAN_TOOLS_BMS_TEMPERATURE_LENGTH,
            };

            uint8_t can_data[8] = { 0 };
            uint16_t* temperatures = (uint16_t*)&(can_data[2]);

            can_data[1] = (mux & 0xF) | ((ch & 0xF) << 4);
            temperature_frame.data = can_data;

            uint8_t temperature_idx_counter = 0;

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

                uint16_t data_counter = (ic)*NUM_RX_BYT;

                // The voltage value from the ADC is in the zeroth "word" (two
                // bytes) of the response data
                uint16_t temperature = raw_data[data_counter]
                                       | (raw_data[data_counter + 1] << 8);

                temperatures[temperature_idx_counter] = temperature;

                temperature_idx_counter++;

                if (temperature_idx_counter == 3) {
                    can_send(&temperature_frame); // TODO: use cantools?
                    temperature_idx_counter = 0;
                }

                // TODO: calc PEC

                cumulative_temperature += temperature;

                /*
                 * Using negative-temperature-coefficient (NTC) thermistors, so
                 * comparisons are reversed (i.e. less than over-temp threshold)
                 */
                // if (temperature < OVERTEMPERATURE_THRESHOLD) {
                //     *ot += 1;
                // }
                //
                // /*
                //  * If temperatures are getting a bit too high, we turn on the
                //  * fan
                //  */
                // if (temperature < SOFT_OVERTEMPERATURE_THRESHOLD) {
                //     fan_enable(true);
                // }
                //
                // if (temperature > SOFT_OVERTEMPERATURE_THRESHOLD_LOW) {
                //     fan_enable(false);
                // }
                //
                // if (temperature > UNDERTEMPERATURE_THRESHOLD) {
                //     *ut += 1;
                // }
            }

            /*
             * Compute average temperature. This truncates a 32 bit number
             * into a 16 bit number. This shouldn't be a problem because the
             * average temperature won't be larger than 16-bits, but the reader
             * should be aware that this is intentional. A 32 bit number is
             * needed to store the cumulative sum, and it can be shown that this
             * is sufficient to store the sum of all the temperature sensor
             * voltages
             */
            *avg_pack_temperature
                = (cumulative_temperature
                   / (NUM_MUXES * NUM_MUX_CHANNELS * NUM_TEMPERATURE_ICS));

            enable_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, ch);
        } // End for each mux channel
    } // End for each mux

    return pec_errors;
}
