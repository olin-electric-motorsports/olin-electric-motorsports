#include <Arduino.h>
#include "MLX90621.h"
#include <Wire.h>
MLX90621 sensor; // create an instance of the Sensor class

void setup(){ 
  //Serial.begin(19200);
  //Serial.println("trying to initialize sensor...");
  sensor.initialise (16); // start the thermo cam with 8 frames per second
  //Serial.println("sensor initialized!");
}
void loop(){
  sensor.measure(); //get new readings from the sensor

/*
  for(int y=0;y<4;y++){ //go through all the rows
    Serial.print("[");
    
    for(int x=0;x<16;x++){ //go through all the columns
      double tempAtXY= sensor.getTemperature(y+x*4); // extract the temperature at position x/y
      Serial.print(tempAtXY);
         
      if (x<15) Serial.print(",");
    }
    Serial.print("]");
    if (y<3)Serial.print("~"); 
  }
  Serial.print("\n");
*/
  delay(31);
};
