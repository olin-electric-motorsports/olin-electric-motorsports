/*
 * BMS DEMO TX 
 *
 * CAN transmitting code from Tutorial 6. Transmits a CAN message on 0x25 with a 0
 * or 0xFF to turn on or off an LED based on a button state.
 *
 * @author Alex Hoppe '19
 */

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "can_api.h"

#define LED1_PIN    PD5
#define LED2_PIN    PD6
#define LED3_PIN    PD7

#define LED_PORT    PORTD
#define LED_DDR     DDRD
uint8_t msg[1];

// ISR(PCINT0_vect) {
//     /* If button is pressed, turn the light on */
//     if (bit_is_clear(PINB, PINOUT_1)) {
//         PORTB |= _BV(LED2_PIN);
//     } else {
//         PORTB &= ~_BV(LED2_PIN);
//     }
// }


int main (void) {
    
    /* Set the data direction register so the led pin is output */
    LED_DDR |= _BV(LED1_PIN) | _BV(LED2_PIN) | _BV(LED3_PIN);   
        
//    /* Set up input pin with pull-up resistor */
//    DDRB &= ~_BV(PINOUT_1);     /* Sanity check pin to input */
//    PORTB |= _BV(PINOUT_1);     /* Set output high (if DDR is set to input, 
//                                 * this sets a pull-up resistor */

    sei();
    
//    /* set up pin change interrupts */    
//    PCICR |= _BV(PCIE0);
//    PCMSK0 |= _BV(PINOUT_1);

    /* Initialize CAN */
    CAN_init(CAN_ENABLED);

    while (1) {
        LED_PORT ^= _BV(LED3_PIN);
        
        /* If this board's LED is on, set the CAN msg on */
        if (bit_is_clear(PIND, LED3_PIN)) {
            msg[0] = 0x00;
        } else {
            msg[0] = 0xFF;
        }
        CAN_transmit(0, CAN_ID_TUTORIAL6, CAN_LEN_TUTORIAL6, msg);
        
        _delay_ms(250);
    }                               
}
