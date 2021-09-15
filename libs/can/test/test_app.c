#include "libs/can/api.h"
#include <avr/io.h>
#include <util/delay.h>

#define LED0 (PD6)

int main(void) {
    can_init(BAUD_500KBPS);

    can_frame_t msg = {
        .id = 0x010,
        .dlc = 1,
        .mob = 0,
    };

    uint8_t can_data[1] = { 0x0F };

    msg.data = can_data;

    while (1) {
        can_send(&msg);
        _delay_ms(1000);
    }
}
