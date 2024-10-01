#pragma once

#include <stdbool.h>
#include <stdint.h>

#define MUX1_ADDRESS (0x90)
#define MUX2_ADDRESS (0x92)
#define MUX3_ADDRESS (0x94)

#define MUX_ENABLE  (true)
#define MUX_DISABLE (false)

#define NUM_MUXES    (3)
#define NUM_CHANNELS (8)

extern const uint8_t MUXES[NUM_MUXES];
/*
 * Configures the multiplexer
 * @param num_ics - number of ADBMS chips in daisy chain
 * @param address - address of mux to configure
 * @param enable - enable or disable mux
 * @channel - channel to enable/disable
 */
void configure_mux(uint8_t num_ics, uint8_t address, bool enable,
                   uint8_t channel);

/*
 * Enable all channels on main PCA9545 I2C mux
 */
void mux_init(uint8_t num_ics);

bool configure_mux_until_ack(uint8_t num_ics, uint8_t address, bool enable,
                             uint8_t channel, uint8_t max_tries);

void enable_da_i2c(uint8_t num_ics, uint8_t da);
