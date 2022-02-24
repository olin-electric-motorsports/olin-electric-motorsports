#include <avr/io.h>
#include <util/delay.h>

#include "config.h"
#include "libs/spi/api.h"

#define LEN 6
uint8_t txdata[LEN] = { 0x01, 0x16, 0x03, 0xD3, 0xFF, 0x08 };
uint8_t rxdata[LEN] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

int main(void) {
    spi_init(&spi_cfg);

    for (;;) {
        _delay_ms(1);
        spi_transceive(txdata, rxdata, LEN);
    }
}
