#pragma once

#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include <stdbool.h>
#include <stdint.h>

// Mux addresses
#define LTC1380_MUX1 (0x90)
#define LTC1380_MUX2 (0x92)
#define LTC1380_MUX3 (0x94)

#define MUX_ENABLE  (true)
#define MUX_DISABLE (false)

#define NUM_MUXES (3)

#define NUM_MUX_CHANNELS (8)

/*
 * Configures the multiplexer
 */
void enable_mux(uint8_t num_ics, uint8_t address, bool enable, uint8_t channel);
