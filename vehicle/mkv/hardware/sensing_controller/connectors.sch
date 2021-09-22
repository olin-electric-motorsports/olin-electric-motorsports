EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 3500 2450 2    50   Input ~ 0
HALL_EFFECT_POWER
Text GLabel 4100 2550 2    50   Input ~ 0
12V
Text GLabel 4100 2650 2    50   Input ~ 0
GND
$Comp
L power:GND #PWR0201
U 1 1 61C9B190
P 3900 2700
F 0 "#PWR0201" H 3900 2450 50  0001 C CNN
F 1 "GND" H 3905 2527 50  0000 C CNN
F 2 "" H 3900 2700 50  0001 C CNN
F 3 "" H 3900 2700 50  0001 C CNN
	1    3900 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2650 3900 2650
Wire Wire Line
	3900 2700 3900 2650
Connection ~ 3900 2650
Wire Wire Line
	3250 2750 3350 2750
Text GLabel 3350 2750 2    50   BiDi ~ 0
CAN+
Wire Wire Line
	3250 2850 3350 2850
Text GLabel 3350 2850 2    50   BiDi ~ 0
CAN-
Text GLabel 4100 2950 2    50   Input ~ 0
12V
Text GLabel 4100 3050 2    50   Input ~ 0
GND
Text GLabel 3650 3150 2    50   Input ~ 0
LIN_POT_POWER
Text GLabel 3500 3250 2    50   Input ~ 0
HALL_EFFECT_SENSE
Wire Wire Line
	3500 3250 3250 3250
Text GLabel 4000 3350 2    50   BiDi ~ 0
CAN+
Text GLabel 4000 3450 2    50   BiDi ~ 0
CAN-
Text GLabel 4000 3550 2    50   Input ~ 0
GND
Text GLabel 4000 3650 2    50   BiDi ~ 0
CAN+
Text GLabel 4000 3750 2    50   BiDi ~ 0
CAN-
Text Notes 4250 3600 0    50   ~ 0
CAN GND Shield
Wire Wire Line
	3250 3150 3650 3150
Wire Wire Line
	3250 3050 4100 3050
Wire Wire Line
	3250 2950 4100 2950
Wire Wire Line
	3250 2550 4100 2550
Wire Wire Line
	3900 2650 4100 2650
Wire Wire Line
	3500 2450 3250 2450
Wire Wire Line
	3250 3350 4000 3350
Wire Wire Line
	3250 3450 4000 3450
Wire Wire Line
	3250 3550 4000 3550
Wire Wire Line
	3250 3650 4000 3650
Wire Wire Line
	3250 3750 4000 3750
Text GLabel 3650 3850 2    50   Input ~ 0
LIN_POT_SENSE
Wire Wire Line
	3650 3850 3250 3850
Text GLabel 3450 3950 2    50   Input ~ 0
HALL_EFFECT_RETURN
Wire Wire Line
	3450 3950 3250 3950
Text GLabel 4100 4050 2    50   Input ~ 0
12V
Text GLabel 4100 4150 2    50   Input ~ 0
GND
Wire Wire Line
	3250 4050 4100 4050
Wire Wire Line
	3250 4150 4100 4150
Text GLabel 4000 4250 2    50   BiDi ~ 0
CAN+
Text GLabel 4000 4350 2    50   BiDi ~ 0
CAN-
Wire Wire Line
	3250 4250 4000 4250
Wire Wire Line
	3250 4350 4000 4350
Text GLabel 4100 4450 2    50   Input ~ 0
12V
Text GLabel 4100 4550 2    50   Input ~ 0
GND
Wire Wire Line
	3250 4450 4100 4450
Wire Wire Line
	3250 4550 4100 4550
Text GLabel 3650 4650 2    50   Input ~ 0
LIN_POT_RETURN
Wire Wire Line
	3650 4650 3250 4650
Text GLabel 3450 5100 2    50   Input ~ 0
HALL_EFFECT_POWER
Text GLabel 3450 5700 2    50   Input ~ 0
HALL_EFFECT_RETURN
$Comp
L sensing_controller-rescue:C_0.1uF-formula C?
U 1 1 61D43758
P 3300 5400
AR Path="/60A3DAC4/61D43758" Ref="C?"  Part="1" 
AR Path="/60A3D93E/61D43758" Ref="C?"  Part="1" 
AR Path="/60A3D8ED/61D43758" Ref="C201"  Part="1" 
F 0 "C201" H 3415 5446 50  0000 L CNN
F 1 "C_0.1uF" H 3415 5355 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3338 5250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3325 5500 50  0001 C CNN
F 4 "DK" H 3300 5400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3300 5400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 3725 5900 60  0001 C CNN "PurchasingLink"
	1    3300 5400
	1    0    0    1   
$EndComp
Wire Wire Line
	3450 5700 3300 5700
Wire Wire Line
	3300 5700 3300 5550
Wire Wire Line
	3300 5100 3450 5100
Wire Wire Line
	3300 5250 3300 5100
Wire Wire Line
	3300 5100 3100 5100
Connection ~ 3300 5100
Wire Wire Line
	3300 5700 3100 5700
Connection ~ 3300 5700
Text GLabel 3100 5100 0    50   Input ~ 0
5V
Text GLabel 3100 5700 0    50   Input ~ 0
GND
Text GLabel 3550 6000 2    50   Input ~ 0
LIN_POT_POWER
Text GLabel 3150 6000 0    50   Input ~ 0
5V
Text GLabel 3200 6150 0    50   Input ~ 0
GND
Wire Wire Line
	3200 6150 3550 6150
Text GLabel 3550 6150 2    50   Input ~ 0
LIN_POT_RETURN
Wire Wire Line
	3150 6000 3550 6000
Text Notes 3100 2050 0    87   ~ 0
TO VEHICLE
$Comp
L sensing_controller-rescue:Ampseal_23_RA-formula J202
U 1 1 61D5B9A1
P 3050 3550
F 0 "J202" H 3008 4897 60  0000 C CNN
F 1 "Ampseal_23_RA" H 3008 4791 60  0000 C CNN
F 2 "footprints:Ampseal_23" H 2850 4300 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F776087%7FE11%7Fpdf%7FEnglish%7FENG_CD_776087_E11.pdf%7F776087-1" H 2850 4300 60  0001 C CNN
F 4 "TE" H 2900 4850 60  0001 C CNN "MFN"
F 5 "776087-1" H 3000 4950 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-776087-1.html" H 3100 5050 60  0001 C CNN "PurchasingLink"
	1    3050 3550
	1    0    0    -1  
$EndComp
$Comp
L sensing_controller-rescue:MicroFit_24-formula J201
U 1 1 61D5DA0D
P 5300 2300
F 0 "J201" H 5483 2397 60  0000 C CNN
F 1 "MicroFit_24" H 5483 2291 60  0000 C CNN
F 2 "footprints:Molex_Microfit3_Header_02x12_Straight_0444322401_OEM" H 5250 2150 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430452400_sd.pdf" H 5350 2250 60  0001 C CNN
F 4 "DK" H 5450 2350 60  0001 C CNN "MFN"
F 5 "WM4728-ND" H 5550 2450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex-llc/0430452400/WM4728-ND/531428" H 5650 2550 60  0001 C CNN "PurchasingLink"
	1    5300 2300
	1    0    0    -1  
$EndComp
Text Notes 5050 2050 0    87   ~ 0
To Suspension Strain Members
Text GLabel 5750 3050 2    50   UnSpc ~ 0
STRAIN_1B_+
Text GLabel 5750 4250 2    50   UnSpc ~ 0
STRAIN_1B_-
Text GLabel 5750 3150 2    50   UnSpc ~ 0
STRAIN_2B_+
Text GLabel 5750 4350 2    50   UnSpc ~ 0
STRAIN_2B_-
Text GLabel 5750 3250 2    50   UnSpc ~ 0
STRAIN_3B_+
Text GLabel 5750 4450 2    50   UnSpc ~ 0
STRAIN_3B_-
Text GLabel 5750 3350 2    50   UnSpc ~ 0
STRAIN_4B_+
Text GLabel 5750 4550 2    50   UnSpc ~ 0
STRAIN_4B_-
Text GLabel 5750 3450 2    50   UnSpc ~ 0
STRAIN_5B_+
Text GLabel 5750 4650 2    50   UnSpc ~ 0
STRAIN_5B_-
Text GLabel 5750 3550 2    50   UnSpc ~ 0
STRAIN_6B_+
Text GLabel 5750 4750 2    50   UnSpc ~ 0
STRAIN_6B_-
Text GLabel 5750 4150 2    50   UnSpc ~ 0
STRAIN_6A_-
Text GLabel 5750 2950 2    50   UnSpc ~ 0
STRAIN_6A_+
Text GLabel 5750 4050 2    50   UnSpc ~ 0
STRAIN_5A_-
Text GLabel 5750 2850 2    50   UnSpc ~ 0
STRAIN_5A_+
Text GLabel 5750 3950 2    50   UnSpc ~ 0
STRAIN_4A_-
Text GLabel 5750 2750 2    50   UnSpc ~ 0
STRAIN_4A_+
Text GLabel 5750 3850 2    50   UnSpc ~ 0
STRAIN_3A_-
Text GLabel 5750 2650 2    50   UnSpc ~ 0
STRAIN_3A_+
Text GLabel 5750 3750 2    50   UnSpc ~ 0
STRAIN_2A_-
Text GLabel 5750 2550 2    50   UnSpc ~ 0
STRAIN_2A_+
Text GLabel 5750 3650 2    50   UnSpc ~ 0
STRAIN_1A_-
Text GLabel 5750 2450 2    50   UnSpc ~ 0
STRAIN_1A_+
Wire Wire Line
	5750 2450 5650 2450
Wire Wire Line
	5650 2550 5750 2550
Wire Wire Line
	5750 2650 5650 2650
Wire Wire Line
	5650 2750 5750 2750
Wire Wire Line
	5750 2850 5650 2850
Wire Wire Line
	5650 2950 5750 2950
Wire Wire Line
	5750 3050 5650 3050
Wire Wire Line
	5650 3150 5750 3150
Wire Wire Line
	5750 3250 5650 3250
Wire Wire Line
	5650 3350 5750 3350
Wire Wire Line
	5750 3450 5650 3450
Wire Wire Line
	5650 3550 5750 3550
Wire Wire Line
	5750 3650 5650 3650
Wire Wire Line
	5650 3750 5750 3750
Wire Wire Line
	5750 3850 5650 3850
Wire Wire Line
	5650 3950 5750 3950
Wire Wire Line
	5750 4050 5650 4050
Wire Wire Line
	5650 4150 5750 4150
Wire Wire Line
	5750 4250 5650 4250
Wire Wire Line
	5650 4350 5750 4350
Wire Wire Line
	5750 4450 5650 4450
Wire Wire Line
	5650 4550 5750 4550
Wire Wire Line
	5750 4650 5650 4650
Wire Wire Line
	5650 4750 5750 4750
$EndSCHEMATC
