#include "Wire.h"

void setup() {
  Wire.begin();
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  Wire.beginTransmission(0b1110000);
  Wire.write(0b00001001);
  Wire.endTransmission();
  delay(500);
}
