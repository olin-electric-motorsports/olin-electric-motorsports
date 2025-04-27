#include <stdint.h>
#include <stdlib.h>

#include "icm20948.h"
#include "libs/spi/api.h"
#include <util/delay.h>

// #include "projects/can_print/can_print.h"

void icm_read_register(uint8_t _register, uint8_t* rx_data) {
    uint8_t tx_data[2] = { _register | (1 << 7), 0x0 };
    uint8_t _rx_data[2];
    spi_transceive_cs(tx_data, _rx_data, 2);
    *rx_data = _rx_data[1];
}

void icm_burst_read(uint8_t start_reg, uint8_t len, uint8_t* data) {
    uint8_t tx_buf[len + 1];
    uint8_t rx_buf[len + 1];
    tx_buf[0] = start_reg | 0x80;  
    for (uint8_t i = 1; i < len + 1; i++) {
        tx_buf[i] = 0x00;
    }
    spi_transceive_cs(tx_buf, rx_buf, len + 1);
    for (uint8_t i = 0; i < len; i++) {
        data[i] = rx_buf[i + 1];
    }
}


void icm_multi_read(uint8_t _register, uint8_t len, uint8_t* data) {
    for (uint8_t i = 0; i < len; i++) {
        icm_read_register(_register + i, &data[i]);
    }
}

void icm_write_register(uint8_t _register, uint8_t tx_data) {
    uint8_t _tx_data[2] = { _register, tx_data };
    spi_transceive_cs(_tx_data, NULL, 2);
}

void icm_multi_write(uint8_t _register, uint8_t len, const uint8_t *data) {
    for (uint8_t i = 0; i < len; i++) {
        icm_write_register(_register + i, data[i]);
    }
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
    //Set the ODR of devices on the secondary I2C bus to 137.5Hz (1.1 kHz/(2^(0x04))) in the REG_I2C_MST_ODR_CONFIG (0x00) register
    regChar = 0x03;
    icm_write_register(I2C_MST_ODR_CONFIG, regChar);
    write_mag(MAGNETOMETER_ADDR, CNTL2, 0x06); // continuous mode 3 -> 50 Hz
    _delay_ms(10);
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
    // for (unsigned char i = 0; i < len; i++) {
    //     icm_read_register(0x3B + i, &data[i]);
    // }
    icm_burst_read(0x3B, len, data);
    //set the bank to 3 again so we can turn off the mag
    switch_register_bank(BANK_3);
    //disable the mag communcation again in I2C_SLV0_CTRL
    regChar = 0x00;
    icm_write_register(0x05, regChar);
    switch_register_bank(BANK_0);
}

void getChipAccelGyroCalibration()
{
	unsigned char sampleBank[12] = {0,0,0,0,0,0,0,0,0,0,0,0};
	unsigned char accelRegOTP[8] = {0,0,0,0,0,0,0,0};
	long AxisStorage[6] = {0,0,0,0,0,0};
	short hardwareScale[6] = {0,0,0,0,0,0};
	int i = 0;
	unsigned char regChar[8] = {0};
	switch_register_bank(0);
	//out of sleep
	regChar[0] = 0x01;
    icm_write_register(0x06, regChar[0]);
	//Allow the MEMS hardware to warm up
	_delay_ms(100);
    switch_register_bank(2);

	//Set sensor ODR to 1kHz
	regChar[0] = 0x00;
    icm_write_register(0x00, regChar[0]);

	//Set rate (±250 dps), DLPF status (on), DLPF 3dB to (119.5 Hz)
	// regChar[0] = 0x11;
    // icm_write_register(0x01, regChar[0]);

	//Set Accel ODR to 1kHz
	regChar[0] = 0x00;
	regChar[1] = 0x00;
    icm_write_register(0x10, regChar[0]);
    icm_write_register(0x11, regChar[1]);

	//Set Accel Scale to ±2g
	regChar[0] = 0x11;
    icm_write_register(0x14, regChar[0]);

	//START DATA COLLECTION
    switch_register_bank(0);
	//Aquire 20 samples from each register
	for(i = 0; i < 20; i++)
	{
        icm_burst_read(0x2D, 12, &sampleBank[0]);
		//Accel Axis (x, y, z)
		AxisStorage[0] += (short) ((sampleBank[0] << 8) | sampleBank[1]);
		AxisStorage[1] += (short) ((sampleBank[2] << 8) | sampleBank[3]);
		AxisStorage[2] += (short) ((sampleBank[4] << 8) | sampleBank[5]);
		//Gyro Axis (x, y, z)
		AxisStorage[3] += (short) ((sampleBank[6] << 8) | sampleBank[7]);
		AxisStorage[4] += (short) ((sampleBank[8] << 8) | sampleBank[9]);
		AxisStorage[5] += (short) ((sampleBank[10] << 8) | sampleBank[11]);
		_delay_ms(5);
	}

	//Get the simple average from each axis, and remove gravity if appliciable
	for(i = 0; i < 6; i++)
	{
		AxisStorage[i] /= 20;
		if(i < 3)
		{
			if(i == 2)
			{
				if(AxisStorage[2] > 0)
				{
					//Remove 1g (16384x LSB) from offset
					AxisStorage[i] -= 0x4000;
				}
				else
				{
					//If the chip is upside down, remove 1g (16384x LSB)
					AxisStorage[i] += 0x4000;
				}
			}
		}
		else
		{
			//Get bias scale (div by 0.031)
			AxisStorage[i] *= 32;
			//Convert to DPS from LSB
            // SHOULD THIS BE 2000??
			AxisStorage[i] /= 131;
			//Negate for a correct bias
			AxisStorage[i] = -AxisStorage[i];
		}
		//Remove leading zeroes and convert to two bytes for IMU
		hardwareScale[i] = (short)(AxisStorage[i] & 0xFFFF);
	}
	//Now, read Accel bias values in OTP memory
	//Set to bank one
    switch_register_bank(1);

	//Perform read
    icm_burst_read(0x14, 8, &accelRegOTP[0]);
	//Create hardware accel bias by scaling ±2g average to ±16g range (1g = 2048x LSB)
	hardwareScale[0] = (((short)accelRegOTP[0] << 8) + (short)accelRegOTP[1]) - (hardwareScale[0] >> 3);
	hardwareScale[1] = (((short)accelRegOTP[3] << 8) + (short)accelRegOTP[4]) - (hardwareScale[1] >> 3);
	hardwareScale[2] = (((short)accelRegOTP[6] << 8) + (short)accelRegOTP[7]) - (hardwareScale[2] >> 3);
	//Write hardware accel values to bias registers
    regChar[0] = (unsigned char)(hardwareScale[0] >> 8 & 0xFF);
    regChar[1] = (unsigned char)((hardwareScale[0] & 0xFE) | (accelRegOTP[1] & 0x01));
    regChar[3] = (unsigned char)(hardwareScale[1] >> 8 & 0xFF);
    regChar[4] = (unsigned char)((hardwareScale[1] & 0xFE) | (accelRegOTP[4] & 0x01));
    regChar[6] = (unsigned char)(hardwareScale[2] >> 8 & 0xFF);
    regChar[7] = (unsigned char)((hardwareScale[2] & 0xFE) | (accelRegOTP[7] & 0x01));
    // icm_multi_write(0x14, 6, regChar);
    switch_register_bank(2);
	//Write hardware gyro values to bias registers
	regChar[0] = (unsigned char)(hardwareScale[3] >> 8 & 0xFF);
	regChar[1] = (unsigned char)(hardwareScale[3] & 0xFE);
	regChar[2] = (unsigned char)(hardwareScale[4] >> 8 & 0xFF);
	regChar[3] = (unsigned char)(hardwareScale[4] & 0xFE);
	regChar[4] = (unsigned char)(hardwareScale[5] >> 8 & 0xFF);
	regChar[5] = (unsigned char)(hardwareScale[5] & 0xFE);
    icm_multi_write(0x03, 6, regChar);
    switch_register_bank(0);
}