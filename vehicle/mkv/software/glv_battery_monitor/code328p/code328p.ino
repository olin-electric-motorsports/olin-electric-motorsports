//Import the Adafruit INA260 libraries for reading current
#include "Adafruit_INA260.h"


//Import the SPI library for communication
#include<SPI.h>  

Adafruit_INA260 ina260 = Adafruit_INA260();
void setup() {
  
  //Start the INA260 chip
  ina260.begin();
  
  //begin SPI protocol and set clock divider
  SPI.begin();
  SPI.setClockDivider(SPI_CLOCK_DIV16);
}

void loop() {
  //check current through shunt resistor in INA260
  float current = ina260.readCurrent();
  
  //set SS LOW to start transfer, then send current and set SS back to HIGH
  digitalWrite(SS, LOW);     
  unsigned int Masterecieve = SPI.transfer(current); 
  digitalWrite(SS, HIGH);       
  
  //Wait until next current check
  delay(1000);
}
