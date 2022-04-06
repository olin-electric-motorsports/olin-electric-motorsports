#include "mux.h"

#include <stdbool.h>

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

#define MUX_DATALENGTH (3 * 3) // 3 bytes of data for 3 muxes each

// ICOMn bits
#define START       (0b0110 << 4)
#define STOP        (0b0001 << 4)
#define BLANK       (0b0000 << 4)
#define NO_TRANSMIT (0b0111 << 4)

// FCOMn bits
#define ACK       (0b0000)
#define NACK      (0b1000)
#define NACK_STOP (0b1001)

#define CMD_LEN (6)

void enable_mux(uint8_t num_ics, cell_asic ics[], uint8_t address, bool enable,
                uint8_t channel) {
    uint8_t tx_data[CMD_LEN] = { 0 };

    /*
     * Third byte is command for mux: xxxxECCC
     *   x: don't care
     *   E: enable
     *   C: channel
     */
    uint8_t mux_cmd = enable ? 0x8 : 0x00;
    mux_cmd |= channel & 0x7;

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // Do nothing for the first byte transmitted
        tx_data[0] = START;
        tx_data[1] = NACK_STOP;

        // Second byte is address of mux
        tx_data[2] = START | (address >> 4);
        tx_data[3] = (address << 4) | NACK;

        tx_data[4] = START;
        tx_data[5] = (mux_cmd << 4) | NACK_STOP;
    }

    wakeup_sleep(num_ics);

    uint8_t wrcomm_cmd[2] = { 0x07, 0x21 };
    write_68(NUM_ICS, wrcomm_cmd, tx_data);

    wakeup_idle(num_ics);
    LTC6811_stcomm(MUX_DATALENGTH);
}
