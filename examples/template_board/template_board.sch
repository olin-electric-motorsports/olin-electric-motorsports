EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "OEM Project Template"
Date "2019-08-22"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Wesley Soo-Hoo"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE119A
P 3150 9350
F 0 "#PWR?" H 3150 9100 50  0001 C CNN
F 1 "GND" H 3155 9177 50  0000 C CNN
F 2 "" H 3150 9350 50  0001 C CNN
F 3 "" H 3150 9350 50  0001 C CNN
	1    3150 9350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE168D
P 2400 9100
F 0 "#PWR?" H 2400 8850 50  0001 C CNN
F 1 "GND" H 2400 8900 50  0000 C CNN
F 2 "" H 2400 9100 50  0001 C CNN
F 3 "" H 2400 9100 50  0001 C CNN
	1    2400 9100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 2100 9100
F 0 "#PWR?" H 2100 8850 50  0001 C CNN
F 1 "GND" H 2105 8927 50  0000 C CNN
F 2 "" H 2100 9100 50  0001 C CNN
F 3 "" H 2100 9100 50  0001 C CNN
	1    2100 9100
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C102
U 1 1 5BEE2647
P 2400 9000
F 0 "C102" H 2450 8850 50  0000 L CNN
F 1 "C_2.2uF" H 2280 9250 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2438 8850 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2425 9100 50  0001 C CNN
F 4 "DK" H 2400 9000 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2400 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2825 9500 60  0001 C CNN "PurchasingLink"
	1    2400 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5BEE2923
P 2100 8950
F 0 "C101" H 2150 8800 50  0000 L CNN
F 1 "C_0.1uF" H 1930 9200 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2138 8800 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 2125 9050 50  0001 C CNN
F 4 "DK" H 2100 8950 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 2100 8950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 2525 9450 60  0001 C CNN "PurchasingLink"
	1    2100 8950
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R103
U 1 1 5BEE2A52
P 4000 9600
F 0 "R103" V 4100 9550 50  0000 L CNN
F 1 "R_100K" V 3900 9450 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3930 9600 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 4080 9600 50  0001 C CNN
F 4 "DK" H 4000 9600 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 4000 9600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 4480 10000 60  0001 C CNN "PurchasingLink"
	1    4000 9600
	0    1    1    0   
$EndComp
$Comp
L formula:C_0.1uF C103
U 1 1 5BEE239B
P 4000 8750
F 0 "C103" V 3940 8890 50  0000 C CNN
F 1 "C_0.1uF" V 4040 8950 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 4038 8600 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4025 8850 50  0001 C CNN
F 4 "DK" H 4000 8750 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 4000 8750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4425 9250 60  0001 C CNN "PurchasingLink"
	1    4000 8750
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
L formula:C_22uF COUT101
U 1 1 5C061BB4
P 4800 9050
F 0 "COUT101" H 4690 9300 50  0000 L CNN
F 1 "C_22uF" H 4820 8950 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 4850 8650 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 4850 9400 50  0001 C CNN
F 4 "DK" H 4600 9050 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 4850 8550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 5225 9550 60  0001 C CNN "PurchasingLink"
	1    4800 9050
	1    0    0    -1  
$EndComp
$Comp
L formula:C_47uF COUT103
U 1 1 5C062E7A
P 5600 9050
F 0 "COUT103" H 5500 9300 50  0000 L CNN
F 1 "C_47uF" H 5610 8950 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5638 8900 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 5625 9150 50  0001 C CNN
F 4 "DK" H 5600 9050 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 5600 9050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 6025 9550 60  0001 C CNN "PurchasingLink"
	1    5600 9050
	1    0    0    -1  
$EndComp
$Comp
L formula:C_33uF COUT102
U 1 1 5C08921B
P 5200 9050
F 0 "COUT102" H 5100 9300 50  0000 L CNN
F 1 "C_33uF" H 5210 8950 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 5250 8650 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5200 9700 50  0001 C CNN
F 4 "C4532X7R1C336M250KC" H 5250 8550 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 5200 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 5450 9550 60  0001 C CNN "PurchasingLink"
	1    5200 9050
	1    0    0    -1  
$EndComp
$Comp
L formula:R_25K R102
U 1 1 5C0B315C
P 3500 9600
F 0 "R102" V 3600 9550 50  0000 L CNN
F 1 "R_25K" V 3400 9500 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3550 9050 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" H 3500 9200 50  0001 C CNN
F 4 "A124124CT-ND" H 2900 9600 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B25KE" H 3550 10100 60  0001 C CNN "Digi-key Part Number"
F 6 "https://www.digikey.com/product-detail/en/te-connectivity-passive-product/CPF-A-0805B25KE/A124124CT-ND/5970044" H 3550 10000 60  0001 C CNN "PurchasingLink"
	1    3500 9600
	0    1    1    0   
$EndComp
$Comp
L formula:F_500mA_16V F101
U 1 1 5C0BFA29
P 1050 8800
F 0 "F101" V 1130 8800 50  0000 C CNN
F 1 "F_500mA_16V" V 950 8820 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 980 8800 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1130 8800 50  0001 C CNN
F 4 "DK" H 1050 8800 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1050 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1530 9200 60  0001 C CNN "PurchasingLink"
	1    1050 8800
	0    1    1    0   
$EndComp
$Comp
L formula:R_0_2512 R104
U 1 1 5C0C29A9
P 6550 8700
F 0 "R104" V 6350 8700 50  0000 C CNN
F 1 "R_0_2512" V 6450 8750 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 6480 8700 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 6630 8700 50  0001 C CNN
F 4 "DK" H 6550 8700 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 6550 8700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 7030 9100 60  0001 C CNN "PurchasingLink"
	1    6550 8700
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 6300 9750
F 0 "D103" V 6500 9730 50  0000 R CNN
F 1 "LED_0805" V 6410 9730 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6200 9750 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6300 9850 50  0001 C CNN
F 4 "DK" H 6300 9750 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6300 9750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6700 10250 60  0001 C CNN "PurchasingLink"
	1    6300 9750
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 6300 9150
F 0 "R105" H 6370 9196 50  0000 L CNN
F 1 "R_200" H 6370 9105 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6230 9150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6380 9150 50  0001 C CNN
F 4 "DK" H 6300 9150 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6300 9150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6780 9550 60  0001 C CNN "PurchasingLink"
	1    6300 9150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 6300 10100
F 0 "#PWR?" H 6300 9850 50  0001 C CNN
F 1 "GND" H 6305 9927 50  0000 C CNN
F 2 "" H 6300 10100 50  0001 C CNN
F 3 "" H 6300 10100 50  0001 C CNN
	1    6300 10100
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 1300 9100
F 0 "D101" H 1290 9290 50  0000 C CNN
F 1 "D_Zener_18V" H 1280 9200 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1200 9100 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1300 9200 50  0001 C CNN
F 4 "DK" H 1500 9400 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1400 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 1700 9600 60  0001 C CNN "PurchasingLink"
	1    1300 9100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 1300 9350
F 0 "#PWR?" H 1300 9100 50  0001 C CNN
F 1 "GND" H 1305 9177 50  0000 C CNN
F 2 "" H 1300 9350 50  0001 C CNN
F 3 "" H 1300 9350 50  0001 C CNN
	1    1300 9350
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 1700 9400
F 0 "D102" V 1738 9283 50  0000 R CNN
F 1 "LED_0805" V 1647 9283 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1600 9400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1700 9500 50  0001 C CNN
F 4 "DK" H 1700 9400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1700 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2100 9900 60  0001 C CNN "PurchasingLink"
	1    1700 9400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 1700 9650
F 0 "#PWR?" H 1700 9400 50  0001 C CNN
F 1 "GND" H 1705 9477 50  0000 C CNN
F 2 "" H 1700 9650 50  0001 C CNN
F 3 "" H 1700 9650 50  0001 C CNN
	1    1700 9650
	1    0    0    -1  
$EndComp
Text Notes 1950 8700 0    50   ~ 0
Input Capacitors\n\n
Text Notes 1600 9700 1    50   ~ 0
12V Indicator
Text Notes 1200 9350 1    50   ~ 0
Protection\n
Text Notes 2600 8450 0    89   ~ 0
BUCK CONVERTER\n
$Comp
L power:GND #PWR?
U 1 1 5C77960D
P 3350 9900
F 0 "#PWR?" H 3350 9650 50  0001 C CNN
F 1 "GND" H 3355 9727 50  0000 C CNN
F 2 "" H 3350 9900 50  0001 C CNN
F 3 "" H 3350 9900 50  0001 C CNN
	1    3350 9900
	1    0    0    -1  
$EndComp
Text Notes 3450 9850 0    50   ~ 0
Feedback Divider\n
Text Notes 3600 8600 0    50   ~ 0
Bootstrap Capacitor\n
Text Notes 4900 8650 0    50   ~ 0
Output Capacitors\n
$Comp
L power:GND #PWR?
U 1 1 5C7815F8
P 5200 9200
F 0 "#PWR?" H 5200 8950 50  0001 C CNN
F 1 "GND" H 5205 9027 50  0000 C CNN
F 2 "" H 5200 9200 50  0001 C CNN
F 3 "" H 5200 9200 50  0001 C CNN
	1    5200 9200
	1    0    0    -1  
$EndComp
Text Notes 6650 8750 0    50   ~ 0
VCC Jumper\n
Text Notes 6150 10000 1    50   ~ 0
5V Indicator
$Comp
L formula:ATMEGA16M1 U2
U 1 1 5D58A7A6
P 2550 2700
F 0 "U2" H 3450 4560 50  0000 C CNN
F 1 "ATMEGA16M1" H 1850 4550 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2550 2700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1600 4530 50  0001 C CNN
F 4 "DK" H 2550 2700 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2550 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2000 4930 60  0001 C CNN "PurchasingLink"
	1    2550 2700
	1    0    0    -1  
$EndComp
Text Label 3650 2100 0    50   ~ 0
CAN_TX
Text Label 3650 2200 0    50   ~ 0
CAN_RX
Text Label 3650 3000 0    50   ~ 0
MISO
Text Label 3650 3100 0    50   ~ 0
MOSI
Text Label 3650 3200 0    50   ~ 0
SCK
Text Label 4300 3700 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1150 1150
F 0 "R1" V 1050 1100 50  0000 L CNN
F 1 "R_100" V 1240 1030 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 350 1300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 850 1650 50  0001 C CNN
F 4 "DK" H 1150 1150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 500 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1630 1550 60  0001 C CNN "PurchasingLink"
	1    1150 1150
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C3
U 1 1 5D58E505
P 1150 1450
F 0 "C3" V 1200 1300 50  0000 L CNN
F 1 "C_100pF" V 1000 1270 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1188 1300 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1175 1550 50  0001 C CNN
F 4 "DK" H 1150 1450 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1150 1450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1575 1950 60  0001 C CNN "PurchasingLink"
	1    1150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 800 1300
F 0 "#PWR?" H 800 1050 50  0001 C CNN
F 1 "GND" H 805 1127 50  0000 C CNN
F 2 "" H 800 1300 50  0001 C CNN
F 3 "" H 800 1300 50  0001 C CNN
	1    800  1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1150 1600
F 0 "#PWR?" H 1150 1350 50  0001 C CNN
F 1 "GND" H 1155 1427 50  0000 C CNN
F 2 "" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0001 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4100 4100
F 0 "Y1" H 3810 4170 50  0000 L CNN
F 1 "Crystal_SMD" H 3420 4100 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4050 4175 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4150 4275 50  0001 C CNN
F 4 "DK" H 4100 4100 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4100 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4550 4675 60  0001 C CNN "PurchasingLink"
	1    4100 4100
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB5B2
P 3900 4350
F 0 "C4" H 3790 4430 50  0000 L CNN
F 1 "C_30pF" H 3630 4270 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3938 4200 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 3925 4450 50  0001 C CNN
F 4 "DK" H 3900 4350 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 3900 4350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4325 4850 60  0001 C CNN "PurchasingLink"
	1    3900 4350
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB694
P 4300 4350
F 0 "C5" H 4320 4430 50  0000 L CNN
F 1 "C_30pF" H 4330 4250 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4338 4200 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4325 4450 50  0001 C CNN
F 4 "DK" H 4300 4350 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4300 4350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4725 4850 60  0001 C CNN "PurchasingLink"
	1    4300 4350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5D5EB7F3
P 4150 3500
F 0 "R3" V 4070 3500 50  0000 C CNN
F 1 "R_10K" V 4200 3750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4080 3500 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4230 3500 50  0001 C CNN
F 4 "DK" H 4150 3500 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4150 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4630 3900 60  0001 C CNN "PurchasingLink"
	1    4150 3500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 3900 4500
F 0 "#PWR?" H 3900 4250 50  0001 C CNN
F 1 "GND" H 3905 4327 50  0000 C CNN
F 2 "" H 3900 4500 50  0001 C CNN
F 3 "" H 3900 4500 50  0001 C CNN
	1    3900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4300 4500
F 0 "#PWR?" H 4300 4250 50  0001 C CNN
F 1 "GND" H 4305 4327 50  0000 C CNN
F 2 "" H 4300 4500 50  0001 C CNN
F 3 "" H 4300 4500 50  0001 C CNN
	1    4300 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4100 4250
F 0 "#PWR?" H 4100 4000 50  0001 C CNN
F 1 "GND" H 4105 4077 50  0000 C CNN
F 2 "" H 4100 4250 50  0001 C CNN
F 3 "" H 4100 4250 50  0001 C CNN
	1    4100 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4450 3950
F 0 "#PWR?" H 4450 3700 50  0001 C CNN
F 1 "GND" H 4455 3777 50  0000 C CNN
F 2 "" H 4450 3950 50  0001 C CNN
F 3 "" H 4450 3950 50  0001 C CNN
	1    4450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1300 4050
F 0 "#PWR?" H 1300 3800 50  0001 C CNN
F 1 "GND" H 1305 3877 50  0000 C CNN
F 2 "" H 1300 4050 50  0001 C CNN
F 3 "" H 1300 4050 50  0001 C CNN
	1    1300 4050
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U1
U 1 1 5D5FAEDE
P 14800 2050
F 0 "U1" H 15160 2400 50  0000 C CNN
F 1 "MCP2561-E_SN" H 15150 1690 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 14800 1550 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 14400 2400 50  0001 C CNN
F 4 "DK" H 14800 2050 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 14800 2050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 14800 2800 60  0001 C CNN "PurchasingLink"
	1    14800 2050
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5D5FB603
P 14650 1450
F 0 "C1" V 14600 1560 50  0000 C CNN
F 1 "C_0.1uF" V 14610 1260 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 14688 1300 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14675 1550 50  0001 C CNN
F 4 "DK" H 14650 1450 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 14650 1450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 15075 1950 60  0001 C CNN "PurchasingLink"
	1    14650 1450
	0    1    1    0   
$EndComp
NoConn ~ 15300 2050
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 14500 1600
F 0 "#PWR?" H 14500 1350 50  0001 C CNN
F 1 "GND" H 14400 1600 50  0000 C CNN
F 2 "" H 14500 1600 50  0001 C CNN
F 3 "" H 14500 1600 50  0001 C CNN
	1    14500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 14800 2450
F 0 "#PWR?" H 14800 2200 50  0001 C CNN
F 1 "GND" H 14805 2277 50  0000 C CNN
F 2 "" H 14800 2450 50  0001 C CNN
F 3 "" H 14800 2450 50  0001 C CNN
	1    14800 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 14300 2250
F 0 "#PWR?" H 14300 2000 50  0001 C CNN
F 1 "GND" H 14305 2077 50  0000 C CNN
F 2 "" H 14300 2250 50  0001 C CNN
F 3 "" H 14300 2250 50  0001 C CNN
	1    14300 2250
	1    0    0    -1  
$EndComp
Text Label 14300 1850 2    50   ~ 0
CAN_TX
Text Label 14300 1950 2    50   ~ 0
CAN_RX
Text Label 15750 1900 0    50   ~ 0
CAN_+
Text Label 15750 2200 0    50   ~ 0
CAN_-
Text Notes 14200 1050 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2250 800  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3550 4900 0    89   ~ 0
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
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 14850 3750
F 0 "J1" H 14850 3960 50  0000 C CNN
F 1 "CONN_02X03" H 14740 3550 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 14850 2550 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 14850 2550 50  0001 C CNN
F 4 "DK" H 14850 3750 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 14850 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 15250 4350 60  0001 C CNN "PurchasingLink"
	1    14850 3750
	1    0    0    -1  
$EndComp
Text Label 14600 3650 2    50   ~ 0
MISO
Text Label 14600 3750 2    50   ~ 0
SCK
Text Label 14600 3850 2    50   ~ 0
RESET
Text Label 15100 3750 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 15100 3850
F 0 "#PWR?" H 15100 3600 50  0001 C CNN
F 1 "GND" H 15105 3677 50  0000 C CNN
F 2 "" H 15100 3850 50  0001 C CNN
F 3 "" H 15100 3850 50  0001 C CNN
	1    15100 3850
	1    0    0    -1  
$EndComp
Text Notes 13850 3400 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Wire Wire Line
	1450 1300 1150 1300
Connection ~ 1150 1300
$Comp
L formula:C_0.1uF C2
U 1 1 5D58E34B
P 800 1150
F 0 "C2" V 850 1010 50  0000 L CNN
F 1 "C_0.1uF" V 660 990 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 838 1000 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 825 1250 50  0001 C CNN
F 4 "DK" H 800 1150 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 800 1150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1225 1650 60  0001 C CNN "PurchasingLink"
	1    800  1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  850  800  1000
Wire Wire Line
	800  1000 1150 1000
Connection ~ 800  1000
Connection ~ 1150 1000
Wire Wire Line
	1150 1000 1450 1000
Wire Wire Line
	1300 4050 1300 3900
Wire Wire Line
	1300 3500 1450 3500
Wire Wire Line
	1450 3900 1300 3900
Connection ~ 1300 3900
Wire Wire Line
	1300 3900 1300 3500
NoConn ~ 1450 1700
Wire Wire Line
	3900 4200 3900 4100
Wire Wire Line
	3900 4100 4000 4100
Wire Wire Line
	4200 4100 4300 4100
Wire Wire Line
	4300 4100 4300 4200
Wire Wire Line
	4100 3950 4450 3950
Wire Wire Line
	4300 4100 4300 3800
Wire Wire Line
	4300 3800 3650 3800
Connection ~ 4300 4100
Wire Wire Line
	3900 4100 3900 3900
Wire Wire Line
	3900 3900 3650 3900
Connection ~ 3900 4100
Wire Wire Line
	3650 3700 4000 3700
Wire Wire Line
	4000 3700 4000 3500
Connection ~ 4000 3700
Wire Wire Line
	4000 3700 4300 3700
Wire Wire Line
	4300 3500 4450 3500
Wire Wire Line
	4450 3500 4450 3350
Wire Wire Line
	14500 1450 14500 1600
Wire Wire Line
	14800 1650 14800 1450
Connection ~ 14800 1450
Wire Wire Line
	14800 1450 14800 1300
Wire Wire Line
	15300 1950 15400 1950
Wire Wire Line
	15400 1950 15400 1900
Wire Wire Line
	15400 2150 15400 2200
Wire Wire Line
	15000 8600 15000 8450
Wire Wire Line
	15450 8450 15450 8600
Wire Wire Line
	3500 8750 3850 8750
Wire Wire Line
	4150 8750 4250 8750
Wire Wire Line
	4250 8750 4250 8900
Wire Wire Line
	3500 8900 4250 8900
Connection ~ 4250 8900
Wire Wire Line
	4250 8900 4300 8900
Wire Wire Line
	3350 9600 3350 9900
Wire Wire Line
	3650 9600 3750 9600
Wire Wire Line
	4150 9600 6000 9600
Wire Wire Line
	6000 9600 6000 8900
Wire Wire Line
	3750 9100 3750 9600
Connection ~ 3750 9600
Wire Wire Line
	3750 9600 3850 9600
Wire Wire Line
	3500 9100 3750 9100
Wire Wire Line
	4500 8900 4800 8900
Connection ~ 6000 8900
Connection ~ 4800 8900
Wire Wire Line
	4800 8900 5200 8900
Connection ~ 5200 8900
Wire Wire Line
	5200 8900 5600 8900
Connection ~ 5600 8900
Wire Wire Line
	5600 8900 6000 8900
Wire Wire Line
	6300 9000 6300 8900
Wire Wire Line
	6300 9900 6300 10100
Wire Wire Line
	6300 9300 6300 9600
Wire Wire Line
	1300 9250 1300 9350
Connection ~ 2100 8800
Wire Wire Line
	1700 9550 1700 9650
Wire Wire Line
	2750 9050 2650 9050
Wire Wire Line
	2650 9050 2650 8800
Connection ~ 2650 8800
Wire Wire Line
	2650 8800 2750 8800
Wire Wire Line
	15300 2150 15400 2150
$Comp
L formula:TPS560430YF U101
U 1 1 5C75D405
P 3100 8950
F 0 "U101" H 3125 9415 50  0000 C CNN
F 1 "TPS560430YF" H 3125 9324 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 3050 9650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps560430.pdf" H 3100 9500 50  0001 C CNN
F 4 "TPS560430YFDBVR" H 3050 7850 50  0001 C CNN "MPN"
F 5 "TPS560430YFDBVR-ND" H 3100 7950 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 3850 8050 50  0001 C CNN "Purchasing Link"
	1    3100 8950
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R101
U 1 1 5DE6EFCB
P 1700 9000
F 0 "R101" H 1770 9046 50  0000 L CNN
F 1 "R_1K" H 1770 8955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1630 9000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1780 9000 50  0001 C CNN
F 4 "DK" H 1700 9000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1700 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2180 9400 60  0001 C CNN "PurchasingLink"
	1    1700 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 8800 2100 8800
Connection ~ 1700 8800
Text Notes 4250 8750 0    50   ~ 0
Inductor\n
$Comp
L power:GND #PWR?
U 1 1 5F87F709
P 4800 9200
F 0 "#PWR?" H 4800 8950 50  0001 C CNN
F 1 "GND" H 4805 9027 50  0000 C CNN
F 2 "" H 4800 9200 50  0001 C CNN
F 3 "" H 4800 9200 50  0001 C CNN
	1    4800 9200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F87F995
P 5600 9200
F 0 "#PWR?" H 5600 8950 50  0001 C CNN
F 1 "GND" H 5605 9027 50  0000 C CNN
F 2 "" H 5600 9200 50  0001 C CNN
F 3 "" H 5600 9200 50  0001 C CNN
	1    5600 9200
	1    0    0    -1  
$EndComp
$Comp
L formula:L_100uH L101
U 1 1 5F881F17
P 4400 8900
F 0 "L101" H 4400 9000 50  0000 C CNN
F 1 "L_100uH" H 4400 8850 50  0000 C CNN
F 2 "footprints:L_100uH_OEM" H 4300 8700 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_commercial_decoupling_nlfv32-ef_en.pdf" H 4300 8750 50  0001 C CNN
F 4 "Digikey" H 4500 8700 50  0001 C CNN "MFN"
F 5 "445-15759-1-ND" H 4400 9150 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 4700 9100 50  0001 C CNN "Link"
	1    4400 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  8800 900  8800
Wire Wire Line
	1200 8800 1300 8800
Wire Wire Line
	1300 8950 1300 8800
Connection ~ 1300 8800
Wire Wire Line
	1300 8800 1700 8800
$Comp
L formula:R_120_DNP R2
U 1 1 5FA5AB4A
P 15600 2050
F 0 "R2" H 15670 2096 50  0000 L CNN
F 1 "R_120_DNP" H 15670 2005 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14400 2200 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 14400 2500 50  0001 L CNN
F 4 "DK" H 15600 2050 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 14400 2300 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 14400 2400 60  0001 L CNN "PurchasingLink"
	1    15600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	15400 1900 15600 1900
Wire Wire Line
	15400 2200 15600 2200
Connection ~ 15600 1900
Wire Wire Line
	15600 1900 15750 1900
Connection ~ 15600 2200
Wire Wire Line
	15600 2200 15750 2200
Wire Wire Line
	2100 8800 2400 8800
$Comp
L power:+5V #PWR?
U 1 1 5FD33116
P 6550 8450
F 0 "#PWR?" H 6550 8300 50  0001 C CNN
F 1 "+5V" H 6565 8623 50  0000 C CNN
F 2 "" H 6550 8450 50  0001 C CNN
F 3 "" H 6550 8450 50  0001 C CNN
	1    6550 8450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 800 850
F 0 "#PWR?" H 800 700 50  0001 C CNN
F 1 "+5V" H 815 1023 50  0000 C CNN
F 2 "" H 800 850 50  0001 C CNN
F 3 "" H 800 850 50  0001 C CNN
	1    800  850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3B2BE
P 14800 1300
F 0 "#PWR?" H 14800 1150 50  0001 C CNN
F 1 "+5V" H 14815 1473 50  0000 C CNN
F 2 "" H 14800 1300 50  0001 C CNN
F 3 "" H 14800 1300 50  0001 C CNN
	1    14800 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 15100 3650
F 0 "#PWR?" H 15100 3500 50  0001 C CNN
F 1 "+5V" H 15115 3823 50  0000 C CNN
F 2 "" H 15100 3650 50  0001 C CNN
F 3 "" H 15100 3650 50  0001 C CNN
	1    15100 3650
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
Connection ~ 2400 8800
Wire Wire Line
	2400 8800 2650 8800
Text Notes 3900 3050 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 4450 3350
F 0 "#PWR?" H 4450 3200 50  0001 C CNN
F 1 "+5V" H 4465 3523 50  0000 C CNN
F 2 "" H 4450 3350 50  0001 C CNN
F 3 "" H 4450 3350 50  0001 C CNN
	1    4450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 8800 1700 8850
Wire Wire Line
	1700 9150 1700 9250
Wire Wire Line
	6000 8900 6300 8900
Wire Wire Line
	6550 8900 6550 8850
Wire Wire Line
	6550 8550 6550 8450
Connection ~ 6300 8900
Wire Wire Line
	6300 8900 6550 8900
$Comp
L power:+BATT #PWR?
U 1 1 615FBF35
P 700 8600
F 0 "#PWR?" H 700 8450 50  0001 C CNN
F 1 "+BATT" H 715 8773 50  0000 C CNN
F 2 "" H 700 8600 50  0001 C CNN
F 3 "" H 700 8600 50  0001 C CNN
	1    700  8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  8600 700  8800
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
$EndSCHEMATC
