#include "libs/adc/api.h"
#include "libs/uart/api.h"
#include <avr/interrupt.h>
#include <stdbool.h>
#include <stdio.h>
#include <util/delay.h>

uint16_t adc_value = 0;
volatile bool adc_ready = false;

void adc_irq(void) {
    adc_read_results(&adc_value);
    adc_start_convert(6);
    adc_ready = true;
}

int main(void) {
    adc_init();
    uart_init(9600);

    sei();

    adc_interrupt_enable(adc_irq);
    adc_start_convert(6);
    for (;;) {
        if (adc_ready) {
            char msg[64];
            sprintf(msg, "adc: %d\r\n", adc_value);
            uart_puts(msg);
            adc_ready = false;
        }
        _delay_ms(10);
    }
}
