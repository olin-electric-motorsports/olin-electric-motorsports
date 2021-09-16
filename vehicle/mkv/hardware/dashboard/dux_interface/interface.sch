EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "MKV Dashboard Interface Board"
Date "2019-11-11"
Rev "0"
Comp "Olin Electric Motorsports"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:MM_F_VT_20 J1
U 1 1 5DC9C7F3
P 900 2000
F 0 "J1" H 856 3347 60  0000 C CNN
F 1 "MM_F_VT_20" H 856 3241 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_20" H 700 3100 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F2-338068-0" H 800 3200 60  0001 C CNN
F 4 "TE" H 1000 3400 60  0001 C CNN "MFN"
F 5 "2-338068-0" H 1100 3500 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-2-338068-0.html" H 900 3300 60  0001 C CNN "PurchasingLink"
	1    900  2000
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_F_VT_20 J2
U 1 1 5DC9C8A5
P 900 4450
F 0 "J2" H 856 5797 60  0000 C CNN
F 1 "MM_F_VT_20" H 856 5691 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_20" H 700 5550 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F2-338068-0" H 800 5650 60  0001 C CNN
F 4 "TE" H 1000 5850 60  0001 C CNN "MFN"
F 5 "2-338068-0" H 1100 5950 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-2-338068-0.html" H 900 5750 60  0001 C CNN "PurchasingLink"
	1    900  4450
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_F_VT_10 J4
U 1 1 5DC9CB1E
P 2300 2000
F 0 "J4" H 2256 3347 60  0000 C CNN
F 1 "MM_F_VT_10" H 2256 3241 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_10" H 2100 3100 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-338068-0" H 2200 3200 60  0001 C CNN
F 4 "TE" H 2400 3400 60  0001 C CNN "MFN"
F 5 "1-338068-0" H 2500 3500 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-338068-0.html" H 2300 3300 60  0001 C CNN "PurchasingLink"
	1    2300 2000
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_F_VT_04 J5
U 1 1 5DC9CE7C
P 2450 4300
F 0 "J5" H 2506 4747 60  0000 C CNN
F 1 "MM_F_VT_04" H 2506 4641 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_4" H 2250 5400 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F338068-4" H 2350 5500 60  0001 C CNN
F 4 "TE" H 2550 5700 60  0001 C CNN "MFN"
F 5 "338068-4" H 2650 5800 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-338068-4.html" H 2450 5600 60  0001 C CNN "PurchasingLink"
	1    2450 4300
	1    0    0    -1  
$EndComp
$Comp
L formula:Ampseal_35_VT J7
U 1 1 5DC9DA96
P 10000 2550
F 0 "J7" H 9673 2502 60  0000 R CNN
F 1 "Ampseal_35_VT" H 9673 2608 60  0000 R CNN
F 2 "footprints:Ampseal_35" H 9800 3900 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F776231%7FA13%7Fpdf%7FEnglish%7FENG_CD_776231_A13.pdf%7F1-776231-1" H 9800 3900 60  0001 C CNN
F 4 "TE" H 9950 4550 60  0001 C CNN "MFN"
F 5 "1-776231-1" H 9850 4450 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-1-776231-1.html" H 10050 4650 60  0001 C CNN "PurchasingLink"
	1    10000 2550
	1    0    0    -1  
$EndComp
Wire Notes Line
	6350 500  500  500 
Wire Notes Line
	6400 500  11200 500 
Wire Notes Line
	11200 500  11200 5900
Wire Notes Line
	11200 5900 6400 5900
Wire Notes Line
	6400 5900 6400 500 
Text Notes 7700 5750 0    197  ~ 0
Back (Exterior)
Text Notes 3950 5000 0    197  ~ 0
Front (Interior)
$Comp
L formula:NanoFit_RA_04 U2
U 1 1 5DCB468B
P 4600 1050
F 0 "U2" H 4600 1300 50  0000 C CNN
F 1 "Nanofit_4" H 4600 1400 50  0000 C CNN
F 2 "Connector_Molex:Molex_Nano-Fit_105310-xx04_2x02_P2.50mm_Vertical" H 4600 1050 50  0001 C CNN
F 3 "" H 4600 1050 50  0001 C CNN
	1    4600 1050
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_04 U3
U 1 1 5DCB561E
P 4600 1700
F 0 "U3" H 4600 1950 50  0000 C CNN
F 1 "Nanofit_4" H 4600 2050 50  0000 C CNN
F 2 "Connector_Molex:Molex_Nano-Fit_105310-xx04_2x02_P2.50mm_Vertical" H 4600 1700 50  0001 C CNN
F 3 "" H 4600 1700 50  0001 C CNN
	1    4600 1700
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_10 U4
U 1 1 5DCB9D7D
P 5550 1350
F 0 "U4" H 5550 1900 50  0000 C CNN
F 1 "Nanofit_10" H 5550 2000 50  0000 C CNN
F 2 "Connector_Molex:Molex_Nano-Fit_105310-xx10_2x05_P2.50mm_Vertical" H 5550 1350 50  0001 C CNN
F 3 "" H 5550 1350 50  0001 C CNN
	1    5550 1350
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_12 U1
U 1 1 5DCBAD7A
P 3450 1450
F 0 "U1" H 3450 2100 50  0000 C CNN
F 1 "Nanofit_12" H 3450 2200 50  0000 C CNN
F 2 "Connector_Molex:Molex_Nano-Fit_105310-xx12_2x06_P2.50mm_Vertical" H 3450 1450 50  0001 C CNN
F 3 "" H 3450 1450 50  0001 C CNN
	1    3450 1450
	1    0    0    -1  
$EndComp
Text Label 1050 900  0    50   ~ 0
GND
Text Label 1050 1000 0    50   ~ 0
12V
Text Label 1050 1100 0    50   ~ 0
5V_DUX
Text Label 1050 1200 0    50   ~ 0
MISO_DUX
Text Label 1050 1300 0    50   ~ 0
MOSI_DUX
Text Label 1050 1400 0    50   ~ 0
SCK_DUX
Text Label 1050 1500 0    50   ~ 0
RESET_DUX
Text Label 1050 1600 0    50   ~ 0
CAN+
Text Label 1050 1700 0    50   ~ 0
CAN-
Text Label 1050 1800 0    50   ~ 0
START_BTN
Text Label 1050 1900 0    50   ~ 0
START_LED
Text Label 1050 2000 0    50   ~ 0
BMS_LED
Text Label 1050 2100 0    50   ~ 0
IMD_LED
Text Label 1050 2200 0    50   ~ 0
GND
Text Label 1050 2300 0    50   ~ 0
RTD_LSD
Text Label 1050 2400 0    50   ~ 0
RJ45_LED_O_DUX
Text Label 1050 2500 0    50   ~ 0
RJ45_LED_G_DUX
Text Label 1050 2600 0    50   ~ 0
STEERING_POT_+
Text Label 1050 2700 0    50   ~ 0
STEERING_POT_SENSE
Text Label 1050 2800 0    50   ~ 0
STEERING_POT_-
Text Label 2700 4100 0    50   ~ 0
SS_BOTS
Text Label 2700 4200 0    50   ~ 0
SS_INERTIA
Text Label 2700 4300 0    50   ~ 0
SS_ESTOP
Text Label 2700 4400 0    50   ~ 0
5V_CAN_LOGGER
Text Label 1050 3350 0    50   ~ 0
GND
Text Label 1050 3450 0    50   ~ 0
12V
Text Label 1050 3650 0    50   ~ 0
MISO_THROTTLE
Text Label 1050 3750 0    50   ~ 0
MOSI_THROTTLE
Text Label 1050 3850 0    50   ~ 0
SCK_THROTTLE
Text Label 1050 3950 0    50   ~ 0
RESET_THROTTLE
Text Label 1050 3550 0    50   ~ 0
5V_THROTTLE
Text Label 1050 4050 0    50   ~ 0
CAN+
Text Label 1050 4150 0    50   ~ 0
CAN-
Text Label 1050 4250 0    50   ~ 0
THROTTLE_POT_1_+
Text Label 1050 4350 0    50   ~ 0
THROTTLE_POT_1_SENSE
Text Label 1050 4450 0    50   ~ 0
THROTTLE_POT_1_-
Text Label 1050 4550 0    50   ~ 0
THROTTLE_POT_2_+
Text Label 1050 4650 0    50   ~ 0
THROTTLE_POT_2_SENSE
Text Label 1050 4750 0    50   ~ 0
THROTTLE_POT_2_-
Text Label 1050 4850 0    50   ~ 0
RJ45_LED_O_THROTTLE
Text Label 1050 4950 0    50   ~ 0
RJ45_LED_G_THROTTLE
Text Label 1050 5050 0    50   ~ 0
DRIVE_MODE_+
Text Label 1050 5150 0    50   ~ 0
DRIVE_MODE_SENSE
Text Label 1050 5250 0    50   ~ 0
DRIVE_MODE_-
Text Label 2450 900  0    50   ~ 0
LV_LED
Text Label 2450 1000 0    50   ~ 0
HV_LED
Text Label 2450 1100 0    50   ~ 0
BRAKE_LED
Text Label 2450 1200 0    50   ~ 0
5V_STEERING
Text Label 2450 1700 0    50   ~ 0
GND
Text Label 2450 1800 0    50   ~ 0
GND
Text Label 4800 1100 0    50   ~ 0
5V_LED_BARS
Text Label 4800 1750 0    50   ~ 0
5V_LED_BARS
Text Label 4800 1200 0    50   ~ 0
SPEED_LED_BAR
Text Label 4800 1850 0    50   ~ 0
SOC_LED_BAR
Text Label 5750 1400 0    50   ~ 0
GND
Text Label 5750 1500 0    50   ~ 0
GND
Text Label 5750 1600 0    50   ~ 0
GND
Text Label 5750 1700 0    50   ~ 0
GND
Text Label 5750 1800 0    50   ~ 0
GND
Text Label 5750 900  0    50   ~ 0
START_BTN
Text Label 5750 1000 0    50   ~ 0
START_LED
Text Label 5750 1100 0    50   ~ 0
BMS_LED
Text Label 5750 1200 0    50   ~ 0
IMD_LED
Text Label 5750 1300 0    50   ~ 0
GND
Text Label 3650 1100 0    50   ~ 0
BRAKE_LED
Text Label 3650 1500 0    50   ~ 0
GND
Text Label 3650 1600 0    50   ~ 0
GND
Text Label 3650 1700 0    50   ~ 0
GND
Text Label 3650 1800 0    50   ~ 0
GND
Text Label 3650 1900 0    50   ~ 0
GND
Text Label 3650 2000 0    50   ~ 0
GND
Text Label 3650 900  0    50   ~ 0
LV_LED
Text Label 3650 1000 0    50   ~ 0
HV_LED
Wire Notes Line
	550  550  550  2950
Wire Notes Line
	6300 2950 6300 550 
Text Notes 3300 2850 0    118  ~ 0
Internal Connectors \nto Peripherals\n
Text Notes 3350 2250 0    50   ~ 0
Layout note: \nPlace on driver's left\n
Text Notes 4500 2150 0    50   ~ 0
Layout note: \nPlace on driver's center\n
Text Notes 5350 2100 0    50   ~ 0
Layout note: \nPlace on driver's right\n\n
Text Notes 1850 3450 0    118  ~ 0
Throttle Connectors
Wire Notes Line
	550  3000 550  5350
Wire Notes Line
	550  5350 3750 5350
Wire Notes Line
	3750 5350 3750 3000
Wire Notes Line
	3750 3000 550  3000
Text Label 8700 1150 0    50   ~ 0
MISO_DUX
Text Label 8700 1250 0    50   ~ 0
MOSI_DUX
Text Label 7400 1450 2    50   ~ 0
SCK_DUX
Text Label 7400 1350 2    50   ~ 0
RESET_DUX
Text Label 7400 1250 2    50   ~ 0
CAN+
Text Label 7400 1150 2    50   ~ 0
CAN-
Text Label 8700 1350 0    50   ~ 0
5V_DUX
Text Label 7800 2000 3    50   ~ 0
RJ45_LED_O_DUX
Text Label 8100 2000 3    50   ~ 0
RJ45_LED_G_DUX
Text Label 7800 4290 3    50   ~ 0
RJ45_LED_O_THROTTLE
Text Label 8100 4290 3    50   ~ 0
RJ45_LED_G_THROTTLE
Text Label 8700 3440 0    50   ~ 0
MISO_THROTTLE
Text Label 8700 3540 0    50   ~ 0
MOSI_THROTTLE
Text Label 7400 3740 2    50   ~ 0
SCK_THROTTLE
Text Label 7400 3640 2    50   ~ 0
RESET_THROTTLE
Text Label 8700 3640 0    50   ~ 0
5V_THROTTLE
Text Label 7400 3540 2    50   ~ 0
CAN+
Text Label 7400 3440 2    50   ~ 0
CAN-
Text Label 8700 3740 0    50   ~ 0
GND
Text Label 10200 850  0    50   ~ 0
GND
Text Label 10200 950  0    50   ~ 0
12V
Text Label 10200 1150 0    50   ~ 0
IS>BOTS
Text Label 10200 1250 0    50   ~ 0
IS>BOTS
Text Label 10200 1350 0    50   ~ 0
BOTS>ESTOP
Text Label 10200 1450 0    50   ~ 0
ESTOP>HVD
Text Label 10200 1550 0    50   ~ 0
GND
Text Label 10200 1750 0    50   ~ 0
GND
Text Label 10200 1850 0    50   ~ 0
CAN+
Text Label 10200 1950 0    50   ~ 0
CAN-
Text Label 10200 2150 0    50   ~ 0
CAN+
Text Label 10200 2050 0    50   ~ 0
CAN-
Text Label 10200 2250 0    50   ~ 0
CAN_GND
Text Label 10200 2350 0    50   ~ 0
STEERING_POT_+
Text Label 10200 2450 0    50   ~ 0
STEERING_POT_SENSE
Text Label 10200 2550 0    50   ~ 0
STEERING_POT_-
Text Label 10200 2750 0    50   ~ 0
GND
Text Label 10200 2850 0    50   ~ 0
RTD_SUPPLY_12V
Text Label 10200 2950 0    50   ~ 0
12V
Text Label 10200 3050 0    50   ~ 0
GND
Text Label 10200 3150 0    50   ~ 0
THROTTLE_POT_1_+
Text Label 10200 3250 0    50   ~ 0
THROTTLE_POT_1_SENSE
Text Label 10200 3350 0    50   ~ 0
THROTTLE_POT_1_-
Text Label 10200 3450 0    50   ~ 0
THROTTLE_POT_2_+
Text Label 10200 3550 0    50   ~ 0
THROTTLE_POT_2_SENSE
Text Label 10200 3650 0    50   ~ 0
THROTTLE_POT_2_-
Text Label 10200 3850 0    50   ~ 0
CAN+
Text Label 10200 3750 0    50   ~ 0
CAN-
Text Label 10200 3950 0    50   ~ 0
CAN_GND
Text Label 10200 4050 0    50   ~ 0
RTD_LSD
Text Label 10200 4150 0    50   ~ 0
CAN+
Text Label 10200 4250 0    50   ~ 0
CAN-
Text Label 3650 1200 0    50   ~ 0
DRIVE_MODE_+
Text Label 3650 1300 0    50   ~ 0
DRIVE_MODE_SENSE
Text Label 3650 1400 0    50   ~ 0
DRIVE_MODE_-
Text Notes 1600 2100 0    118  ~ 0
DUX Connectors\n
Wire Notes Line
	550  2950 3100 2950
Wire Notes Line
	3100 2950 3100 550 
Wire Notes Line
	3100 550  550  550 
Wire Notes Line
	6300 550  3150 550 
Wire Notes Line
	3150 550  3150 2950
Wire Notes Line
	3150 2950 6300 2950
$Comp
L formula:MicroFit_RA_V_2 J8
U 1 1 5DCFB5BE
P 5400 2550
F 0 "J8" H 5456 2825 50  0000 C CNN
F 1 "MicroFit_RA_V_2" H 5456 2734 50  0000 C CNN
F 2 "Connector_Molex:Molex_Micro-Fit_3.0_43045-0212_2x01_P3.00mm_Vertical" H 5350 2750 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430450200_sd.pdf" H 5350 2750 50  0001 C CNN
F 4 "MFN" H 5500 2800 50  0001 C CNN "DK"
F 5 "WM1865-ND" H 5600 2900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex/0430450200/WM1813-ND/252526" H 5400 2700 50  0001 C CNN "PurchasingLink"
	1    5400 2550
	1    0    0    -1  
$EndComp
Text Label 5650 2500 0    50   ~ 0
BOTS>ESTOP
Text Label 5650 2600 0    50   ~ 0
ESTOP>HVD
Wire Notes Line
	6350 500  6350 5400
Wire Notes Line
	6350 5400 500  5400
Wire Notes Line
	500  5400 500  500 
$Comp
L power:+12V #PWR?
U 1 1 5DCFD863
P 1100 5950
F 0 "#PWR?" H 1100 5800 50  0001 C CNN
F 1 "+12V" H 1115 6123 50  0000 C CNN
F 2 "" H 1100 5950 50  0001 C CNN
F 3 "" H 1100 5950 50  0001 C CNN
	1    1100 5950
	1    0    0    -1  
$EndComp
Text Label 1100 5950 3    50   ~ 0
12V
$Comp
L power:+12V #PWR?
U 1 1 5DCFDBAB
P 1350 5950
F 0 "#PWR?" H 1350 5800 50  0001 C CNN
F 1 "+12V" H 1365 6123 50  0000 C CNN
F 2 "" H 1350 5950 50  0001 C CNN
F 3 "" H 1350 5950 50  0001 C CNN
	1    1350 5950
	1    0    0    -1  
$EndComp
Text Label 1350 5950 3    50   ~ 0
RTD_SUPPLY_12V
$Comp
L power:GND #PWR?
U 1 1 5DCFDED7
P 2150 6350
F 0 "#PWR?" H 2150 6100 50  0001 C CNN
F 1 "GND" H 2155 6177 50  0000 C CNN
F 2 "" H 2150 6350 50  0001 C CNN
F 3 "" H 2150 6350 50  0001 C CNN
	1    2150 6350
	1    0    0    -1  
$EndComp
Text Label 2150 6350 1    50   ~ 0
CAN_GND
Text Notes 3115 6570 0    98   ~ 0
Power Flags\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5DCFEE19
P 1600 5950
F 0 "#FLG?" H 1600 6025 50  0001 C CNN
F 1 "PWR_FLAG" V 1600 6078 50  0000 L CNN
F 2 "" H 1600 5950 50  0001 C CNN
F 3 "~" H 1600 5950 50  0001 C CNN
	1    1600 5950
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5DCFF24F
P 1600 5950
F 0 "#PWR?" H 1600 5800 50  0001 C CNN
F 1 "+12V" H 1615 6123 50  0000 C CNN
F 2 "" H 1600 5950 50  0001 C CNN
F 3 "" H 1600 5950 50  0001 C CNN
	1    1600 5950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5DD01903
P 2375 6350
F 0 "#FLG?" H 2375 6425 50  0001 C CNN
F 1 "PWR_FLAG" V 2375 6700 50  0000 C CNN
F 2 "" H 2375 6350 50  0001 C CNN
F 3 "~" H 2375 6350 50  0001 C CNN
	1    2375 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD0198E
P 2375 6350
F 0 "#PWR?" H 2375 6100 50  0001 C CNN
F 1 "GND" H 2380 6177 50  0000 C CNN
F 2 "" H 2375 6350 50  0001 C CNN
F 3 "" H 2375 6350 50  0001 C CNN
	1    2375 6350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_120_DNP R1
U 1 1 5DD2F1A4
P 4550 3375
F 0 "R1" V 4343 3375 50  0000 C CNN
F 1 "R_120_DNP" V 4434 3375 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3350 3525 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 3350 3825 50  0001 L CNN
F 4 "DK" H 4550 3375 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 3350 3625 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 3350 3725 60  0001 L CNN "PurchasingLink"
	1    4550 3375
	0    1    1    0   
$EndComp
Text Label 4400 3375 2    50   ~ 0
CAN+
Text Label 4700 3375 0    50   ~ 0
CAN-
$Comp
L formula:RJ45_VT U6
U 1 1 5E45C10A
P 8050 4090
F 0 "U6" H 8050 5133 60  0000 C CNN
F 1 "RJ45_VT" H 8050 5027 60  0000 C CNN
F 2 "footprints:RJ45-Vertical" H 7800 3040 60  0001 C CNN
F 3 "https://www.amphenolcanada.com/ProductSearch/drawings/AC/MRJ548XX1.pdf" H 7950 2500 60  0001 C CNN
F 4 "DK" H 8050 4921 60  0000 C CNN "MFN"
F 5 "MRJ-5481-01-ND" H 8150 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=MRJ-5481-01" H 8350 2900 60  0001 C CNN "PurchasingLink"
	1    8050 4090
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4290 8400 4290
Text Label 7700 4290 3    50   ~ 0
GND
Text Label 8000 4290 3    50   ~ 0
GND
Text Label 8340 4290 3    50   ~ 0
GND
$Comp
L formula:RJ45_VT U5
U 1 1 5E460B52
P 8050 1800
F 0 "U5" H 8050 2843 60  0000 C CNN
F 1 "RJ45_VT" H 8050 2737 60  0000 C CNN
F 2 "footprints:RJ45-Vertical" H 7800 750 60  0001 C CNN
F 3 "https://www.amphenolcanada.com/ProductSearch/drawings/AC/MRJ548XX1.pdf" H 7950 210 60  0001 C CNN
F 4 "DK" H 8050 2631 60  0000 C CNN "MFN"
F 5 "MRJ-5481-01-ND" H 8150 410 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=MRJ-5481-01" H 8350 610 60  0001 C CNN "PurchasingLink"
	1    8050 1800
	1    0    0    -1  
$EndComp
Text Label 8700 1450 0    50   ~ 0
GND
Wire Wire Line
	8300 2000 8400 2000
Text Label 8300 2000 3    50   ~ 0
GND
Text Label 8000 2000 3    50   ~ 0
GND
Text Label 7700 2000 3    50   ~ 0
GND
Wire Wire Line
	10200 1150 10550 1150
Text Label 10700 1350 0    50   ~ 0
SS_BOTS
Text Label 10550 1150 0    50   ~ 0
SS_INERTIA
Wire Wire Line
	10200 1450 10700 1450
Text Label 10700 1450 0    50   ~ 0
SS_ESTOP
Wire Wire Line
	10200 1350 10700 1350
Text Label 10200 1050 0    50   ~ 0
12V
Text Label 10200 2650 0    50   ~ 0
5V_STEERING
Wire Notes Line
	4175 5700 4175 6750
Wire Notes Line
	4175 6750 900  6750
Wire Notes Line
	900  5700 4175 5700
Wire Notes Line
	900  5700 900  6750
$Comp
L Connector:TestPoint TP1
U 1 1 5E65DC3E
P 4750 6350
F 0 "TP1" V 4945 6422 50  0000 C CNN
F 1 "TestPoint" V 4854 6422 50  0000 C CNN
F 2 "footprints:tp_1.6mm" H 4950 6350 50  0001 C CNN
F 3 "~" H 4950 6350 50  0001 C CNN
	1    4750 6350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5E65EA13
P 4750 6650
F 0 "TP2" V 4945 6722 50  0000 C CNN
F 1 "TestPoint" V 4854 6722 50  0000 C CNN
F 2 "footprints:tp_1.6mm" H 4950 6650 50  0001 C CNN
F 3 "~" H 4950 6650 50  0001 C CNN
	1    4750 6650
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5E65F584
P 4750 6975
F 0 "TP3" V 4945 7047 50  0000 C CNN
F 1 "TestPoint" V 4854 7047 50  0000 C CNN
F 2 "footprints:tp_1.6mm" H 4950 6975 50  0001 C CNN
F 3 "~" H 4950 6975 50  0001 C CNN
	1    4750 6975
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5E65F58A
P 4750 7275
F 0 "TP4" V 4945 7347 50  0000 C CNN
F 1 "TestPoint" V 4854 7347 50  0000 C CNN
F 2 "footprints:tp_1.6mm" H 4950 7275 50  0001 C CNN
F 3 "~" H 4950 7275 50  0001 C CNN
	1    4750 7275
	0    -1   -1   0   
$EndComp
Text Label 4950 6650 0    50   ~ 0
CAN+
Text Label 4950 6975 0    50   ~ 0
CAN-
Wire Wire Line
	4950 6975 4750 6975
$Comp
L power:GND #PWR?
U 1 1 5E6612D4
P 5075 7325
F 0 "#PWR?" H 5075 7075 50  0001 C CNN
F 1 "GND" H 5080 7152 50  0000 C CNN
F 2 "" H 5075 7325 50  0001 C CNN
F 3 "" H 5075 7325 50  0001 C CNN
	1    5075 7325
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 7325 5075 7275
Wire Wire Line
	5075 7275 4750 7275
$Comp
L power:+12V #PWR?
U 1 1 5E6644FB
P 5050 6200
F 0 "#PWR?" H 5050 6050 50  0001 C CNN
F 1 "+12V" H 5065 6373 50  0000 C CNN
F 2 "" H 5050 6200 50  0001 C CNN
F 3 "" H 5050 6200 50  0001 C CNN
	1    5050 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6200 5050 6350
Wire Wire Line
	5050 6350 4750 6350
Wire Wire Line
	4750 6650 4950 6650
Text Notes 4400 5900 0    98   ~ 0
Test Points
Wire Notes Line
	4325 5700 4325 7650
Wire Notes Line
	4325 7650 5325 7650
Wire Notes Line
	5325 7650 5325 5700
Wire Notes Line
	5325 5700 4325 5700
$Comp
L formula:R_1K R2
U 1 1 5E67032C
P 4300 4150
F 0 "R2" V 4093 4150 50  0000 C CNN
F 1 "R_1K" V 4184 4150 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4230 4150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 4380 4150 50  0001 C CNN
F 4 "DK" H 4300 4150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 4300 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 4780 4550 60  0001 C CNN "PurchasingLink"
	1    4300 4150
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D1
U 1 1 5E671943
P 4750 4150
F 0 "D1" H 4743 3895 50  0000 C CNN
F 1 "LED_0805" H 4743 3986 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 4650 4150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4750 4250 50  0001 C CNN
F 4 "DK" H 4750 4150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4750 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5150 4650 60  0001 C CNN "PurchasingLink"
	1    4750 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 4150 4600 4150
$Comp
L power:+12V #PWR?
U 1 1 5E675CE9
P 4025 4075
F 0 "#PWR?" H 4025 3925 50  0001 C CNN
F 1 "+12V" H 4040 4248 50  0000 C CNN
F 2 "" H 4025 4075 50  0001 C CNN
F 3 "" H 4025 4075 50  0001 C CNN
	1    4025 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	4025 4075 4025 4150
Wire Wire Line
	4025 4150 4150 4150
$Comp
L power:GND #PWR?
U 1 1 5E678C29
P 5050 4200
F 0 "#PWR?" H 5050 3950 50  0001 C CNN
F 1 "GND" H 5055 4027 50  0000 C CNN
F 2 "" H 5050 4200 50  0001 C CNN
F 3 "" H 5050 4200 50  0001 C CNN
	1    5050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4200 5050 4150
Wire Wire Line
	4900 4150 5050 4150
Text Notes 5050 3350 0    50   ~ 0
CAN Termination
Text Notes 5225 4100 0    50   ~ 0
12V Indicator
Text Label 2590 6350 1    50   ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 5E6AE5CE
P 2590 6350
F 0 "#PWR?" H 2590 6100 50  0001 C CNN
F 1 "GND" H 2595 6177 50  0000 C CNN
F 2 "" H 2590 6350 50  0001 C CNN
F 3 "" H 2590 6350 50  0001 C CNN
	1    2590 6350
	1    0    0    -1  
$EndComp
Text Label 2450 1300 0    50   ~ 0
SPEED_LED_BAR
Text Label 2450 1400 0    50   ~ 0
SOC_LED_BAR
Text Label 2450 1500 0    50   ~ 0
5V_LED_BARS
$Comp
L power:GND #PWR?
U 1 1 5E6BE8EA
P 4800 1550
F 0 "#PWR?" H 4800 1300 50  0001 C CNN
F 1 "GND" V 4800 1350 50  0000 C CNN
F 2 "" H 4800 1550 50  0001 C CNN
F 3 "" H 4800 1550 50  0001 C CNN
	1    4800 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6BEDD5
P 4800 1650
F 0 "#PWR?" H 4800 1400 50  0001 C CNN
F 1 "GND" V 4800 1450 50  0000 C CNN
F 2 "" H 4800 1650 50  0001 C CNN
F 3 "" H 4800 1650 50  0001 C CNN
	1    4800 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6BFA26
P 4800 900
F 0 "#PWR?" H 4800 650 50  0001 C CNN
F 1 "GND" V 4800 700 50  0000 C CNN
F 2 "" H 4800 900 50  0001 C CNN
F 3 "" H 4800 900 50  0001 C CNN
	1    4800 900 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6BFA2C
P 4800 1000
F 0 "#PWR?" H 4800 750 50  0001 C CNN
F 1 "GND" V 4800 800 50  0000 C CNN
F 2 "" H 4800 1000 50  0001 C CNN
F 3 "" H 4800 1000 50  0001 C CNN
	1    4800 1000
	0    -1   -1   0   
$EndComp
Text Label 10200 1650 0    50   ~ 0
5V_CAN_LOGGER
Text Label 2450 1600 0    50   ~ 0
5V_LED_BARS
$EndSCHEMATC
