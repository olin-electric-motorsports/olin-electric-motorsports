#include <stdbool.h>
#include <stdint.h>

extern volatile bool run_1ms;
extern volatile uint32_t start_time;

/*
 * Timer1 is used to generate a 1ms timer that increments a time variable each
 * millisecond. `get_time` is used to get the current time, doing so by
 * disabling interrupts, storing the time, and re-enabling interrupts to ensure
 * that there is no issue with accessing a 32-bit number on an 8-bit machine
 */
uint32_t get_time(void);
