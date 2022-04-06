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
    int pec_errors = 0;
    int32_t cumulative_temperature = 0;

    wakeup_sleep(NUM_ICS);

    for (uint8_t mux = 0; mux < NUM_MUXES; mux++) {
        // For each mux,
        for (uint8_t ch = 0; ch < NUM_MUX_CHANNELS; ch++) {
            // For each mux channel (ch)

            enable_mux(NUM_ICS, ICS, MUXES[mux], MUX_ENABLE, ch);

            // read aux gpio voltage (this is what the tmperature sensor is
            // connected to) for temperature
            wakeup_idle(NUM_ICS);
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

            // Wait for conversions to finish
            (void)LTC6811_pollAdc();

            // Read voltage from auxiliary pin (connected to the mux)
            wakeup_idle(NUM_ICS);

            uint8_t raw_data[NUM_RX_BYT * NUM_ICS]; // raw data read back
            LTC681x_rdaux_reg(AUX_CH_GPIO1, NUM_ICS, raw_data);

            for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
                if (ic % 2 == 0) {
                    // Skip every even IC (only odd LTC6811s have temperature
                    // sensing)
                    continue;
                }

                // Data is zeroth byte of response
                uint16_t temperature = raw_data[0] | (raw_data[1] << 8);
                cumulative_temperature += temperature;

                /*
                 * Using negative-temperature-coefficient (NTC) thermistors, so
                 * comparisons are reversed (i.e. less than over-temp threshold)
                 */
                if (temperature < OVERTEMPERATURE_THRESHOLD) {
                    *ot += 1;
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
                    *ut += 1;
                }
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

    return pec_errors;
}
