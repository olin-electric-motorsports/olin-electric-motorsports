#include "mux.h"

#include <stdbool.h>
#include <stdint.h>

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"

#define MUX_DATALENGTH (3)
#define ADBMS_CMD_LEN  (6)

// ICOMn bits
#define START       (0b0110 << 4)
#define STOP        (0b0001 << 4)
#define BLANK       (0b0000 << 4)
#define NO_TRANSMIT (0b0111 << 4)

// FCOMn bits
#define ACK       (0b0000)
#define NACK      (0b1000)
#define NACK_STOP (0b1001)

uint8_t I2C_MUX_ADDRESS = 0xE0; // variable so compiler doesn't give overflow
                                // warning when shifting

void mux_init(uint8_t num_ics) {
    uint8_t tx_data[ADBMS_CMD_LEN] = { 0 };

    tx_data[0] = START; // START xxxx
    tx_data[1] = NACK_STOP; // xxxx NACK_STOP

    tx_data[2] = START | (I2C_MUX_ADDRESS >> 4); // START AAAA
    tx_data[3] = (I2C_MUX_ADDRESS << 4) | NACK; // AAAA NACK
    tx_data[4] = BLANK; // xxxxBLANK
    tx_data[5] = 0xF0 | NACK_STOP; // Enable all channels

    wakeup_sleep(num_ics); // wake up the IC core

    uint8_t wrcomm_cmd[2] = { 0x07, 0x21 }; // command to write to COMM register
    write_68(NUM_ICS, wrcomm_cmd, tx_data);

    wakeup_idle(num_ics); // wake up the isospi comms
    LTC681x_stcomm(MUX_DATALENGTH); // where does this value come from?
}

void configure_mux(uint8_t num_ics, uint8_t address, bool enable,
                   uint8_t channel) {
    /*
     * Third byte is command for mux: xxxxECCC
     *   x: don't care
     *   E: enable
     *   C: channel
     */
    uint8_t mux_cmd = channel & 0x7;
    mux_cmd |= (enable << 3); // ENABLE C2 C1 C0

    /*
     * ADBMS comand message
     *
     * A: Address
     * M: Mux command
     */
    uint8_t tx_data[ADBMS_CMD_LEN] = { 0 };

    tx_data[0] = START; // START xxxx
    tx_data[1] = NACK_STOP; // xxxx NACK_STOP

    tx_data[2] = START | (address >> 4); // START AAAA
    tx_data[3] = (address << 4) | NACK; // AAAA NACK
    tx_data[4] = BLANK; // xxxxBLANK
    tx_data[5] = mux_cmd << 4 | NACK_STOP; // MMMM NACK_STOP

    wakeup_sleep(num_ics); // wake up the IC core

    uint8_t wrcomm_cmd[2] = { 0x07, 0x21 }; // command to write to COMM register
    write_68(NUM_ICS, wrcomm_cmd, tx_data);

    wakeup_idle(num_ics); // wake up the isospi comms
    LTC681x_stcomm(MUX_DATALENGTH); // where does this value come from?
}
