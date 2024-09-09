#include <stdint.h>
#include <stdlib.h>

#include "icm20948.h"
#include "libs/spi/api.h"

#include "projects/can_print/can_print.h"

void icm_read_register(uint8_t register_, uint8_t* rx_data) {
    uint8_t tx_data[2] = { register_ + (1 << 7), 0x0 };
    uint8_t _rx_data[2];
    spi_transceive_cs(tx_data, _rx_data, 2);
    *rx_data = _rx_data[1];
}

void icm_write_register(uint8_t _register, uint8_t tx_data) {
    uint8_t _tx_data[2] = { _register, tx_data };
    spi_transceive_cs(_tx_data, NULL, 2);
}

// TODO: FIFO use more efficient burst SPI reads

void switch_register_bank(uint8_t bank) {
    icm_write_register(REG_BANK_SEL, (bank << 4));
}
