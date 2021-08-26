#include "Adafruit_NeoPixel.h"


//define NeoPixel Pin and Number of LEDs
#define PIN 9
#define NUM_LEDS 15
//create a NeoPixel strip
Adafruit_NeoPixel strip(NUM_LEDS, PIN, NEO_RGB + NEO_KHZ800);

void setup() {
  // start the strip and blank it out
  strip.begin();
  strip.show();
}

void loop() {
  // set pixel to red, delay(1000)
  //strip.setPixelColor(0, 255, 0, 0);
  //strip.show();
  //delay(1000);
  // set pixel to off, delay(1000)
  //strip.setPixelColor(0, 0, 0, 0);
  //strip.show();
  //delay(1000);
  
  colorWipe(strip.Color(255,   0,   0)     , 50); // Red
  colorWipe(strip.Color(  0, 255,   0)     , 50); // Green
  colorWipe(strip.Color(  0,   0, 255)     , 50); // Blue

}

void colorWipe(uint32_t color, int wait) {
  for(int i=0; i<strip.numPixels(); i++) { // For each pixel in strip...
    strip.setPixelColor(i, color);         //  Set pixel's color (in RAM)
    strip.show();                          //  Update strip to match
    delay(wait);                           //  Pause for a moment
  }
}
