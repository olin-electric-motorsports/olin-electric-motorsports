/*
 * Board: Accelerometer Module
 * Version: v1.0
 * Description: The goal of this board is to measure the frequency of vibrations in the chassis
 * in order to perform modal analysis.
 */

/****** Libraries ******/
#include <SPI.h>
#include <SD.h>
#include <Wire.h>

/****** LED Macros ******/
// Voltage Indicator LED
#define DDR_VLED DDRC
#define PORT_VLED PORTC
#define HIGH_VLED PC2
#define MED_VLED PC1
#define LOW_VLED PC0

// Status LED
#define DDR_SLED DDRD
#define PORT_SLED PORTD
#define ON_LED PD5
#define READY_LED PD6


/****** Button Macros ******/
#define BUTTON PD7
#define DDR_BUTTON DDRD


/****** SPI Macros ******/
#define MOSI PB3
#define MISO PB4
#define SCK PB5
#define DDR_SPI DDRB
#define PORT_SPI PORTB

// Accelerometer
#define ACC_CS PB2

#define READ 1
#define WRITE 0
#define MULTIPLE 1
#define SINGLE 0
#define RWbit 7 // Location of Read/Write Bit (Accelerometer)
#define MSbit 6 // Location of Multiple/Single Bit (Accelerometer)
#define WHOAMI 0x0F // Location if WHO AM I register (Accelerometer)
#define OUT_XL 0b101000 // Location of OUT_X_L (Accelerometer)
#define OUT_XH 0b101001 // Location of OUT_X_H (Accelerometer)
#define OUT_YL 0b101010 // Location of OUT_Y_L (Accelerometer)
#define OUT_YH 0b101011 // Location of OUT_Y_H (Accelerometer)
#define OUT_ZL 0b101100 // Location of OUT_Z_L (Accelerometer)
#define OUT_ZH 0b101101 // Location of OUT_Z_H (Accelerometer)

// SD Card
#define SD_CS PB1

/****** I2C Macros ******/
#define INA260_ADDR 1000000
#define VOLTAGE_REG 0x02

// Variable Declaration

void setup() {
  
  DDR_SLED |= _BV(READY_LED);
  DDR_BUTTON &= ~_BV(BUTTON);
  DDR_VLED |= _BV(HIGH_VLED);

  // Accelerometer CS Pin
  DDR_SPI |= _BV(ACC_CS);

  // Activate SD Card @ CS Pin
  // TODO: Check if PB1 can be used a select pin input for .begin() function
  SD.begin(SD_CS);

  // Activate I2C Communication
  Wire.begin();

  // Set SPI pins at Output
  DDR_SPI |= _BV(SCK) | _BV(MOSI);

  
//  PCICR |= _BV(PCIE2);
//  PCMSK2 |= _BV(PCINT23);
//  sei();
}

//ISR(PCINT2_vect) {
//  PORTD ^= _BV(PD6);
//}

void loop() {
  int xyzData[6]; // initalize memset

  // QUESTION: Do I need this if I initalize the variable in every loop?
  memset(xyzData,0,6); // set xyzData to zeros

  // get accelerometer data
  for (int i = 0; i < 6; i++) {
    xyzData[ i ] = getData(READ, SINGLE, (OUT_XL + i), ACC_CS);
  }

  // creates/opens file "data.txt"
  // starts writing at END of file
  File data = SD.open("data.txt", FILE_WRITE);
  if (data) {
    for ( int i = 0; i < 3; i++ ) {
      data.println(xyzData[ i*2 ] >> 6 | xyzData[ (i*2)+1 ] << 2);
    }
    data.println("");
    data.close();
  }
  
  // I2C Slave Address (INA260) -- 1000000
  // Bus Voltage register (0x02)
  // Alert Limit register (0x07)
  Wire.beginTransmission(INA260_ADDR);
  Wire.write(byte(VOLTAGE_REG));
  Wire.endTransmission();
  Wire.requestFrom(INA260_ADDR, 16);
  int voltage = 0b0;
  while (Wire.available()) {
    int data = Wire.read();
    // Will the data come in the right order to collect it like this?
    voltage = (voltage << 1) | data;
  }
  
  if (bit_is_set( PINB, PB1 )) {
    PORT_SLED ^= _BV(READY_LED);
    delay(1000);
  }
}

int getData(int rwbit, int msbit, int address, int cs) {
  // Accelerometer Datasheet - Max Speed 1MHz
  // Page 27 - SPI MODE 0 - Output on Falling Edge, Data Capture on Rising Edge
  
  SPI.beginTransaction(SPISettings(400000, MSBFIRST, SPI_MODE0));
  PORT_SPI &= ~_BV(cs);
  int output = SPI.transfer(rwbit << RWbit | msbit << MSbit | address);
  PORT_SPI |= _BV(cs);
  SPI.endTransaction();
  return output;
}
