/*
 * Sample Arduino Code for Spi Secondary 
 * 
*/
#include<SPI.h>
#include<stdio.h>
#include<string.h>
#include<avr/io.h>
boolean received;
volatile int res = 0;
char buffer[20];

void setup() {
  Serial.begin(9600);
  pinMode(MISO,OUTPUT);
  SPCR |= _BV(SPE);
  SPI.attachInterrupt();
  DDRD |= _BV(PD6);
  DDRD |= _BV(PD5);
  PORTD |= _BV(6);
  PORTD |= _BV(5);
  delay(1000);
  PORTD &= ~_BV(6);
  PORTD &= ~_BV(5);
}

ISR (SPI_STC_vect)
{
  res = SPDR;
  received = true;
  SPDR = res+1;
}

void loop() {
  if(received){
    PORTD ^= _BV(6);
    if (res < 0x04) {
      PORTD |= _BV(PD5);
    } else {
      PORTD &= ~_BV(PD5);
    }
    received = false;
  }
  delay(1000);

}