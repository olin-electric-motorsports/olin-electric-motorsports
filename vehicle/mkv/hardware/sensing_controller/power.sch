EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 8300 4400 0    89   ~ 0
5V TO 3.3V REGULATOR
Text Notes 5250 4150 0    89   ~ 0
LDO (7V TO 5V)
Text Notes 6500 4400 0    50   ~ 0
Add silkscreen on the\nlayout that says DNP (Resistor)\n
Text Notes 4200 5650 0    50   ~ 0
Replaced 3.65M and 1.18M resistors with 300K \nand 100K resistors respectively. Still buy both \nsets of resistors, so that we can test both.
$Comp
L formula:TPS560430YF U401
U 1 1 6186BCA8
P 7200 2100
F 0 "U401" H 7225 2565 50  0000 C CNN
F 1 "TPS560430YF" H 7225 2474 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 7150 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps560430.pdf" H 7200 2650 50  0001 C CNN
F 4 "TPS560430YFDBVR-ND" H 7150 1000 50  0001 C CNN "MPN"
F 5 "DK" H 7200 1100 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 7950 1200 50  0001 C CNN "Purchasing Link"
F 7 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 3630 -4480 50  0001 C CNN "PurchasingLink"
	1    7200 2100
	1    0    0    -1  
$EndComp
$Comp
L formula:TP TP403
U 1 1 61874ED4
P 4400 2450
F 0 "TP403" V 4540 2340 50  0000 L CNN
F 1 "TP" V 4480 2360 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 4300 2350 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 4400 2450 50  0001 C CNN
F 4 "DK" H 4500 2550 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 4600 2650 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 4700 2750 50  0001 C CNN "PurchasingLink"
	1    4400 2450
	0    -1   -1   0   
$EndComp
Text Notes 6250 1550 0    89   ~ 0
BUCK CONVERTER (12V TO 7V)
$Comp
L formula:F_500mA_16V F401
U 1 1 61874F10
P 5000 1950
F 0 "F401" V 4803 1950 50  0000 C CNN
F 1 "F_500mA_16V" V 4894 1950 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 4930 1950 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 5080 1950 50  0001 C CNN
F 4 "DK" H 5000 1950 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 5000 1950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 5480 2350 60  0001 C CNN "PurchasingLink"
	1    5000 1950
	0    1    1    0   
$EndComp
$Comp
L formula:C_2.2uF C403
U 1 1 61878320
P 6350 2450
F 0 "C403" H 6470 2550 50  0000 L CNN
F 1 "C_2.2uF" H 6480 2460 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 6388 2300 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 6375 2550 50  0001 C CNN
F 4 "DK" H 6350 2450 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 6350 2450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 6775 2950 60  0001 C CNN "PurchasingLink"
	1    6350 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2200 6750 2200
Wire Wire Line
	6750 2200 6750 1950
Wire Wire Line
	6750 1950 6850 1950
Connection ~ 6750 1950
$Comp
L formula:C_0.1uF C402
U 1 1 61880CA4
P 6150 2400
F 0 "C402" H 6300 2350 50  0000 L CNN
F 1 "C_0.1uF" H 6250 2450 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6188 2250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6175 2500 50  0001 C CNN
F 4 "DK" H 6150 2400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6150 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6575 2900 60  0001 C CNN "PurchasingLink"
	1    6150 2400
	-1   0    0    1   
$EndComp
Connection ~ 6350 1950
Wire Wire Line
	6350 1950 6750 1950
Connection ~ 6150 1950
Wire Wire Line
	6150 1950 6350 1950
$Comp
L formula:R_1K R402
U 1 1 6188973A
P 5650 2200
F 0 "R402" H 5720 2246 50  0000 L CNN
F 1 "R_1K" H 5720 2155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5580 2200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5730 2200 50  0001 C CNN
F 4 "DK" H 5650 2200 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 5650 2200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6130 2600 60  0001 C CNN "PurchasingLink"
	1    5650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2050 5650 1950
Connection ~ 5650 1950
Wire Wire Line
	5650 1950 6150 1950
Wire Wire Line
	6350 1950 6350 2250
Wire Wire Line
	6150 1950 6150 2250
Wire Wire Line
	5650 2350 5650 2550
$Comp
L formula:LED_0805 D402
U 1 1 618A2D58
P 5650 2700
F 0 "D402" V 5730 2630 50  0000 R CNN
F 1 "LED_0805" V 5660 2640 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5550 2700 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5650 2800 50  0001 C CNN
F 4 "DK" H 5650 2700 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5650 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6050 3200 60  0001 C CNN "PurchasingLink"
	1    5650 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 1950 5450 1950
$Comp
L formula:D_Zener_18V D401
U 1 1 618AC0C4
P 5450 2450
F 0 "D401" V 5390 2200 50  0000 L CNN
F 1 "D_Zener_18V" V 5470 1910 50  0000 L CNN
F 2 "footprints:DO-214AA" H 5350 2450 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 5450 2550 50  0001 C CNN
F 4 "DK" H 5650 2750 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 5550 2650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 5850 2950 60  0001 C CNN "PurchasingLink"
	1    5450 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 2300 5450 1950
Connection ~ 5450 1950
Wire Wire Line
	5450 1950 5650 1950
Wire Wire Line
	5450 2600 5450 3050
Wire Wire Line
	5450 3050 5650 3050
Wire Wire Line
	6350 3050 6350 2550
Wire Wire Line
	6150 2550 6150 3050
Connection ~ 6150 3050
Wire Wire Line
	6150 3050 6350 3050
Wire Wire Line
	5650 2850 5650 3050
Connection ~ 5650 3050
Wire Wire Line
	5650 3050 6150 3050
Wire Wire Line
	4850 1950 4750 1950
Text GLabel 4600 1950 0    50   Input ~ 0
12V
$Comp
L formula:TP TP401
U 1 1 61874EDD
P 4400 2200
F 0 "TP401" V 4540 2020 50  0000 L CNN
F 1 "TP" V 4478 2047 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 4300 2100 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 4400 2200 50  0001 C CNN
F 4 "DK" H 4500 2300 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 4600 2400 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 4700 2500 50  0001 C CNN "PurchasingLink"
	1    4400 2200
	0    -1   -1   0   
$EndComp
Text Notes 4200 1650 0    50   ~ 0
(Input Voltage From Battery: 12.8V-16.8V)
Wire Wire Line
	4600 2200 4750 2200
Wire Wire Line
	4750 2200 4750 1950
Connection ~ 4750 1950
Wire Wire Line
	4750 1950 4600 1950
Wire Wire Line
	4600 2450 4750 2450
Wire Wire Line
	4750 2450 4750 3050
Wire Wire Line
	4750 3050 5150 3050
Connection ~ 5450 3050
Wire Wire Line
	5150 3050 5150 3200
Connection ~ 5150 3050
Wire Wire Line
	5150 3050 5450 3050
$Comp
L power:GND #PWR?
U 1 1 618F1261
P 5150 3200
F 0 "#PWR?" H 5150 2950 50  0001 C CNN
F 1 "GND" H 5155 3027 50  0000 C CNN
F 2 "" H 5150 3200 50  0001 C CNN
F 3 "" H 5150 3200 50  0001 C CNN
	1    5150 3200
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C401
U 1 1 618FE009
P 7800 1900
F 0 "C401" V 7548 1900 50  0000 C CNN
F 1 "C_0.1uF" V 7639 1900 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 7838 1750 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7825 2000 50  0001 C CNN
F 4 "DK" H 7800 1900 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7800 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8225 2400 60  0001 C CNN "PurchasingLink"
	1    7800 1900
	0    1    1    0   
$EndComp
$Comp
L formula:C_33uF COUT403
U 1 1 618FE021
P 8800 2550
F 0 "COUT403" H 8900 2500 50  0000 L CNN
F 1 "C_33uF" H 8900 2400 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 8850 2150 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 8800 3200 50  0001 C CNN
F 4 "DK" H 8850 2050 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 8800 2900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 9050 3050 60  0001 C CNN "PurchasingLink"
	1    8800 2550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_22uF COUT401
U 1 1 618FE02A
P 8600 2300
F 0 "COUT401" H 8715 2346 50  0000 L CNN
F 1 "C_22uF" H 8715 2255 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 8638 2150 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 8625 2400 50  0001 C CNN
F 4 "DK" H 8600 2300 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 8600 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 9025 2800 60  0001 C CNN "PurchasingLink"
	1    8600 2300
	-1   0    0    1   
$EndComp
$Comp
L formula:R_15k R405
U 1 1 618FE03B
P 9550 3150
F 0 "R405" H 9550 3375 50  0000 C CNN
F 1 "R_15k" H 9550 3284 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9450 2950 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RE_105_RoHS_L_6.pdf" V 9550 3150 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/yageo/RE0805FRE0715KL/5923506" H 9550 2900 50  0001 C CNN "Link"
	1    9550 3150
	0    1    1    0   
$EndComp
$Comp
L formula:R_90k R403
U 1 1 618FE042
P 9550 2400
F 0 "R403" H 9550 2625 50  0000 C CNN
F 1 "R_90k" H 9550 2534 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9450 2200 50  0001 C CNN
F 3 "https://www.vishay.com/docs/60026/ptn.pdf" V 9550 2400 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-dale-thin-film/PTN0805E9002BST1/7103062" H 9550 2150 50  0001 C CNN "Link"
	1    9550 2400
	0    1    1    0   
$EndComp
$Comp
L formula:L_8.1uH L401
U 1 1 618FE04A
P 8300 2150
F 0 "L401" H 8300 2450 50  0000 C CNN
F 1 "L_8.1uH" H 8300 2350 50  0000 C CNN
F 2 "footprints:L_8.1uH" H 8300 2150 50  0001 C CNN
F 3 "https://www.coilcraft.com/getmedia/76c9c081-4945-4c85-9129-9356e1ad6734/xgl4020.pdf" H 8300 2150 50  0001 C CNN
	1    8300 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_0_2512 R401
U 1 1 618FE05A
P 10250 2050
F 0 "R401" V 10043 2050 50  0000 C CNN
F 1 "R_0_2512" V 10134 2050 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 10180 2050 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 10330 2050 50  0001 C CNN
F 4 "DK" H 10250 2050 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 10250 2050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 10730 2450 60  0001 C CNN "PurchasingLink"
	1    10250 2050
	0    1    1    0   
$EndComp
$Comp
L formula:R_200 R404
U 1 1 618FE065
P 9900 2400
F 0 "R404" H 9970 2446 50  0000 L CNN
F 1 "R_200" H 9970 2355 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9830 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9980 2400 50  0001 C CNN
F 4 "DK" H 9900 2400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9900 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10380 2800 60  0001 C CNN "PurchasingLink"
	1    9900 2400
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D403
U 1 1 618FE06E
P 9900 2800
F 0 "D403" V 9939 2683 50  0000 R CNN
F 1 "LED_0805" V 9848 2683 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 9800 2800 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 9900 2900 50  0001 C CNN
F 4 "DK" H 9900 2800 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 9900 2800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10300 3300 60  0001 C CNN "PurchasingLink"
	1    9900 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618FE075
P 9900 3050
F 0 "#PWR?" H 9900 2800 50  0001 C CNN
F 1 "GND" H 9905 2877 50  0000 C CNN
F 2 "" H 9900 3050 50  0001 C CNN
F 3 "" H 9900 3050 50  0001 C CNN
	1    9900 3050
	1    0    0    -1  
$EndComp
Text GLabel 10700 2050 2    50   Input ~ 0
7V
Wire Wire Line
	8400 2050 8600 2050
Wire Wire Line
	8600 2150 8600 2050
Connection ~ 8600 2050
Wire Wire Line
	8600 2050 8800 2050
$Comp
L formula:C_47uF COUT402
U 1 1 6192BCB8
P 8950 2300
F 0 "COUT402" H 9065 2346 50  0000 L CNN
F 1 "C_47uF" H 9100 2250 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8988 2150 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 8975 2400 50  0001 C CNN
F 4 "DK" H 8950 2300 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 8950 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 9375 2800 60  0001 C CNN "PurchasingLink"
	1    8950 2300
	1    0    0    -1  
$EndComp
Connection ~ 8800 2050
Wire Wire Line
	8800 2050 8950 2050
Wire Wire Line
	7650 1900 7600 1900
Wire Wire Line
	7950 1900 8000 1900
Wire Wire Line
	8000 1900 8000 2050
Wire Wire Line
	8000 2050 8200 2050
Wire Wire Line
	8000 2050 7600 2050
Connection ~ 8000 2050
Wire Wire Line
	8800 2050 8800 2400
Wire Wire Line
	8950 2150 8950 2050
Connection ~ 8950 2050
Wire Wire Line
	8600 2450 8600 2800
Wire Wire Line
	8600 2800 8800 2800
Wire Wire Line
	8800 2800 8800 2700
Wire Wire Line
	9200 2800 9200 2500
Wire Wire Line
	9200 2500 8950 2500
Wire Wire Line
	8950 2500 8950 2450
Connection ~ 8800 2800
Wire Wire Line
	8900 2800 8900 2900
Wire Wire Line
	8800 2800 8900 2800
Connection ~ 8900 2800
Wire Wire Line
	8900 2800 9200 2800
Wire Wire Line
	9550 2250 9550 2050
Connection ~ 9550 2050
Wire Wire Line
	9550 3000 9550 2800
Wire Wire Line
	9550 3300 9550 3500
Wire Wire Line
	9550 2800 9300 2800
Wire Wire Line
	9300 2800 9300 3150
Wire Wire Line
	9300 3150 7750 3150
Wire Wire Line
	7750 3150 7750 2250
Wire Wire Line
	7750 2250 7600 2250
Connection ~ 9550 2800
Wire Wire Line
	9550 2800 9550 2550
$Comp
L power:GND #PWR?
U 1 1 619FA45C
P 8900 2900
F 0 "#PWR?" H 8900 2650 50  0001 C CNN
F 1 "GND" H 8905 2727 50  0000 C CNN
F 2 "" H 8900 2900 50  0001 C CNN
F 3 "" H 8900 2900 50  0001 C CNN
	1    8900 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619FA8CD
P 9550 3500
F 0 "#PWR?" H 9550 3250 50  0001 C CNN
F 1 "GND" H 9555 3327 50  0000 C CNN
F 2 "" H 9550 3500 50  0001 C CNN
F 3 "" H 9550 3500 50  0001 C CNN
	1    9550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2050 9550 2050
Wire Wire Line
	9900 2250 9900 2050
Wire Wire Line
	9550 2050 9900 2050
Wire Wire Line
	9900 2650 9900 2550
Wire Wire Line
	9900 3050 9900 2950
Wire Wire Line
	10100 2050 9900 2050
Connection ~ 9900 2050
Wire Wire Line
	10400 2050 10600 2050
$Comp
L formula:TP TP402
U 1 1 61A35E15
P 10850 2200
F 0 "TP402" V 10990 2020 50  0000 L CNN
F 1 "TP" V 10928 2047 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 10750 2100 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 10850 2200 50  0001 C CNN
F 4 "DK" H 10950 2300 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 11050 2400 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 11150 2500 50  0001 C CNN "PurchasingLink"
	1    10850 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	10650 2200 10600 2200
Wire Wire Line
	10600 2200 10600 2050
Connection ~ 10600 2050
Wire Wire Line
	10600 2050 10700 2050
$Comp
L formula:TPS7A26 U402
U 1 1 61A919D2
P 5600 4650
F 0 "U402" H 5600 5015 50  0000 C CNN
F 1 "TPS7A26" H 5600 4924 50  0000 C CNN
F 2 "footprints:TPS7A26" H 5600 4650 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tps7a26.pdf" H 5600 4650 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/texas-instruments/TPS7A2625DRVR/10715499" H 5600 4650 50  0001 C CNN "Purchasing Link"
	1    5600 4650
	1    0    0    -1  
$EndComp
Text GLabel 4950 4600 0    50   Input ~ 0
7V
Wire Wire Line
	4950 4600 5150 4600
Wire Wire Line
	5150 4600 5150 4750
Wire Wire Line
	5150 4750 5300 4750
Connection ~ 5150 4600
Wire Wire Line
	5150 4600 5300 4600
$Comp
L power:GND #PWR?
U 1 1 61A9FE4B
P 5600 5100
F 0 "#PWR?" H 5600 4850 50  0001 C CNN
F 1 "GND" H 5605 4927 50  0000 C CNN
F 2 "" H 5600 5100 50  0001 C CNN
F 3 "" H 5600 5100 50  0001 C CNN
	1    5600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5100 5600 4950
$Comp
L formula:R_10K R406
U 1 1 61AA7E5B
P 6300 4550
F 0 "R406" V 6300 4500 50  0000 L CNN
F 1 "R_10K" V 6400 4450 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6230 4550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6380 4550 50  0001 C CNN
F 4 "DK" H 6300 4550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6300 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6780 4950 60  0001 C CNN "PurchasingLink"
	1    6300 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 4550 6050 4550
Text GLabel 6250 4350 2    50   Input ~ 0
Vpg
Wire Wire Line
	6050 4550 6050 4350
Connection ~ 6050 4550
Wire Wire Line
	6050 4550 5900 4550
Wire Wire Line
	6050 4350 6250 4350
Wire Wire Line
	6450 4550 6600 4550
Wire Wire Line
	6600 4550 6600 4650
Wire Wire Line
	6600 4650 6200 4650
Wire Wire Line
	6600 4650 6700 4650
Connection ~ 6600 4650
Text GLabel 6950 4650 2    50   Input ~ 0
5V
$Comp
L formula:C_47uF C404
U 1 1 61AE44D0
P 6700 4900
F 0 "C404" H 6815 4946 50  0000 L CNN
F 1 "C_47uF" H 6815 4855 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6738 4750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 6725 5000 50  0001 C CNN
F 4 "DK" H 6700 4900 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 6700 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 7125 5400 60  0001 C CNN "PurchasingLink"
	1    6700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4650 6700 4750
Connection ~ 6700 4650
Wire Wire Line
	6700 5050 6700 5150
$Comp
L power:GND #PWR?
U 1 1 61AF5086
P 6700 5150
F 0 "#PWR?" H 6700 4900 50  0001 C CNN
F 1 "GND" H 6705 4977 50  0000 C CNN
F 2 "" H 6700 5150 50  0001 C CNN
F 3 "" H 6700 5150 50  0001 C CNN
	1    6700 5150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_300K R407
U 1 1 61AF5510
P 6200 4900
F 0 "R407" H 6270 4946 50  0000 L CNN
F 1 "R_300K" H 6270 4855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6130 4900 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 6280 4900 50  0001 C CNN
F 4 "DK" H 6200 4900 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 6200 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB304V/P300KDACT-ND/1466006" H 6680 5300 60  0001 C CNN "PurchasingLink"
	1    6200 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4750 6200 4650
Connection ~ 6200 4650
Wire Wire Line
	6200 4650 5900 4650
$Comp
L formula:R_100K R408
U 1 1 61AFE1F7
P 6200 5350
F 0 "R408" H 6270 5396 50  0000 L CNN
F 1 "R_100K" H 6270 5305 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6130 5350 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6280 5350 50  0001 C CNN
F 4 "DK" H 6200 5350 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6200 5350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6680 5750 60  0001 C CNN "PurchasingLink"
	1    6200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5200 6200 5100
$Comp
L power:GND #PWR?
U 1 1 61B07308
P 6200 5600
F 0 "#PWR?" H 6200 5350 50  0001 C CNN
F 1 "GND" H 6205 5427 50  0000 C CNN
F 2 "" H 6200 5600 50  0001 C CNN
F 3 "" H 6200 5600 50  0001 C CNN
	1    6200 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5600 6200 5500
Wire Wire Line
	6200 5100 6000 5100
Wire Wire Line
	6000 5100 6000 4750
Wire Wire Line
	6000 4750 5900 4750
Connection ~ 6200 5100
Wire Wire Line
	6200 5100 6200 5050
$Comp
L formula:LM3480 U403
U 1 1 61B4474F
P 9000 4800
F 0 "U403" H 9000 5042 50  0000 C CNN
F 1 "LM3480" H 9000 4951 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 8950 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 9100 4550 50  0001 C CNN
F 4 "DK" H 9050 5125 60  0001 C CNN "MFN"
F 5 "LM3480IM3-3.3CT-ND" H 9150 5225 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/LM3480IM3-3.3/LM3480IM3-3.3CT-ND/3701583" H 8950 5025 60  0001 C CNN "PurchasingLink"
	1    9000 4800
	1    0    0    -1  
$EndComp
Text GLabel 8400 4800 0    50   Input ~ 0
5V
Wire Wire Line
	8400 4800 8600 4800
Text GLabel 9700 4800 2    50   Input ~ 0
3.3V
Wire Wire Line
	9700 4800 9550 4800
Wire Wire Line
	9000 5100 9000 5250
$Comp
L formula:C_0.1uF C405
U 1 1 61B5ACCA
P 9450 5100
F 0 "C405" H 9565 5146 50  0000 L CNN
F 1 "C_0.1uF" H 9565 5055 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9488 4950 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9475 5200 50  0001 C CNN
F 4 "DK" H 9450 5100 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 9450 5100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9875 5600 60  0001 C CNN "PurchasingLink"
	1    9450 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4950 9450 4800
Connection ~ 9450 4800
Wire Wire Line
	9450 4800 9300 4800
Wire Wire Line
	9450 5250 9000 5250
Connection ~ 9000 5250
$Comp
L formula:C_0.1uF C406
U 1 1 61B6A288
P 8600 5150
F 0 "C406" H 8290 5190 50  0000 L CNN
F 1 "C_0.1uF" H 8210 5100 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8638 5000 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8625 5250 50  0001 C CNN
F 4 "DK" H 8600 5150 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8600 5150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9025 5650 60  0001 C CNN "PurchasingLink"
	1    8600 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5000 8600 4800
Connection ~ 8600 4800
Wire Wire Line
	8600 4800 8700 4800
Wire Wire Line
	8600 5300 9000 5300
Wire Wire Line
	9000 5250 9000 5300
Connection ~ 9000 5300
Wire Wire Line
	9000 5300 9000 5400
$Comp
L power:GND #PWR?
U 1 1 61B7A6EE
P 9000 5400
F 0 "#PWR?" H 9000 5150 50  0001 C CNN
F 1 "GND" H 9005 5227 50  0000 C CNN
F 2 "" H 9000 5400 50  0001 C CNN
F 3 "" H 9000 5400 50  0001 C CNN
	1    9000 5400
	1    0    0    -1  
$EndComp
$Comp
L formula:TP TP404
U 1 1 61BADD4E
P 7150 4500
F 0 "TP404" V 7150 4550 50  0000 L CNN
F 1 "TP" V 7100 4550 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 7050 4400 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 7150 4500 50  0001 C CNN
F 4 "DK" H 7250 4600 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 7350 4700 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 7450 4800 50  0001 C CNN "PurchasingLink"
	1    7150 4500
	0    1    1    0   
$EndComp
$Comp
L formula:TP TP405
U 1 1 61BB0621
P 9900 4650
F 0 "TP405" V 9800 4700 50  0000 L CNN
F 1 "TP" V 9900 4700 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 9800 4550 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 9900 4650 50  0001 C CNN
F 4 "DK" H 10000 4750 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 10100 4850 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 10200 4950 50  0001 C CNN "PurchasingLink"
	1    9900 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 4650 9550 4650
Wire Wire Line
	9550 4650 9550 4800
Connection ~ 9550 4800
Wire Wire Line
	9550 4800 9450 4800
Wire Wire Line
	6950 4500 6850 4500
Wire Wire Line
	6850 4500 6850 4650
Wire Wire Line
	6700 4650 6850 4650
Wire Wire Line
	6950 4650 6850 4650
Connection ~ 6850 4650
Wire Notes Line style solid
	1400 2500 1400 3000
Wire Notes Line style solid
	1400 3000 2400 3000
Wire Notes Line style solid
	2400 3000 2400 2500
Wire Notes Line style solid
	2400 2500 1400 2500
Wire Notes Line style solid
	1400 3250 1400 3750
Wire Notes Line style solid
	1400 3750 2400 3750
Wire Notes Line style solid
	2400 3750 2400 3250
Wire Notes Line style solid
	2400 3250 1400 3250
Wire Notes Line style solid
	1400 4000 1400 4500
Wire Notes Line style solid
	1400 4500 2400 4500
Wire Notes Line style solid
	2400 4500 2400 4000
Wire Notes Line style solid
	2400 4000 1400 4000
Wire Notes Line style solid
	1900 3000 1900 3250
Wire Notes Line style solid
	1900 3750 1900 4000
Wire Notes Line
	900  2750 1400 2750
Wire Notes Line
	2400 4250 2900 4250
Wire Notes Line
	2400 3500 2900 3500
Wire Notes Line
	2650 3700 2900 3700
Wire Notes Line
	2650 3900 2900 3900
Wire Notes Line
	2650 4100 2900 4100
Wire Notes Line
	2650 3500 2650 4100
Wire Notes Line
	2650 4450 2900 4450
Wire Notes Line
	2650 4250 2650 4450
Text Notes 900  2750 0    50   ~ 0
Battery In
Text Notes 1600 2800 0    50   ~ 0
VBatt —> 7V\n(Buck Converter)
Text Notes 1550 3550 0    50   ~ 0
7V —> 5V (LDO)
Text Notes 1600 4300 0    50   ~ 0
5V —> 3.3V (LDO)
Text Notes 2900 3500 0    50   ~ 0
ATmega16M1
Text Notes 2900 4250 0    50   ~ 0
ATmega328P
Text Notes 2900 4450 0    50   ~ 0
Tire Temp Sense
Text Notes 2900 3700 0    50   ~ 0
Suspension Strain Sense
Text Notes 2900 3900 0    50   ~ 0
Suspension Travel Sense
Text Notes 2900 4100 0    50   ~ 0
Wheel Speed Sense
Text Notes 1950 3150 0    50   ~ 0
600mA Output
Text Notes 1950 3900 0    50   ~ 0
500mA Output
Text Notes 2300 4600 0    50   ~ 0
100mA Output
$Comp
L power:GND #PWR?
U 1 1 614A945B
P 7250 2500
F 0 "#PWR?" H 7250 2250 50  0001 C CNN
F 1 "GND" H 7255 2327 50  0000 C CNN
F 2 "" H 7250 2500 50  0001 C CNN
F 3 "" H 7250 2500 50  0001 C CNN
	1    7250 2500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
