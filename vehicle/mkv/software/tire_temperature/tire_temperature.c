#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#define UPDATE_STATUS 1
#define PLED1 PB2
#define PLED2 PB3

volatile uint8_t clock_prescale = 0;
volatile uint8_t timer_flag = 0x00;
uint8_t timer_max = 20;

ISR(TIMER0_COMPA_vect){

  clock_prescale++;
	if(clock_prescale>timer_max) {
    //set UPDATE_STATUS bit to 1
		timer_flag |= _BV(UPDATE_STATUS);
		clock_prescale = 0;
	}
}

void initTimer(void) {
    // define bit value for timer/counter control register
    TCCR0A = _BV(WGM01);
    // set clock prescaler
    TCCR0B = 0b101;
    //Match A Interrupt enabled
    TIMSK0 |= _BV(OCIE0A);
    // reset value when OCR0A hits certain value
    OCR0A = 128;

}

int main (void) {
    sei();
    DDRB |= _BV(PLED1);
    DDRB |= _BV(PLED2);
    initTimer();

    while (1) {
      if(bit_is_set(timer_flag,UPDATE_STATUS)) {
        timer_flag &= ~_BV(UPDATE_STATUS);
        PORTB ^= _BV(PLED1);
        PORTB ^= _BV(PLED2);

      }
    }


    /*
    while (1) {

      PORTB |= _BV(PB2);
      PORTB |= _BV(PB3);
      _delay_ms(1000);
      PORTB &= ~_BV(PB2);
      PORTB &= ~_BV(PB3);

      PORTB ^= _BV(PB2);
      PORTB ^= _BV(PB3);
      _delay_ms(1000);
    }
    */

}
