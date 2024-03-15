#include <libopencm3/stm32/common.h>
#include <libopencm3/stm32/f1/gpio.h>
#include <libopencm3/stm32/f1/memorymap.h>
#include <libopencm3/stm32/f1/rcc.h>

int main(void) {
    rcc_periph_clock_enable(RCC_GPIOA);
    gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL,
                  GPIO5);
    while (1) {
        for (int i = 0; i < 500000; i++) {
            __asm__("nop");
        }

        gpio_toggle(GPIOA, GPIO5);
    }
}
