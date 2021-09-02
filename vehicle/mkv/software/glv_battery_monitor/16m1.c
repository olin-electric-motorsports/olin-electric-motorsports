#include <avr/io.h>
#include <util/delay.h>


//Debugging LEDS

#define LED1    PB2
#define LED2    PB3
#define LED3    PB4


uint8_t gCAN_MSG[8] = {0, 0, 0, 0, 0, 0, 0, 0};





int main(void) {

  DDRB |= _BV(LED1) | _BV(LED2) | _BV(LED3)

  while(1){
    //get current info
    //CAN message
    CAN_transmit(//Manu needs to give me these 3 values, , , gCAN_MSG);

  }

}
