/*
 * Helper definitions for ADC modes, cell channels, STAT conversions, etc.
 * Mostly pulled from LTCs DC2259_test Arduino sketch.
 * 
 * @author Alex Hoppe '19
 * @author Vienna Scheyer '21
 */

#ifndef _LTC_DEFS_H
#define _LTC_DEFS_H

// Definitions for ADC conversion modes
#define MD_422HZ_1KHZ 0
#define MD_27KHZ_14KHZ 1
#define MD_7KHZ_3KHZ 2
#define MD_26HZ_2KHZ 3


#define ADC_OPT_ENABLED 1
#define ADC_OPT_DISABLED 0

// Options for which cells to start an ADC conversion on
#define CELL_CH_ALL 0
#define CELL_CH_1and7 1
#define CELL_CH_2and8 2
#define CELL_CH_3and9 3
#define CELL_CH_4and10 4
#define CELL_CH_5and11 5
#define CELL_CH_6and12 6

// // Self test options
// #define SELFTEST_1 1
// #define SELFTEST_2 2

// Options for which AUX voltages/channels to start an ADC conversion on
#define AUX_CH_ALL 0
#define AUX_CH_GPIO1 1
#define AUX_CH_GPIO2 2
#define AUX_CH_GPIO3 3
#define AUX_CH_GPIO4 4
#define AUX_CH_GPIO5 5
#define AUX_CH_VREF2 6

// Options for which types of STAT register checks to perform
#define STAT_CH_ALL 0
#define STAT_CH_SOC 1
#define STAT_CH_ITEMP 2
#define STAT_CH_VREGA 3
#define STAT_CH_VREGD 4

// Option for permitting discharge during cell voltage conversion
#define DCP_DISABLED 0
#define DCP_ENABLED 1

//
// #define PULL_UP_CURRENT 1
// #define PULL_DOWN_CURRENT 0

#endif
