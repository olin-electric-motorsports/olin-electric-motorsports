#include "libs/adc/api.h"
#include "libs/uart/api.h"
#include <stdio.h>
#include <stdbool.h>

uint16_t adc_value = 0;
volatile bool adc_ready = false;

void adc_irq(void) {
    adc_poll_complete(&adc_value);
    adc_ready = true;
}

int main(void) {
    adc_init();
    uart_init(9600);

    adc_interrupt_enable(adc_irq);
    adc_start_convert(0);
    for (;;) {
        if (adc_ready) {
            char msg[64];
            sprintf(msg, "adc: %d\n", adc_value);
            uart_puts(msg);
        }
    }
}
