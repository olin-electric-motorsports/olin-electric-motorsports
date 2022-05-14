EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "OEM 9-Axis IMU"
Date "2021-12-2"
Rev "v01"
Comp "Olin Electric Motorsports"
Comment1 "Drew Pang"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE168D
P 2700 6500
F 0 "#PWR?" H 2700 6250 50  0001 C CNN
F 1 "GND" H 2700 6300 50  0000 C CNN
F 2 "" H 2700 6500 50  0001 C CNN
F 3 "" H 2700 6500 50  0001 C CNN
	1    2700 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 2400 6500
F 0 "#PWR?" H 2400 6250 50  0001 C CNN
F 1 "GND" H 2405 6327 50  0000 C CNN
F 2 "" H 2400 6500 50  0001 C CNN
F 3 "" H 2400 6500 50  0001 C CNN
	1    2400 6500
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C102
U 1 1 5BEE2647
P 2700 6400
F 0 "C102" H 2750 6250 50  0000 L CNN
F 1 "C_2.2uF" H 2580 6650 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2738 6250 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2725 6500 50  0001 C CNN
F 4 "DK" H 2700 6400 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2700 6400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 3125 6900 60  0001 C CNN "PurchasingLink"
	1    2700 6400
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5BEE2923
P 2400 6350
F 0 "C101" H 2450 6200 50  0000 L CNN
F 1 "C_0.1uF" H 2230 6600 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2438 6200 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 2425 6450 50  0001 C CNN
F 4 "DK" H 2400 6350 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 2400 6350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 2825 6850 60  0001 C CNN "PurchasingLink"
	1    2400 6350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R103
U 1 1 5BEE2A52
P 4300 7000
F 0 "R103" V 4400 6950 50  0000 L CNN
F 1 "R_100K" V 4200 6850 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4230 7000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 4380 7000 50  0001 C CNN
F 4 "DK" H 4300 7000 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 4300 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 4780 7400 60  0001 C CNN "PurchasingLink"
	1    4300 7000
	0    1    1    0   
$EndComp
$Comp
L formula:C_0.1uF C103
U 1 1 5BEE239B
P 4300 6150
F 0 "C103" V 4240 6290 50  0000 C CNN
F 1 "C_0.1uF" V 4340 6350 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 4338 6000 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4325 6250 50  0001 C CNN
F 4 "DK" H 4300 6150 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 4300 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4725 6650 60  0001 C CNN "PurchasingLink"
	1    4300 6150
	0    -1   -1   0   
$EndComp
$Comp
L formula:C_22uF COUT101
U 1 1 5C061BB4
P 5100 6450
F 0 "COUT101" H 4990 6700 50  0000 L CNN
F 1 "C_22uF" H 5120 6350 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 5150 6050 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5150 6800 50  0001 C CNN
F 4 "DK" H 4900 6450 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 5150 5950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 5525 6950 60  0001 C CNN "PurchasingLink"
	1    5100 6450
	1    0    0    -1  
$EndComp
$Comp
L formula:C_47uF COUT103
U 1 1 5C062E7A
P 5900 6450
F 0 "COUT103" H 5800 6700 50  0000 L CNN
F 1 "C_47uF" H 5910 6350 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5938 6300 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 5925 6550 50  0001 C CNN
F 4 "DK" H 5900 6450 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 5900 6450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 6325 6950 60  0001 C CNN "PurchasingLink"
	1    5900 6450
	1    0    0    -1  
$EndComp
$Comp
L formula:C_33uF COUT102
U 1 1 5C08921B
P 5500 6450
F 0 "COUT102" H 5400 6700 50  0000 L CNN
F 1 "C_33uF" H 5510 6350 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 5550 6050 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 5500 7100 50  0001 C CNN
F 4 "C4532X7R1C336M250KC" H 5550 5950 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 5500 6800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 5750 6950 60  0001 C CNN "PurchasingLink"
	1    5500 6450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_25K R102
U 1 1 5C0B315C
P 3800 7000
F 0 "R102" V 3900 6950 50  0000 L CNN
F 1 "R_25K" V 3700 6900 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3850 6450 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" H 3800 6600 50  0001 C CNN
F 4 "A124124CT-ND" H 3200 7000 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B25KE" H 3850 7500 60  0001 C CNN "Digi-key Part Number"
F 6 "https://www.digikey.com/product-detail/en/te-connectivity-passive-product/CPF-A-0805B25KE/A124124CT-ND/5970044" H 3850 7400 60  0001 C CNN "PurchasingLink"
	1    3800 7000
	0    1    1    0   
$EndComp
$Comp
L formula:F_500mA_16V F101
U 1 1 5C0BFA29
P 1350 6200
F 0 "F101" V 1430 6200 50  0000 C CNN
F 1 "F_500mA_16V" V 1250 6220 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 1280 6200 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1430 6200 50  0001 C CNN
F 4 "DK" H 1350 6200 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1350 6200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1830 6600 60  0001 C CNN "PurchasingLink"
	1    1350 6200
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 6600 7150
F 0 "D103" V 6800 7130 50  0000 R CNN
F 1 "LED_0805" V 6710 7130 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6500 7150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6600 7250 50  0001 C CNN
F 4 "DK" H 6600 7150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6600 7150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7000 7650 60  0001 C CNN "PurchasingLink"
	1    6600 7150
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 6600 6550
F 0 "R105" H 6670 6596 50  0000 L CNN
F 1 "R_200" H 6670 6505 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6530 6550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6680 6550 50  0001 C CNN
F 4 "DK" H 6600 6550 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6600 6550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7080 6950 60  0001 C CNN "PurchasingLink"
	1    6600 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 6600 7500
F 0 "#PWR?" H 6600 7250 50  0001 C CNN
F 1 "GND" H 6605 7327 50  0000 C CNN
F 2 "" H 6600 7500 50  0001 C CNN
F 3 "" H 6600 7500 50  0001 C CNN
	1    6600 7500
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 1600 6500
F 0 "D101" H 1590 6690 50  0000 C CNN
F 1 "D_Zener_18V" H 1580 6600 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1500 6500 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1600 6600 50  0001 C CNN
F 4 "DK" H 1800 6800 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1700 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 2000 7000 60  0001 C CNN "PurchasingLink"
	1    1600 6500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 1600 6750
F 0 "#PWR?" H 1600 6500 50  0001 C CNN
F 1 "GND" H 1605 6577 50  0000 C CNN
F 2 "" H 1600 6750 50  0001 C CNN
F 3 "" H 1600 6750 50  0001 C CNN
	1    1600 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 2000 6800
F 0 "D102" V 2038 6683 50  0000 R CNN
F 1 "LED_0805" V 1947 6683 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1900 6800 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2000 6900 50  0001 C CNN
F 4 "DK" H 2000 6800 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2000 6800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2400 7300 60  0001 C CNN "PurchasingLink"
	1    2000 6800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 2000 7050
F 0 "#PWR?" H 2000 6800 50  0001 C CNN
F 1 "GND" H 2005 6877 50  0000 C CNN
F 2 "" H 2000 7050 50  0001 C CNN
F 3 "" H 2000 7050 50  0001 C CNN
	1    2000 7050
	1    0    0    -1  
$EndComp
Text Notes 2250 6100 0    50   ~ 0
Input Capacitors\n\n
Text Notes 1900 7100 1    50   ~ 0
12V Indicator
Text Notes 1500 6750 1    50   ~ 0
Protection\n
Text Notes 2900 5850 0    89   ~ 0
BUCK CONVERTER\n
$Comp
L power:GND #PWR?
U 1 1 5C77960D
P 3650 7300
F 0 "#PWR?" H 3650 7050 50  0001 C CNN
F 1 "GND" H 3655 7127 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
Text Notes 3750 7250 0    50   ~ 0
Feedback Divider\n
Text Notes 3900 6000 0    50   ~ 0
Bootstrap Capacitor\n
Text Notes 5200 6050 0    50   ~ 0
Output Capacitors\n
$Comp
L power:GND #PWR?
U 1 1 5C7815F8
P 5500 6600
F 0 "#PWR?" H 5500 6350 50  0001 C CNN
F 1 "GND" H 5505 6427 50  0000 C CNN
F 2 "" H 5500 6600 50  0001 C CNN
F 3 "" H 5500 6600 50  0001 C CNN
	1    5500 6600
	1    0    0    -1  
$EndComp
Text Notes 6450 7400 1    50   ~ 0
5V Indicator
Text Label 3900 2350 0    50   ~ 0
CAN_TX
Text Label 3900 2450 0    50   ~ 0
CAN_RX
Text Label 3900 1250 0    50   ~ 0
MISO
Text Label 3900 1350 0    50   ~ 0
MOSI
Text Label 4550 3950 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1400 1400
F 0 "R1" V 1300 1350 50  0000 L CNN
F 1 "R_100" V 1490 1280 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 600 1550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1100 1900 50  0001 C CNN
F 4 "DK" H 1400 1400 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 750 1650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1880 1800 60  0001 C CNN "PurchasingLink"
	1    1400 1400
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C3
U 1 1 5D58E505
P 1400 1700
F 0 "C3" V 1450 1550 50  0000 L CNN
F 1 "C_100pF" V 1250 1520 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1438 1550 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1425 1800 50  0001 C CNN
F 4 "DK" H 1400 1700 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1400 1700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1825 2200 60  0001 C CNN "PurchasingLink"
	1    1400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 1050 1550
F 0 "#PWR?" H 1050 1300 50  0001 C CNN
F 1 "GND" H 1055 1377 50  0000 C CNN
F 2 "" H 1050 1550 50  0001 C CNN
F 3 "" H 1050 1550 50  0001 C CNN
	1    1050 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1400 1850
F 0 "#PWR?" H 1400 1600 50  0001 C CNN
F 1 "GND" H 1405 1677 50  0000 C CNN
F 2 "" H 1400 1850 50  0001 C CNN
F 3 "" H 1400 1850 50  0001 C CNN
	1    1400 1850
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4350 4350
F 0 "Y1" H 4060 4420 50  0000 L CNN
F 1 "Crystal_SMD" H 3670 4350 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4300 4425 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4400 4525 50  0001 C CNN
F 4 "DK" H 4350 4350 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4350 4350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4800 4925 60  0001 C CNN "PurchasingLink"
	1    4350 4350
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB5B2
P 4150 4600
F 0 "C4" H 4040 4680 50  0000 L CNN
F 1 "C_30pF" H 3880 4520 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4188 4450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4175 4700 50  0001 C CNN
F 4 "DK" H 4150 4600 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4150 4600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4575 5100 60  0001 C CNN "PurchasingLink"
	1    4150 4600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB694
P 4550 4600
F 0 "C5" H 4570 4680 50  0000 L CNN
F 1 "C_30pF" H 4580 4500 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4588 4450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4575 4700 50  0001 C CNN
F 4 "DK" H 4550 4600 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4550 4600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4975 5100 60  0001 C CNN "PurchasingLink"
	1    4550 4600
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5D5EB7F3
P 4400 3750
F 0 "R3" V 4320 3750 50  0000 C CNN
F 1 "R_10K" V 4450 4000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4330 3750 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4480 3750 50  0001 C CNN
F 4 "DK" H 4400 3750 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4400 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4880 4150 60  0001 C CNN "PurchasingLink"
	1    4400 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 4150 4750
F 0 "#PWR?" H 4150 4500 50  0001 C CNN
F 1 "GND" H 4155 4577 50  0000 C CNN
F 2 "" H 4150 4750 50  0001 C CNN
F 3 "" H 4150 4750 50  0001 C CNN
	1    4150 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4550 4750
F 0 "#PWR?" H 4550 4500 50  0001 C CNN
F 1 "GND" H 4555 4577 50  0000 C CNN
F 2 "" H 4550 4750 50  0001 C CNN
F 3 "" H 4550 4750 50  0001 C CNN
	1    4550 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4350 4500
F 0 "#PWR?" H 4350 4250 50  0001 C CNN
F 1 "GND" H 4355 4327 50  0000 C CNN
F 2 "" H 4350 4500 50  0001 C CNN
F 3 "" H 4350 4500 50  0001 C CNN
	1    4350 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4700 4200
F 0 "#PWR?" H 4700 3950 50  0001 C CNN
F 1 "GND" H 4705 4027 50  0000 C CNN
F 2 "" H 4700 4200 50  0001 C CNN
F 3 "" H 4700 4200 50  0001 C CNN
	1    4700 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1550 4300
F 0 "#PWR?" H 1550 4050 50  0001 C CNN
F 1 "GND" H 1555 4127 50  0000 C CNN
F 2 "" H 1550 4300 50  0001 C CNN
F 3 "" H 1550 4300 50  0001 C CNN
	1    1550 4300
	1    0    0    -1  
$EndComp
Text Notes 8000 1000 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2500 1050 0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3800 5150 0    89   ~ 0
16 MHz CRYSTAL\n
Connection ~ 1400 1550
$Comp
L formula:C_0.1uF C2
U 1 1 5D58E34B
P 1050 1400
F 0 "C2" V 1100 1260 50  0000 L CNN
F 1 "C_0.1uF" V 910 1240 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1088 1250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1075 1500 50  0001 C CNN
F 4 "DK" H 1050 1400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1050 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1475 1900 60  0001 C CNN "PurchasingLink"
	1    1050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1250 1400 1250
Connection ~ 1400 1250
Wire Wire Line
	1550 4300 1550 4150
Connection ~ 1550 4150
Wire Wire Line
	1550 4150 1550 3750
NoConn ~ 1700 1950
Wire Wire Line
	4150 4450 4150 4350
Wire Wire Line
	4150 4350 4250 4350
Wire Wire Line
	4450 4350 4550 4350
Wire Wire Line
	4550 4350 4550 4450
Wire Wire Line
	4350 4200 4700 4200
Wire Wire Line
	4550 4350 4550 4050
Wire Wire Line
	4550 4050 3900 4050
Connection ~ 4550 4350
Wire Wire Line
	4150 4350 4150 4150
Wire Wire Line
	4150 4150 3900 4150
Connection ~ 4150 4350
Wire Wire Line
	3900 3950 4250 3950
Wire Wire Line
	4250 3950 4250 3750
Connection ~ 4250 3950
Wire Wire Line
	4250 3950 4550 3950
Wire Wire Line
	4550 3750 4700 3750
Wire Wire Line
	4450 6150 4550 6150
Wire Wire Line
	4550 6150 4550 6300
Connection ~ 4550 6300
Wire Wire Line
	4550 6300 4600 6300
Wire Wire Line
	3650 7000 3650 7300
Wire Wire Line
	3950 7000 4050 7000
Wire Wire Line
	4450 7000 6300 7000
Wire Wire Line
	6300 7000 6300 6300
Wire Wire Line
	4050 6500 4050 7000
Connection ~ 4050 7000
Wire Wire Line
	4050 7000 4150 7000
Wire Wire Line
	4800 6300 5100 6300
Connection ~ 6300 6300
Connection ~ 5100 6300
Wire Wire Line
	5100 6300 5500 6300
Connection ~ 5500 6300
Wire Wire Line
	5500 6300 5900 6300
Connection ~ 5900 6300
Wire Wire Line
	5900 6300 6300 6300
Wire Wire Line
	6600 6400 6600 6300
Wire Wire Line
	6600 7300 6600 7500
Wire Wire Line
	6600 6700 6600 7000
Wire Wire Line
	1600 6650 1600 6750
Connection ~ 2400 6200
Wire Wire Line
	2000 6950 2000 7050
Wire Wire Line
	2950 6450 2950 6200
Connection ~ 2950 6200
$Comp
L formula:R_1K R101
U 1 1 5DE6EFCB
P 2000 6400
F 0 "R101" H 2070 6446 50  0000 L CNN
F 1 "R_1K" H 2070 6355 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1930 6400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2080 6400 50  0001 C CNN
F 4 "DK" H 2000 6400 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2000 6400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2480 6800 60  0001 C CNN "PurchasingLink"
	1    2000 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6200 2400 6200
Connection ~ 2000 6200
Text Notes 4550 6150 0    50   ~ 0
Inductor\n
$Comp
L power:GND #PWR?
U 1 1 5F87F709
P 5100 6600
F 0 "#PWR?" H 5100 6350 50  0001 C CNN
F 1 "GND" H 5105 6427 50  0000 C CNN
F 2 "" H 5100 6600 50  0001 C CNN
F 3 "" H 5100 6600 50  0001 C CNN
	1    5100 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F87F995
P 5900 6600
F 0 "#PWR?" H 5900 6350 50  0001 C CNN
F 1 "GND" H 5905 6427 50  0000 C CNN
F 2 "" H 5900 6600 50  0001 C CNN
F 3 "" H 5900 6600 50  0001 C CNN
	1    5900 6600
	1    0    0    -1  
$EndComp
$Comp
L formula:L_100uH L101
U 1 1 5F881F17
P 4700 6300
F 0 "L101" H 4700 6400 50  0000 C CNN
F 1 "L_100uH" H 4700 6250 50  0000 C CNN
F 2 "footprints:L_100uH_OEM" H 4600 6100 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_commercial_decoupling_nlfv32-ef_en.pdf" H 4600 6150 50  0001 C CNN
F 4 "Digikey" H 4800 6100 50  0001 C CNN "MFN"
F 5 "445-15759-1-ND" H 4700 6550 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 5000 6500 50  0001 C CNN "Link"
	1    4700 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6200 1200 6200
Wire Wire Line
	1500 6200 1600 6200
Wire Wire Line
	1600 6350 1600 6200
Connection ~ 1600 6200
Wire Wire Line
	1600 6200 2000 6200
Wire Wire Line
	2400 6200 2700 6200
$Comp
L power:+5V #PWR?
U 1 1 5FD33116
P 6850 5850
F 0 "#PWR?" H 6850 5700 50  0001 C CNN
F 1 "+5V" H 6865 6023 50  0000 C CNN
F 2 "" H 6850 5850 50  0001 C CNN
F 3 "" H 6850 5850 50  0001 C CNN
	1    6850 5850
	1    0    0    -1  
$EndComp
Connection ~ 2700 6200
Wire Wire Line
	2700 6200 2950 6200
Wire Wire Line
	2000 6200 2000 6250
Wire Wire Line
	2000 6550 2000 6650
Wire Wire Line
	6300 6300 6600 6300
Wire Wire Line
	6850 6300 6850 6250
Connection ~ 6600 6300
Wire Wire Line
	6600 6300 6850 6300
$Comp
L formula:ICM-20948 U3
U 1 1 618EE847
P 6200 2300
F 0 "U3" H 6750 3100 50  0000 C CNN
F 1 "ICM-20948" H 6750 3000 50  0000 C CNN
F 2 "Sensor_Motion:InvenSense_QFN-24_3x3mm_P0.4mm" H 6200 1300 50  0001 C CNN
F 3 "http://www.invensense.com/wp-content/uploads/2016/06/DS-000189-ICM-20948-v1.3.pdf" H 6200 2150 50  0001 C CNN
	1    6200 2300
	1    0    0    -1  
$EndComp
Text Notes 5700 1000 0    89   ~ 0
9-AXIS IMU
$Comp
L formula:NCP110AMX180TBG LDO1
U 1 1 61AA1E14
P 6100 4550
F 0 "LDO1" H 6325 4975 50  0000 C CNN
F 1 "NCP110AMX180TBG" H 6325 4884 50  0000 C CNN
F 2 "footprints:VREG_NCP170AMX135TCG" H 6050 4700 50  0001 C CNN
F 3 "https://www.onsemi.com/pdf/datasheet/ncp110-d.pdf" H 6050 4700 50  0001 C CNN
F 4 "https://www.mouser.com/ProductDetail/onsemi/NCP110AMX180TBG?qs=f9yNj16SXrJuTjfcDZVbNA%3D%3D" H 6100 4550 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/en/products/detail/onsemi/NCP110AMX180TBG/8258541?s=N4IgTCBcDaIHIGEAKBGFAGAggWQBooA50AVAIQHEQBdAXyA" H 6100 4550 50  0001 C CNN "Alt Purchasing Link"
	1    6100 4550
	1    0    0    -1  
$EndComp
Text Notes 5450 3850 0    89   ~ 0
LINEAR VOLTAGE REGULATOR
$Comp
L power:GND #PWR?
U 1 1 61AC6492
P 6200 3050
F 0 "#PWR?" H 6200 2800 50  0001 C CNN
F 1 "GND" H 6205 2877 50  0000 C CNN
F 2 "" H 6200 3050 50  0001 C CNN
F 3 "" H 6200 3050 50  0001 C CNN
	1    6200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4500 6000 4350
Connection ~ 6000 4350
Wire Wire Line
	5850 4350 6000 4350
$Comp
L formula:C_1uF C6
U 1 1 61AE8A0E
P 5850 4750
F 0 "C6" H 5965 4846 50  0000 L CNN
F 1 "C_1uF" H 5965 4755 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5888 5350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 5875 5600 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 6275 5250 60  0001 C CNN "PurchasingLink"
	1    5850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4550 5850 4350
$Comp
L formula:C_1uF C8
U 1 1 61AF2BC9
P 6900 4750
F 0 "C8" H 7015 4846 50  0000 L CNN
F 1 "C_1uF" H 7015 4755 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6938 5350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 6925 5600 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 7325 5250 60  0001 C CNN "PurchasingLink"
	1    6900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4350 6900 4350
Wire Wire Line
	6900 4550 6900 4350
Connection ~ 6900 4350
Connection ~ 6100 1400
Wire Wire Line
	6100 1400 6100 1600
Wire Wire Line
	6100 1400 5900 1400
$Comp
L power:GND #PWR?
U 1 1 61B0A2E1
P 5600 1550
F 0 "#PWR?" H 5600 1300 50  0001 C CNN
F 1 "GND" H 5605 1377 50  0000 C CNN
F 2 "" H 5600 1550 50  0001 C CNN
F 3 "" H 5600 1550 50  0001 C CNN
	1    5600 1550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C7
U 1 1 61B0D0A4
P 5750 1400
F 0 "C7" V 5498 1400 50  0000 C CNN
F 1 "C_0.1uF" V 5589 1400 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 5788 1250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5775 1500 50  0001 C CNN
F 4 "DK" H 5750 1400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 5750 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6175 1900 60  0001 C CNN "PurchasingLink"
	1    5750 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 1600 6300 1400
Wire Wire Line
	6100 1400 6300 1400
$Comp
L power:+1V8 #PWR?
U 1 1 61B1AE56
P 6100 1250
F 0 "#PWR?" H 6100 1100 50  0001 C CNN
F 1 "+1V8" H 6115 1423 50  0000 C CNN
F 2 "" H 6100 1250 50  0001 C CNN
F 3 "" H 6100 1250 50  0001 C CNN
	1    6100 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 61B20C27
P 7050 4200
F 0 "#PWR?" H 7050 4050 50  0001 C CNN
F 1 "+1V8" H 7065 4373 50  0000 C CNN
F 2 "" H 7050 4200 50  0001 C CNN
F 3 "" H 7050 4200 50  0001 C CNN
	1    7050 4200
	1    0    0    -1  
$EndComp
Connection ~ 5850 4350
Wire Wire Line
	6100 1400 6100 1250
Wire Wire Line
	5600 1550 5600 1400
Wire Wire Line
	6200 3000 6200 3050
Wire Wire Line
	6900 4350 7050 4350
Wire Wire Line
	5700 4350 5850 4350
Wire Wire Line
	5700 2500 5550 2500
$Comp
L power:GND #PWR?
U 1 1 61B368BD
P 5550 2650
F 0 "#PWR?" H 5550 2400 50  0001 C CNN
F 1 "GND" H 5555 2477 50  0000 C CNN
F 2 "" H 5550 2650 50  0001 C CNN
F 3 "" H 5550 2650 50  0001 C CNN
	1    5550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2500 5550 2650
$Comp
L formula:C_0.1uF C9
U 1 1 61B3C24E
P 6900 2650
F 0 "C9" H 6785 2604 50  0000 R CNN
F 1 "C_0.1uF" H 6785 2695 50  0000 R CNN
F 2 "footprints:C_0805_OEM" H 6938 2500 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6925 2750 50  0001 C CNN
F 4 "DK" H 6900 2650 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6900 2650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7325 3150 60  0001 C CNN "PurchasingLink"
	1    6900 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 2500 6900 2500
$Comp
L power:GND #PWR?
U 1 1 61B4044E
P 6900 2800
F 0 "#PWR?" H 6900 2550 50  0001 C CNN
F 1 "GND" H 6905 2627 50  0000 C CNN
F 2 "" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AC572D
P 6650 4500
F 0 "#PWR?" H 6650 4250 50  0001 C CNN
F 1 "GND" H 6655 4327 50  0000 C CNN
F 2 "" H 6650 4500 50  0001 C CNN
F 3 "" H 6650 4500 50  0001 C CNN
	1    6650 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AF2BCF
P 6900 4850
F 0 "#PWR?" H 6900 4600 50  0001 C CNN
F 1 "GND" H 6905 4677 50  0000 C CNN
F 2 "" H 6900 4850 50  0001 C CNN
F 3 "" H 6900 4850 50  0001 C CNN
	1    6900 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AEBF96
P 5850 4850
F 0 "#PWR?" H 5850 4600 50  0001 C CNN
F 1 "GND" H 5855 4677 50  0000 C CNN
F 2 "" H 5850 4850 50  0001 C CNN
F 3 "" H 5850 4850 50  0001 C CNN
	1    5850 4850
	1    0    0    -1  
$EndComp
Text Label 5700 2000 2    50   ~ 0
MISO
Text Label 5700 2100 2    50   ~ 0
MOSI
Text Label 5700 2200 2    50   ~ 0
SCK
Text Label 5700 2300 2    50   ~ 0
CS
Text Notes 10650 1000 0    89   ~ 0
PROGRAMMING LEDS & TEST POINTS
Text Label 3900 1650 0    50   ~ 0
P_LED1
Text Label 3900 1550 0    50   ~ 0
P_LED2
Text Label 3900 2750 0    50   ~ 0
P_LED3
Text Label 11950 1350 0    50   ~ 0
P_LED1
Text Label 11950 2350 0    50   ~ 0
P_LED3
Wire Wire Line
	10450 1350 10700 1350
Wire Wire Line
	10450 2350 10700 2350
$Comp
L formula:R_499 R4
U 1 1 61C2F9CD
P 10850 1350
F 0 "R4" V 10643 1350 50  0000 C CNN
F 1 "R_499" V 10734 1350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10780 1350 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 10930 1350 50  0001 C CNN
F 4 "DK" H 10850 1350 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 10850 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 11330 1750 60  0001 C CNN "PurchasingLink"
	1    10850 1350
	0    1    1    0   
$EndComp
$Comp
L formula:R_499 R6
U 1 1 61C3159D
P 10850 2350
F 0 "R6" V 10643 2350 50  0000 C CNN
F 1 "R_499" V 10734 2350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10780 2350 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 10930 2350 50  0001 C CNN
F 4 "DK" H 10850 2350 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 10850 2350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 11330 2750 60  0001 C CNN "PurchasingLink"
	1    10850 2350
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D3
U 1 1 61C3800B
P 11250 2350
F 0 "D3" H 11250 2550 50  0000 C CNN
F 1 "LED_0805" H 11250 2450 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 11150 2350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 11250 2450 50  0001 C CNN
F 4 "DK" H 11250 2350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 11250 2350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 11650 2850 60  0001 C CNN "PurchasingLink"
	1    11250 2350
	-1   0    0    1   
$EndComp
$Comp
L formula:LED_0805 D2
U 1 1 61C34070
P 11250 1850
F 0 "D2" H 11250 2050 50  0000 C CNN
F 1 "LED_0805" H 11250 1950 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 11150 1850 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 11250 1950 50  0001 C CNN
F 4 "DK" H 11250 1850 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 11250 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 11650 2350 60  0001 C CNN "PurchasingLink"
	1    11250 1850
	-1   0    0    1   
$EndComp
$Comp
L formula:R_499 R5
U 1 1 61C308EA
P 10850 1850
F 0 "R5" V 10643 1850 50  0000 C CNN
F 1 "R_499" V 10734 1850 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10780 1850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 10930 1850 50  0001 C CNN
F 4 "DK" H 10850 1850 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 10850 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 11330 2250 60  0001 C CNN "PurchasingLink"
	1    10850 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 1850 10700 1850
Text Label 11950 1850 0    50   ~ 0
P_LED2
$Comp
L formula:Test_Point_SMD TP1
U 1 1 61B60808
P 11750 1300
F 0 "TP1" H 11700 1500 50  0000 L CNN
F 1 "Test_Point_SMD" H 11500 1150 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 11750 1150 50  0001 C CNN
F 3 "" H 11750 1300 50  0001 C CNN
	1    11750 1300
	1    0    0    -1  
$EndComp
Connection ~ 11750 1350
Wire Wire Line
	11750 1350 11950 1350
$Comp
L formula:Test_Point_SMD TP2
U 1 1 61B6C90E
P 11750 1800
F 0 "TP2" H 11700 2000 50  0000 L CNN
F 1 "Test_Point_SMD" H 11700 1650 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 11750 1650 50  0001 C CNN
F 3 "" H 11750 1800 50  0001 C CNN
	1    11750 1800
	1    0    0    -1  
$EndComp
Connection ~ 11750 1850
Wire Wire Line
	11750 1850 11950 1850
$Comp
L formula:Test_Point_SMD TP3
U 1 1 61B6E666
P 11750 2300
F 0 "TP3" H 11700 2500 50  0000 L CNN
F 1 "Test_Point_SMD" H 11700 2150 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 11750 2150 50  0001 C CNN
F 3 "" H 11750 2300 50  0001 C CNN
	1    11750 2300
	1    0    0    -1  
$EndComp
Connection ~ 11750 2350
Wire Wire Line
	11750 2350 11950 2350
Wire Wire Line
	10450 1850 10450 2350
Connection ~ 10450 1850
Wire Wire Line
	10450 1350 10450 1850
$Comp
L formula:LED_0805 D1
U 1 1 61C3251D
P 11250 1350
F 0 "D1" H 11250 1550 50  0000 C CNN
F 1 "LED_0805" H 11250 1450 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 11150 1350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 11250 1450 50  0001 C CNN
F 4 "DK" H 11250 1350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 11250 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 11650 1850 60  0001 C CNN "PurchasingLink"
	1    11250 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	11000 1350 11100 1350
Wire Wire Line
	11400 1350 11750 1350
Wire Wire Line
	11000 1850 11100 1850
Wire Wire Line
	11400 1850 11750 1850
Wire Wire Line
	11400 2350 11750 2350
$Comp
L formula:Test_Point_SMD TP4
U 1 1 61BADBFC
P 12850 1350
F 0 "TP4" V 12799 1528 50  0000 L CNN
F 1 "Test_Point_SMD" V 12890 1528 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 12850 1200 50  0001 C CNN
F 3 "" H 12850 1350 50  0001 C CNN
	1    12850 1350
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP5
U 1 1 61BAE1C9
P 12850 1850
F 0 "TP5" V 12799 2028 50  0000 L CNN
F 1 "Test_Point_SMD" V 12890 2028 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 12850 1700 50  0001 C CNN
F 3 "" H 12850 1850 50  0001 C CNN
	1    12850 1850
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP6
U 1 1 61BB1C88
P 12850 2350
F 0 "TP6" V 12799 2528 50  0000 L CNN
F 1 "Test_Point_SMD" V 12890 2528 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 12850 2200 50  0001 C CNN
F 3 "" H 12850 2350 50  0001 C CNN
	1    12850 2350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61BCACDC
P 12650 1850
F 0 "#PWR?" H 12650 1700 50  0001 C CNN
F 1 "+5V" H 12665 2023 50  0000 C CNN
F 2 "" H 12650 1850 50  0001 C CNN
F 3 "" H 12650 1850 50  0001 C CNN
	1    12650 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 1850 12800 1850
Wire Wire Line
	12650 1350 12800 1350
Wire Wire Line
	12800 2350 12650 2350
$Comp
L power:+1V8 #PWR?
U 1 1 61BE4C67
P 12650 2350
F 0 "#PWR?" H 12650 2200 50  0001 C CNN
F 1 "+1V8" H 12665 2523 50  0000 C CNN
F 2 "" H 12650 2350 50  0001 C CNN
F 3 "" H 12650 2350 50  0001 C CNN
	1    12650 2350
	1    0    0    -1  
$EndComp
Wire Notes Line
	7400 800  7400 3350
Wire Notes Line
	7400 3350 5350 3350
Wire Notes Line
	5350 3350 5350 800 
Wire Notes Line
	5350 800  7400 800 
Wire Notes Line
	7700 800  10000 800 
Wire Notes Line
	13700 800  13700 2650
Wire Notes Line
	10300 800  10300 2650
Wire Notes Line
	10300 2650 13700 2650
Wire Notes Line
	10300 800  13700 800 
Wire Notes Line
	7450 3650 7450 5150
Wire Notes Line
	5350 3650 5350 5150
Wire Notes Line
	5350 3650 7450 3650
Wire Notes Line
	5350 5150 7450 5150
Wire Notes Line
	800  5250 5050 5250
Wire Notes Line
	5050 800  5050 5250
Wire Notes Line
	800  800  800  5250
Wire Notes Line
	7500 5550 7500 7800
Wire Notes Line
	7500 7800 800  7800
Wire Notes Line
	800  7800 800  5550
Wire Notes Line
	800  5550 7500 5550
NoConn ~ 3900 1750
NoConn ~ 3900 1850
NoConn ~ 3900 2150
NoConn ~ 3900 2250
NoConn ~ 3900 2650
NoConn ~ 3900 1450
NoConn ~ 3900 2850
NoConn ~ 3900 3050
NoConn ~ 3900 3150
NoConn ~ 3900 3650
NoConn ~ 3900 3750
NoConn ~ 6700 2300
NoConn ~ 6700 2200
NoConn ~ 5700 2600
Wire Wire Line
	11000 2350 11100 2350
Text Label 3900 3250 0    50   ~ 0
MISO_A
Text Label 3900 3350 0    50   ~ 0
MOSI_A
Text Label 3900 3450 0    50   ~ 0
SCK_A
Entry Wire Line
	-2850 9400 -2750 9500
$Comp
L power:+BATT #PWR?
U 1 1 61FFDEAE
P 1000 6000
F 0 "#PWR?" H 1000 5850 50  0001 C CNN
F 1 "+BATT" H 1015 6173 50  0000 C CNN
F 2 "" H 1000 6000 50  0001 C CNN
F 3 "" H 1000 6000 50  0001 C CNN
	1    1000 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6000 1000 6200
$Comp
L power:+BATT #PWR?
U 1 1 6200AC87
P 12650 1350
F 0 "#PWR?" H 12650 1200 50  0001 C CNN
F 1 "+BATT" H 12665 1523 50  0000 C CNN
F 2 "" H 12650 1350 50  0001 C CNN
F 3 "" H 12650 1350 50  0001 C CNN
	1    12650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6300 4550 6300
Wire Wire Line
	2950 6200 3050 6200
Wire Wire Line
	3050 6450 2950 6450
Wire Wire Line
	3800 6500 4050 6500
$Comp
L power:GND #PWR?
U 1 1 5BEE119A
P 3450 6750
F 0 "#PWR?" H 3450 6500 50  0001 C CNN
F 1 "GND" H 3455 6577 50  0000 C CNN
F 2 "" H 3450 6750 50  0001 C CNN
F 3 "" H 3450 6750 50  0001 C CNN
	1    3450 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6150 4150 6150
$Comp
L formula:TPS560430YF U101
U 1 1 5C75D405
P 3400 6350
F 0 "U101" H 3425 6815 50  0000 C CNN
F 1 "TPS560430YF" H 3425 6724 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 3350 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps560430.pdf" H 3400 6900 50  0001 C CNN
F 4 "TPS560430YFDBVR" H 3350 5250 50  0001 C CNN "MPN"
F 5 "TPS560430YFDBVR-ND" H 3400 5350 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 4150 5450 50  0001 C CNN "Purchasing Link"
	1    3400 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621183A6
P 4700 3650
F 0 "#PWR?" H 4700 3500 50  0001 C CNN
F 1 "+5V" H 4715 3823 50  0000 C CNN
F 2 "" H 4700 3650 50  0001 C CNN
F 3 "" H 4700 3650 50  0001 C CNN
	1    4700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3750 4700 3650
$Comp
L power:+5V #PWR?
U 1 1 6211CD12
P 5700 4200
F 0 "#PWR?" H 5700 4050 50  0001 C CNN
F 1 "+5V" H 5715 4373 50  0000 C CNN
F 2 "" H 5700 4200 50  0001 C CNN
F 3 "" H 5700 4200 50  0001 C CNN
	1    5700 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4200 5700 4350
Wire Wire Line
	7050 4200 7050 4350
Wire Notes Line
	800  800  5050 800 
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 1050 1100
F 0 "#PWR?" H 1050 950 50  0001 C CNN
F 1 "+5V" H 1065 1273 50  0000 C CNN
F 2 "" H 1050 1100 50  0001 C CNN
F 3 "" H 1050 1100 50  0001 C CNN
	1    1050 1100
	1    0    0    -1  
$EndComp
Connection ~ 1050 1250
Wire Wire Line
	1050 1100 1050 1250
Wire Wire Line
	10400 3500 10400 3650
$Comp
L power:+BATT #PWR?
U 1 1 61FD9B5F
P 10400 3500
F 0 "#PWR?" H 10400 3350 50  0001 C CNN
F 1 "+BATT" H 10415 3673 50  0000 C CNN
F 2 "" H 10400 3500 50  0001 C CNN
F 3 "" H 10400 3500 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
Wire Notes Line
	10150 3000 11600 3000
Wire Notes Line
	10150 3950 10150 3000
Wire Notes Line
	11600 3950 10150 3950
Wire Notes Line
	11600 3000 11600 3950
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 11300 3650
F 0 "#PWR?" H 11300 3400 50  0001 C CNN
F 1 "GND" H 11305 3477 50  0000 C CNN
F 2 "" H 11300 3650 50  0001 C CNN
F 3 "" H 11300 3650 50  0001 C CNN
	1    11300 3650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 11300 3500
F 0 "#FLG?" H 11300 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 11300 3674 50  0000 C CNN
F 2 "" H 11300 3500 50  0001 C CNN
F 3 "~" H 11300 3500 50  0001 C CNN
	1    11300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 3500 11300 3650
Text Notes 10450 3200 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 10850 3500
F 0 "#PWR?" H 10850 3350 50  0001 C CNN
F 1 "+5V" H 10865 3673 50  0000 C CNN
F 2 "" H 10850 3500 50  0001 C CNN
F 3 "" H 10850 3500 50  0001 C CNN
	1    10850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 3650 10850 3500
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 10850 3650
F 0 "#FLG?" H 10850 3725 50  0001 C CNN
F 1 "PWR_FLAG" H 10850 3824 50  0000 C CNN
F 2 "" H 10850 3650 50  0001 C CNN
F 3 "~" H 10850 3650 50  0001 C CNN
	1    10850 3650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 10400 3650
F 0 "#FLG?" H 10400 3725 50  0001 C CNN
F 1 "PWR_FLAG" H 10400 3824 50  0000 C CNN
F 2 "" H 10400 3650 50  0001 C CNN
F 3 "~" H 10400 3650 50  0001 C CNN
	1    10400 3650
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 61FF5303
P 8550 4700
F 0 "#PWR?" H 8550 4550 50  0001 C CNN
F 1 "+BATT" H 8565 4873 50  0000 C CNN
F 2 "" H 8550 4700 50  0001 C CNN
F 3 "" H 8550 4700 50  0001 C CNN
	1    8550 4700
	1    0    0    -1  
$EndComp
Wire Notes Line
	7700 3000 9850 3000
Wire Notes Line
	7700 3950 7700 3000
Wire Notes Line
	9850 3950 7700 3950
Wire Notes Line
	9850 3000 9850 3950
Wire Notes Line
	7750 4200 7750 7050
Wire Notes Line
	8800 7050 7750 7050
Wire Notes Line
	8800 4200 8800 7050
Wire Notes Line
	7750 4200 8800 4200
Text Label 7850 4400 0    89   ~ 0
CONNECTOR
Text Notes 7800 3200 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Text Label 8300 5050 0    50   ~ 0
CAN_-
Text Label 8300 4950 0    50   ~ 0
CAN_+
Wire Wire Line
	8550 4850 8550 4700
Wire Wire Line
	8300 4850 8550 4850
$Comp
L power:GND #PWR?
U 1 1 61B61C12
P 8650 4850
F 0 "#PWR?" H 8650 4600 50  0001 C CNN
F 1 "GND" H 8655 4677 50  0000 C CNN
F 2 "" H 8650 4850 50  0001 C CNN
F 3 "" H 8650 4850 50  0001 C CNN
	1    8650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4750 8650 4750
Wire Wire Line
	8650 4750 8650 4850
Wire Wire Line
	8300 6650 8300 6750
$Comp
L power:GND #PWR?
U 1 1 61B5A95A
P 8300 6750
F 0 "#PWR?" H 8300 6500 50  0001 C CNN
F 1 "GND" H 8305 6577 50  0000 C CNN
F 2 "" H 8300 6750 50  0001 C CNN
F 3 "" H 8300 6750 50  0001 C CNN
	1    8300 6750
	1    0    0    -1  
$EndComp
Connection ~ 8300 6650
Wire Wire Line
	8300 6550 8300 6650
Connection ~ 8300 6550
Wire Wire Line
	8300 6450 8300 6550
Connection ~ 8300 6450
Wire Wire Line
	8300 6350 8300 6450
Connection ~ 8300 6350
Wire Wire Line
	8300 6250 8300 6350
Connection ~ 8300 6250
Wire Wire Line
	8300 6150 8300 6250
Connection ~ 8300 6150
Wire Wire Line
	8300 6050 8300 6150
Connection ~ 8300 6050
Wire Wire Line
	8300 5950 8300 6050
Connection ~ 8300 5950
Wire Wire Line
	8300 5850 8300 5950
Connection ~ 8300 5850
Wire Wire Line
	8300 5750 8300 5850
Connection ~ 8300 5750
Wire Wire Line
	8300 5650 8300 5750
Connection ~ 8300 5650
Wire Wire Line
	8300 5550 8300 5650
Connection ~ 8300 5550
Wire Wire Line
	8300 5450 8300 5550
Connection ~ 8300 5450
Wire Wire Line
	8300 5350 8300 5450
Connection ~ 8300 5350
Wire Wire Line
	8300 5250 8300 5350
Connection ~ 8300 5250
Wire Wire Line
	8300 5150 8300 5250
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 8800 3550
F 0 "J1" H 8800 3760 50  0000 C CNN
F 1 "CONN_02X03" H 8690 3350 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 8800 2350 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 8800 2350 50  0001 C CNN
F 4 "DK" H 8800 3550 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 8800 3550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 9200 4150 60  0001 C CNN "PurchasingLink"
	1    8800 3550
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_F_VT_20 J2
U 1 1 61AFFB50
P 8150 5850
F 0 "J2" H 8108 7197 60  0000 C CNN
F 1 "MM_F_VT_20" H 8108 7091 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_20" H 7950 6950 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F2-338068-0" H 8050 7050 60  0001 C CNN
F 4 "TE" H 8250 7250 60  0001 C CNN "MFN"
F 5 "2-338068-0" H 8350 7350 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-2-338068-0.html" H 8150 7150 60  0001 C CNN "PurchasingLink"
	1    8150 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 9050 3450
F 0 "#PWR?" H 9050 3300 50  0001 C CNN
F 1 "+5V" H 9065 3623 50  0000 C CNN
F 2 "" H 9050 3450 50  0001 C CNN
F 3 "" H 9050 3450 50  0001 C CNN
	1    9050 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 9050 3650
F 0 "#PWR?" H 9050 3400 50  0001 C CNN
F 1 "GND" H 9055 3477 50  0000 C CNN
F 2 "" H 9050 3650 50  0001 C CNN
F 3 "" H 9050 3650 50  0001 C CNN
	1    9050 3650
	1    0    0    -1  
$EndComp
Text Label 9050 3550 0    50   ~ 0
MOSI_A
Text Label 8550 3650 2    50   ~ 0
RESET
Text Label 8550 3550 2    50   ~ 0
SCK_A
Text Label 8550 3450 2    50   ~ 0
MISO_A
Wire Notes Line
	7700 2700 7700 800 
Wire Notes Line
	10000 800  10000 2700
Wire Notes Line
	10000 2700 7700 2700
Connection ~ 8600 1400
$Comp
L formula:MCP2561-E_SN U1
U 1 1 5D5FAEDE
P 8600 2000
F 0 "U1" H 8960 2350 50  0000 C CNN
F 1 "MCP2561-E_SN" H 8950 1640 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 8600 1500 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 8200 2350 50  0001 C CNN
F 4 "DK" H 8600 2000 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 8600 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 8600 2750 60  0001 C CNN "PurchasingLink"
	1    8600 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 8600 2400
F 0 "#PWR?" H 8600 2150 50  0001 C CNN
F 1 "GND" H 8605 2227 50  0000 C CNN
F 2 "" H 8600 2400 50  0001 C CNN
F 3 "" H 8600 2400 50  0001 C CNN
	1    8600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1600 8600 1400
NoConn ~ 9100 2000
Wire Wire Line
	9100 2100 9200 2100
Wire Wire Line
	9100 1900 9200 1900
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 8100 2200
F 0 "#PWR?" H 8100 1950 50  0001 C CNN
F 1 "GND" H 8105 2027 50  0000 C CNN
F 2 "" H 8100 2200 50  0001 C CNN
F 3 "" H 8100 2200 50  0001 C CNN
	1    8100 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2150 9550 2150
Connection ~ 9400 2150
Wire Wire Line
	9400 1850 9550 1850
Connection ~ 9400 1850
Wire Wire Line
	9200 2150 9400 2150
Wire Wire Line
	9200 1850 9400 1850
$Comp
L formula:R_120_DNP R2
U 1 1 5FA5AB4A
P 9400 2000
F 0 "R2" H 9470 2046 50  0000 L CNN
F 1 "R_120_DNP" H 9470 1955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8200 2150 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 8200 2450 50  0001 L CNN
F 4 "DK" H 9400 2000 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 8200 2250 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 8200 2350 60  0001 L CNN "PurchasingLink"
	1    9400 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 2100 9200 2150
Wire Wire Line
	9200 1900 9200 1850
Wire Wire Line
	8300 1400 8300 1550
Text Label 9550 2150 0    50   ~ 0
CAN_-
Text Label 9550 1850 0    50   ~ 0
CAN_+
Text Label 8100 1900 2    50   ~ 0
CAN_RX
Text Label 8100 1800 2    50   ~ 0
CAN_TX
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 8300 1550
F 0 "#PWR?" H 8300 1300 50  0001 C CNN
F 1 "GND" H 8200 1550 50  0000 C CNN
F 2 "" H 8300 1550 50  0001 C CNN
F 3 "" H 8300 1550 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5D5FB603
P 8450 1400
F 0 "C1" V 8400 1510 50  0000 C CNN
F 1 "C_0.1uF" V 8410 1210 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 8488 1250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8475 1500 50  0001 C CNN
F 4 "DK" H 8450 1400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8450 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8875 1900 60  0001 C CNN "PurchasingLink"
	1    8450 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	8600 1400 8600 1250
$Comp
L power:+5V #PWR?
U 1 1 621A6B9D
P 8600 1250
F 0 "#PWR?" H 8600 1100 50  0001 C CNN
F 1 "+5V" H 8615 1423 50  0000 C CNN
F 2 "" H 8600 1250 50  0001 C CNN
F 3 "" H 8600 1250 50  0001 C CNN
	1    8600 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621AF7B8
P 10450 1200
F 0 "#PWR?" H 10450 1050 50  0001 C CNN
F 1 "+5V" H 10465 1373 50  0000 C CNN
F 2 "" H 10450 1200 50  0001 C CNN
F 3 "" H 10450 1200 50  0001 C CNN
	1    10450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1200 10450 1350
Wire Wire Line
	6850 5950 6850 5850
Text Notes 6950 6150 0    50   ~ 0
VCC Jumper\n
$Comp
L formula:R_0_2512 R104
U 1 1 5C0C29A9
P 6850 6100
F 0 "R104" V 6650 6100 50  0000 C CNN
F 1 "R_0_2512" V 6750 6150 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 6780 6100 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 6930 6100 50  0001 C CNN
F 4 "DK" H 6850 6100 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 6850 6100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 7330 6500 60  0001 C CNN "PurchasingLink"
	1    6850 6100
	1    0    0    -1  
$EndComp
Text Label 3900 1950 0    50   ~ 0
SCK
Text Label 3900 2550 0    50   ~ 0
CS
NoConn ~ 3950 2950
NoConn ~ 3900 3550
$Comp
L formula:ATMEGA16M1 U2
U 1 1 5D58A7A6
P 2800 2950
F 0 "U2" H 3700 4810 50  0000 C CNN
F 1 "ATMEGA16M1" H 2100 4800 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2800 2950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1850 4780 50  0001 C CNN
F 4 "DK" H 2800 2950 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2800 2950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2250 5180 60  0001 C CNN "PurchasingLink"
	1    2800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1550 1700 1550
Wire Wire Line
	1400 1250 1700 1250
Wire Wire Line
	1550 3750 1700 3750
Wire Wire Line
	1550 4150 1700 4150
$EndSCHEMATC
