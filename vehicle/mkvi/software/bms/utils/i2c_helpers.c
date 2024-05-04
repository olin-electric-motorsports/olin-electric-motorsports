/*
TODO: Add a file-level comment to explain some of the terminology being used
for clarity.
*/
#include "i2c_helpers.h"

#include <stdbool.h>
#include <stdint.h>

#include "fault.h"
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

const uint8_t MUXES[NUM_MUXES] = { MUX1_ADDRESS, MUX2_ADDRESS, MUX3_ADDRESS };

uint8_t I2C_MUX_ADDRESS = 0xE0; // variable so compiler doesn't give overflow
                                // warning when shifting

#define BYTES_IN_REG (6)

// TODO: function currently assumes all i2c commands transmit 3 bytes, where
// the first byte is all 0 - this should be made more generic
void transmit_i2c(uint8_t num_ics, uint8_t tx_byte) {
    uint8_t tx_data[ADBMS_CMD_LEN * num_ics];

    tx_data[0] = START; // START xxxx
    tx_data[1] = NACK_STOP; // xxxx NACK_STOP

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        tx_data[ic * BYTES_IN_REG + 0] = START; // START xxxx
        tx_data[ic * BYTES_IN_REG + 1] = NACK_STOP; // xxxx NACK_STOP
        tx_data[ic * BYTES_IN_REG + 2]
            = START | (I2C_MUX_ADDRESS >> 4); // START AAAA
        tx_data[ic * BYTES_IN_REG + 3]
            = (I2C_MUX_ADDRESS << 4) | NACK; // AAAA NACK
        tx_data[ic * BYTES_IN_REG + 4] = BLANK | (tx_byte >> 4); // xxxxBLANK
        tx_data[ic * BYTES_IN_REG + 5]
            = (tx_byte << 4) | NACK_STOP; // Enable all channels
    }

    wakeup_sleep(num_ics); // wake up the IC core

    uint8_t wrcomm_cmd[2] = { 0x07, 0x21 }; // command to write to COMM register
    write_68(NUM_ICS, wrcomm_cmd, tx_data);

    wakeup_idle(num_ics); // wake up the isospi comms
    LTC681x_stcomm(MUX_DATALENGTH);
}

void enable_da_i2c(uint8_t num_ics, uint8_t da) {
    uint8_t tx_byte = 0b00000000 | (1 << da);
    transmit_i2c(num_ics, tx_byte);
    // For debugging to know which DA is being commanded
    bms_mux.num_da = da;
}

void disable_da_i2c(uint8_t num_ics) {
    uint8_t tx_byte = 0;
    transmit_i2c(num_ics, tx_byte);
}

// This function explicitally disables all muxes
void mux_init(uint8_t num_ics) {
    for (uint8_t i = 0; i < DA_BOARDS_PER_IC; i++) {
        enable_da_i2c(num_ics, i);

        // Disable Each MUX on the DA Board
        for (uint8_t j = 0; j < NUM_MUXES; j++) {
            configure_mux_until_ack(num_ics, MUXES[j], false, 0, 10);
        }
    }

    disable_da_i2c(num_ics);
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
     * ADBMS command message
     *
     * A: Address
     * M: Mux command
     */
    uint8_t tx_data[ADBMS_CMD_LEN * NUM_ICS] = { 0 };
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        tx_data[ic*NUM_ICS + 0] = START; // START xxxx
        tx_data[ic*NUM_ICS + 1] = NACK_STOP; // xxxx NACK_STOP

        tx_data[ic*NUM_ICS + 2] = START | (address >> 4); // START AAAA
        tx_data[ic*NUM_ICS + 3] = (address << 4) | NACK; // AAAA NACK
        tx_data[ic*NUM_ICS + 4] = BLANK; // xxxxBLANK
        tx_data[ic*NUM_ICS + 5] = mux_cmd << 4 | NACK_STOP; // MMMM NACK_STOP
    }

    wakeup_sleep(num_ics); // wake up the IC core

    uint8_t wrcomm_cmd[2] = { 0x07, 0x21 }; // command to write to COMM register
    write_68(NUM_ICS, wrcomm_cmd, tx_data);

    wakeup_idle(num_ics); // wake up the isospi comms
    LTC681x_stcomm(MUX_DATALENGTH);
}

uint8_t check_ack(uint8_t num_ics) {
    // Adapted from `LTC681x_rdcomm()`
    uint8_t cmd[2] = { 0x07, 0x22 };
    uint8_t rx_buffer[NUM_RX_BYT * num_ics];

    read_68(num_ics, cmd, rx_buffer);

    uint8_t status = 0;
    bool ack;
    // check if the order in the daisy chain is reversed
    for (uint8_t i = 0; i < num_ics; i++) {
        // Read the last Byte in each COMM Register. Memory is as follows:
        // D2[3:0], FCOM2[3:0]
        // Secondary device ACKs if FCOM2[3] is 0 (datasheet pg. 43)
        ack = ~(rx_buffer[NUM_RX_BYT * i + 5] >> 3) & 1;
        status |= ack << i;
    }

    return status;
}

bool configure_mux_until_ack(uint8_t num_ics, uint8_t address, bool enable,
                             uint8_t channel, uint8_t max_tries) {
    uint8_t try_counter = 0;

    uint8_t acks = 0;
    while (try_counter < max_tries) {
        configure_mux(num_ics, address, enable, channel);
        acks |= check_ack(num_ics);
        // Hardcoded for 6 BMS Chips
        for (uint8_t i = 0; i < NUM_ICS; i++) {
            if ((acks >> i) & 1) {
                continue;
            } else {
                return false;
            }
        }
        return true;
        try_counter++;
    }

    set_fault(BMS_FAULT_MUX_MIA);


    return false;
}
