#include <libopencm3/stm32/common.h>
#include <libopencm3/stm32/f1/gpio.h>
#include <libopencm3/stm32/f1/memorymap.h>
#include <libopencm3/stm32/f1/rcc.h>


int main(void) {
    rcc_periph_clock_enable(RCC_GPIOC);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL,
                  GPIO13);
    while (1) {
        gpio_set(GPIOC, GPIO13);
    }
}