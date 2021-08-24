EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L formula:LT3045 U7
U 1 1 612445AB
P 4700 3400
F 0 "U7" H 5525 4465 50  0000 C CNN
F 1 "LT3045" H 5525 4374 50  0000 C CNN
F 2 "footprints:MSOP-12_MSE" H 4800 6100 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LT3045.pdf" H 3750 5230 50  0001 C CNN
F 4 "Analog" H 4800 6100 60  0001 C CNN "MFN"
F 5 "LT3045EMSE#TRPBF" H 4800 6100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/analog-devices-inc/LT3045EMSE-TRPBF/6235366" H 4150 5630 60  0001 C CNN "PurchasingLink"
	1    4700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 612445B1
P 4700 3550
F 0 "#PWR?" H 4700 3400 50  0001 C CNN
F 1 "+5V" H 4715 3723 50  0000 C CNN
F 2 "" H 4700 3550 50  0001 C CNN
F 3 "" H 4700 3550 50  0001 C CNN
	1    4700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3850 4700 3850
Wire Wire Line
	4700 3850 4700 3550
Text Label 4650 3750 2    50   ~ 0
Lin-IN
Wire Wire Line
	4650 3750 4300 3750
Text Label 4550 2600 0    50   ~ 0
Lin-IN
Wire Wire Line
	4550 2600 4850 2600
Wire Wire Line
	5050 2800 5050 2700
Connection ~ 5050 2600
Connection ~ 5050 2700
Wire Wire Line
	5050 2700 5050 2600
$Comp
L power:VBUS #PWR?
U 1 1 612445C1
P 6650 2500
F 0 "#PWR?" H 6650 2350 50  0001 C CNN
F 1 "VBUS" H 6665 2673 50  0000 C CNN
F 2 "" H 6650 2500 50  0001 C CNN
F 3 "" H 6650 2500 50  0001 C CNN
	1    6650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2500 6650 2600
Wire Wire Line
	6650 2600 6500 2600
Wire Wire Line
	6000 2700 6050 2700
Wire Wire Line
	6050 2700 6050 2600
Connection ~ 6050 2600
Wire Wire Line
	6050 2600 6000 2600
$Comp
L formula:C_4.7uF_25V C21
U 1 1 612445CE
P 4700 2950
F 0 "C21" H 4450 3050 50  0000 L CNN
F 1 "C_4.7uF_25V" H 4100 2950 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4738 3550 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM219R61E475KA73-01.pdf" H 4725 3800 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/tdk-corporation/C2012X7R1H225M125AE/445-172488-1-ND/4990030" H 5125 3450 60  0001 C CNN "PurchasingLink"
	1    4700 2950
	1    0    0    -1  
$EndComp
Connection ~ 4850 2600
Wire Wire Line
	4850 2600 4950 2600
Wire Wire Line
	4700 2750 4850 2750
Wire Wire Line
	4850 2600 4850 2750
$Comp
L power:GND #PWR?
U 1 1 612445D8
P 4700 3050
F 0 "#PWR?" H 4700 2800 50  0001 C CNN
F 1 "GND" H 4705 2877 50  0000 C CNN
F 2 "" H 4700 3050 50  0001 C CNN
F 3 "" H 4700 3050 50  0001 C CNN
	1    4700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3000 5050 2800
Connection ~ 5050 2800
NoConn ~ 5050 3100
Wire Wire Line
	5050 3300 5000 3300
Wire Wire Line
	5000 3300 5000 3400
$Comp
L power:GND #PWR?
U 1 1 612445E3
P 5000 3400
F 0 "#PWR?" H 5000 3150 50  0001 C CNN
F 1 "GND" H 5005 3227 50  0000 C CNN
F 2 "" H 5000 3400 50  0001 C CNN
F 3 "" H 5000 3400 50  0001 C CNN
	1    5000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3200 4950 3200
Wire Wire Line
	4950 3200 4950 2600
Connection ~ 4950 2600
Wire Wire Line
	4950 2600 5050 2600
Wire Wire Line
	6000 3000 6500 3000
Wire Wire Line
	6500 3000 6500 2600
Connection ~ 6500 2600
Wire Wire Line
	6500 2600 6050 2600
$Comp
L formula:C_10uF_25V C22
U 1 1 612445F2
P 6650 2750
F 0 "C22" H 6765 2796 50  0000 L CNN
F 1 "C_10uF_25V" H 6765 2705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6600 2550 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM21BR61E106KA73-01.pdf" H 6650 2750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/murata-electronics/GRM21BR61E106KA73K/490-16824-1-ND/7595732" H 6650 3250 50  0001 C CNN "Purchasing Link"
	1    6650 2750
	1    0    0    -1  
$EndComp
Connection ~ 6650 2600
Wire Wire Line
	6650 2900 6650 3300
$Comp
L power:GND #PWR?
U 1 1 612445FA
P 6650 3400
F 0 "#PWR?" H 6650 3150 50  0001 C CNN
F 1 "GND" H 6655 3227 50  0000 C CNN
F 2 "" H 6650 3400 50  0001 C CNN
F 3 "" H 6650 3400 50  0001 C CNN
	1    6650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3200 6000 3300
Wire Wire Line
	6000 3300 6650 3300
Connection ~ 6000 3300
Connection ~ 6650 3300
Wire Wire Line
	6650 3300 6650 3400
$Comp
L power:+12V #PWR?
U 1 1 612611CA
P 4350 3500
F 0 "#PWR?" H 4350 3350 50  0001 C CNN
F 1 "+12V" H 4365 3673 50  0000 C CNN
F 2 "" H 4350 3500 50  0001 C CNN
F 3 "" H 4350 3500 50  0001 C CNN
	1    4350 3500
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_01X03 J17
U 1 1 612611D3
P 4050 3750
F 0 "J17" H 4078 3791 50  0000 L CNN
F 1 "CONN_01X03" H 4078 3700 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 4050 2550 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 4050 2550 50  0001 C CNN
F 4 "Mouser" H 4050 3750 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 4050 3750 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 4450 4350 60  0001 C CNN "PurchasingLink"
	1    4050 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 3650 4350 3650
Wire Wire Line
	4350 3650 4350 3500
$EndSCHEMATC
