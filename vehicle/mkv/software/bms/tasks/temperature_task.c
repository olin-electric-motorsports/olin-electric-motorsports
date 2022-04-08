#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/utils/mux.h"
#include <string.h>

// Array of mux addresses
const uint8_t MUXES[NUM_MUXES] = { LTC1380_MUX1, LTC1380_MUX2, LTC1380_MUX3 };

#define NUM_TEMPS_PER_IC (NUM_MUXES * NUM_MUX_CHANNELS)
static uint16_t temperatures[NUM_TEMPERATURE_ICS][NUM_TEMPS_PER_IC] = { 0 };

/*
 * Enables or disables the accumulator fans by turning on or off the PWM pin
 * connected to timer 1.
 */
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

            // enable_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, ch-1);
            enable_mux(NUM_ICS, MUXES[mux], MUX_ENABLE, ch);

            // read aux gpio voltage (this is what the tmperature sensor is
            // connected to) for temperature
            wakeup_idle(NUM_ICS);
            LTC6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1);

            // Wait for conversions to finish
            (void)LTC6811_pollAdc();

            // Read voltage from auxiliary pin (connected to the mux)

            uint8_t raw_data[NUM_RX_BYT * NUM_ICS]; // raw data read back

            wakeup_idle(NUM_ICS);
            LTC681x_rdaux_reg(AUX_CH_GPIO1, NUM_ICS, raw_data);

            uint8_t ic_idx = 0;

            for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
                if (ic % 2 == 1) {
                    // Skip all odd ICs
                    continue;
                }
                // Executes for every other chip (0, 2, 4, etc)

                uint16_t data_counter = (ic) * NUM_RX_BYT;
                uint16_t temperature_idx = mux * NUM_MUX_CHANNELS + ch;

                // Data is zeroth byte of response TODO update comment
                uint16_t temperature = raw_data[data_counter] | (raw_data[data_counter+1] << 8);

                // TODO: calc PEC

                temperatures[ic_idx][temperature_idx] = temperature;
                ic_idx++;

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
            *avg_pack_temperature = (
                cumulative_temperature
                / (NUM_MUXES * NUM_MUX_CHANNELS * NUM_TEMPERATURE_ICS));

            enable_mux(NUM_ICS, MUXES[mux], MUX_DISABLE, ch);
        } // End for each mux channel
    } // End for each mux

    // Finally, disable all multiplexers
    enable_mux(NUM_ICS, MUX1, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, MUX2, MUX_DISABLE, 0);
    enable_mux(NUM_ICS, MUX3, MUX_DISABLE, 0);

    return pec_errors;
}

#define CAN_ID_TEMPERATURE_BASE (0x430)
#define CAN_TEMP_DLC (8)
#define NUM_TEMPS_PER_MESSAGE   (4)
#define NUM_CAN_TEMP_MSG_PER_IC (6)

void can_send_bms_temperatures(void) {
    can_frame_t temperature_frame = {
        .id = CAN_ID_TEMPERATURE_BASE,
        .mob = 0,
        .dlc = CAN_TEMP_DLC,
    };

    for (uint8_t temp_ic = 0; temp_ic < NUM_TEMPERATURE_ICS; temp_ic++) {

        /*
         * NUM_MUXES = 3
         * NUM_MUX_CHANNELS = 8
         * 3 * 8 = 24 total channels per peripheral board
         *
         * Each CAN message can send 8 bytes, or 4 temperatures (each temp is 2
         *     bytes)
         *
         * Need 6 CAN messages per board (per iteration of ic)
         */
        for (uint8_t message = 0; message < NUM_CAN_TEMP_MSG_PER_IC;
             message++) {
            // For each group of temperatures

            /*
             * Trick: instead of creating our own data array, we just set the
             * pointer to the array to be the pointer to the cell temps in 
             * giant array with some offset. That way, we can reuse memory and 
             * avoid memcpy-ing.
             */
            temperature_frame.data = ((uint8_t*)temperatures[temp_ic])
                + (message * CAN_TEMP_DLC);

            can_send(&temperature_frame);
            temperature_frame.id++;
        }
    }
}
