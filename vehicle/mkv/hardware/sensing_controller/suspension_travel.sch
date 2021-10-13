EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 18 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:R_1K_0.1 R1801
U 1 1 60A40AD2
P 5500 3700
F 0 "R1801" H 5570 3746 50  0000 L CNN
F 1 "R_1K_0.1" H 5570 3655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5430 3700 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 5580 3700 50  0001 C CNN
F 4 "DK" H 5500 3700 60  0001 C CNN "MFN"
F 5 "P1.0KDACT-ND" H 5500 3700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB102V/P1.0KDACT-ND/1465947" H 5980 4100 60  0001 C CNN "PurchasingLink"
	1    5500 3700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_22uF C1801
U 1 1 60A40ADB
P 5500 4150
F 0 "C1801" H 5615 4196 50  0000 L CNN
F 1 "C_22uF" H 5615 4105 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 5538 4000 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5525 4250 50  0001 C CNN
F 4 "DK" H 5500 4150 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 5500 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 5925 4650 60  0001 C CNN "PurchasingLink"
	1    5500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3850 5500 3950
Wire Wire Line
	5500 4300 5500 4450
Wire Wire Line
	5500 3550 5500 3300
Wire Wire Line
	5500 3950 5650 3950
Connection ~ 5500 3950
Wire Wire Line
	5500 3950 5500 4000
$Comp
L power:GND #PWR?
U 1 1 60A40AE9
P 5500 4450
F 0 "#PWR?" H 5500 4200 50  0001 C CNN
F 1 "GND" H 5505 4277 50  0000 C CNN
F 2 "" H 5500 4450 50  0001 C CNN
F 3 "" H 5500 4450 50  0001 C CNN
	1    5500 4450
	1    0    0    -1  
$EndComp
Text GLabel 5650 3950 2    50   Output ~ 0
LIN_POT_SENSE_FILTERED
Wire Wire Line
	5450 3300 5500 3300
Text Notes 4900 3150 0    50   ~ 0
From Connector
Text Notes 6050 3850 0    50   ~ 0
To Micro
Text GLabel 5450 3300 0    50   Input ~ 0
LIN_POT_SENSE
$EndSCHEMATC
