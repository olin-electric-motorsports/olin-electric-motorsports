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
L formula:R_100K R6
U 1 1 5BEE2A52
P 4150 9400
F 0 "R6" V 4250 9350 50  0000 L CNN
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
L formula:R_25K R5
U 1 1 5C0B315C
P 3650 9400
F 0 "R5" V 3750 9350 50  0000 L CNN
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
L formula:R_0_2512 R12
U 1 1 5C0C29A9
P 6700 8500
F 0 "R12" V 6500 8500 50  0000 C CNN
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
L formula:R_200 R8
U 1 1 5C0C44F9
P 6450 8950
F 0 "R8" H 6520 8996 50  0000 L CNN
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
P 2800 3000
F 0 "U1" H 3700 4860 50  0000 C CNN
F 1 "ATMEGA16M1" H 2100 4850 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2800 3000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1850 4830 50  0001 C CNN
F 4 "DK" H 2800 3000 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2800 3000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2250 5230 60  0001 C CNN "PurchasingLink"
	1    2800 3000
	1    0    0    -1  
$EndComp
Text Label 3900 2400 0    50   ~ 0
CAN_TX
Text Label 3900 2500 0    50   ~ 0
CAN_RX
Text Label 3900 3300 0    50   ~ 0
MISO
Text Label 3900 3400 0    50   ~ 0
MOSI
Text Label 3900 3500 0    50   ~ 0
SCK
Text Label 4550 4000 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1400 1450
F 0 "R1" V 1300 1400 50  0000 L CNN
F 1 "R_100" V 1490 1330 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 600 1600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1100 1950 50  0001 C CNN
F 4 "DK" H 1400 1450 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 750 1700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1880 1850 60  0001 C CNN "PurchasingLink"
	1    1400 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1300 1400 1300
Connection ~ 1400 1300
Wire Wire Line
	1400 1300 1700 1300
$Comp
L formula:C_100pF C2
U 1 1 5D58E505
P 1400 1750
F 0 "C2" V 1450 1600 50  0000 L CNN
F 1 "C_100pF" V 1250 1570 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1438 1600 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1425 1850 50  0001 C CNN
F 4 "DK" H 1400 1750 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1400 1750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1825 2250 60  0001 C CNN "PurchasingLink"
	1    1400 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 1050 1600
F 0 "#PWR?" H 1050 1350 50  0001 C CNN
F 1 "GND" H 1055 1427 50  0000 C CNN
F 2 "" H 1050 1600 50  0001 C CNN
F 3 "" H 1050 1600 50  0001 C CNN
	1    1050 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1400 1900
F 0 "#PWR?" H 1400 1650 50  0001 C CNN
F 1 "GND" H 1405 1727 50  0000 C CNN
F 2 "" H 1400 1900 50  0001 C CNN
F 3 "" H 1400 1900 50  0001 C CNN
	1    1400 1900
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4350 4400
F 0 "Y1" H 4060 4470 50  0000 L CNN
F 1 "Crystal_SMD" H 3670 4400 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4300 4475 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4400 4575 50  0001 C CNN
F 4 "DK" H 4350 4400 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4350 4400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4800 4975 60  0001 C CNN "PurchasingLink"
	1    4350 4400
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB5B2
P 4150 4650
F 0 "C5" H 4040 4730 50  0000 L CNN
F 1 "C_30pF" H 3880 4570 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4188 4500 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4175 4750 50  0001 C CNN
F 4 "DK" H 4150 4650 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4150 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4575 5150 60  0001 C CNN "PurchasingLink"
	1    4150 4650
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C7
U 1 1 5D5EB694
P 4550 4650
F 0 "C7" H 4570 4730 50  0000 L CNN
F 1 "C_30pF" H 4580 4550 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4588 4500 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4575 4750 50  0001 C CNN
F 4 "DK" H 4550 4650 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4550 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4975 5150 60  0001 C CNN "PurchasingLink"
	1    4550 4650
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R7
U 1 1 5D5EB7F3
P 4400 3800
F 0 "R7" V 4320 3800 50  0000 C CNN
F 1 "R_10K" V 4450 4050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4330 3800 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4480 3800 50  0001 C CNN
F 4 "DK" H 4400 3800 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4400 3800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4880 4200 60  0001 C CNN "PurchasingLink"
	1    4400 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 4150 4800
F 0 "#PWR?" H 4150 4550 50  0001 C CNN
F 1 "GND" H 4155 4627 50  0000 C CNN
F 2 "" H 4150 4800 50  0001 C CNN
F 3 "" H 4150 4800 50  0001 C CNN
	1    4150 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4550 4800
F 0 "#PWR?" H 4550 4550 50  0001 C CNN
F 1 "GND" H 4555 4627 50  0000 C CNN
F 2 "" H 4550 4800 50  0001 C CNN
F 3 "" H 4550 4800 50  0001 C CNN
	1    4550 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4350 4550
F 0 "#PWR?" H 4350 4300 50  0001 C CNN
F 1 "GND" H 4355 4377 50  0000 C CNN
F 2 "" H 4350 4550 50  0001 C CNN
F 3 "" H 4350 4550 50  0001 C CNN
	1    4350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4700 4250
F 0 "#PWR?" H 4700 4000 50  0001 C CNN
F 1 "GND" H 4705 4077 50  0000 C CNN
F 2 "" H 4700 4250 50  0001 C CNN
F 3 "" H 4700 4250 50  0001 C CNN
	1    4700 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1550 4350
F 0 "#PWR?" H 1550 4100 50  0001 C CNN
F 1 "GND" H 1555 4177 50  0000 C CNN
F 2 "" H 1550 4350 50  0001 C CNN
F 3 "" H 1550 4350 50  0001 C CNN
	1    1550 4350
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
F 0 "C8" V 14500 1550 50  0000 C CNN
F 1 "C_0.1uF" V 14600 1350 50  0000 C CNN
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
Text Notes 2500 1100 0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3800 5200 0    89   ~ 0
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
L formula:CONN_02X03 J3
U 1 1 5D628C9D
P 15050 3500
F 0 "J3" H 15050 3710 50  0000 C CNN
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
Connection ~ 1400 1600
Wire Wire Line
	1700 1600 1400 1600
$Comp
L formula:C_0.1uF C1
U 1 1 5D58E34B
P 1050 1450
F 0 "C1" V 1100 1310 50  0000 L CNN
F 1 "C_0.1uF" V 910 1290 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1088 1300 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1075 1550 50  0001 C CNN
F 4 "DK" H 1050 1450 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1050 1450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1475 1950 60  0001 C CNN "PurchasingLink"
	1    1050 1450
	1    0    0    -1  
$EndComp
Connection ~ 1050 1300
Wire Wire Line
	1050 1150 1050 1300
Wire Wire Line
	1550 4350 1550 4200
Wire Wire Line
	1550 3800 1700 3800
Wire Wire Line
	1700 4200 1550 4200
Connection ~ 1550 4200
Wire Wire Line
	1550 4200 1550 3800
NoConn ~ 1700 2000
Wire Wire Line
	4150 4500 4150 4400
Wire Wire Line
	4150 4400 4250 4400
Wire Wire Line
	4450 4400 4550 4400
Wire Wire Line
	4550 4400 4550 4500
Connection ~ 4550 4400
Wire Wire Line
	4550 4400 4550 4100
Wire Wire Line
	4350 4250 4700 4250
Wire Wire Line
	4550 4100 3900 4100
Connection ~ 4150 4400
Wire Wire Line
	4150 4400 4150 4200
Wire Wire Line
	4150 4200 3900 4200
Wire Wire Line
	3900 4000 4250 4000
Wire Wire Line
	4250 4000 4250 3800
Connection ~ 4250 4000
Wire Wire Line
	4250 4000 4550 4000
Wire Wire Line
	4550 3800 4700 3800
Wire Wire Line
	4700 3800 4700 3650
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
L formula:R_1K R3
U 1 1 5DE6EFCB
P 1850 8800
F 0 "R3" H 1920 8846 50  0000 L CNN
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
L formula:R_120_DNP R13
U 1 1 5FA5AB4A
P 15600 2150
F 0 "R13" H 15670 2196 50  0000 L CNN
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
P 1050 1150
F 0 "#PWR?" H 1050 1000 50  0001 C CNN
F 1 "+5V" H 1065 1323 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "" H 1050 1150 50  0001 C CNN
	1    1050 1150
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
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 4700 3650
F 0 "#PWR?" H 4700 3500 50  0001 C CNN
F 1 "+5V" H 4715 3823 50  0000 C CNN
F 2 "" H 4700 3650 50  0001 C CNN
F 3 "" H 4700 3650 50  0001 C CNN
	1    4700 3650
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
Text Label 3900 1300 0    50   ~ 0
P_LED_1
Text Label 3900 1400 0    50   ~ 0
P_LED_3
Text Label 3900 1600 0    50   ~ 0
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
NoConn ~ 3900 1500
NoConn ~ 3900 1700
NoConn ~ 3900 1800
NoConn ~ 3900 2200
NoConn ~ 3900 2300
NoConn ~ 3900 2600
NoConn ~ 3900 2700
NoConn ~ 3900 2800
NoConn ~ 3900 2900
NoConn ~ 3900 3800
NoConn ~ 3900 3700
NoConn ~ 3900 3100
NoConn ~ 3900 3200
Wire Notes Line
	5400 750  750  750 
Wire Notes Line
	5650 2650 5650 750 
Wire Notes Line
	8800 2650 5650 2650
Wire Notes Line
	8800 750  8800 2650
Wire Notes Line
	5650 750  8800 750 
Text Notes 6000 950  0    89   ~ 0
DEBUGGING LEDS & TEST POINTS
Text Label 7850 1900 2    50   ~ 0
12V
$Comp
L power:+5V #PWR?
U 1 1 61862B19
P 7850 1650
F 0 "#PWR?" H 7850 1500 50  0001 C CNN
F 1 "+5V" H 7865 1823 50  0000 C CNN
F 2 "" H 7850 1650 50  0001 C CNN
F 3 "" H 7850 1650 50  0001 C CNN
	1    7850 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61860130
P 7850 2150
F 0 "#PWR?" H 7850 1900 50  0001 C CNN
F 1 "GND" H 7855 1977 50  0000 C CNN
F 2 "" H 7850 2150 50  0001 C CNN
F 3 "" H 7850 2150 50  0001 C CNN
	1    7850 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP6
U 1 1 6185F968
P 7900 2150
F 0 "TP6" V 7849 2328 50  0000 L CNN
F 1 "Test_Point_SMD" V 7940 2328 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7900 2000 50  0001 C CNN
F 3 "" H 7900 2150 50  0001 C CNN
	1    7900 2150
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP5
U 1 1 6185F601
P 7900 1900
F 0 "TP5" V 7849 2078 50  0000 L CNN
F 1 "Test_Point_SMD" V 7940 2078 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7900 1750 50  0001 C CNN
F 3 "" H 7900 1900 50  0001 C CNN
	1    7900 1900
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP4
U 1 1 6185F040
P 7900 1650
F 0 "TP4" V 7849 1828 50  0000 L CNN
F 1 "Test_Point_SMD" V 7940 1828 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 7900 1500 50  0001 C CNN
F 3 "" H 7900 1650 50  0001 C CNN
	1    7900 1650
	0    1    1    0   
$EndComp
Text Label 6050 2350 2    50   ~ 0
P_LED_3
Text Label 6050 1900 2    50   ~ 0
P_LED_2
Wire Wire Line
	7250 2350 7450 2350
Wire Wire Line
	6850 2350 6950 2350
Connection ~ 6400 2350
Wire Wire Line
	6400 2350 6550 2350
Wire Wire Line
	6050 2350 6400 2350
$Comp
L power:GND #PWR?
U 1 1 61855754
P 7450 2350
F 0 "#PWR?" H 7450 2100 50  0001 C CNN
F 1 "GND" H 7455 2177 50  0000 C CNN
F 2 "" H 7450 2350 50  0001 C CNN
F 3 "" H 7450 2350 50  0001 C CNN
	1    7450 2350
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D6
U 1 1 6185574E
P 7100 2350
F 0 "D6" H 7093 2095 50  0000 C CNN
F 1 "LED_0805" H 7093 2186 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 7000 2350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7100 2450 50  0001 C CNN
F 4 "DK" H 7100 2350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7100 2350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7500 2850 60  0001 C CNN "PurchasingLink"
	1    7100 2350
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R11
U 1 1 61855745
P 6700 2350
F 0 "R11" V 6493 2350 50  0000 C CNN
F 1 "R_200" V 6584 2350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6630 2350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6780 2350 50  0001 C CNN
F 4 "DK" H 6700 2350 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6700 2350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7180 2750 60  0001 C CNN "PurchasingLink"
	1    6700 2350
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 6185573C
P 6400 2300
F 0 "TP3" H 6200 2400 50  0000 L CNN
F 1 "Test_Point_SMD" H 6100 2100 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6400 2150 50  0001 C CNN
F 3 "" H 6400 2300 50  0001 C CNN
	1    6400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1900 7450 1900
Wire Wire Line
	6850 1900 6950 1900
Connection ~ 6400 1900
Wire Wire Line
	6400 1900 6550 1900
Wire Wire Line
	6050 1900 6400 1900
$Comp
L power:GND #PWR?
U 1 1 61852A77
P 7450 1900
F 0 "#PWR?" H 7450 1650 50  0001 C CNN
F 1 "GND" H 7455 1727 50  0000 C CNN
F 2 "" H 7450 1900 50  0001 C CNN
F 3 "" H 7450 1900 50  0001 C CNN
	1    7450 1900
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D5
U 1 1 61852A71
P 7100 1900
F 0 "D5" H 7093 1645 50  0000 C CNN
F 1 "LED_0805" H 7093 1736 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 7000 1900 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7100 2000 50  0001 C CNN
F 4 "DK" H 7100 1900 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7100 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7500 2400 60  0001 C CNN "PurchasingLink"
	1    7100 1900
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R10
U 1 1 61852A68
P 6700 1900
F 0 "R10" V 6493 1900 50  0000 C CNN
F 1 "R_200" V 6584 1900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6630 1900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6780 1900 50  0001 C CNN
F 4 "DK" H 6700 1900 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6700 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7180 2300 60  0001 C CNN "PurchasingLink"
	1    6700 1900
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP2
U 1 1 61852A5F
P 6400 1850
F 0 "TP2" H 6200 1950 50  0000 L CNN
F 1 "Test_Point_SMD" H 6100 1650 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6400 1700 50  0001 C CNN
F 3 "" H 6400 1850 50  0001 C CNN
	1    6400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1400 7450 1400
Wire Wire Line
	6850 1400 6950 1400
Connection ~ 6400 1400
Wire Wire Line
	6400 1400 6550 1400
Wire Wire Line
	6050 1400 6400 1400
Text Label 6050 1400 2    50   ~ 0
P_LED_1
$Comp
L power:GND #PWR?
U 1 1 6183D47F
P 7450 1400
F 0 "#PWR?" H 7450 1150 50  0001 C CNN
F 1 "GND" H 7455 1227 50  0000 C CNN
F 2 "" H 7450 1400 50  0001 C CNN
F 3 "" H 7450 1400 50  0001 C CNN
	1    7450 1400
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D4
U 1 1 6183ABAD
P 7100 1400
F 0 "D4" H 7093 1145 50  0000 C CNN
F 1 "LED_0805" H 7093 1236 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 7000 1400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7100 1500 50  0001 C CNN
F 4 "DK" H 7100 1400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7100 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7500 1900 60  0001 C CNN "PurchasingLink"
	1    7100 1400
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R9
U 1 1 618378C8
P 6700 1400
F 0 "R9" V 6493 1400 50  0000 C CNN
F 1 "R_200" V 6584 1400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6630 1400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6780 1400 50  0001 C CNN
F 4 "DK" H 6700 1400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6700 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7180 1800 60  0001 C CNN "PurchasingLink"
	1    6700 1400
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP1
U 1 1 61836793
P 6400 1350
F 0 "TP1" H 6200 1450 50  0000 L CNN
F 1 "Test_Point_SMD" H 6100 1150 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6400 1200 50  0001 C CNN
F 3 "" H 6400 1350 50  0001 C CNN
	1    6400 1350
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
$Comp
L power:+3V3 #PWR?
U 1 1 618BCF0B
P 15850 8450
F 0 "#PWR?" H 15850 8300 50  0001 C CNN
F 1 "+3V3" H 15865 8623 50  0000 C CNN
F 2 "" H 15850 8450 50  0001 C CNN
F 3 "" H 15850 8450 50  0001 C CNN
	1    15850 8450
	1    0    0    -1  
$EndComp
Wire Notes Line
	5400 5750 750  5750
Wire Notes Line
	750  750  750  5750
Wire Notes Line
	5400 750  5400 5750
$Comp
L formula:SM06B-GHS-TB(LF)(SN) J2
U 1 1 618AE836
P 14650 5050
F 0 "J2" H 14543 4383 50  0000 C CNN
F 1 "SM06B-GHS-TB(LF)(SN)" H 14543 4474 50  0000 C CNN
F 2 "footprints:JST_SM06B-GHS-TB(LF)(SN)" H 14900 4850 50  0001 L BNN
F 3 "https://www.jst-mfg.com/product/pdf/eng/eGH.pdf" H 14650 5050 50  0001 L BNN
F 4 "JST" H 14900 4950 50  0001 L BNN "MANUFACTURER"
F 5 "4.25mm" H 14900 4650 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "Manufacturer Recommendations" H 14900 4750 50  0001 L BNN "STANDARD"
F 7 "N/A" H 15250 4650 50  0001 L BNN "PARTREV"
	1    14650 5050
	-1   0    0    1   
$EndComp
Text Notes 14000 4300 0    89   ~ 0
JST GH 6-PIN CONNECTOR
$Comp
L power:+5V #PWR?
U 1 1 618D6C8C
P 15400 4850
F 0 "#PWR?" H 15400 4700 50  0001 C CNN
F 1 "+5V" H 15415 5023 50  0000 C CNN
F 2 "" H 15400 4850 50  0001 C CNN
F 3 "" H 15400 4850 50  0001 C CNN
	1    15400 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618EACA8
P 15400 5350
F 0 "#PWR?" H 15400 5100 50  0001 C CNN
F 1 "GND" H 15405 5177 50  0000 C CNN
F 2 "" H 15400 5350 50  0001 C CNN
F 3 "" H 15400 5350 50  0001 C CNN
	1    15400 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	15050 4850 15400 4850
Wire Wire Line
	15050 5350 15400 5350
Text Notes 15300 4950 0    50   ~ 0
RTS
Text Notes 15300 5050 0    50   ~ 0
CTS
Text Notes 15300 5150 0    50   ~ 0
TX
Text Notes 15300 5250 0    50   ~ 0
RX
Text Label 3900 3600 0    50   ~ 0
CS
Text Notes 4150 3350 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
Text Notes 1400 4900 0    50   ~ 0
Pinout to RXD and TXD for Radio\n
Wire Wire Line
	2100 5300 2650 5300
Wire Wire Line
	1250 5300 1800 5300
Wire Wire Line
	1700 5200 2650 5200
$Comp
L formula:R_499 R4
U 1 1 61A8E5C6
P 1950 5300
F 0 "R4" V 1700 5300 50  0000 C CNN
F 1 "R_499" V 1800 5300 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1880 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2030 5300 50  0001 C CNN
F 4 "DK" H 1950 5300 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 1950 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 2430 5700 60  0001 C CNN "PurchasingLink"
	1    1950 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 5200 1400 5200
$Comp
L formula:R_499 R2
U 1 1 61A8D0CC
P 1550 5200
F 0 "R2" V 1343 5200 50  0000 C CNN
F 1 "R_499" V 1434 5200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1480 5200 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 1630 5200 50  0001 C CNN
F 4 "DK" H 1550 5200 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 1550 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 2030 5600 60  0001 C CNN "PurchasingLink"
	1    1550 5200
	0    1    1    0   
$EndComp
Text Notes 1450 5600 0    50   ~ 0
(recalculate resistances later)
Text Label 15050 4950 0    50   ~ 0
RTS
Text Label 15050 5050 0    50   ~ 0
CTS
Text Label 3900 1900 0    50   ~ 0
RTS
Text Label 3900 2000 0    50   ~ 0
CTS
Text Label 2650 5300 0    50   ~ 0
RXD
Text Label 1250 5300 2    50   ~ 0
SCK
Text Label 1250 5200 2    50   ~ 0
MOSI
Text Label 2650 5200 0    50   ~ 0
TXD
Wire Notes Line
	1000 4800 2850 4800
Wire Notes Line
	2850 4800 2850 5450
Wire Notes Line
	2850 5450 1000 5450
Wire Notes Line
	1000 5450 1000 4800
Text Label 15050 5150 0    50   ~ 0
TXD
Text Label 15050 5250 0    50   ~ 0
RXD
Wire Notes Line
	13850 4100 16100 4100
Wire Notes Line
	16100 4100 16100 5700
Wire Notes Line
	16100 5700 13850 5700
Wire Notes Line
	13850 5700 13850 4100
Wire Notes Line
	12000 4750 9800 4750
Wire Notes Line
	12000 6150 12000 4750
Wire Notes Line
	9800 6150 12000 6150
Wire Notes Line
	9800 4750 9800 6150
Wire Notes Line
	6500 7250 6500 4750
Wire Notes Line
	9650 7250 6500 7250
Wire Notes Line
	9650 4750 9650 7250
Wire Notes Line
	6500 4750 9650 4750
Wire Wire Line
	10500 5450 10500 5250
Wire Wire Line
	10500 5450 10500 5550
Connection ~ 10500 5450
Wire Wire Line
	10650 5450 10500 5450
Wire Wire Line
	11400 5450 11400 5250
Wire Wire Line
	11250 5450 11400 5450
Connection ~ 11400 5450
Wire Wire Line
	11400 5550 11400 5450
Wire Wire Line
	10950 5750 10950 5850
Wire Wire Line
	11400 5850 10950 5850
Connection ~ 10950 5850
Wire Wire Line
	10500 5850 10950 5850
$Comp
L power:+3V3 #PWR?
U 1 1 61952FDC
P 11400 5250
F 0 "#PWR?" H 11400 5100 50  0001 C CNN
F 1 "+3V3" H 11415 5423 50  0000 C CNN
F 2 "" H 11400 5250 50  0001 C CNN
F 3 "" H 11400 5250 50  0001 C CNN
	1    11400 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61951B74
P 10500 5250
F 0 "#PWR?" H 10500 5100 50  0001 C CNN
F 1 "+5V" H 10515 5423 50  0000 C CNN
F 2 "" H 10500 5250 50  0001 C CNN
F 3 "" H 10500 5250 50  0001 C CNN
	1    10500 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6194DE21
P 10950 5850
F 0 "#PWR?" H 10950 5600 50  0001 C CNN
F 1 "GND" H 10955 5677 50  0000 C CNN
F 2 "" H 10950 5850 50  0001 C CNN
F 3 "" H 10950 5850 50  0001 C CNN
	1    10950 5850
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C11
U 1 1 6193D5A8
P 11400 5700
F 0 "C11" H 11100 5750 50  0000 L CNN
F 1 "C_0.1uF" H 10950 5650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 11438 5550 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 11425 5800 50  0001 C CNN
F 4 "DK" H 11400 5700 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 11400 5700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 11825 6200 60  0001 C CNN "PurchasingLink"
	1    11400 5700
	-1   0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C10
U 1 1 6193CC13
P 10500 5700
F 0 "C10" H 10650 5750 50  0000 L CNN
F 1 "C_0.1uF" H 10650 5650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10538 5550 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 10525 5800 50  0001 C CNN
F 4 "DK" H 10500 5700 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 10500 5700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 10925 6200 60  0001 C CNN "PurchasingLink"
	1    10500 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9050 5650 9050 5700
$Comp
L power:GND #PWR?
U 1 1 61933B6D
P 9050 5700
F 0 "#PWR?" H 9050 5450 50  0001 C CNN
F 1 "GND" H 9055 5527 50  0000 C CNN
F 2 "" H 9050 5700 50  0001 C CNN
F 3 "" H 9050 5700 50  0001 C CNN
	1    9050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5450 8150 5350
Wire Wire Line
	9050 5350 8150 5350
Wire Wire Line
	7950 5350 7050 5350
Wire Wire Line
	7950 5450 7950 5350
Wire Wire Line
	7650 5650 7450 5650
Text Notes 9950 4950 0    89   ~ 0
LINEAR VOLTAGE REGULATOR
$Comp
L Regulator_Linear:LM3480-3.3 U4
U 1 1 618D2CBA
P 10950 5450
F 0 "U4" H 10950 5692 50  0000 C CNN
F 1 "LM3480-3.3" H 10950 5601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10950 5675 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 10950 5450 50  0001 C CNN
	1    10950 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 618C230E
P 7050 5350
F 0 "#PWR?" H 7050 5200 50  0001 C CNN
F 1 "+3V3" H 7065 5523 50  0000 C CNN
F 2 "" H 7050 5350 50  0001 C CNN
F 3 "" H 7050 5350 50  0001 C CNN
	1    7050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 618BF3B1
P 7450 5650
F 0 "#PWR?" H 7450 5500 50  0001 C CNN
F 1 "+3V3" H 7465 5823 50  0000 C CNN
F 2 "" H 7450 5650 50  0001 C CNN
F 3 "" H 7450 5650 50  0001 C CNN
	1    7450 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5650 7050 5700
Connection ~ 7050 5350
$Comp
L formula:C_0.1uF C8
U 1 1 617EBFF4
P 7050 5500
F 0 "C8" H 6850 5550 50  0000 L CNN
F 1 "C_0.1uF" H 6650 5450 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7088 5350 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7075 5600 50  0001 C CNN
F 4 "DK" H 7050 5500 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7050 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7475 6000 60  0001 C CNN "PurchasingLink"
	1    7050 5500
	1    0    0    1   
$EndComp
$Comp
L formula:C_0.1uF C9
U 1 1 617EB4B5
P 9050 5500
F 0 "C9" H 9165 5546 50  0000 L CNN
F 1 "C_0.1uF" H 9165 5455 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9088 5350 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9075 5600 50  0001 C CNN
F 4 "DK" H 9050 5500 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 9050 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9475 6000 60  0001 C CNN "PurchasingLink"
	1    9050 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 617EA675
P 7050 5700
F 0 "#PWR?" H 7050 5450 50  0001 C CNN
F 1 "GND" H 7055 5527 50  0000 C CNN
F 2 "" H 7050 5700 50  0001 C CNN
F 3 "" H 7050 5700 50  0001 C CNN
	1    7050 5700
	1    0    0    -1  
$EndComp
Connection ~ 9050 5350
$Comp
L power:+5V #PWR?
U 1 1 617E5864
P 9050 5350
F 0 "#PWR?" H 9050 5200 50  0001 C CNN
F 1 "+5V" H 9065 5523 50  0000 C CNN
F 2 "" H 9050 5350 50  0001 C CNN
F 3 "" H 9050 5350 50  0001 C CNN
	1    9050 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 6850 8050 6950
$Comp
L power:GND #PWR?
U 1 1 617D3F9B
P 8050 6950
F 0 "#PWR?" H 8050 6700 50  0001 C CNN
F 1 "GND" H 8055 6777 50  0000 C CNN
F 2 "" H 8050 6950 50  0001 C CNN
F 3 "" H 8050 6950 50  0001 C CNN
	1    8050 6950
	1    0    0    -1  
$EndComp
Text Notes 7000 4950 0    89   ~ 0
4-BIT 5V-3V3 LEVEL SHIFTER
$Comp
L Logic_LevelTranslator:TXB0104PW U3
U 1 1 617BA7D9
P 8050 6150
F 0 "U3" H 8050 7200 50  0000 C CNN
F 1 "TXB0104PW" H 8050 7100 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8050 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 8160 6245 50  0001 C CNN
	1    8050 6150
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP79511-I_MS U?
U 1 1 619A9C99
P 6850 3650
F 0 "U?" H 7950 4039 60  0000 C CNN
F 1 "MCP79511-I_MS" H 7950 3933 60  0000 C CNN
F 2 "footprints:MCP79511-I&slashMS" H 7950 3900 60  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/MCP7951X-MCP7952X-Battery-Backed-SPI-RTCC-20002300C.pdf" H 7350 3650 60  0001 C CNN
F 4 "https://www.digikey.com/short/8h8hqbn4" H 7950 3000 50  0001 C CNN "PurchasingLink"
	1    6850 3650
	1    0    0    -1  
$EndComp
Text Notes 7300 3000 0    89   ~ 0
REAL-TIME CLOCK
$Comp
L power:+3V3 #PWR?
U 1 1 61A05BE5
P 8550 3500
F 0 "#PWR?" H 8550 3350 50  0001 C CNN
F 1 "+3V3" H 8565 3673 50  0000 C CNN
F 2 "" H 8550 3500 50  0001 C CNN
F 3 "" H 8550 3500 50  0001 C CNN
	1    8550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3650 8550 3500
$Comp
L formula:Crystal_32_768kHz Y?
U 1 1 61A94C98
P 6800 3700
F 0 "Y?" V 6800 3500 50  0000 L CNN
F 1 "Crystal_32_768kHz" V 6500 3350 50  0000 L CNN
F 2 "footprints:Crystal_32_768kHZ" H 6500 4000 50  0001 L BNN
F 3 "https://www.jauch.com/downloadfile/57fde22d50dbf_d3c203011c87952f2834/jtx310-auto-2-210512.pdf" H 6800 3700 50  0001 L BNN
F 4 "https://www.digikey.com/short/3nzmt0hf" H 6750 3500 50  0001 C CNN "PurchasingLink"
F 5 "Jauch Quartz" H 6500 3400 50  0001 L BNN "MANUFACTURER"
	1    6800 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 3650 6950 3650
Wire Wire Line
	6950 3650 6950 3500
Wire Wire Line
	6950 3500 6800 3500
Wire Wire Line
	7350 3750 6950 3750
Wire Wire Line
	6950 3750 6950 3900
Wire Wire Line
	6950 3900 6800 3900
Text Notes 6100 4300 0    89   ~ 0
32.768 kHz CRYSTAL\n
Wire Notes Line
	8900 2750 8900 4500
Wire Notes Line
	8900 4500 5650 4500
Wire Notes Line
	5650 4500 5650 2750
Wire Notes Line
	5650 2750 8900 2750
$EndSCHEMATC
