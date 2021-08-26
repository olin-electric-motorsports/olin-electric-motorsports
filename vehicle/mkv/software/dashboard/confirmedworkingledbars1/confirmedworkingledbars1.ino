/*
Header:
    This is the functional code for the dashboard LED bars. 
    Function: Responsible for displaying %throttle & %SoC
            : Interface with Dashboard Right

Author:
    Emily Wan
    ewan@olin.edu
    4254999033
*/

#include <Wire.h>
#include <Adafruit_GFX.h>
#include "Adafruit_LEDBackpack.h"

Adafruit_24bargraph socbar = Adafruit_24bargraph();
Adafruit_24bargraph throttlebar = Adafruit_24bargraph();
15
int throttle;
int SoC;

double fracThrottle;
double fracSoC;

int bar1len;
int bar2len;

void setup() {
  
  throttlebar.begin(0x70);  // Left Bar Address
  socbar.begin(0x77);  // Right Bar Address


  for (uint8_t b=0; b<24; b++){
    if ((b % 3) == 0)  throttlebar.setBar(b, LED_RED);
    if ((b % 3) == 1)  throttlebar.setBar(b, LED_YELLOW);
    if ((b % 3) == 2)  throttlebar.setBar(b, LED_GREEN);
  }
  throttlebar.writeDisplay();
    
  for (uint8_t a=0; a<24; a++){
    if ((a % 3) == 0)  socbar.setBar(a, LED_RED);
    if ((a % 3) == 1)  socbar.setBar(a, LED_YELLOW);
    if ((a % 3) == 2)  socbar.setBar(a, LED_GREEN);
  }
  socbar.writeDisplay();
  delay(2000);
  
  for (uint8_t b=0; b<24; b++){
      throttlebar.setBar(b, LED_OFF);
      throttlebar.writeDisplay();
  }
  for (uint8_t b=0; b<24; b++){
      throttlebar.setBar(b, LED_OFF);
      throttlebar.writeDisplay();
  }
 for (uint8_t b=0; b<24; b++) {
   throttlebar.setBar(b, LED_RED);
   throttlebar.writeDisplay();
   delay(50);
   throttlebar.setBar(b, LED_OFF);
   throttlebar.writeDisplay();
 }
  for (uint8_t b=0; b<24; b++) {
   throttlebar.setBar(b, LED_GREEN);
   throttlebar.writeDisplay();
   delay(50);
   throttlebar.setBar(b, LED_OFF);
   throttlebar.writeDisplay();
 }

 for (uint8_t b=0; b<24; b++) {
   throttlebar.setBar(23-b, LED_YELLOW);
   throttlebar.writeDisplay();
   delay(50);
   throttlebar.setBar(23-b, LED_OFF);
   throttlebar.writeDisplay();
 }
 for (uint8_t b=0; b<24; b++) {
   socbar.setBar(b, LED_RED);
   socbar.writeDisplay();
   delay(50);
   socbar.setBar(b, LED_OFF);
   socbar.writeDisplay();
 }
  for (uint8_t b=0; b<24; b++) {
   socbar.setBar(b, LED_GREEN);
   socbar.writeDisplay();
   delay(50);
   socbar.setBar(b, LED_OFF);
   socbar.writeDisplay();
 }

 for (uint8_t b=0; b<24; b++) {
   socbar.setBar(23-b, LED_YELLOW);
   socbar.writeDisplay();
   delay(50);
   socbar.setBar(23-b, LED_OFF);
   socbar.writeDisplay();
 }  
}



void loop() {


  throttle = analogRead(PC0);
  SoC = analogRead(PC1);

  bar1len = throttle*24/1024;
  bar2len = SoC*24/1024;

 for (uint8_t b=0; b<bar1len; b++) {
   int s =(b+12)%24;
   throttlebar.setBar(s, LED_GREEN);

 } 
  
  for (uint8_t a=0; a<bar2len; a++) {
   int d = (a+12)%24;
   socbar.setBar(d, LED_GREEN);
 }
 
 throttlebar.writeDisplay();
 socbar.writeDisplay();
 
 delay(50);
 
 for (uint8_t b=0; b<24; b++) {
   int s =(b+12)%24;
   throttlebar.setBar(s, LED_OFF);
 } 
  
  for (uint8_t a=0; a<24; a++) {
   int d = (a+12)%24;
   socbar.setBar(d, LED_OFF);
 }
   
}
