#ifndef COOLING_BOARD_H
#define COOLING_BOARD_H


#include <stdint.h>

gpio_t FAN_SIGNAL = PC1;
gpio_t WATER_SIGNAL = PD1;
gpio_t FAN_POWER_LED = PB0;

void initializeCoolingBoard();
void controlCoolingSystem(uint16_t temperature1, uint16_t temperature2);

#endif
