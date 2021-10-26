EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Telemetry Core"
Date "2021-10-25"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Melissa Kazazic"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE119A
P 3300 9150
F 0 "#PWR?" H 3300 8900 50  0001 C CNN
F 1 "GND" H 3305 8977 50  0000 C CNN
F 2 "" H 3300 9150 50  0001 C CNN
F 3 "" H 3300 9150 50  0001 C CNN
	1    3300 9150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE168D
P 2550 8900
F 0 "#PWR?" H 2550 8650 50  0001 C CNN
F 1 "GND" H 2550 8700 50  0000 C CNN
F 2 "" H 2550 8900 50  0001 C CNN
F 3 "" H 2550 8900 50  0001 C CNN
	1    2550 8900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 2250 8900
F 0 "#PWR?" H 2250 8650 50  0001 C CNN
F 1 "GND" H 2255 8727 50  0000 C CNN
F 2 "" H 2250 8900 50  0001 C CNN
F 3 "" H 2250 8900 50  0001 C CNN
	1    2250 8900
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C4
U 1 1 5BEE2647
P 2550 8800
F 0 "C4" H 2600 8650 50  0000 L CNN
F 1 "C_2.2uF" H 2430 9050 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2588 8650 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2575 8900 50  0001 C CNN
F 4 "DK" H 2550 8800 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2550 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2975 9300 60  0001 C CNN "PurchasingLink"
	1    2550 8800
	1    0    0    -1  
$EndComp
Connection ~ 2550 8600
Wire Wire Line
	2550 8600 2800 8600
$Comp
L formula:C_0.1uF C3
U 1 1 5BEE2923
P 2250 8750
F 0 "C3" H 2300 8600 50  0000 L CNN
F 1 "C_0.1uF" H 2080 9000 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2288 8600 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 2275 8850 50  0001 C CNN
F 4 "DK" H 2250 8750 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 2250 8750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 2675 9250 60  0001 C CNN "PurchasingLink"
	1    2250 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 8600 2550 8600
Connection ~ 2250 8600
$Comp
L formula:R_100K R4
U 1 1 5BEE2A52
P 4150 9400
F 0 "R4" V 4250 9350 50  0000 L CNN
F 1 "R_100K" V 4050 9250 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4080 9400 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 4230 9400 50  0001 C CNN
F 4 "DK" H 4150 9400 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 4150 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 4630 9800 60  0001 C CNN "PurchasingLink"
	1    4150 9400
	0    1    1    0   
$EndComp
$Comp
L formula:C_0.1uF C6
U 1 1 5BEE239B
P 4150 8550
F 0 "C6" V 4090 8690 50  0000 C CNN
F 1 "C_0.1uF" V 4190 8750 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 4188 8400 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4175 8650 50  0001 C CNN
F 4 "DK" H 4150 8550 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 4150 8550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4575 9050 60  0001 C CNN "PurchasingLink"
	1    4150 8550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 15450 8600
F 0 "#PWR?" H 15450 8350 50  0001 C CNN
F 1 "GND" H 15455 8427 50  0000 C CNN
F 2 "" H 15450 8600 50  0001 C CNN
F 3 "" H 15450 8600 50  0001 C CNN
	1    15450 8600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_22uF COUT1
U 1 1 5C061BB4
P 4950 8850
F 0 "COUT1" H 4840 9100 50  0000 L CNN
F 1 "C_22uF" H 4970 8750 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 5000 8450 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5000 9200 50  0001 C CNN
F 4 "DK" H 4750 8850 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 5000 8350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 5375 9350 60  0001 C CNN "PurchasingLink"
	1    4950 8850
	1    0    0    -1  
$EndComp
Connection ~ 4950 8700
Wire Wire Line
	4650 8700 4950 8700
$Comp
L formula:C_47uF COUT3
U 1 1 5C062E7A
P 5750 8850
F 0 "COUT3" H 5650 9100 50  0000 L CNN
F 1 "C_47uF" H 5760 8750 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5788 8700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 5775 8950 50  0001 C CNN
F 4 "DK" H 5750 8850 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 5750 8850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 6175 9350 60  0001 C CNN "PurchasingLink"
	1    5750 8850
	1    0    0    -1  
$EndComp
Connection ~ 5750 8700
Wire Wire Line
	5750 8700 6150 8700
$Comp
L formula:C_33uF COUT2
U 1 1 5C08921B
P 5350 8850
F 0 "COUT2" H 5250 9100 50  0000 L CNN
F 1 "C_33uF" H 5360 8750 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 5400 8450 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5350 9500 50  0001 C CNN
F 4 "C4532X7R1C336M250KC" H 5400 8350 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 5350 9200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 5600 9350 60  0001 C CNN "PurchasingLink"
	1    5350 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 8700 5350 8700
Wire Wire Line
	5350 8700 5750 8700
Connection ~ 5350 8700
$Comp
L formula:R_25K R3
U 1 1 5C0B315C
P 3650 9400
F 0 "R3" V 3750 9350 50  0000 L CNN
F 1 "R_25K" V 3550 9300 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3700 8850 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" H 3650 9000 50  0001 C CNN
F 4 "A124124CT-ND" H 3050 9400 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B25KE" H 3700 9900 60  0001 C CNN "Digi-key Part Number"
F 6 "https://www.digikey.com/product-detail/en/te-connectivity-passive-product/CPF-A-0805B25KE/A124124CT-ND/5970044" H 3700 9800 60  0001 C CNN "PurchasingLink"
	1    3650 9400
	0    1    1    0   
$EndComp
$Comp
L formula:F_500mA_16V F1
U 1 1 5C0BFA29
P 1200 8600
F 0 "F1" V 1280 8600 50  0000 C CNN
F 1 "F_500mA_16V" V 1100 8620 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 1130 8600 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1280 8600 50  0001 C CNN
F 4 "DK" H 1200 8600 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1200 8600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1680 9000 60  0001 C CNN "PurchasingLink"
	1    1200 8600
	0    1    1    0   
$EndComp
$Comp
L formula:R_0_2512 R10
U 1 1 5C0C29A9
P 6700 8500
F 0 "R10" V 6500 8500 50  0000 C CNN
F 1 "R_0_2512" V 6600 8550 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 6630 8500 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 6780 8500 50  0001 C CNN
F 4 "DK" H 6700 8500 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 6700 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 7180 8900 60  0001 C CNN "PurchasingLink"
	1    6700 8500
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D3
U 1 1 5C0C344A
P 6450 9550
F 0 "D3" V 6650 9530 50  0000 R CNN
F 1 "LED_0805" V 6560 9530 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6350 9550 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6450 9650 50  0001 C CNN
F 4 "DK" H 6450 9550 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6450 9550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6850 10050 60  0001 C CNN "PurchasingLink"
	1    6450 9550
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R6
U 1 1 5C0C44F9
P 6450 8950
F 0 "R6" H 6520 8996 50  0000 L CNN
F 1 "R_200" H 6520 8905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6380 8950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6530 8950 50  0001 C CNN
F 4 "DK" H 6450 8950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6450 8950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6930 9350 60  0001 C CNN "PurchasingLink"
	1    6450 8950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 6450 9900
F 0 "#PWR?" H 6450 9650 50  0001 C CNN
F 1 "GND" H 6455 9727 50  0000 C CNN
F 2 "" H 6450 9900 50  0001 C CNN
F 3 "" H 6450 9900 50  0001 C CNN
	1    6450 9900
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D1
U 1 1 5C623D49
P 1450 8900
F 0 "D1" H 1440 9090 50  0000 C CNN
F 1 "D_Zener_18V" H 1430 9000 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1350 8900 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1450 9000 50  0001 C CNN
F 4 "DK" H 1650 9200 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1550 9100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 1850 9400 60  0001 C CNN "PurchasingLink"
	1    1450 8900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 1450 9150
F 0 "#PWR?" H 1450 8900 50  0001 C CNN
F 1 "GND" H 1455 8977 50  0000 C CNN
F 2 "" H 1450 9150 50  0001 C CNN
F 3 "" H 1450 9150 50  0001 C CNN
	1    1450 9150
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D2
U 1 1 5C754D7D
P 1850 9200
F 0 "D2" V 1888 9083 50  0000 R CNN
F 1 "LED_0805" V 1797 9083 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1750 9200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1850 9300 50  0001 C CNN
F 4 "DK" H 1850 9200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1850 9200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2250 9700 60  0001 C CNN "PurchasingLink"
	1    1850 9200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 1850 9450
F 0 "#PWR?" H 1850 9200 50  0001 C CNN
F 1 "GND" H 1855 9277 50  0000 C CNN
F 2 "" H 1850 9450 50  0001 C CNN
F 3 "" H 1850 9450 50  0001 C CNN
	1    1850 9450
	1    0    0    -1  
$EndComp
Text Notes 2100 8500 0    50   ~ 0
Input Capacitors\n\n
Text Notes 1750 9500 1    50   ~ 0
12V Indicator
Text Notes 1350 9150 1    50   ~ 0
Protection\n
Text Notes 3000 8050 0    89   ~ 0
BUCK CONVERTER\n
$Comp
L power:GND #PWR?
U 1 1 5C77960D
P 3500 9700
F 0 "#PWR?" H 3500 9450 50  0001 C CNN
F 1 "GND" H 3505 9527 50  0000 C CNN
F 2 "" H 3500 9700 50  0001 C CNN
F 3 "" H 3500 9700 50  0001 C CNN
	1    3500 9700
	1    0    0    -1  
$EndComp
Text Notes 3600 9650 0    50   ~ 0
Feedback Divider\n
Text Notes 3750 8400 0    50   ~ 0
Bootstrap Capacitor\n
Text Notes 5050 8450 0    50   ~ 0
Output Capacitors\n
$Comp
L power:GND #PWR?
U 1 1 5C7815F8
P 5350 9000
F 0 "#PWR?" H 5350 8750 50  0001 C CNN
F 1 "GND" H 5355 8827 50  0000 C CNN
F 2 "" H 5350 9000 50  0001 C CNN
F 3 "" H 5350 9000 50  0001 C CNN
	1    5350 9000
	1    0    0    -1  
$EndComp
Text Notes 6800 8550 0    50   ~ 0
VCC Jumper\n
Text Notes 6300 9800 1    50   ~ 0
5V Indicator
$Comp
L formula:ATMEGA16M1 U1
U 1 1 5D58A7A6
P 2750 2900
F 0 "U1" H 3650 4760 50  0000 C CNN
F 1 "ATMEGA16M1" H 2050 4750 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2750 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1800 4730 50  0001 C CNN
F 4 "DK" H 2750 2900 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2750 2900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2200 5130 60  0001 C CNN "PurchasingLink"
	1    2750 2900
	1    0    0    -1  
$EndComp
Text Label 3850 2300 0    50   ~ 0
CAN_TX
Text Label 3850 2400 0    50   ~ 0
CAN_RX
Text Label 3850 3200 0    50   ~ 0
MISO
Text Label 3850 3300 0    50   ~ 0
MOSI
Text Label 3850 3400 0    50   ~ 0
SCK
Text Label 4500 3900 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1350 1350
F 0 "R1" V 1250 1300 50  0000 L CNN
F 1 "R_100" V 1440 1230 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 550 1500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1050 1850 50  0001 C CNN
F 4 "DK" H 1350 1350 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 700 1600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1830 1750 60  0001 C CNN "PurchasingLink"
	1    1350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1200 1350 1200
Connection ~ 1350 1200
Wire Wire Line
	1350 1200 1650 1200
$Comp
L formula:C_100pF C2
U 1 1 5D58E505
P 1350 1650
F 0 "C2" V 1400 1500 50  0000 L CNN
F 1 "C_100pF" V 1200 1470 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1388 1500 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1375 1750 50  0001 C CNN
F 4 "DK" H 1350 1650 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1350 1650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1775 2150 60  0001 C CNN "PurchasingLink"
	1    1350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 1000 1500
F 0 "#PWR?" H 1000 1250 50  0001 C CNN
F 1 "GND" H 1005 1327 50  0000 C CNN
F 2 "" H 1000 1500 50  0001 C CNN
F 3 "" H 1000 1500 50  0001 C CNN
	1    1000 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1350 1800
F 0 "#PWR?" H 1350 1550 50  0001 C CNN
F 1 "GND" H 1355 1627 50  0000 C CNN
F 2 "" H 1350 1800 50  0001 C CNN
F 3 "" H 1350 1800 50  0001 C CNN
	1    1350 1800
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4300 4300
F 0 "Y1" H 4010 4370 50  0000 L CNN
F 1 "Crystal_SMD" H 3620 4300 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4250 4375 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4350 4475 50  0001 C CNN
F 4 "DK" H 4300 4300 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4300 4300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4750 4875 60  0001 C CNN "PurchasingLink"
	1    4300 4300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB5B2
P 4100 4550
F 0 "C5" H 3990 4630 50  0000 L CNN
F 1 "C_30pF" H 3830 4470 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4138 4400 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4125 4650 50  0001 C CNN
F 4 "DK" H 4100 4550 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4100 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4525 5050 60  0001 C CNN "PurchasingLink"
	1    4100 4550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C7
U 1 1 5D5EB694
P 4500 4550
F 0 "C7" H 4520 4630 50  0000 L CNN
F 1 "C_30pF" H 4530 4450 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4538 4400 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4525 4650 50  0001 C CNN
F 4 "DK" H 4500 4550 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4500 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4925 5050 60  0001 C CNN "PurchasingLink"
	1    4500 4550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R5
U 1 1 5D5EB7F3
P 4350 3700
F 0 "R5" V 4270 3700 50  0000 C CNN
F 1 "R_10K" V 4400 3950 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4280 3700 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4430 3700 50  0001 C CNN
F 4 "DK" H 4350 3700 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4350 3700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4830 4100 60  0001 C CNN "PurchasingLink"
	1    4350 3700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 4100 4700
F 0 "#PWR?" H 4100 4450 50  0001 C CNN
F 1 "GND" H 4105 4527 50  0000 C CNN
F 2 "" H 4100 4700 50  0001 C CNN
F 3 "" H 4100 4700 50  0001 C CNN
	1    4100 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4500 4700
F 0 "#PWR?" H 4500 4450 50  0001 C CNN
F 1 "GND" H 4505 4527 50  0000 C CNN
F 2 "" H 4500 4700 50  0001 C CNN
F 3 "" H 4500 4700 50  0001 C CNN
	1    4500 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4300 4450
F 0 "#PWR?" H 4300 4200 50  0001 C CNN
F 1 "GND" H 4305 4277 50  0000 C CNN
F 2 "" H 4300 4450 50  0001 C CNN
F 3 "" H 4300 4450 50  0001 C CNN
	1    4300 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4650 4150
F 0 "#PWR?" H 4650 3900 50  0001 C CNN
F 1 "GND" H 4655 3977 50  0000 C CNN
F 2 "" H 4650 4150 50  0001 C CNN
F 3 "" H 4650 4150 50  0001 C CNN
	1    4650 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1500 4250
F 0 "#PWR?" H 1500 4000 50  0001 C CNN
F 1 "GND" H 1505 4077 50  0000 C CNN
F 2 "" H 1500 4250 50  0001 C CNN
F 3 "" H 1500 4250 50  0001 C CNN
	1    1500 4250
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U3
U 1 1 5D5FAEDE
P 14800 2150
F 0 "U3" H 15160 2500 50  0000 C CNN
F 1 "MCP2561-E_SN" H 15150 1790 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 14800 1650 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 14400 2500 50  0001 C CNN
F 4 "DK" H 14800 2150 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 14800 2150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 14800 2900 60  0001 C CNN "PurchasingLink"
	1    14800 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C8
U 1 1 5D5FB603
P 14650 1550
F 0 "C8" V 14600 1660 50  0000 C CNN
F 1 "C_0.1uF" V 14610 1360 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 14688 1400 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14675 1650 50  0001 C CNN
F 4 "DK" H 14650 1550 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 14650 1550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 15075 2050 60  0001 C CNN "PurchasingLink"
	1    14650 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	14800 1750 14800 1550
Connection ~ 14800 1550
Wire Wire Line
	14800 1550 14800 1400
NoConn ~ 15300 2150
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 14500 1700
F 0 "#PWR?" H 14500 1450 50  0001 C CNN
F 1 "GND" H 14400 1700 50  0000 C CNN
F 2 "" H 14500 1700 50  0001 C CNN
F 3 "" H 14500 1700 50  0001 C CNN
	1    14500 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 14800 2550
F 0 "#PWR?" H 14800 2300 50  0001 C CNN
F 1 "GND" H 14805 2377 50  0000 C CNN
F 2 "" H 14800 2550 50  0001 C CNN
F 3 "" H 14800 2550 50  0001 C CNN
	1    14800 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 14300 2350
F 0 "#PWR?" H 14300 2100 50  0001 C CNN
F 1 "GND" H 14305 2177 50  0000 C CNN
F 2 "" H 14300 2350 50  0001 C CNN
F 3 "" H 14300 2350 50  0001 C CNN
	1    14300 2350
	1    0    0    -1  
$EndComp
Text Label 14300 1950 2    50   ~ 0
CAN_TX
Text Label 14300 2050 2    50   ~ 0
CAN_RX
Text Label 15750 2000 0    50   ~ 0
CAN_P
Text Label 15750 2300 0    50   ~ 0
CAN_N
Text Notes 14200 1150 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2450 1000 0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3750 5100 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 14600 8150 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 14550 8600
F 0 "#FLG?" H 14550 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 14550 8774 50  0000 C CNN
F 2 "" H 14550 8600 50  0001 C CNN
F 3 "~" H 14550 8600 50  0001 C CNN
	1    14550 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 15000 8600
F 0 "#FLG?" H 15000 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 15000 8774 50  0000 C CNN
F 2 "" H 15000 8600 50  0001 C CNN
F 3 "~" H 15000 8600 50  0001 C CNN
	1    15000 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 15450 8450
F 0 "#FLG?" H 15450 8525 50  0001 C CNN
F 1 "PWR_FLAG" H 15450 8624 50  0000 C CNN
F 2 "" H 15450 8450 50  0001 C CNN
F 3 "~" H 15450 8450 50  0001 C CNN
	1    15450 8450
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_02X03 J2
U 1 1 5D628C9D
P 15050 3500
F 0 "J2" H 15050 3710 50  0000 C CNN
F 1 "CONN_02X03" H 14940 3300 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 15050 2300 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 15050 2300 50  0001 C CNN
F 4 "DK" H 15050 3500 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 15050 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 15450 4100 60  0001 C CNN "PurchasingLink"
	1    15050 3500
	1    0    0    -1  
$EndComp
Text Label 14800 3400 2    50   ~ 0
MISO
Text Label 14800 3500 2    50   ~ 0
SCK
Text Label 14800 3600 2    50   ~ 0
RESET
Text Label 15300 3500 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 15300 3600
F 0 "#PWR?" H 15300 3350 50  0001 C CNN
F 1 "GND" H 15305 3427 50  0000 C CNN
F 2 "" H 15300 3600 50  0001 C CNN
F 3 "" H 15300 3600 50  0001 C CNN
	1    15300 3600
	1    0    0    -1  
$EndComp
Text Notes 14050 3150 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Connection ~ 1350 1500
Wire Wire Line
	1650 1500 1350 1500
$Comp
L formula:C_0.1uF C1
U 1 1 5D58E34B
P 1000 1350
F 0 "C1" V 1050 1210 50  0000 L CNN
F 1 "C_0.1uF" V 860 1190 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1038 1200 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1025 1450 50  0001 C CNN
F 4 "DK" H 1000 1350 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1000 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1425 1850 60  0001 C CNN "PurchasingLink"
	1    1000 1350
	1    0    0    -1  
$EndComp
Connection ~ 1000 1200
Wire Wire Line
	1000 1050 1000 1200
Wire Wire Line
	1500 4250 1500 4100
Wire Wire Line
	1500 3700 1650 3700
Wire Wire Line
	1650 4100 1500 4100
Connection ~ 1500 4100
Wire Wire Line
	1500 4100 1500 3700
NoConn ~ 1650 1900
Wire Wire Line
	4100 4400 4100 4300
Wire Wire Line
	4100 4300 4200 4300
Wire Wire Line
	4400 4300 4500 4300
Wire Wire Line
	4500 4300 4500 4400
Connection ~ 4500 4300
Wire Wire Line
	4500 4300 4500 4000
Wire Wire Line
	4300 4150 4650 4150
Wire Wire Line
	4500 4000 3850 4000
Connection ~ 4100 4300
Wire Wire Line
	4100 4300 4100 4100
Wire Wire Line
	4100 4100 3850 4100
Wire Wire Line
	3850 3900 4200 3900
Wire Wire Line
	4200 3900 4200 3700
Connection ~ 4200 3900
Wire Wire Line
	4200 3900 4500 3900
Wire Wire Line
	4500 3700 4650 3700
Wire Wire Line
	4650 3700 4650 3550
Wire Wire Line
	14500 1550 14500 1700
Wire Wire Line
	15300 2050 15400 2050
Wire Wire Line
	15400 2050 15400 2000
Wire Wire Line
	15400 2250 15400 2300
Wire Wire Line
	15000 8600 15000 8450
Wire Wire Line
	15450 8450 15450 8600
Wire Wire Line
	3650 8550 4000 8550
Wire Wire Line
	4300 8550 4400 8550
Wire Wire Line
	4400 8550 4400 8700
Wire Wire Line
	3650 8700 4400 8700
Connection ~ 4400 8700
Wire Wire Line
	4400 8700 4450 8700
Wire Wire Line
	3500 9400 3500 9700
Wire Wire Line
	3800 9400 3900 9400
Wire Wire Line
	4300 9400 6150 9400
Wire Wire Line
	6150 9400 6150 8700
Connection ~ 6150 8700
Wire Wire Line
	6150 8700 6450 8700
Wire Wire Line
	3900 8900 3900 9400
Connection ~ 3900 9400
Wire Wire Line
	3900 9400 4000 9400
Wire Wire Line
	3650 8900 3900 8900
Wire Wire Line
	6450 8800 6450 8700
Connection ~ 6450 8700
Wire Wire Line
	6450 8700 6700 8700
Wire Wire Line
	6450 9700 6450 9900
Wire Wire Line
	6450 9100 6450 9400
Wire Wire Line
	1450 9050 1450 9150
Wire Wire Line
	1850 9350 1850 9450
Wire Wire Line
	2900 8850 2800 8850
Wire Wire Line
	2800 8850 2800 8600
Connection ~ 2800 8600
Wire Wire Line
	2800 8600 2900 8600
Wire Wire Line
	15300 2250 15400 2250
$Comp
L formula:TPS560430YF U2
U 1 1 5C75D405
P 3250 8750
F 0 "U2" H 3275 9215 50  0000 C CNN
F 1 "TPS560430YF" H 3275 9124 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 3200 9450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps560430.pdf" H 3250 9300 50  0001 C CNN
F 4 "TPS560430YFDBVR" H 3200 7650 50  0001 C CNN "MPN"
F 5 "TPS560430YFDBVR-ND" H 3250 7750 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 4000 7850 50  0001 C CNN "Purchasing Link"
	1    3250 8750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R2
U 1 1 5DE6EFCB
P 1850 8800
F 0 "R2" H 1920 8846 50  0000 L CNN
F 1 "R_1K" H 1920 8755 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1780 8800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1930 8800 50  0001 C CNN
F 4 "DK" H 1850 8800 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1850 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2330 9200 60  0001 C CNN "PurchasingLink"
	1    1850 8800
	1    0    0    -1  
$EndComp
Text Notes 4400 8550 0    50   ~ 0
Inductor\n
$Comp
L power:GND #PWR?
U 1 1 5F87F709
P 4950 9000
F 0 "#PWR?" H 4950 8750 50  0001 C CNN
F 1 "GND" H 4955 8827 50  0000 C CNN
F 2 "" H 4950 9000 50  0001 C CNN
F 3 "" H 4950 9000 50  0001 C CNN
	1    4950 9000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F87F995
P 5750 9000
F 0 "#PWR?" H 5750 8750 50  0001 C CNN
F 1 "GND" H 5755 8827 50  0000 C CNN
F 2 "" H 5750 9000 50  0001 C CNN
F 3 "" H 5750 9000 50  0001 C CNN
	1    5750 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:L_100uH L1
U 1 1 5F881F17
P 4550 8700
F 0 "L1" H 4550 8800 50  0000 C CNN
F 1 "L_100uH" H 4550 8650 50  0000 C CNN
F 2 "formula:L_100uH" H 4450 8500 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_commercial_decoupling_nlfv32-ef_en.pdf" H 4450 8550 50  0001 C CNN
F 4 "Digikey" H 4650 8500 50  0001 C CNN "MFN"
F 5 "445-15759-1-ND" H 4550 8950 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 4850 8900 50  0001 C CNN "Link"
	1    4550 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  8600 1050 8600
Wire Wire Line
	1350 8600 1450 8600
Connection ~ 1450 8600
Wire Wire Line
	1450 8750 1450 8600
$Comp
L formula:R_120_DNP R11
U 1 1 5FA5AB4A
P 15600 2150
F 0 "R11" H 15670 2196 50  0000 L CNN
F 1 "R_120_DNP" H 15670 2105 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14400 2300 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 14400 2600 50  0001 L CNN
F 4 "DK" H 15600 2150 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 14400 2400 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 14400 2500 60  0001 L CNN "PurchasingLink"
	1    15600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	15400 2000 15600 2000
Connection ~ 15600 2000
Wire Wire Line
	15600 2000 15750 2000
Wire Wire Line
	15400 2300 15600 2300
Connection ~ 15600 2300
Wire Wire Line
	15600 2300 15750 2300
$Comp
L power:+5V #PWR?
U 1 1 5FD33116
P 6700 8250
F 0 "#PWR?" H 6700 8100 50  0001 C CNN
F 1 "+5V" H 6715 8423 50  0000 C CNN
F 2 "" H 6700 8250 50  0001 C CNN
F 3 "" H 6700 8250 50  0001 C CNN
	1    6700 8250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 1000 1050
F 0 "#PWR?" H 1000 900 50  0001 C CNN
F 1 "+5V" H 1015 1223 50  0000 C CNN
F 2 "" H 1000 1050 50  0001 C CNN
F 3 "" H 1000 1050 50  0001 C CNN
	1    1000 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3B2BE
P 14800 1400
F 0 "#PWR?" H 14800 1250 50  0001 C CNN
F 1 "+5V" H 14815 1573 50  0000 C CNN
F 2 "" H 14800 1400 50  0001 C CNN
F 3 "" H 14800 1400 50  0001 C CNN
	1    14800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 15300 3400
F 0 "#PWR?" H 15300 3250 50  0001 C CNN
F 1 "+5V" H 15315 3573 50  0000 C CNN
F 2 "" H 15300 3400 50  0001 C CNN
F 3 "" H 15300 3400 50  0001 C CNN
	1    15300 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 15000 8450
F 0 "#PWR?" H 15000 8300 50  0001 C CNN
F 1 "+5V" H 15015 8623 50  0000 C CNN
F 2 "" H 15000 8450 50  0001 C CNN
F 3 "" H 15000 8450 50  0001 C CNN
	1    15000 8450
	1    0    0    -1  
$EndComp
Text Notes 4100 3250 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 4650 3550
F 0 "#PWR?" H 4650 3400 50  0001 C CNN
F 1 "+5V" H 4665 3723 50  0000 C CNN
F 2 "" H 4650 3550 50  0001 C CNN
F 3 "" H 4650 3550 50  0001 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 8600 2250 8600
Wire Wire Line
	1450 8600 1850 8600
Connection ~ 1850 8600
Wire Wire Line
	1850 8600 1850 8650
Wire Wire Line
	1850 8950 1850 9050
Wire Wire Line
	6700 8700 6700 8650
Wire Wire Line
	6700 8350 6700 8250
Wire Wire Line
	850  8400 850  8600
$Comp
L power:+BATT #PWR?
U 1 1 6160D1CA
P 14550 8450
F 0 "#PWR?" H 14550 8300 50  0001 C CNN
F 1 "+BATT" H 14565 8623 50  0000 C CNN
F 2 "" H 14550 8450 50  0001 C CNN
F 3 "" H 14550 8450 50  0001 C CNN
	1    14550 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 8450 14550 8600
Text Label 3850 1200 0    50   ~ 0
P_LED_1
Text Label 3850 1300 0    50   ~ 0
P_LED_3
Text Label 3850 1500 0    50   ~ 0
P_LED_2
$Comp
L power:PWR_FLAG #FLG?
U 1 1 618699AF
P 14150 8450
F 0 "#FLG?" H 14150 8525 50  0001 C CNN
F 1 "PWR_FLAG" H 14150 8624 50  0000 C CNN
F 2 "" H 14150 8450 50  0001 C CNN
F 3 "~" H 14150 8450 50  0001 C CNN
	1    14150 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 8600 14150 8450
Text Label 14150 8600 0    50   ~ 0
12V
$Comp
L power:PWR_FLAG #FLG?
U 1 1 61875252
P 15850 8600
F 0 "#FLG?" H 15850 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 15850 8774 50  0000 C CNN
F 2 "" H 15850 8600 50  0001 C CNN
F 3 "~" H 15850 8600 50  0001 C CNN
	1    15850 8600
	-1   0    0    1   
$EndComp
Wire Wire Line
	15850 8600 15850 8450
$Comp
L power:+3.3V #PWR?
U 1 1 61879CA9
P 15850 8450
F 0 "#PWR?" H 15850 8300 50  0001 C CNN
F 1 "+3.3V" H 15865 8623 50  0000 C CNN
F 2 "" H 15850 8450 50  0001 C CNN
F 3 "" H 15850 8450 50  0001 C CNN
	1    15850 8450
	1    0    0    -1  
$EndComp
Text Label 850  8400 0    50   ~ 0
12V
Wire Notes Line
	13850 900  13850 2800
Wire Notes Line
	13850 2800 16150 2800
Wire Notes Line
	16150 2800 16150 900 
Wire Notes Line
	16150 900  13850 900 
Wire Notes Line
	13700 900  13700 3850
Connection ~ 13150 2000
Wire Wire Line
	13150 2000 13150 1900
Connection ~ 13150 2100
Wire Wire Line
	13150 2100 13150 2000
Connection ~ 13150 2200
Wire Wire Line
	13150 2200 13150 2100
Connection ~ 13150 2300
Wire Wire Line
	13150 2300 13150 2200
Connection ~ 13150 2400
Wire Wire Line
	13150 2400 13150 2300
Connection ~ 13150 2500
Wire Wire Line
	13150 2500 13150 2400
Connection ~ 13150 2600
Wire Wire Line
	13150 2600 13150 2500
Connection ~ 13150 2700
Wire Wire Line
	13150 2700 13150 2600
Connection ~ 13150 2800
Wire Wire Line
	13150 2800 13150 2700
Connection ~ 13150 2900
Wire Wire Line
	13150 2900 13150 2800
Connection ~ 13150 3000
Wire Wire Line
	13150 3000 13150 2900
Connection ~ 13150 3100
Wire Wire Line
	13150 3100 13150 3000
Connection ~ 13150 3200
Wire Wire Line
	13150 3200 13150 3100
Connection ~ 13150 3300
Wire Wire Line
	13150 3300 13150 3200
Connection ~ 13150 3400
Wire Wire Line
	13150 3400 13150 3300
Wire Wire Line
	13150 3600 13150 3400
$Comp
L power:GND #PWR?
U 1 1 618BABEB
P 13150 3600
F 0 "#PWR?" H 13150 3350 50  0001 C CNN
F 1 "GND" H 13155 3427 50  0000 C CNN
F 2 "" H 13150 3600 50  0001 C CNN
F 3 "" H 13150 3600 50  0001 C CNN
	1    13150 3600
	1    0    0    -1  
$EndComp
Text Label 13150 1800 0    50   ~ 0
CAN_N
Text Label 13150 1700 0    50   ~ 0
CAN_P
Wire Wire Line
	13150 1500 13550 1500
$Comp
L power:GND #PWR?
U 1 1 618AF3B1
P 13550 1500
F 0 "#PWR?" H 13550 1250 50  0001 C CNN
F 1 "GND" H 13555 1327 50  0000 C CNN
F 2 "" H 13550 1500 50  0001 C CNN
F 3 "" H 13550 1500 50  0001 C CNN
	1    13550 1500
	1    0    0    -1  
$EndComp
Text Label 13150 1600 0    50   ~ 0
12V
Text Notes 12550 1150 0    89   ~ 0
CONNECTOR
$Comp
L formula:MM_F_RA_20 J1
U 1 1 618A4BED
P 13000 2600
F 0 "J1" H 12958 3947 60  0000 C CNN
F 1 "MM_F_RA_20" H 12958 3841 60  0000 C CNN
F 2 "footprints:micromatch_female_ra_20" H 12800 3700 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=338070&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=2-338070-0" H 12900 3800 60  0001 C CNN
F 4 "TE" H 13100 4000 60  0001 C CNN "MFN"
F 5 "2-338070-0" H 13200 4100 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-2-338070-0.html" H 13000 3900 60  0001 C CNN "PurchasingLink"
	1    13000 2600
	1    0    0    -1  
$EndComp
Wire Notes Line
	12250 3850 12250 900 
Wire Notes Line
	12250 900  13700 900 
Wire Notes Line
	12250 3850 13700 3850
Wire Notes Line
	750  7700 7350 7700
Wire Notes Line
	7350 7700 7350 10250
Wire Notes Line
	7350 10250 750  10250
Wire Notes Line
	750  10250 750  7700
NoConn ~ 3850 1400
NoConn ~ 3850 1600
NoConn ~ 3850 1700
NoConn ~ 3850 2100
NoConn ~ 3850 2200
NoConn ~ 3850 2500
NoConn ~ 3850 2600
NoConn ~ 3850 2700
NoConn ~ 3850 2800
NoConn ~ 3850 3700
NoConn ~ 3850 3600
NoConn ~ 3850 3000
NoConn ~ 3850 3100
Wire Notes Line
	700  650  700  5250
Wire Notes Line
	700  5250 5350 5250
Wire Notes Line
	5350 5250 5350 650 
Wire Notes Line
	5350 650  700  650 
Wire Notes Line
	5600 2550 5600 650 
Wire Notes Line
	8750 2550 5600 2550
Wire Notes Line
	8750 650  8750 2550
Wire Notes Line
	5600 650  8750 650 
Text Notes 5950 850  0    89   ~ 0
DEBUGGING LEDS & TEST POINTS
Text Label 7800 1800 2    50   ~ 0
12V
$Comp
L power:+5V #PWR?
U 1 1 61862B19
P 7800 1550
F 0 "#PWR?" H 7800 1400 50  0001 C CNN
F 1 "+5V" H 7815 1723 50  0000 C CNN
F 2 "" H 7800 1550 50  0001 C CNN
F 3 "" H 7800 1550 50  0001 C CNN
	1    7800 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61860130
P 7800 2050
F 0 "#PWR?" H 7800 1800 50  0001 C CNN
F 1 "GND" H 7805 1877 50  0000 C CNN
F 2 "" H 7800 2050 50  0001 C CNN
F 3 "" H 7800 2050 50  0001 C CNN
	1    7800 2050
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP6
U 1 1 6185F968
P 7850 2050
F 0 "TP6" V 7799 2228 50  0000 L CNN
F 1 "Test_Point_SMD" V 7890 2228 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7850 1900 50  0001 C CNN
F 3 "" H 7850 2050 50  0001 C CNN
	1    7850 2050
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP5
U 1 1 6185F601
P 7850 1800
F 0 "TP5" V 7799 1978 50  0000 L CNN
F 1 "Test_Point_SMD" V 7890 1978 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7850 1650 50  0001 C CNN
F 3 "" H 7850 1800 50  0001 C CNN
	1    7850 1800
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP4
U 1 1 6185F040
P 7850 1550
F 0 "TP4" V 7799 1728 50  0000 L CNN
F 1 "Test_Point_SMD" V 7890 1728 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7850 1400 50  0001 C CNN
F 3 "" H 7850 1550 50  0001 C CNN
	1    7850 1550
	0    1    1    0   
$EndComp
Text Label 6000 2250 2    50   ~ 0
P_LED_3
Text Label 6000 1800 2    50   ~ 0
P_LED_2
Wire Wire Line
	7200 2250 7400 2250
Wire Wire Line
	6800 2250 6900 2250
Connection ~ 6350 2250
Wire Wire Line
	6350 2250 6500 2250
Wire Wire Line
	6000 2250 6350 2250
$Comp
L power:GND #PWR?
U 1 1 61855754
P 7400 2250
F 0 "#PWR?" H 7400 2000 50  0001 C CNN
F 1 "GND" H 7405 2077 50  0000 C CNN
F 2 "" H 7400 2250 50  0001 C CNN
F 3 "" H 7400 2250 50  0001 C CNN
	1    7400 2250
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D6
U 1 1 6185574E
P 7050 2250
F 0 "D6" H 7043 1995 50  0000 C CNN
F 1 "LED_0805" H 7043 2086 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 6950 2250 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7050 2350 50  0001 C CNN
F 4 "DK" H 7050 2250 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7050 2250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7450 2750 60  0001 C CNN "PurchasingLink"
	1    7050 2250
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R9
U 1 1 61855745
P 6650 2250
F 0 "R9" V 6443 2250 50  0000 C CNN
F 1 "R_200" V 6534 2250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6580 2250 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6730 2250 50  0001 C CNN
F 4 "DK" H 6650 2250 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6650 2250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7130 2650 60  0001 C CNN "PurchasingLink"
	1    6650 2250
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 6185573C
P 6350 2200
F 0 "TP3" H 6150 2300 50  0000 L CNN
F 1 "Test_Point_SMD" H 6050 2000 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6350 2050 50  0001 C CNN
F 3 "" H 6350 2200 50  0001 C CNN
	1    6350 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1800 7400 1800
Wire Wire Line
	6800 1800 6900 1800
Connection ~ 6350 1800
Wire Wire Line
	6350 1800 6500 1800
Wire Wire Line
	6000 1800 6350 1800
$Comp
L power:GND #PWR?
U 1 1 61852A77
P 7400 1800
F 0 "#PWR?" H 7400 1550 50  0001 C CNN
F 1 "GND" H 7405 1627 50  0000 C CNN
F 2 "" H 7400 1800 50  0001 C CNN
F 3 "" H 7400 1800 50  0001 C CNN
	1    7400 1800
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D5
U 1 1 61852A71
P 7050 1800
F 0 "D5" H 7043 1545 50  0000 C CNN
F 1 "LED_0805" H 7043 1636 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 6950 1800 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7050 1900 50  0001 C CNN
F 4 "DK" H 7050 1800 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7050 1800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7450 2300 60  0001 C CNN "PurchasingLink"
	1    7050 1800
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R8
U 1 1 61852A68
P 6650 1800
F 0 "R8" V 6443 1800 50  0000 C CNN
F 1 "R_200" V 6534 1800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6580 1800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6730 1800 50  0001 C CNN
F 4 "DK" H 6650 1800 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6650 1800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7130 2200 60  0001 C CNN "PurchasingLink"
	1    6650 1800
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP2
U 1 1 61852A5F
P 6350 1750
F 0 "TP2" H 6150 1850 50  0000 L CNN
F 1 "Test_Point_SMD" H 6050 1550 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6350 1600 50  0001 C CNN
F 3 "" H 6350 1750 50  0001 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1300 7400 1300
Wire Wire Line
	6800 1300 6900 1300
Connection ~ 6350 1300
Wire Wire Line
	6350 1300 6500 1300
Wire Wire Line
	6000 1300 6350 1300
Text Label 6000 1300 2    50   ~ 0
P_LED_1
$Comp
L power:GND #PWR?
U 1 1 6183D47F
P 7400 1300
F 0 "#PWR?" H 7400 1050 50  0001 C CNN
F 1 "GND" H 7405 1127 50  0000 C CNN
F 2 "" H 7400 1300 50  0001 C CNN
F 3 "" H 7400 1300 50  0001 C CNN
	1    7400 1300
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D4
U 1 1 6183ABAD
P 7050 1300
F 0 "D4" H 7043 1045 50  0000 C CNN
F 1 "LED_0805" H 7043 1136 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 6950 1300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7050 1400 50  0001 C CNN
F 4 "DK" H 7050 1300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7050 1300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7450 1800 60  0001 C CNN "PurchasingLink"
	1    7050 1300
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R7
U 1 1 618378C8
P 6650 1300
F 0 "R7" V 6443 1300 50  0000 C CNN
F 1 "R_200" V 6534 1300 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6580 1300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6730 1300 50  0001 C CNN
F 4 "DK" H 6650 1300 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6650 1300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7130 1700 60  0001 C CNN "PurchasingLink"
	1    6650 1300
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP1
U 1 1 61836793
P 6350 1250
F 0 "TP1" H 6150 1350 50  0000 L CNN
F 1 "Test_Point_SMD" H 6050 1050 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6350 1100 50  0001 C CNN
F 3 "" H 6350 1250 50  0001 C CNN
	1    6350 1250
	1    0    0    -1  
$EndComp
Wire Notes Line
	13900 2900 13900 3950
Wire Notes Line
	13900 3950 16100 3950
Wire Notes Line
	16100 3950 16100 2900
Wire Notes Line
	16100 2900 13900 2900
$EndSCHEMATC
