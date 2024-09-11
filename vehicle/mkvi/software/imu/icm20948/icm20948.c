#include <stdint.h>
#include <stdlib.h>

#include "icm20948.h"
#include "libs/spi/api.h"
#include <util/delay.h>

#include "projects/can_print/can_print.h"

void icm_read_register(uint8_t register_, uint8_t* rx_data) {
    uint8_t tx_data[2] = { register_ | (1 << 7), 0x0 };
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

void init_magnetometer(void) {
    switch_register_bank(BANK_3);

    // Close all auxilary I2C buses
    icm_write_register(I2C_SLV0_CTRL, 0x0);
    icm_write_register(I2C_SLV1_CTRL, 0x0);
    icm_write_register(I2C_SLV2_CTRL, 0x0);
    icm_write_register(I2C_SLV3_CTRL, 0x0);

    icm_write_register(I2C_MST_ODR_CONFIG, 0x04);

    switch_register_bank(BANK_0);
}

void read_magnetometer(uint8_t register_, uint8_t* rx_data) {
    switch_register_bank(BANK_3);
    uint8_t _rx_data;

    // Write the magnetometer addr for reading
    icm_write_register(I2C_SLV4_ADDR, (I2C_READ << 7) | MAGNETOMETER_ADDR);

    // Set the magnetometer register addr to read
    icm_write_register(I2C_SLV4_REG, register_);

    // Enable reading from aux I2C device
    icm_write_register(I2C_SLV4_CTRL, 0x80);

    switch_register_bank(BANK_0);

    // // Toggle I2C controller
    icm_write_register(USER_CTRL, 0x20); // TODO: Future, read before writing
    _delay_ms(30);
    // icm_write_register(USER_CTRL, 0x00);

    switch_register_bank(BANK_3);
    // Read data
    icm_read_register(I2C_SLV4_DI, &_rx_data);
    // icm_read_register(EXT_SLV_SENS_DATA_00, &_rx_data);
    _can_print(_rx_data);
}

void write_magnetometer(uint8_t register_, uint8_t tx_data) {
    ;
}
