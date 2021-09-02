#include <avr/io.h>
#include <util/delay.h>


int main(void) {
  //Data Direction Registry (basically if its active or not)
  DDRB |= _BV(PC0);
  //This only activates the port, we need to turn it on if we want to have it on

  //DDRB &= _BV(PB6);
  //Sets us the PIN as an output
  //The numbers depend on the board and dont always match in PINS

  /**
  while(1)
  {
    //if (bit_is_set(PINB, PB6))
    {
      //Turns PC0 & PC1 ON
      PORTB |= _BV(PC0) | _BV(PC1);
    }
    //else
    {
      //Turns PC0 & PC1 OFF
      PORTB &= ~_BV(PC0) | _BV(PC1);
    }
  }*/

  //Does the same thing the the previous while but in less code
  while(1)
  {
    PORTB ^= _BV(PB0);
    _delay_ms(20);
  }
}
