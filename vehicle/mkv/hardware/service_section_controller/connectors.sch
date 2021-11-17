EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4650 1300 0    98   ~ 0
TO ACCUMULATOR INTERFACE (INTERNAL)
Text Notes 6300 2750 1    50   ~ 0
For Signals
$Comp
L power:GND #PWR?
U 1 1 60E61A8C
P 9900 3400
AR Path="/60A3B20D/60E61A8C" Ref="#PWR?"  Part="1" 
AR Path="/60A3B1F8/60E61A8C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9900 3150 50  0001 C CNN
F 1 "GND" H 9905 3227 50  0000 C CNN
F 2 "" H 9900 3400 50  0001 C CNN
F 3 "" H 9900 3400 50  0001 C CNN
	1    9900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3400 9900 3250
$Comp
L formula:MicroFit_VT_12 J?
U 1 1 60E61ABA
P 8850 2250
AR Path="/60A3B20D/60E61ABA" Ref="J?"  Part="1" 
AR Path="/60A3B1F8/60E61ABA" Ref="J403"  Part="1" 
F 0 "J403" H 8908 3046 59  0000 C CNN
F 1 "MicroFit_VT_12" H 8908 2941 59  0000 C CNN
F 2 "footprints:MicroFit_VT_12" H 8850 1500 100 0001 C CNN
F 3 "" H 8900 2200 100 0001 C CNN
	1    8850 2250
	1    0    0    -1  
$EndComp
Text Notes 8600 1300 0    98   ~ 0
TO AIR MOUNT BOARDS
Text Notes 1250 2300 0    50   ~ 0
AIL connector on ‘TSAL’ page for clarity
Text Notes 1250 2150 0    50   ~ 0
Shutdown Circuit Connector on ‘Shutdown’ page for clarity
Text Notes 1250 2450 0    50   ~ 0
IMD connector on ‘IMD Latch’ page for clarity
Text Notes 4600 2950 1    50   ~ 0
For Programming RJ45
$Comp
L formula:MM_F_VT_16 J401
U 1 1 60B4E94B
P 4850 2550
F 0 "J401" H 4908 3597 60  0000 C CNN
F 1 "MM_F_VT_16" H 4908 3491 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_16" H 4750 3350 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-338068-6" H 4750 3750 60  0001 C CNN
F 4 "TE" H 4950 3950 60  0001 C CNN "MFN"
F 5 "1-338068-6" H 5050 4050 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-338068-6.html" H 4850 3850 60  0001 C CNN "PurchasingLink"
	1    4850 2550
	1    0    0    -1  
$EndComp
$Comp
L formula:Ultrafit_4_RA J?
U 1 1 60B785AF
P 8875 4175
AR Path="/60A3B236/60B785AF" Ref="J?"  Part="1" 
AR Path="/60A3B41E/60B785AF" Ref="J?"  Part="1" 
AR Path="/60A3B1F8/60B785AF" Ref="J404"  Part="1" 
F 0 "J404" H 8983 4612 60  0000 C CNN
F 1 "Ultrafit_4_RA" H 8983 4506 60  0000 C CNN
F 2 "footprints:Ultrafit_4_RA" H 8375 4825 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/1723101104_sd.pdf" H 9325 5275 60  0001 C CNN
F 4 "Digi-Key" H 8175 5425 60  0001 C CNN "MFN"
F 5 "Value" H 8025 4575 60  0001 C CNN "Package"
F 6 "WM11574-ND" H 8225 4675 60  0001 C CNN "MPN"
F 7 "WM11564-ND" H 9275 4925 60  0001 C CNN "MPN2"
F 8 "https://www.digikey.com/products/en?keywords=1723101304" H 9375 5025 60  0001 C CNN "PurchasingLink"
	1    8875 4175
	1    0    0    -1  
$EndComp
Text GLabel 9225 3975 2    50   Input ~ 0
+TS
Text GLabel 9225 4075 2    50   Input ~ 0
-TS
Text GLabel 9225 4175 2    50   Input ~ 0
+TS
Text GLabel 9225 4275 2    50   Input ~ 0
-TS
Text Notes 1250 2600 0    50   ~ 0
BMS isoSPI cutout on ‘BMS Core’ page for clarity
Text GLabel 9050 2000 2    50   Input ~ 0
+AIR_AUX-
Text GLabel 9050 2100 2    50   Input ~ 0
+AIR_COIL+
Text GLabel 9050 2200 2    50   Input ~ 0
+AIR_COIL-
Text GLabel 9050 2300 2    50   Input ~ 0
-AIR_AUX+
Text GLabel 9050 2400 2    50   Input ~ 0
-AIR_AUX-
Text GLabel 9050 2500 2    50   Input ~ 0
-AIR_COIL+
Text GLabel 9050 2600 2    50   Input ~ 0
-AIR_COIL-
Text GLabel 9050 1900 2    50   Input ~ 0
+AIR_AUX+
Text GLabel 9050 2800 2    50   Input ~ 0
FINAL_SHUTDOWN
Text GLabel 9150 3350 2    50   Input ~ 0
FINAL_SHUTDOWN
Wire Wire Line
	9800 2700 9050 2700
$Comp
L power:GND #PWR?
U 1 1 60E61AB1
P 9800 2850
AR Path="/60A3B20D/60E61AB1" Ref="#PWR?"  Part="1" 
AR Path="/60A3B1F8/60E61AB1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9800 2600 50  0001 C CNN
F 1 "GND" H 9805 2677 50  0000 C CNN
F 2 "" H 9800 2850 50  0001 C CNN
F 3 "" H 9800 2850 50  0001 C CNN
	1    9800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2700 9800 2850
Text GLabel 9050 1700 2    50   Input ~ 0
PRECHARGE_LSD
Text GLabel 9050 1800 2    50   Input ~ 0
FINAL_SHUTDOWN
Text GLabel 6850 2050 2    50   Input ~ 0
CHARGE_ENABLE1
Text GLabel 6850 1850 2    50   Input ~ 0
CHARGE_ENABLE2
Text GLabel 6850 1950 2    50   Input ~ 0
FAN_PWM
Text GLabel 6850 2750 2    50   Input ~ 0
CANL
Text GLabel 6850 2650 2    50   Input ~ 0
TSAL_RED+
Text GLabel 6850 2550 2    50   Input ~ 0
TSAL_GREEN+
Text GLabel 6850 2450 2    50   Input ~ 0
TSAL_GREEN+
Text GLabel 6850 2350 2    50   Input ~ 0
TSAL_RED-
Text GLabel 6850 2250 2    50   Input ~ 0
TSAL_GREEN-
Text GLabel 6850 2150 2    50   Input ~ 0
TSAL_GREEN-
Text GLabel 6850 1750 2    50   Input ~ 0
BSPD_CURRENT_SENSE
Text GLabel 5100 3250 2    50   Input ~ 0
SM_RJ45_LEDO
Text GLabel 5100 3150 2    50   Input ~ 0
SM_RJ45_LEDG
Text GLabel 5100 3050 2    50   Input ~ 0
PM_RESET
Text GLabel 5100 2950 2    50   Input ~ 0
PM_SCK
Text GLabel 5100 2850 2    50   Input ~ 0
PM_MOSI
Text GLabel 5100 2750 2    50   Input ~ 0
PM_MISO
Text GLabel 5100 2650 2    50   Input ~ 0
+5V_AIR_CONTROL
Text GLabel 5100 2550 2    50   Input ~ 0
PM_RJ45_LEDO
Text GLabel 5100 2450 2    50   Input ~ 0
PM_RJ45_LEDG
Text GLabel 5100 2350 2    50   Input ~ 0
SM_RESET
Text GLabel 5100 2250 2    50   Input ~ 0
SM_SCK
Text GLabel 5100 2150 2    50   Input ~ 0
SM_MOSI
Text GLabel 5100 2050 2    50   Input ~ 0
SM_MISO
Text GLabel 5100 1950 2    50   Input ~ 0
+5V_BMS
$Comp
L power:GND #PWR?
U 1 1 60FC194A
P 5700 1850
F 0 "#PWR?" H 5700 1600 50  0001 C CNN
F 1 "GND" H 5705 1677 50  0000 C CNN
F 2 "" H 5700 1850 50  0001 C CNN
F 3 "" H 5700 1850 50  0001 C CNN
	1    5700 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60FC206D
P 5900 1850
F 0 "#PWR?" H 5900 1600 50  0001 C CNN
F 1 "GND" H 5905 1677 50  0000 C CNN
F 2 "" H 5900 1850 50  0001 C CNN
F 3 "" H 5900 1850 50  0001 C CNN
	1    5900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1850 5700 1850
Wire Wire Line
	5100 1750 5900 1750
Wire Wire Line
	5900 1750 5900 1850
$Comp
L power:GND #PWR?
U 1 1 60FC50DC
P 8000 3050
F 0 "#PWR?" H 8000 2800 50  0001 C CNN
F 1 "GND" H 8005 2877 50  0000 C CNN
F 2 "" H 8000 3050 50  0001 C CNN
F 3 "" H 8000 3050 50  0001 C CNN
	1    8000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3050 8000 3050
Wire Wire Line
	6750 1850 6850 1850
Wire Wire Line
	6850 1750 6750 1750
Wire Wire Line
	6750 1950 6850 1950
$Comp
L formula:MM_F_VT_14 J402
U 1 1 61ED474B
P 6450 2400
F 0 "J402" H 6558 3297 60  0000 C CNN
F 1 "MM_F_VT_14" H 6558 3191 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_14" H 6400 3050 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-338068-4" H 6350 3600 60  0001 C CNN
F 4 "TE" H 6550 3800 60  0001 C CNN "MFN"
F 5 "1-338068-4" H 6650 3900 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-338068-4.html" H 6450 3700 60  0001 C CNN "PurchasingLink"
	1    6450 2400
	1    0    0    -1  
$EndComp
Text GLabel 6850 2850 2    50   Input ~ 0
CANH
$Comp
L power:+BATT #PWR?
U 1 1 61ED85B3
P 7600 2900
F 0 "#PWR?" H 7600 2750 50  0001 C CNN
F 1 "+BATT" H 7615 3073 50  0000 C CNN
F 2 "" H 7600 2900 50  0001 C CNN
F 3 "" H 7600 2900 50  0001 C CNN
	1    7600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2950 7600 2950
Wire Wire Line
	7600 2950 7600 2900
Wire Wire Line
	6750 2050 6850 2050
Wire Wire Line
	6750 2150 6850 2150
Wire Wire Line
	6750 2250 6850 2250
Wire Wire Line
	6750 2350 6850 2350
Wire Wire Line
	6750 2450 6850 2450
Wire Wire Line
	6750 2550 6850 2550
Wire Wire Line
	6750 2650 6850 2650
Wire Wire Line
	6750 2750 6850 2750
Wire Wire Line
	6750 2850 6850 2850
Text Notes 6250 3250 0    50   ~ 0
This needs to be a right angle connector
$Comp
L formula:MicroFit_RA_V_2 J405
U 1 1 62060F67
P 8850 3300
F 0 "J405" H 8908 3575 50  0000 C CNN
F 1 "MicroFit_RA_V_2" H 8908 3484 50  0000 C CNN
F 2 "footprints:MicroFit_RA_V_2" H 8800 3500 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430450200_sd.pdf" H 8800 3500 50  0001 C CNN
F 4 "MFN" H 8950 3550 50  0001 C CNN "DK"
F 5 "WM1865-ND" H 9050 3650 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex/0430450200/WM1813-ND/252526" H 8850 3450 50  0001 C CNN "PurchasingLink"
	1    8850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3250 9900 3250
Wire Wire Line
	9100 3350 9150 3350
$EndSCHEMATC
