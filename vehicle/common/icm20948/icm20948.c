#include <stdint.h>
#include <stdlib.h>

#include "icm20948.h"
#include "libs/spi/api.h"
#include <util/delay.h>

// #include "projects/can_print/can_print.h"

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

void init_magnetometer()
{
    unsigned char regChar;
    //We need to access the I2C_MST_CTRL and REG_I2C_MST_ODR_CONFIG registers to set up the secondary I2C bus
    switch_register_bank(BANK_3);
    //Quickly close all open I2C buses that might have been active (0x05:ch0 0x09:ch1 0x0D:ch2 0x11:ch3) - CTRL Registers
    regChar = 0x00;
    icm_write_register(0x05, regChar);
    icm_write_register(0x09, regChar);
    icm_write_register(0x0D, regChar);
    icm_write_register(0x11, regChar);
    //Set the ODR of devices on the secondary I2C bus to 68.75Hz (1.1 kHz/(2^(0x04))) in the REG_I2C_MST_ODR_CONFIG (0x00) register
    regChar = 0x04;
    icm_write_register(I2C_MST_ODR_CONFIG, regChar);
    write_mag(MAGNETOMETER_ADDR, CNTL2, 0x04);
}

void write_mag(unsigned char addr, unsigned char reg, unsigned char data)
{
    //Note: For write operations we use the SLV1 registers
    unsigned char regChar;
    //Make sure we are at bank 3
    switch_register_bank(BANK_3);
    //Change the physical I2C address (I2C_SLV1_ADDR) (0x00 ensures transaction is a write), ored with the address (in this case 0x0C) = final should be 0x0C
    regChar = 0x00 | addr;
    icm_write_register(0x07, regChar);
    //changes the register on the IC we want to write to (I2C_SLV1_REG)
    regChar = reg;
    icm_write_register(0x08, regChar);
    //This is the actual data we want to write to the register (REG_I2C_SLV1_DO)
    regChar = data;
    icm_write_register(0x0A, regChar);
    // //enables writing of data we just wrote for this slave, and also sets the length of data (1) to be written into the EXT_SENS_DATA registers in bank 0 (I2C_SLV1_CTRL)
    regChar = 0x81;
    icm_write_register(0x09, regChar);
    //Set the chip to bank 0 so we can read data
    switch_register_bank(BANK_0);
    //enables the master I2C bus module in USER_CTRL
    icm_write_register(0x03, regChar);
    regChar |= 0x20;
    icm_write_register(0x03, regChar);
    //wait a bit so the mag can output to the bank 0 regiters can read 
    _delay_ms(70);
    //disable the I2C master again so we don't have any conflicts
    icm_read_register(0x03, &regChar);
    regChar &= 0xDF;
    icm_write_register(0x03, regChar);
    //set the bank to 3 again so we can turn off the mag
    switch_register_bank(BANK_3);
    //disable the mag communcation again in I2C_SLV1_CTRL
    regChar = 0x00;
    icm_write_register(0x09, regChar);
    switch_register_bank(BANK_0);
}

void read_mag(unsigned char addr, unsigned char reg, unsigned char len, unsigned char *data)
{
    //Note: For read operations we use the SLV0 registers
    unsigned char regChar;
    //Make sure we are at bank 3
    switch_register_bank(BANK_3);
    //Change the physical I2C address (I2C_SLV0_ADDR) (0x80 ensures transaction is a read), ored with the address (in this case 0x0C) = final should be 0x8C
    regChar = 0x80 | addr;
    icm_write_register(0x03, regChar);
    //changes the register on the IC we want to read from (I2C_SLV0_REG)
    regChar = reg;
    icm_write_register(0x04, regChar);
    //enables reading for this slave (0-4), and also sets the length of data to be read into the EXT_SENS_DATA registers in bank 0 (I2C_SLV0_CTRL)
    regChar = 0x80 | len;
    icm_write_register(0x05, regChar);
    //Set the chip to bank 0 so we can read data
    switch_register_bank(BANK_0);
    //enables the master I2C bus module in USER_CTRL
    icm_read_register(0x03, &regChar);
    regChar |= 0x20;
    icm_write_register(0x03, regChar);
    //wait a bit so the mag can output to the bank 0 regiters can read 
    _delay_ms(30);
    //disable the I2C master again so we don't have any conflicts
    icm_read_register(0x03, &regChar);
    regChar &= 0xDF;
    icm_write_register(0x03, regChar);
    //read the output of the mag, starting on REG_EXT_SLV_SENS_DATA_00 and moving forward (len) bytes
    for (unsigned char i = 0; i < len; i++) {
        icm_read_register(0x3B + i, &data[i]);
    }
    //set the bank to 3 again so we can turn off the mag
    switch_register_bank(BANK_3);
    //disable the mag communcation again in I2C_SLV0_CTRL
    regChar = 0x00;
    icm_write_register(0x05, regChar);
    switch_register_bank(BANK_0);
}