#include "mux.h"

#include <stdbool.h>

#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

#define MUX_DATALENGTH (3)

// ICOMn bits
#define START       (0b0110 << 4)
#define STOP        (0b0001 << 4)
#define BLANK       (0b0000 << 4)
#define NO_TRANSMIT (0b0111 << 4)

// FCOMn bits
#define ACK       (0b0000)
#define NACK      (0b1000)
#define NACK_STOP (0b1001)

void enable_mux(uint8_t num_ics, cell_asic ics[], uint8_t address, bool enable,
                uint8_t channel) {
    uint8_t cmd = enable ? 0x8 : 0x00;
    cmd |= channel & 0x7;

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // Do nothing for the first byte transmitted
        ics[ic].com.tx_data[0] = START;
        ics[ic].com.tx_data[1] = NACK_STOP;

        // Second byte is address of mux
        ics[ic].com.tx_data[2] = START | (address >> 4);
        ics[ic].com.tx_data[3] = (address << 4) | NACK;

        // Third byte is command for mux: xxxxECCC
        //   x: don't care
        //   E: enable
        //   C: channel
        ics[ic].com.tx_data[4] = START;
        ics[ic].com.tx_data[5] = (cmd << 4) | NACK_STOP;
    }

    LTC6811_wrcomm(num_ics, ics);
    LTC6811_stcomm(MUX_DATALENGTH); // TODO: what len do we do?
}
