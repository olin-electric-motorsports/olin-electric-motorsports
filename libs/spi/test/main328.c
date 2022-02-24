// #include <avr/interrupt.h>
// #include <avr/io.h>
// #include <stdbool.h>
#include <util/delay.h>

#include "libs/spi/api.h"

#include "config328.h"

#define LEN 1
uint8_t txdata[LEN] = { 0x00 };
uint8_t rxdata[LEN] = { 0x00 };

int main(void) {
    spi_init(&spi_cfg);

    for (;;) {
        _delay_ms(1000);
        spi_transceive(txdata, rxdata, LEN);
        for (uint8_t i = 0; i < LEN; i++) {
            if (rxdata[i] == 0x16) {
                txdata[i] = 0x32;
            } else {
                txdata[i] = 0x00;
            }
        }
    }
}
