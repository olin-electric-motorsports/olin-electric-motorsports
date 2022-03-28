#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/utils/mux.h"

// Array of mux addresses
const uint8_t MUXES[NUM_MUXES] = { LTC1380_MUX1, LTC1380_MUX2, LTC1380_MUX3 };

static void fan_enable(bool enable) {
    timer1_fan_cfg.channel_b.pin_behavior = enable ? TOGGLE : DISCONNECTED;

    // No way to update a single part of the config so we just re-init the timer
    timer_init(&timer1_fan_cfg);
}

int temperature_task(uint16_t* avg_pack_temperature, uint32_t* ot,
                     uint32_t* ut) {
    int rc = 0;
    int error = 0;
    int32_t cumulative_temperature = 0;

    for (uint8_t mux = 0; mux < NUM_MUXES; mux++) {
        // For each mux,
        for (uint8_t ch = 0; ch < NUM_MUX_CHANNELS; ch++) {
            // For each mux channel (ch)

            enable_mux(NUM_ICS, ICS, MUXES[mux], MUX_ENABLE, ch);

            // read aux gpio voltage (this is what the tmperature sensor is
            // connected to) for temperature
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

            // Wait for conversions to finish
            (void)LTC6811_pollAdc();

            // Read voltage from auxiliary pin (connected to the mux)
            error = LTC6811_rdaux(AUX_CH_GPIO1, NUM_ICS, ICS);

            if (error == -1) {
                bms_metrics.temperature_pec_error_count++;
                rc = 1;
                continue;
            }

            uint16_t temperature = 0;

            /*
             * temp_ic indexes the ICs that measure the temperature, so
             *   temp_ic = 0 := ic 1
             *   temp_ic = 1 := ic 3
             *   temp_ic = 2 := ic 5
             *   etc.
             */
            for (uint8_t temp_ic = 0; temp_ic < NUM_TEMPERATURE_ICS;
                 temp_ic += 1) {
                // Use 0 as the a_codes index for GPIO1 channel
                temperature = ICS[(temp_ic * 2) + 1].aux.a_codes[0];

                /*
                 * Store temperature [(mux * NUM_MUX_CHANNELS) + ch] indexes the
                 * channel of the mux. We store temperatures as a 2D array of
                 * ICS vs mux channels and use 24 as the number of mux channels
                 * (3 muxes, 8 channels each).
                 */
                uint16_t channel = (mux * NUM_MUX_CHANNELS) + ch;
                TEMPERATURES[temp_ic][channel] = temperature;
                cumulative_temperature += temperature;

                /*
                 * Using negative-temperature-coefficient (NTC) thermistors, so
                 * comparisons are reversed (i.e. less than over-temp threshold)
                 */
                if (temperature < OVERTEMPERATURE_THRESHOLD) {
                    *ot = *ot + 1;
                }

                // If temperatures are getting a bit too high, we turn on the
                // fan
                if (temperature < SOFT_OVERTEMPERATURE_THRESHOLD) {
                    fan_enable(true);
                }

                if (temperature > SOFT_OVERTEMPERATURE_THRESHOLD_LOW) {
                    fan_enable(false);
                }

                if (temperature > UNDERTEMPERATURE_THRESHOLD) {
                    *ut = *ut + 1;
                }
            } // End for each IC

            /*
             * Compute average temperature. This truncates a 32 bit number
             * into a 16 bit number. This shouldn't be a problem because the
             * average temperature won't be larger than 16-bits, but the reader
             * should be aware that this is intentional. A 32 bit number is
             * needed to store the cumulative sum, and it can be shown that this
             * is sufficient to store the sum of all the temperature sensor
             * voltages
             */
            bms_core.pack_temperature = (uint16_t)(
                cumulative_temperature
                / (NUM_MUXES * NUM_MUX_CHANNELS * NUM_TEMPERATURE_ICS));
        } // End for each mux channel
    } // End for each mux

    // Finally, disable all multiplexers
    // TODO: needed?
    enable_mux(NUM_ICS, ICS, MUX1, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, ICS, MUX2, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, ICS, MUX3, MUX_DISABLE, 0);

    return rc;
}
