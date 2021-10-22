#include <stdint.h>

#define AS_VOLTAGE(raw) (float)raw * (0.004882813)

/*
 * adc_init
 *
 * Initializes analog/digital converter peripheral
 *
 * TODO
 *   - Add in autoconvert support. We don't use this currently but we could in 
 *     the future.
 */
void adc_init(void);

/*
 * adc_start_convert
 *
 * Begins ADC conversion with given ADC
 *
 * Parameters
 *   - (uint8_t) pin: the pin to use, must be between 0 and 10
 *
 * Returns (void)
 */
void adc_start_convert(uint8_t pin);

/*
 * adc_poll_complete
 *
 * Polls for completion of conversion, and, if successful, returns (via out
 * parameter) the value of the ADC
 *
 * Parameters
 *   - [out] (uint16_t *) result: Pointer to where the value will be stored
 *
 * Returns (int)
 *   -  0: Data ready
 *   -  1: Error
 *   - -1: Data not ready
 */
int adc_poll_complete(uint16_t* result);

/*
 * adc_read_results
 *
 * Reads the value of the ADC register. Used as an alternative to
 * adc_poll_complete when using interrupts.
 *
 * Parameters
 *   - [out] (uint16_t *) result: Pointer to where the value will be stored
 *
 * Returns (void)
 */
void adc_read_results(uint16_t* result);

/*
 * adc_interrupt_enable
 *
 * Enables interrupt when ADC data is complete and registers a callback function
 * to be called in the interrupt service routine.
 *
 * Parameters:
 *   - (function ptr) callback: Function to be called when the ISR runs
 *
 * Returns (void)
 */
void adc_interrupt_enable(void (*callback)(void));

/*
 * adc_read
 *
 * Function to read an ADC value. Wraps other functions and is provided as a
 * convenience.
 *
 * WARNING: This function is blocking and won't return until the conversion is
 * complete.
 *
 * Parameters:
 *   - (uint8_t) pin: the pin to use, must be between 0 and 10
 *
 * Returns (uint16_t)
 *   - Value of the ADC conversion
 */
uint16_t adc_read(uint8_t pin);
