EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4600 900  0    118  ~ 0
AIR CONTROL RELAY CIRCUITS
$Comp
L power:GND #PWR0198
U 1 1 61065F69
P 5850 5550
F 0 "#PWR0198" H 5850 5300 50  0001 C CNN
F 1 "GND" H 5855 5377 50  0000 C CNN
F 2 "" H 5850 5550 50  0001 C CNN
F 3 "" H 5850 5550 50  0001 C CNN
	1    5850 5550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R906
U 1 1 61065F72
P 5850 4900
F 0 "R906" V 5750 4850 50  0000 L CNN
F 1 "R_10K" V 5950 4800 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5780 4900 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5930 4900 50  0001 C CNN
F 4 "DK" H 5850 4900 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5850 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6330 5300 60  0001 C CNN "PurchasingLink"
	1    5850 4900
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D903
U 1 1 61065F7B
P 5300 5200
F 0 "D903" V 5300 5450 50  0000 R CNN
F 1 "LED_0805" V 5200 5600 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5200 5200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5300 5300 50  0001 C CNN
F 4 "DK" H 5300 5200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5300 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5700 5700 60  0001 C CNN "PurchasingLink"
	1    5300 5200
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R905
U 1 1 61065F84
P 5300 4800
F 0 "R905" H 5050 4750 50  0000 L CNN
F 1 "R_200" H 5000 4850 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5230 4800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5380 4800 50  0001 C CNN
F 4 "DK" H 5300 4800 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5300 4800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5780 5200 60  0001 C CNN "PurchasingLink"
	1    5300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4600 5600 4600
Wire Wire Line
	5800 4000 5350 4000
$Comp
L power:GND #PWR0200
U 1 1 61065F96
P 3400 5550
F 0 "#PWR0200" H 3400 5300 50  0001 C CNN
F 1 "GND" H 3405 5377 50  0000 C CNN
F 2 "" H 3400 5550 50  0001 C CNN
F 3 "" H 3400 5550 50  0001 C CNN
	1    3400 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4650 3150 4650
$Comp
L formula:R_200 R901
U 1 1 61065FAA
P 2900 4850
F 0 "R901" H 2650 4800 50  0000 L CNN
F 1 "R_200" H 2600 4900 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2830 4850 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2980 4850 50  0001 C CNN
F 4 "DK" H 2900 4850 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 2900 4850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 3380 5250 60  0001 C CNN "PurchasingLink"
	1    2900 4850
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R903
U 1 1 61065FB3
P 3400 5050
F 0 "R903" H 3450 5100 50  0000 L CNN
F 1 "R_10K" H 3450 5000 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3330 5050 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3480 5050 50  0001 C CNN
F 4 "DK" H 3400 5050 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3400 5050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3880 5450 60  0001 C CNN "PurchasingLink"
	1    3400 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4000 2950 4000
Text Notes 4950 3800 0    98   ~ 0
Air+ Weld Detection
$Comp
L power:GND #PWR0202
U 1 1 61066001
P 6350 3100
F 0 "#PWR0202" H 6350 2850 50  0001 C CNN
F 1 "GND" H 6355 2927 50  0000 C CNN
F 2 "" H 6350 3100 50  0001 C CNN
F 3 "" H 6350 3100 50  0001 C CNN
	1    6350 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2350 6350 3100
$Comp
L formula:LED_0805 D904
U 1 1 6106600B
P 5200 2850
F 0 "D904" V 5150 2800 50  0000 R CNN
F 1 "LED_0805" V 5250 2800 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5100 2850 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5200 2950 50  0001 C CNN
F 4 "DK" H 5200 2850 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5200 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5600 3350 60  0001 C CNN "PurchasingLink"
	1    5200 2850
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_10K R908
U 1 1 61066016
P 5650 2600
F 0 "R908" H 5720 2646 50  0000 L CNN
F 1 "R_10K" H 5720 2555 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5580 2600 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5730 2600 50  0001 C CNN
F 4 "DK" H 5650 2600 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5650 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6130 3000 60  0001 C CNN "PurchasingLink"
	1    5650 2600
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R907
U 1 1 61066021
P 5200 2400
F 0 "R907" H 5250 2350 50  0000 L CNN
F 1 "R_200" H 5250 2450 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5130 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5280 2400 50  0001 C CNN
F 4 "DK" H 5200 2400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5200 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5680 2800 60  0001 C CNN "PurchasingLink"
	1    5200 2400
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q902
U 1 1 6106602C
P 6250 2150
F 0 "Q902" H 6456 2196 50  0000 L CNN
F 1 "SSM3K333R" H 6456 2105 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6450 2075 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6450 2225 50  0001 L CNN
F 4 "DK" H 6750 2525 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6650 2425 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6550 2325 60  0001 C CNN "PurchasingLink"
	1    6250 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0203
U 1 1 61066035
P 3150 3000
F 0 "#PWR0203" H 3150 2750 50  0001 C CNN
F 1 "GND" H 3155 2827 50  0000 C CNN
F 2 "" H 3150 3000 50  0001 C CNN
F 3 "" H 3150 3000 50  0001 C CNN
	1    3150 3000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R902
U 1 1 61066040
P 2050 2400
F 0 "R902" H 1800 2350 50  0000 L CNN
F 1 "R_200" H 1750 2450 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1980 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2130 2400 50  0001 C CNN
F 4 "DK" H 2050 2400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 2050 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 2530 2800 60  0001 C CNN "PurchasingLink"
	1    2050 2400
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D902
U 1 1 61066049
P 2050 2800
F 0 "D902" V 2050 3050 50  0000 R CNN
F 1 "LED_0805" V 1950 3200 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1950 2800 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2050 2900 50  0001 C CNN
F 4 "DK" H 2050 2800 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2050 2800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2450 3300 60  0001 C CNN "PurchasingLink"
	1    2050 2800
	0    -1   -1   0   
$EndComp
$Comp
L formula:SSM3K333R Q901
U 1 1 61066054
P 3050 2150
F 0 "Q901" H 3256 2196 50  0000 L CNN
F 1 "SSM3K333R" H 3256 2105 50  0000 L CNN
F 2 "footprints:SOT-23F" H 3250 2075 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 3250 2225 50  0001 L CNN
F 4 "DK" H 3550 2525 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 3450 2425 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 3350 2325 60  0001 C CNN "PurchasingLink"
	1    3050 2150
	1    0    0    -1  
$EndComp
Text Notes 5550 1300 0    98   ~ 0
AIR - Circuit
Text Notes 2000 1300 0    98   ~ 0
Precharge Circuit
Connection ~ 6350 3100
Wire Wire Line
	3150 3000 3150 2350
Connection ~ 3150 3000
Wire Wire Line
	5550 1550 6300 1550
Wire Wire Line
	5300 5450 5850 5450
Text Notes 2850 3800 0    98   ~ 0
Air- Weld Detection
$Comp
L formula:R_10K R904
U 1 1 61066090
P 2400 2550
F 0 "R904" H 2470 2596 50  0000 L CNN
F 1 "R_10K" H 2470 2505 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2330 2550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 2480 2550 50  0001 C CNN
F 4 "DK" H 2400 2550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 2400 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 2880 2950 60  0001 C CNN "PurchasingLink"
	1    2400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1900 10200 1900
Wire Wire Line
	10100 2700 10100 1900
Text Notes 8700 1400 0    98   ~ 0
AIR + Circuit
$Comp
L formula:R_1K R909
U 1 1 61065FF8
P 8800 2000
F 0 "R909" H 8850 2100 50  0000 L CNN
F 1 "R_1K" H 8850 2000 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8730 2000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 8880 2000 50  0001 C CNN
F 4 "DK" H 8800 2000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 8800 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 9280 2400 60  0001 C CNN "PurchasingLink"
	1    8800 2000
	1    0    0    -1  
$EndComp
$Comp
L formula:CP_1mF C901
U 1 1 61065FED
P 9300 2150
F 0 "C901" H 9350 2250 50  0000 L CNN
F 1 "CP_1mF" H 9350 2350 50  0000 L CNN
F 2 "footprints:C_Radial_D10_L13_P5_OEM" H 9225 2150 50  0001 C CNN
F 3 "http://nichicon-us.com/english/products/pdfs/e-uvz.pdf" H 9325 2250 50  0001 C CNN
F 4 "Digi-Key" H 9425 2350 60  0001 C CNN "MFN"
F 5 "493-1305-ND" H 9525 2450 60  0001 C CNN "MPN"
F 6 "Radial, Can" H 9625 2550 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=493-1305-ND" H 9725 2650 60  0001 C CNN "PurchasingLink"
	1    9300 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:CP_1mF C902
U 1 1 61065FE1
P 9700 2150
F 0 "C902" H 9750 2250 50  0000 L CNN
F 1 "CP_1mF" H 9750 2350 50  0000 L CNN
F 2 "footprints:C_Radial_D10_L13_P5_OEM" H 9625 2150 50  0001 C CNN
F 3 "http://nichicon-us.com/english/products/pdfs/e-uvz.pdf" H 9725 2250 50  0001 C CNN
F 4 "Digi-Key" H 9825 2350 60  0001 C CNN "MFN"
F 5 "493-1305-ND" H 9925 2450 60  0001 C CNN "MPN"
F 6 "Radial, Can" H 10025 2550 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=493-1305-ND" H 10125 2650 60  0001 C CNN "PurchasingLink"
	1    9700 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D905
U 1 1 61065FD5
P 8800 2450
F 0 "D905" V 8900 2400 50  0000 R CNN
F 1 "LED_0805" V 8800 2400 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 8700 2450 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 8800 2550 50  0001 C CNN
F 4 "DK" H 8800 2450 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 8800 2450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9200 2950 60  0001 C CNN "PurchasingLink"
	1    8800 2450
	0    -1   -1   0   
$EndComp
Text GLabel 1850 2150 0    50   Input ~ 0
PRECHARGE_CTL
Text GLabel 3150 1500 2    50   Input ~ 0
PRECHARGE_LSD
Wire Wire Line
	3150 1500 3150 1750
Text GLabel 10200 1700 2    50   Input ~ 0
+AIR_COIL+
Text GLabel 10200 1900 2    50   Input ~ 0
+AIR_COIL-
Text GLabel 4950 2150 0    50   Input ~ 0
-AIR_LSD
Text GLabel 6350 1700 2    50   Input ~ 0
-AIR_COIL-
Wire Wire Line
	6350 1700 6350 1900
Text GLabel 8450 1700 0    50   Input ~ 0
FINAL_SHUTDOWN
Text GLabel 5550 1550 0    50   Input ~ 0
FINAL_SHUTDOWN
Text GLabel 6300 1550 2    50   Input ~ 0
-AIR_COIL+
Text GLabel 2950 4000 0    50   Input ~ 0
-AIR_AUX+
Text GLabel 3150 4250 0    50   Input ~ 0
-AIR_AUX-
Wire Wire Line
	3150 4250 3150 4650
Connection ~ 3150 4650
Text GLabel 3650 4650 2    50   Input ~ 0
-AIR_WELD_DETECT
Text GLabel 5600 4250 0    50   Input ~ 0
+AIR_AUX-
Text GLabel 5350 4000 0    50   Input ~ 0
+AIR_AUX+
Text GLabel 6100 4600 2    50   Input ~ 0
+AIR_WELD_DETECT
Wire Wire Line
	5600 4250 5600 4600
Connection ~ 5600 4600
Text GLabel 3650 4000 2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 5800 4000 2    50   Input ~ 0
5V_AIR_CONTROL
Connection ~ 10100 2700
Wire Wire Line
	10100 2700 10100 2850
$Comp
L power:GND #PWR0204
U 1 1 61065FC3
P 10100 2850
F 0 "#PWR0204" H 10100 2600 50  0001 C CNN
F 1 "GND" H 10105 2677 50  0000 C CNN
F 2 "" H 10100 2850 50  0001 C CNN
F 3 "" H 10100 2850 50  0001 C CNN
	1    10100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2150 2400 2400
Connection ~ 2400 2150
Wire Wire Line
	2400 2150 2700 2150
Wire Wire Line
	2400 2700 2400 3000
Wire Wire Line
	2400 3000 3150 3000
Wire Wire Line
	1850 2150 2050 2150
Wire Wire Line
	2050 2150 2050 2250
Connection ~ 2050 2150
Wire Wire Line
	2050 2150 2400 2150
Wire Wire Line
	2050 2550 2050 2650
Wire Wire Line
	2050 2950 2050 3000
Wire Wire Line
	2050 3000 2400 3000
Connection ~ 2400 3000
$Comp
L formula:Test_Point_SMD TP901
U 1 1 61FACB3E
P 2700 2000
F 0 "TP901" H 1750 2100 50  0000 L CNN
F 1 "PRECHARGE_CTL" H 2000 2100 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2700 1850 50  0001 C CNN
F 3 "" H 2700 2000 50  0001 C CNN
	1    2700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2050 2700 2150
Connection ~ 2700 2150
Wire Wire Line
	2700 2150 2850 2150
$Comp
L formula:Test_Point_SMD TP902
U 1 1 61FB4B97
P 3300 1750
F 0 "TP902" V 3249 1928 50  0000 L CNN
F 1 "PRECHARGE_LSD" V 3340 1928 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3300 1600 50  0001 C CNN
F 3 "" H 3300 1750 50  0001 C CNN
	1    3300 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1750 3150 1750
Connection ~ 3150 1750
Wire Wire Line
	3150 1750 3150 1950
Wire Wire Line
	4950 2150 5200 2150
Wire Wire Line
	5200 3000 5200 3100
Wire Wire Line
	5200 2700 5200 2550
Wire Wire Line
	5200 2250 5200 2150
Connection ~ 5200 2150
Wire Wire Line
	5200 2150 5650 2150
Wire Wire Line
	5650 2450 5650 2150
Connection ~ 5650 2150
Wire Wire Line
	5650 2150 5850 2150
Wire Wire Line
	5650 2750 5650 3100
Wire Wire Line
	5200 3100 5650 3100
Connection ~ 5650 3100
Wire Wire Line
	5650 3100 6350 3100
$Comp
L formula:Test_Point_SMD TP904
U 1 1 61FF2D46
P 5850 1900
F 0 "TP904" H 5150 2000 50  0000 L CNN
F 1 "-AIR_LSD" H 5400 2000 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5850 1750 50  0001 C CNN
F 3 "" H 5850 1900 50  0001 C CNN
	1    5850 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1950 5850 2150
Connection ~ 5850 2150
Wire Wire Line
	5850 2150 6050 2150
$Comp
L formula:Test_Point_SMD TP906
U 1 1 61FF4B76
P 6550 1900
F 0 "TP906" V 6499 2078 50  0000 L CNN
F 1 "-AIR_COIL-" V 6590 2078 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6550 1750 50  0001 C CNN
F 3 "" H 6550 1900 50  0001 C CNN
	1    6550 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 1900 6500 1900
Connection ~ 6350 1900
Wire Wire Line
	6350 1900 6350 1950
Wire Wire Line
	8800 2700 9300 2700
Wire Wire Line
	8450 1700 8800 1700
Wire Wire Line
	8800 1700 8800 1850
Connection ~ 8800 1700
Wire Wire Line
	8800 1700 9300 1700
Wire Wire Line
	8800 2150 8800 2300
Wire Wire Line
	8800 2600 8800 2700
Wire Wire Line
	9300 1700 9300 2000
Connection ~ 9300 1700
Wire Wire Line
	9300 1700 9700 1700
Wire Wire Line
	9300 2300 9300 2700
Connection ~ 9300 2700
Wire Wire Line
	9300 2700 9700 2700
Wire Wire Line
	9700 1700 9700 2000
Connection ~ 9700 1700
Wire Wire Line
	9700 1700 10100 1700
Wire Wire Line
	9700 2300 9700 2700
Connection ~ 9700 2700
Wire Wire Line
	9700 2700 10100 2700
$Comp
L formula:Test_Point_SMD TP907
U 1 1 620408CD
P 10100 1400
F 0 "TP907" H 10178 1488 50  0000 L CNN
F 1 "+AIR_COIL+" H 10178 1397 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10100 1250 50  0001 C CNN
F 3 "" H 10100 1400 50  0001 C CNN
	1    10100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1450 10100 1700
Connection ~ 10100 1700
Wire Wire Line
	10100 1700 10200 1700
Wire Wire Line
	3150 4650 3400 4650
Wire Wire Line
	3400 4650 3400 4900
Connection ~ 3400 4650
Wire Wire Line
	3400 4650 3550 4650
Wire Wire Line
	3400 5200 3400 5450
$Comp
L formula:LED_0805 D901
U 1 1 61065FA0
P 2900 5200
F 0 "D901" V 2900 5450 50  0000 R CNN
F 1 "LED_0805" V 2800 5600 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2800 5200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2900 5300 50  0001 C CNN
F 4 "DK" H 2900 5200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2900 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 3300 5700 60  0001 C CNN "PurchasingLink"
	1    2900 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 4650 2900 4700
Wire Wire Line
	2900 5000 2900 5050
Wire Wire Line
	2900 5350 2900 5450
Wire Wire Line
	2900 5450 3400 5450
Wire Wire Line
	3400 5450 3400 5550
Connection ~ 3400 5450
Wire Wire Line
	5600 4600 5850 4600
Wire Wire Line
	5850 4600 5850 4750
Connection ~ 5850 4600
Wire Wire Line
	5850 4600 5950 4600
Wire Wire Line
	5850 5050 5850 5450
Wire Wire Line
	5300 4950 5300 5050
Wire Wire Line
	5300 5350 5300 5450
Wire Wire Line
	5300 4600 5300 4650
Wire Wire Line
	5850 5450 5850 5550
Connection ~ 5850 5450
$Comp
L formula:Test_Point_SMD TP903
U 1 1 620C88BA
P 3550 4400
F 0 "TP903" H 3628 4488 50  0000 L CNN
F 1 "-AIR_WELD_DETECT" H 3628 4397 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3550 4250 50  0001 C CNN
F 3 "" H 3550 4400 50  0001 C CNN
	1    3550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4450 3550 4650
Connection ~ 3550 4650
Wire Wire Line
	3550 4650 3650 4650
$Comp
L formula:Test_Point_SMD TP905
U 1 1 620CAB4A
P 5950 4350
F 0 "TP905" H 6028 4438 50  0000 L CNN
F 1 "+AIR_WELD_DETECT" H 6028 4347 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5950 4200 50  0001 C CNN
F 3 "" H 5950 4350 50  0001 C CNN
	1    5950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4400 5950 4600
Connection ~ 5950 4600
Wire Wire Line
	5950 4600 6100 4600
$EndSCHEMATC
