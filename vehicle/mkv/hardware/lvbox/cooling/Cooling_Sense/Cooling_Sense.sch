EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Cooling Pressure and Temperature Sensing Board"
Date "2019-11-18"
Rev "2"
Comp "Olin Electric Motorsports"
Comment1 "Laurel Rodriguez Mitton"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE119A
P 2900 7100
F 0 "#PWR?" H 2900 6850 50  0001 C CNN
F 1 "GND" H 2905 6927 50  0000 C CNN
F 2 "" H 2900 7100 50  0001 C CNN
F 3 "" H 2900 7100 50  0001 C CNN
	1    2900 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE168D
P 2150 6850
F 0 "#PWR?" H 2150 6600 50  0001 C CNN
F 1 "GND" H 2150 6650 50  0000 C CNN
F 2 "" H 2150 6850 50  0001 C CNN
F 3 "" H 2150 6850 50  0001 C CNN
	1    2150 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 1850 6850
F 0 "#PWR?" H 1850 6600 50  0001 C CNN
F 1 "GND" H 1855 6677 50  0000 C CNN
F 2 "" H 1850 6850 50  0001 C CNN
F 3 "" H 1850 6850 50  0001 C CNN
	1    1850 6850
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C102
U 1 1 5BEE2647
P 2150 6700
F 0 "C102" H 2200 6550 50  0000 L CNN
F 1 "C_2.2uF" H 2030 6950 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2188 6550 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2175 6800 50  0001 C CNN
F 4 "DK" H 2150 6700 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2150 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2575 7200 60  0001 C CNN "PurchasingLink"
	1    2150 6700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5BEE2923
P 1850 6700
F 0 "C101" H 1900 6550 50  0000 L CNN
F 1 "C_0.1uF" H 1680 6950 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1888 6550 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1875 6800 50  0001 C CNN
F 4 "DK" H 1850 6700 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1850 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 2275 7200 60  0001 C CNN "PurchasingLink"
	1    1850 6700
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R103
U 1 1 5BEE2A52
P 3750 7350
F 0 "R103" V 3850 7300 50  0000 L CNN
F 1 "R_100K" V 3650 7200 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3680 7350 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 3830 7350 50  0001 C CNN
F 4 "DK" H 3750 7350 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 3750 7350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 4230 7750 60  0001 C CNN "PurchasingLink"
	1    3750 7350
	0    1    1    0   
$EndComp
$Comp
L formula:C_0.1uF C103
U 1 1 5BEE239B
P 3750 6500
F 0 "C103" V 3690 6640 50  0000 C CNN
F 1 "C_0.1uF" V 3790 6700 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 3788 6350 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3775 6600 50  0001 C CNN
F 4 "DK" H 3750 6500 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3750 6500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4175 7000 60  0001 C CNN "PurchasingLink"
	1    3750 6500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 10600 6100
F 0 "#PWR?" H 10600 5850 50  0001 C CNN
F 1 "GND" H 10605 5927 50  0000 C CNN
F 2 "" H 10600 6100 50  0001 C CNN
F 3 "" H 10600 6100 50  0001 C CNN
	1    10600 6100
	1    0    0    -1  
$EndComp
Text Label 9800 6100 0    50   ~ 0
12V
$Comp
L formula:C_22uF COUT101
U 1 1 5C061BB4
P 4550 6800
F 0 "COUT101" H 4440 7050 50  0000 L CNN
F 1 "C_22uF" H 4570 6700 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 4600 6400 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 4600 7150 50  0001 C CNN
F 4 "DK" H 4350 6800 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 4600 6300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 4975 7300 60  0001 C CNN "PurchasingLink"
	1    4550 6800
	1    0    0    -1  
$EndComp
$Comp
L formula:C_47uF COUT103
U 1 1 5C062E7A
P 5350 6800
F 0 "COUT103" H 5250 7050 50  0000 L CNN
F 1 "C_47uF" H 5360 6700 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5388 6650 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 5375 6900 50  0001 C CNN
F 4 "DK" H 5350 6800 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 5350 6800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 5775 7300 60  0001 C CNN "PurchasingLink"
	1    5350 6800
	1    0    0    -1  
$EndComp
$Comp
L formula:C_33uF COUT102
U 1 1 5C08921B
P 4950 6800
F 0 "COUT102" H 4850 7050 50  0000 L CNN
F 1 "C_33uF" H 4960 6700 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 5000 6400 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 4950 7450 50  0001 C CNN
F 4 "C4532X7R1C336M250KC" H 5000 6300 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 4950 7150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 5200 7300 60  0001 C CNN "PurchasingLink"
	1    4950 6800
	1    0    0    -1  
$EndComp
$Comp
L formula:R_25K R102
U 1 1 5C0B315C
P 3250 7350
F 0 "R102" V 3350 7300 50  0000 L CNN
F 1 "R_25K" V 3150 7250 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3300 6800 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" H 3250 6950 50  0001 C CNN
F 4 "A124124CT-ND" H 2650 7350 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B25KE" H 3300 7850 60  0001 C CNN "Digi-key Part Number"
F 6 "https://www.digikey.com/product-detail/en/te-connectivity-passive-product/CPF-A-0805B25KE/A124124CT-ND/5970044" H 3300 7750 60  0001 C CNN "PurchasingLink"
	1    3250 7350
	0    1    1    0   
$EndComp
$Comp
L formula:F_500mA_16V F101
U 1 1 5C0BFA29
P 1050 6550
F 0 "F101" V 1130 6550 50  0000 C CNN
F 1 "F_500mA_16V" V 950 6570 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 980 6550 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1130 6550 50  0001 C CNN
F 4 "DK" H 1050 6550 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1050 6550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1530 6950 60  0001 C CNN "PurchasingLink"
	1    1050 6550
	0    1    1    0   
$EndComp
$Comp
L formula:R_0_2512 R104
U 1 1 5C0C29A9
P 5900 6650
F 0 "R104" V 5700 6650 50  0000 C CNN
F 1 "R_0_2512" V 5800 6700 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 5830 6650 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 5980 6650 50  0001 C CNN
F 4 "DK" H 5900 6650 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 5900 6650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 6380 7050 60  0001 C CNN "PurchasingLink"
	1    5900 6650
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 6300 7300
F 0 "D103" V 6500 7280 50  0000 R CNN
F 1 "LED_0805" V 6410 7280 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6200 7300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6300 7400 50  0001 C CNN
F 4 "DK" H 6300 7300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6300 7300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6700 7800 60  0001 C CNN "PurchasingLink"
	1    6300 7300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 6300 6900
F 0 "R105" H 6370 6946 50  0000 L CNN
F 1 "R_200" H 6370 6855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6230 6900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6380 6900 50  0001 C CNN
F 4 "DK" H 6300 6900 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6300 6900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6780 7300 60  0001 C CNN "PurchasingLink"
	1    6300 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 6300 7550
F 0 "#PWR?" H 6300 7300 50  0001 C CNN
F 1 "GND" H 6305 7377 50  0000 C CNN
F 2 "" H 6300 7550 50  0001 C CNN
F 3 "" H 6300 7550 50  0001 C CNN
	1    6300 7550
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 700 6850
F 0 "D101" H 690 7040 50  0000 C CNN
F 1 "D_Zener_18V" H 680 6950 50  0000 C CNN
F 2 "footprints:DO-214AA" H 600 6850 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 700 6950 50  0001 C CNN
F 4 "DK" H 900 7150 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 800 7050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 1100 7350 60  0001 C CNN "PurchasingLink"
	1    700  6850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 700 7100
F 0 "#PWR?" H 700 6850 50  0001 C CNN
F 1 "GND" H 705 6927 50  0000 C CNN
F 2 "" H 700 7100 50  0001 C CNN
F 3 "" H 700 7100 50  0001 C CNN
	1    700  7100
	1    0    0    -1  
$EndComp
Text Label 700  6250 0    50   ~ 0
12V
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 1450 7100
F 0 "D102" V 1488 6983 50  0000 R CNN
F 1 "LED_0805" V 1397 6983 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1350 7100 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1450 7200 50  0001 C CNN
F 4 "DK" H 1450 7100 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1450 7100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 1850 7600 60  0001 C CNN "PurchasingLink"
	1    1450 7100
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R101
U 1 1 5C754D87
P 1450 6700
F 0 "R101" H 1520 6746 50  0000 L CNN
F 1 "R_200" H 1520 6655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1380 6700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1530 6700 50  0001 C CNN
F 4 "DK" H 1450 6700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 1450 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 1930 7100 60  0001 C CNN "PurchasingLink"
	1    1450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 1450 7400
F 0 "#PWR?" H 1450 7150 50  0001 C CNN
F 1 "GND" H 1455 7227 50  0000 C CNN
F 2 "" H 1450 7400 50  0001 C CNN
F 3 "" H 1450 7400 50  0001 C CNN
	1    1450 7400
	1    0    0    -1  
$EndComp
Text Notes 1700 6450 0    50   ~ 0
Input Capacitors\n\n
Text Notes 1350 7450 1    50   ~ 0
12V Indicator
Text Notes 600  7100 1    50   ~ 0
Protection\n
Text Notes 2350 6200 0    89   ~ 0
BUCK CONVERTER\n
$Comp
L power:GND #PWR?
U 1 1 5C77960D
P 3100 7350
F 0 "#PWR?" H 3100 7100 50  0001 C CNN
F 1 "GND" H 3105 7177 50  0000 C CNN
F 2 "" H 3100 7350 50  0001 C CNN
F 3 "" H 3100 7350 50  0001 C CNN
	1    3100 7350
	1    0    0    -1  
$EndComp
Text Notes 3200 7600 0    50   ~ 0
Feedback Divider\n
Text Notes 4000 6850 0    50   ~ 0
Inductor\n
Text Notes 3350 6350 0    50   ~ 0
Bootstrap Capacitor\n
$Comp
L formula:L_100uH L101
U 1 1 5BEE27A2
P 4150 6650
F 0 "L101" H 4150 6750 50  0000 C CNN
F 1 "L_100uH" H 4150 6600 50  0000 C CNN
F 2 "footprints:L_100uH" H 4050 6450 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_commercial_decoupling_nlfv32-ef_en.pdf" H 4050 6500 50  0001 C CNN
F 4 "Digikey" H 4250 6450 50  0001 C CNN "MFN"
F 5 "445-15759-1-ND" H 4150 6900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 4450 6850 50  0001 C CNN "Link"
	1    4150 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C781579
P 4550 6950
F 0 "#PWR?" H 4550 6700 50  0001 C CNN
F 1 "GND" H 4555 6777 50  0000 C CNN
F 2 "" H 4550 6950 50  0001 C CNN
F 3 "" H 4550 6950 50  0001 C CNN
	1    4550 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C7815F8
P 4950 6950
F 0 "#PWR?" H 4950 6700 50  0001 C CNN
F 1 "GND" H 4955 6777 50  0000 C CNN
F 2 "" H 4950 6950 50  0001 C CNN
F 3 "" H 4950 6950 50  0001 C CNN
	1    4950 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C781DA3
P 5350 6950
F 0 "#PWR?" H 5350 6700 50  0001 C CNN
F 1 "GND" H 5355 6777 50  0000 C CNN
F 2 "" H 5350 6950 50  0001 C CNN
F 3 "" H 5350 6950 50  0001 C CNN
	1    5350 6950
	1    0    0    -1  
$EndComp
Text Notes 5700 6550 0    50   ~ 0
VCC Jumper\n
Text Notes 6200 7350 1    50   ~ 0
5V Indicator
Text Notes 10600 7650 0    50   ~ 0
2
Text Label 3550 1950 0    50   ~ 0
CAN_TX
Text Label 3550 2050 0    50   ~ 0
CAN_RX
Text Label 3550 2850 0    50   ~ 0
MISO
Text Label 3550 2950 0    50   ~ 0
MOSI
Text Label 3550 3050 0    50   ~ 0
SCK
Text Label 4400 3550 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1050 1000
F 0 "R1" V 950 950 50  0000 L CNN
F 1 "R_100" V 1140 880 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 250 1150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 750 1500 50  0001 C CNN
F 4 "DK" H 1050 1000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 400 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1530 1400 60  0001 C CNN "PurchasingLink"
	1    1050 1000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C3
U 1 1 5D58E505
P 1050 1350
F 0 "C3" V 1100 1200 50  0000 L CNN
F 1 "C_100pF" V 900 1170 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1088 1200 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1075 1450 50  0001 C CNN
F 4 "DK" H 1050 1350 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1050 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1475 1850 60  0001 C CNN "PurchasingLink"
	1    1050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 700 1150
F 0 "#PWR?" H 700 900 50  0001 C CNN
F 1 "GND" H 705 977 50  0000 C CNN
F 2 "" H 700 1150 50  0001 C CNN
F 3 "" H 700 1150 50  0001 C CNN
	1    700  1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1050 1500
F 0 "#PWR?" H 1050 1250 50  0001 C CNN
F 1 "GND" H 1055 1327 50  0000 C CNN
F 2 "" H 1050 1500 50  0001 C CNN
F 3 "" H 1050 1500 50  0001 C CNN
	1    1050 1500
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4000 3950
F 0 "Y1" H 3710 4020 50  0000 L CNN
F 1 "Crystal_SMD" H 3320 3950 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 3950 4025 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4050 4125 50  0001 C CNN
F 4 "DK" H 4000 3950 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4000 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4450 4525 60  0001 C CNN "PurchasingLink"
	1    4000 3950
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB5B2
P 3800 4200
F 0 "C4" H 3690 4280 50  0000 L CNN
F 1 "C_30pF" H 3530 4120 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3838 4050 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 3825 4300 50  0001 C CNN
F 4 "DK" H 3800 4200 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 3800 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4225 4700 60  0001 C CNN "PurchasingLink"
	1    3800 4200
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB694
P 4200 4200
F 0 "C5" H 4220 4280 50  0000 L CNN
F 1 "C_30pF" H 4230 4100 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4238 4050 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4225 4300 50  0001 C CNN
F 4 "DK" H 4200 4200 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4200 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4625 4700 60  0001 C CNN "PurchasingLink"
	1    4200 4200
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5D5EB7F3
P 4250 3400
F 0 "R3" V 4170 3400 50  0000 C CNN
F 1 "R_10K" V 4300 3650 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4180 3400 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4330 3400 50  0001 C CNN
F 4 "DK" H 4250 3400 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4250 3400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4730 3800 60  0001 C CNN "PurchasingLink"
	1    4250 3400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 3800 4350
F 0 "#PWR?" H 3800 4100 50  0001 C CNN
F 1 "GND" H 3805 4177 50  0000 C CNN
F 2 "" H 3800 4350 50  0001 C CNN
F 3 "" H 3800 4350 50  0001 C CNN
	1    3800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4200 4350
F 0 "#PWR?" H 4200 4100 50  0001 C CNN
F 1 "GND" H 4205 4177 50  0000 C CNN
F 2 "" H 4200 4350 50  0001 C CNN
F 3 "" H 4200 4350 50  0001 C CNN
	1    4200 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4000 4100
F 0 "#PWR?" H 4000 3850 50  0001 C CNN
F 1 "GND" H 4005 3927 50  0000 C CNN
F 2 "" H 4000 4100 50  0001 C CNN
F 3 "" H 4000 4100 50  0001 C CNN
	1    4000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4350 3800
F 0 "#PWR?" H 4350 3550 50  0001 C CNN
F 1 "GND" H 4355 3627 50  0000 C CNN
F 2 "" H 4350 3800 50  0001 C CNN
F 3 "" H 4350 3800 50  0001 C CNN
	1    4350 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D5F7547
P 4550 3250
F 0 "#PWR?" H 4550 3100 50  0001 C CNN
F 1 "VCC" H 4660 3310 50  0000 C CNN
F 2 "" H 4550 3250 50  0001 C CNN
F 3 "" H 4550 3250 50  0001 C CNN
	1    4550 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1200 3900
F 0 "#PWR?" H 1200 3650 50  0001 C CNN
F 1 "GND" H 1205 3727 50  0000 C CNN
F 2 "" H 1200 3900 50  0001 C CNN
F 3 "" H 1200 3900 50  0001 C CNN
	1    1200 3900
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U1
U 1 1 5D5FAEDE
P 9800 1600
F 0 "U1" H 10160 1950 50  0000 C CNN
F 1 "MCP2561-E_SN" H 10150 1240 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 9800 1100 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 9400 1950 50  0001 C CNN
F 4 "DK" H 9800 1600 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 9800 1600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 9800 2350 60  0001 C CNN "PurchasingLink"
	1    9800 1600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5D5FB603
P 9650 1000
F 0 "C1" V 9600 1110 50  0000 C CNN
F 1 "C_0.1uF" V 9610 810 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 9688 850 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9675 1100 50  0001 C CNN
F 4 "DK" H 9650 1000 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 9650 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 10075 1500 60  0001 C CNN "PurchasingLink"
	1    9650 1000
	0    1    1    0   
$EndComp
NoConn ~ 10300 1600
$Comp
L power:VCC #PWR?
U 1 1 5D602F58
P 9800 850
F 0 "#PWR?" H 9800 700 50  0001 C CNN
F 1 "VCC" H 9817 1023 50  0000 C CNN
F 2 "" H 9800 850 50  0001 C CNN
F 3 "" H 9800 850 50  0001 C CNN
	1    9800 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 9500 1150
F 0 "#PWR?" H 9500 900 50  0001 C CNN
F 1 "GND" H 9400 1150 50  0000 C CNN
F 2 "" H 9500 1150 50  0001 C CNN
F 3 "" H 9500 1150 50  0001 C CNN
	1    9500 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 9800 2000
F 0 "#PWR?" H 9800 1750 50  0001 C CNN
F 1 "GND" H 9805 1827 50  0000 C CNN
F 2 "" H 9800 2000 50  0001 C CNN
F 3 "" H 9800 2000 50  0001 C CNN
	1    9800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 9300 1800
F 0 "#PWR?" H 9300 1550 50  0001 C CNN
F 1 "GND" H 9305 1627 50  0000 C CNN
F 2 "" H 9300 1800 50  0001 C CNN
F 3 "" H 9300 1800 50  0001 C CNN
	1    9300 1800
	1    0    0    -1  
$EndComp
Text Label 9300 1400 2    50   ~ 0
CAN_TX
Text Label 9300 1500 2    50   ~ 0
CAN_RX
Text Label 10750 1450 0    50   ~ 0
CAN_HI
Text Label 10750 1750 0    50   ~ 0
CAN_LO
Text Notes 9850 1150 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2150 650  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 2400 4200 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 9650 5650 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 9800 5950
F 0 "#FLG?" H 9800 6025 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 6124 50  0000 C CNN
F 2 "" H 9800 5950 50  0001 C CNN
F 3 "~" H 9800 5950 50  0001 C CNN
	1    9800 5950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 10200 5950
F 0 "#FLG?" H 10200 6025 50  0001 C CNN
F 1 "PWR_FLAG" H 10200 6124 50  0000 C CNN
F 2 "" H 10200 5950 50  0001 C CNN
F 3 "~" H 10200 5950 50  0001 C CNN
	1    10200 5950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 10600 5950
F 0 "#FLG?" H 10600 6025 50  0001 C CNN
F 1 "PWR_FLAG" H 10600 6124 50  0000 C CNN
F 2 "" H 10600 5950 50  0001 C CNN
F 3 "~" H 10600 5950 50  0001 C CNN
	1    10600 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D6181B6
P 10200 6100
F 0 "#PWR?" H 10200 5950 50  0001 C CNN
F 1 "VCC" H 10218 6273 50  0000 C CNN
F 2 "" H 10200 6100 50  0001 C CNN
F 3 "" H 10200 6100 50  0001 C CNN
	1    10200 6100
	-1   0    0    1   
$EndComp
Text Label 9500 6100 0    50   ~ 0
5V
$Comp
L power:VCC #PWR?
U 1 1 5D61D085
P 9500 5950
F 0 "#PWR?" H 9500 5800 50  0001 C CNN
F 1 "VCC" H 9517 6123 50  0000 C CNN
F 2 "" H 9500 5950 50  0001 C CNN
F 3 "" H 9500 5950 50  0001 C CNN
	1    9500 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D622997
P 10900 6100
F 0 "#PWR?" H 10900 5850 50  0001 C CNN
F 1 "GND" H 10905 5927 50  0000 C CNN
F 2 "" H 10900 6100 50  0001 C CNN
F 3 "" H 10900 6100 50  0001 C CNN
	1    10900 6100
	1    0    0    -1  
$EndComp
Text Label 10900 5950 2    50   ~ 0
GND
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 10250 2850
F 0 "J1" H 10250 3060 50  0000 C CNN
F 1 "CONN_02X03" H 10140 2650 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 10250 1650 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 10250 1650 50  0001 C CNN
F 4 "DK" H 10250 2850 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 10250 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 10650 3450 60  0001 C CNN "PurchasingLink"
	1    10250 2850
	1    0    0    -1  
$EndComp
Text Label 10000 2750 2    50   ~ 0
MISO
Text Label 10000 2850 2    50   ~ 0
SCK
Text Label 10000 2950 2    50   ~ 0
RESET
Text Label 10500 2850 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 10500 2950
F 0 "#PWR?" H 10500 2700 50  0001 C CNN
F 1 "GND" H 10505 2777 50  0000 C CNN
F 2 "" H 10500 2950 50  0001 C CNN
F 3 "" H 10500 2950 50  0001 C CNN
	1    10500 2950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D6297EA
P 10500 2750
F 0 "#PWR?" H 10500 2600 50  0001 C CNN
F 1 "VCC" H 10517 2923 50  0000 C CNN
F 2 "" H 10500 2750 50  0001 C CNN
F 3 "" H 10500 2750 50  0001 C CNN
	1    10500 2750
	1    0    0    -1  
$EndComp
Text Notes 9250 2500 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
$Comp
L power:VCC #PWR?
U 1 1 5DB132A0
P 700 700
F 0 "#PWR?" H 700 550 50  0001 C CNN
F 1 "VCC" H 717 873 50  0000 C CNN
F 2 "" H 700 700 50  0001 C CNN
F 3 "" H 700 700 50  0001 C CNN
	1    700  700 
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C2
U 1 1 5D58E34B
P 700 1000
F 0 "C2" V 750 860 50  0000 L CNN
F 1 "C_0.1uF" V 560 840 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 738 850 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 725 1100 50  0001 C CNN
F 4 "DK" H 700 1000 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 700 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1125 1500 60  0001 C CNN "PurchasingLink"
	1    700  1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  700  700  850 
Wire Wire Line
	700  850  1050 850 
Connection ~ 700  850 
Connection ~ 1050 850 
Wire Wire Line
	1050 850  1350 850 
Wire Wire Line
	1200 3900 1200 3750
Wire Wire Line
	1200 3350 1350 3350
Wire Wire Line
	1350 3750 1200 3750
Connection ~ 1200 3750
Wire Wire Line
	1200 3750 1200 3350
NoConn ~ 1350 1550
Wire Wire Line
	3800 4050 3800 3950
Wire Wire Line
	3800 3950 3900 3950
Wire Wire Line
	4100 3950 4200 3950
Wire Wire Line
	4200 3950 4200 4050
Wire Wire Line
	4000 3800 4350 3800
Wire Wire Line
	4200 3950 4200 3650
Wire Wire Line
	4200 3650 3550 3650
Connection ~ 4200 3950
Wire Wire Line
	3800 3950 3800 3750
Wire Wire Line
	3800 3750 3550 3750
Connection ~ 3800 3950
Wire Wire Line
	4400 3400 4550 3400
Wire Wire Line
	4550 3400 4550 3250
Wire Wire Line
	9500 1000 9500 1150
Wire Wire Line
	9800 1200 9800 1000
Connection ~ 9800 1000
Wire Wire Line
	9800 1000 9800 850 
Wire Wire Line
	10300 1500 10400 1500
Wire Wire Line
	10400 1500 10400 1450
Wire Wire Line
	10400 1700 10400 1750
Wire Wire Line
	9500 5950 9500 6100
Wire Wire Line
	9800 5950 9800 6100
Wire Wire Line
	10200 5950 10200 6100
Wire Wire Line
	10600 5950 10600 6100
Wire Wire Line
	10900 5950 10900 6100
$Comp
L formula:TPS560430YF U101
U 1 1 5C75D405
P 2850 6700
F 0 "U101" H 2875 7165 50  0000 C CNN
F 1 "TPS560430YF" H 2875 7074 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 2800 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps560430.pdf" H 2850 7250 50  0001 C CNN
F 4 "TPS560430YFDBVR" H 2800 5600 50  0001 C CNN "MPN"
F 5 "TPS560430YFDBVR-ND" H 2850 5700 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 3600 5800 50  0001 C CNN "Purchasing Link"
	1    2850 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6500 3600 6500
Wire Wire Line
	3900 6500 4000 6500
Wire Wire Line
	4000 6500 4000 6650
Wire Wire Line
	3250 6650 4000 6650
Connection ~ 4000 6650
Wire Wire Line
	4000 6650 4050 6650
Wire Wire Line
	3400 7350 3500 7350
Wire Wire Line
	3900 7350 5750 7350
Wire Wire Line
	5750 7350 5750 6650
Wire Wire Line
	3500 6850 3500 7350
Connection ~ 3500 7350
Wire Wire Line
	3500 7350 3600 7350
Wire Wire Line
	3250 6850 3500 6850
Wire Wire Line
	4250 6650 4550 6650
Connection ~ 5750 6650
Connection ~ 4550 6650
Wire Wire Line
	4550 6650 4950 6650
Connection ~ 4950 6650
Wire Wire Line
	4950 6650 5350 6650
Connection ~ 5350 6650
Wire Wire Line
	5350 6650 5750 6650
Wire Wire Line
	6050 6650 6300 6650
Wire Wire Line
	6300 6650 6300 6500
Wire Wire Line
	6300 6750 6300 6650
Connection ~ 6300 6650
Wire Wire Line
	700  6250 700  6550
Wire Wire Line
	700  7000 700  7100
Wire Wire Line
	700  6550 900  6550
Connection ~ 700  6550
Wire Wire Line
	700  6550 700  6700
Wire Wire Line
	1200 6550 1450 6550
Connection ~ 1450 6550
Wire Wire Line
	1450 6550 1850 6550
Connection ~ 1850 6550
Wire Wire Line
	1850 6550 2150 6550
Connection ~ 2150 6550
Wire Wire Line
	2150 6550 2400 6550
Wire Wire Line
	1450 6850 1450 6950
Wire Wire Line
	1450 7250 1450 7400
Wire Wire Line
	2500 6800 2400 6800
Wire Wire Line
	2400 6800 2400 6550
Connection ~ 2400 6550
Wire Wire Line
	2400 6550 2500 6550
Wire Wire Line
	10300 1700 10400 1700
$Comp
L formula:MM_F_RA_20 J2
U 1 1 5DB7F701
P 5100 2250
F 0 "J2" H 5058 3597 60  0000 C CNN
F 1 "MM_F_RA_20" H 5058 3491 60  0000 C CNN
F 2 "footprints:micromatch_female_ra_20" H 4900 3350 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=338070&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=2-338070-0" H 5000 3450 60  0001 C CNN
F 4 "TE" H 5200 3650 60  0001 C CNN "MFN"
F 5 "2-338070-0" H 5300 3750 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-2-338070-0.html" H 5100 3550 60  0001 C CNN "PurchasingLink"
	1    5100 2250
	1    0    0    -1  
$EndComp
Text Label 5250 1450 0    50   ~ 0
CAN_LO
Text Label 5250 1350 0    50   ~ 0
CAN_HI
$Comp
L formula:LED_0805 D2
U 1 1 5DBF4B0C
P 8750 4400
F 0 "D2" H 8743 4145 50  0000 C CNN
F 1 "LED_0805" H 8743 4236 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 8650 4400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 8750 4500 50  0001 C CNN
F 4 "DK" H 8750 4400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 8750 4400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9150 4900 60  0001 C CNN "PurchasingLink"
	1    8750 4400
	-1   0    0    1   
$EndComp
$Comp
L formula:LED_0805 D1
U 1 1 5DBF4365
P 8750 4050
F 0 "D1" H 8743 3795 50  0000 C CNN
F 1 "LED_0805" H 8743 3886 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 8650 4050 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 8750 4150 50  0001 C CNN
F 4 "DK" H 8750 4050 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 8750 4050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9150 4550 60  0001 C CNN "PurchasingLink"
	1    8750 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 4050 9100 4050
Wire Wire Line
	9100 4050 9100 4400
Wire Wire Line
	8900 4400 9100 4400
Connection ~ 9100 4400
Text Label 8300 4050 2    50   ~ 0
COOLING_ACTIVE_LED
Text Label 8300 4400 2    50   ~ 0
TEMP_GOOD_LED
Wire Wire Line
	4100 3400 4100 3550
Wire Wire Line
	4100 3550 4400 3550
Wire Wire Line
	3550 3550 4100 3550
Connection ~ 4100 3550
$Comp
L formula:R_200 R4
U 1 1 5DCAEC1D
P 8450 4050
F 0 "R4" V 8657 4050 50  0000 C CNN
F 1 "R_200" V 8566 4050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 8380 4050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8530 4050 50  0001 C CNN
F 4 "DK" H 8450 4050 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 8450 4050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 8930 4450 60  0001 C CNN "PurchasingLink"
	1    8450 4050
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R5
U 1 1 5DCB5996
P 8450 4400
F 0 "R5" V 8657 4400 50  0000 C CNN
F 1 "R_200" V 8566 4400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 8380 4400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8530 4400 50  0001 C CNN
F 4 "DK" H 8450 4400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 8450 4400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 8930 4800 60  0001 C CNN "PurchasingLink"
	1    8450 4400
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R7
U 1 1 5DCE9EE6
P 10100 4000
F 0 "R7" V 10307 4000 50  0000 C CNN
F 1 "R_200" V 10216 4000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10030 4000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 10180 4000 50  0001 C CNN
F 4 "DK" H 10100 4000 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 10100 4000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10580 4400 60  0001 C CNN "PurchasingLink"
	1    10100 4000
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D4
U 1 1 5DCEA5AD
P 10400 4000
F 0 "D4" H 10393 3745 50  0000 C CNN
F 1 "LED_0805" H 10393 3836 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 10300 4000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10400 4100 50  0001 C CNN
F 4 "DK" H 10400 4000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10400 4000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10800 4500 60  0001 C CNN "PurchasingLink"
	1    10400 4000
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R8
U 1 1 5DCEADF0
P 10100 4350
F 0 "R8" V 10307 4350 50  0000 C CNN
F 1 "R_200" V 10216 4350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10030 4350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 10180 4350 50  0001 C CNN
F 4 "DK" H 10100 4350 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 10100 4350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10580 4750 60  0001 C CNN "PurchasingLink"
	1    10100 4350
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R9
U 1 1 5DCEB597
P 10100 4700
F 0 "R9" V 10307 4700 50  0000 C CNN
F 1 "R_200" V 10216 4700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10030 4700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 10180 4700 50  0001 C CNN
F 4 "DK" H 10100 4700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 10100 4700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10580 5100 60  0001 C CNN "PurchasingLink"
	1    10100 4700
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D5
U 1 1 5DCEBB62
P 10400 4350
F 0 "D5" H 10393 4095 50  0000 C CNN
F 1 "LED_0805" H 10393 4186 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 10300 4350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10400 4450 50  0001 C CNN
F 4 "DK" H 10400 4350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10400 4350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10800 4850 60  0001 C CNN "PurchasingLink"
	1    10400 4350
	-1   0    0    1   
$EndComp
$Comp
L formula:LED_0805 D6
U 1 1 5DCEC269
P 10400 4700
F 0 "D6" H 10393 4445 50  0000 C CNN
F 1 "LED_0805" H 10393 4536 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 10300 4700 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10400 4800 50  0001 C CNN
F 4 "DK" H 10400 4700 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10400 4700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10800 5200 60  0001 C CNN "PurchasingLink"
	1    10400 4700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DCECA51
P 10850 4800
F 0 "#PWR?" H 10850 4550 50  0001 C CNN
F 1 "GND" H 10855 4627 50  0000 C CNN
F 2 "" H 10850 4800 50  0001 C CNN
F 3 "" H 10850 4800 50  0001 C CNN
	1    10850 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 4000 10850 4000
Wire Wire Line
	10850 4000 10850 4350
Wire Wire Line
	10550 4350 10850 4350
Connection ~ 10850 4350
Wire Wire Line
	10850 4350 10850 4700
Wire Wire Line
	10550 4700 10850 4700
Connection ~ 10850 4700
Wire Wire Line
	10850 4700 10850 4800
Text Label 9950 4000 2    50   ~ 0
LED_1
Text Label 9950 4350 2    50   ~ 0
LED_2
Text Label 9950 4700 2    50   ~ 0
LED_3
Wire Notes Line
	9650 3650 11000 3650
Wire Notes Line
	11000 3650 11000 5050
Wire Notes Line
	11000 5050 9650 5050
Wire Notes Line
	9650 5050 9650 3650
Text Notes 7700 3600 0    89   ~ 0
SYSTEM STATUS LEDS\n
Text Notes 11000 3600 2    89   ~ 0
PROGRAMMING LEDS\n
Text Notes 4750 800  0    89   ~ 0
INPUT PINS\n
Text Label 5250 1250 0    50   ~ 0
12V
Text Label 5250 1150 0    50   ~ 0
GND
NoConn ~ 3550 1850
NoConn ~ 3550 2450
NoConn ~ 3550 3350
Text Label 3550 1150 0    50   ~ 0
LED_3
Text Label 5250 1550 0    50   ~ 0
PUMP_RELAY_READ
Wire Wire Line
	1050 1150 1350 1150
Wire Wire Line
	1050 1200 1050 1150
Connection ~ 1050 1150
Wire Wire Line
	6300 7150 6300 7050
Wire Wire Line
	6300 7550 6300 7450
$Sheet
S 5300 1600 1250 1400
U 5DD7ADE7
F0 "Logic_Sheet" 50
F1 "Logic_Sheet.sch" 50
F2 "SENSE_1-" I L 5300 1750 50 
F3 "SENSE_1+" I L 5300 1650 50 
F4 "SENSE_1_OUT" I R 6550 1650 50 
F5 "SENSE_2-" I L 5300 1950 50 
F6 "SENSE_2+" I L 5300 1850 50 
F7 "SENSE_2_OUT" I R 6550 1850 50 
F8 "SENSE_3-" I L 5300 2150 50 
F9 "SENSE_3+" I L 5300 2050 50 
F10 "SENSE_3_OUT" I R 6550 2050 50 
F11 "SENSE_4-" I L 5300 2350 50 
F12 "SENSE_4+" I L 5300 2250 50 
F13 "SENSE_4_OUT" I R 6550 2250 50 
F14 "SENSE_5-" I L 5300 2550 50 
F15 "SENSE_5+" I L 5300 2450 50 
F16 "SENSE_5_OUT" I R 6550 2450 50 
F17 "SENSE_6-" I L 5300 2750 50 
F18 "SENSE_6+" I L 5300 2650 50 
F19 "SENSE_6_OUT" I R 6550 2650 50 
F20 "SENSE_7-" I L 5300 2950 50 
F21 "SENSE_7+" I L 5300 2850 50 
F22 "SENSE_7_OUT" I R 6550 2850 50 
$EndSheet
$Comp
L formula:SSM3K333R Q1
U 1 1 5E0A4B82
P 8400 2400
F 0 "Q1" H 8606 2446 50  0000 L CNN
F 1 "SSM3K333R" H 8606 2355 50  0000 L CNN
F 2 "footprints:SOT-23F" H 8600 2325 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 8600 2475 50  0001 L CNN
F 4 "DK" H 8900 2775 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 8800 2675 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 8700 2575 60  0001 C CNN "PurchasingLink"
	1    8400 2400
	1    0    0    -1  
$EndComp
Text Label 8500 2200 0    50   ~ 0
PUMP_RELAY_READ
$Comp
L power:GND #PWR?
U 1 1 5E0A4B89
P 8500 2600
F 0 "#PWR?" H 8500 2350 50  0001 C CNN
F 1 "GND" H 8505 2427 50  0000 C CNN
F 2 "" H 8500 2600 50  0001 C CNN
F 3 "" H 8500 2600 50  0001 C CNN
	1    8500 2600
	1    0    0    -1  
$EndComp
Text Label 7700 2400 2    50   ~ 0
PUMP_CONTROL
Text Notes 8600 2000 2    89   ~ 0
PUMP CONTROL
$Comp
L formula:R_10K R10
U 1 1 5E0A4B94
P 8200 2550
F 0 "R10" H 8130 2504 50  0000 R CNN
F 1 "R_10K" H 8130 2595 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 8130 2550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8280 2550 50  0001 C CNN
F 4 "DK" H 8200 2550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8200 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8680 2950 60  0001 C CNN "PurchasingLink"
	1    8200 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 5E0A4B9A
P 7800 2850
F 0 "D3" V 7839 2733 50  0000 R CNN
F 1 "LED" V 7748 2733 50  0000 R CNN
F 2 "" H 7800 2850 50  0001 C CNN
F 3 "~" H 7800 2850 50  0001 C CNN
	1    7800 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0A4BA0
P 7800 3000
F 0 "#PWR?" H 7800 2750 50  0001 C CNN
F 1 "GND" H 7805 2827 50  0000 C CNN
F 2 "" H 7800 3000 50  0001 C CNN
F 3 "" H 7800 3000 50  0001 C CNN
	1    7800 3000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R6
U 1 1 5E0A4BA9
P 7800 2550
F 0 "R6" H 7730 2504 50  0000 R CNN
F 1 "R_200" H 7730 2595 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 7730 2550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 7880 2550 50  0001 C CNN
F 4 "DK" H 7800 2550 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 7800 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 8280 2950 60  0001 C CNN "PurchasingLink"
	1    7800 2550
	-1   0    0    1   
$EndComp
Text Notes 7950 3050 0    50   ~ 0
INTENTION LED
Wire Wire Line
	7700 2400 7800 2400
Wire Wire Line
	7800 2400 8200 2400
Connection ~ 7800 2400
Connection ~ 8200 2400
$Comp
L power:GND #PWR?
U 1 1 5E0A4BB4
P 8200 2700
F 0 "#PWR?" H 8200 2450 50  0001 C CNN
F 1 "GND" H 8205 2527 50  0000 C CNN
F 2 "" H 8200 2700 50  0001 C CNN
F 3 "" H 8200 2700 50  0001 C CNN
	1    8200 2700
	1    0    0    -1  
$EndComp
Wire Notes Line
	7100 3250 7100 2100
$Comp
L power:GND #PWR?
U 1 1 5DF048E8
P 5250 3050
F 0 "#PWR?" H 5250 2800 50  0001 C CNN
F 1 "GND" H 5255 2877 50  0000 C CNN
F 2 "" H 5250 3050 50  0001 C CNN
F 3 "" H 5250 3050 50  0001 C CNN
	1    5250 3050
	1    0    0    -1  
$EndComp
Text Label 3550 1250 0    50   ~ 0
COOLING_ACTIVE_LED
Wire Wire Line
	9100 4400 9100 4500
$Comp
L power:GND #PWR?
U 1 1 5DC0C20C
P 9100 4500
F 0 "#PWR?" H 9100 4250 50  0001 C CNN
F 1 "GND" H 9105 4327 50  0000 C CNN
F 2 "" H 9100 4500 50  0001 C CNN
F 3 "" H 9100 4500 50  0001 C CNN
	1    9100 4500
	1    0    0    -1  
$EndComp
Wire Notes Line
	9250 4750 9250 3700
Text Label 3550 1750 0    50   ~ 0
TEMP_GOOD_LED
Wire Wire Line
	10400 1750 10550 1750
Wire Wire Line
	10400 1450 10550 1450
$Comp
L formula:R_120_DNP R2
U 1 1 5DE61D36
P 10550 1600
F 0 "R2" H 10620 1646 50  0000 L CNN
F 1 "R_120_DNP" H 10620 1555 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9350 1750 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 9350 2050 50  0001 L CNN
F 4 "DK" H 10550 1600 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 9350 1850 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 9350 1950 60  0001 L CNN "PurchasingLink"
	1    10550 1600
	1    0    0    -1  
$EndComp
Connection ~ 10550 1450
Wire Wire Line
	10550 1450 10750 1450
Connection ~ 10550 1750
Wire Wire Line
	10550 1750 10750 1750
Text Label 3550 2250 0    50   ~ 0
PUMP_RELAY_READ
Wire Notes Line
	9200 3250 9200 2100
Wire Notes Line
	7100 2100 9200 2100
Wire Notes Line
	7100 3250 9200 3250
Wire Notes Line
	7500 4750 7500 3700
Wire Notes Line
	7500 3700 9250 3700
Wire Notes Line
	7500 4750 9250 4750
Wire Wire Line
	5300 1650 5250 1650
Wire Wire Line
	5300 1750 5250 1750
Wire Wire Line
	5300 1850 5250 1850
Wire Wire Line
	5300 1950 5250 1950
Wire Wire Line
	5300 2050 5250 2050
Wire Wire Line
	5300 2150 5250 2150
Wire Wire Line
	5300 2250 5250 2250
Wire Wire Line
	5300 2350 5250 2350
Wire Wire Line
	5300 2450 5250 2450
Wire Wire Line
	5300 2550 5250 2550
Wire Wire Line
	5300 2650 5250 2650
Wire Wire Line
	5300 2750 5250 2750
Wire Wire Line
	5300 2850 5250 2850
Wire Wire Line
	5300 2950 5250 2950
Text Label 6600 1650 0    50   ~ 0
READ_1
Text Label 6600 1850 0    50   ~ 0
READ_2
Text Label 6600 2050 0    50   ~ 0
READ_3
Text Label 6600 2250 0    50   ~ 0
READ_4
Text Label 6600 2450 0    50   ~ 0
READ_5
Text Label 6600 2650 0    50   ~ 0
READ_6
Text Label 6600 2850 0    50   ~ 0
READ_7
Wire Wire Line
	6550 1650 6600 1650
Wire Wire Line
	6550 1850 6600 1850
Wire Wire Line
	6550 2050 6600 2050
Wire Wire Line
	6550 2250 6600 2250
Wire Wire Line
	6550 2450 6600 2450
Wire Wire Line
	6550 2650 6600 2650
Wire Wire Line
	6550 2850 6600 2850
Text Label 3550 1050 0    50   ~ 0
READ_5
Text Label 3550 1350 0    50   ~ 0
READ_3
Text Label 3550 1450 0    50   ~ 0
READ_2
Text Label 3550 1550 0    50   ~ 0
READ_1
Text Label 3550 2150 0    50   ~ 0
READ_4
Text Label 3550 3150 0    50   ~ 0
READ_7
Text Label 3550 3250 0    50   ~ 0
READ_6
Text Label 3550 2350 0    50   ~ 0
PUMP_CONTROL
$Comp
L power:VCC #PWR?
U 1 1 5DF48159
P 6300 6500
F 0 "#PWR?" H 6300 6350 50  0001 C CNN
F 1 "VCC" H 6317 6673 50  0000 C CNN
F 2 "" H 6300 6500 50  0001 C CNN
F 3 "" H 6300 6500 50  0001 C CNN
	1    6300 6500
	1    0    0    -1  
$EndComp
$Comp
L formula:ATMEGA16M1 U2
U 1 1 5D58A7A6
P 2450 2550
F 0 "U2" H 3350 4410 50  0000 C CNN
F 1 "ATMEGA16M1" H 1750 4400 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2450 2550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1500 4380 50  0001 C CNN
F 4 "DK" H 2450 2550 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2450 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 1900 4780 60  0001 C CNN "PurchasingLink"
	1    2450 2550
	1    0    0    -1  
$EndComp
Text Label 3550 2750 0    50   ~ 0
LED_2
Text Label 3550 2650 0    50   ~ 0
LED_1
NoConn ~ 3550 850 
NoConn ~ 3550 950 
$Comp
L formula:Test_Point_SMD TP1
U 1 1 5E429057
P 8150 5450
F 0 "TP1" H 8228 5538 50  0000 L CNN
F 1 "Test_Point_SMD" H 8228 5447 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 8150 5300 50  0001 C CNN
F 3 "" H 8150 5450 50  0001 C CNN
	1    8150 5450
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 5E42FEC6
P 8150 6100
F 0 "TP3" H 8228 6188 50  0000 L CNN
F 1 "Test_Point_SMD" H 8228 6097 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 8150 5950 50  0001 C CNN
F 3 "" H 8150 6100 50  0001 C CNN
	1    8150 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E430843
P 8150 6150
F 0 "#PWR?" H 8150 5900 50  0001 C CNN
F 1 "GND" H 8155 5977 50  0000 C CNN
F 2 "" H 8150 6150 50  0001 C CNN
F 3 "" H 8150 6150 50  0001 C CNN
	1    8150 6150
	1    0    0    -1  
$EndComp
Text Label 8150 5500 3    50   ~ 0
12V
$Comp
L formula:Test_Point_SMD TP2
U 1 1 5E441894
P 8150 5800
F 0 "TP2" H 8228 5888 50  0000 L CNN
F 1 "Test_Point_SMD" H 8228 5797 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 8150 5650 50  0001 C CNN
F 3 "" H 8150 5800 50  0001 C CNN
	1    8150 5800
	1    0    0    -1  
$EndComp
Text Label 8150 5850 3    50   ~ 0
5V
Text Notes 7750 5400 0    89   ~ 0
TESTING POINTS\n\n
$EndSCHEMATC
