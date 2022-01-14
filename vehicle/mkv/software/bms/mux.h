#include <stdint.h>
#include <stdbool.h>

// Mux addresses
#define MUX1 (0x90)
#define MUX2 (0x92)
#define MUX3 (0x94)

#define MUX_ENABLE (true)
#define MUX_DISABLE (false)

#define NUM_MUX_CHANNELS (8)

/*
 * Configures the multiplexer
 */
void configure_mux(uint8_t num_ics, cell_asic ics[], uint8_t address, bool enable, uint8_t channel);
