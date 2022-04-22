EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Hardware In The Loop: Primary Board"
Date ""
Rev "0A"
Comp "Olin Electric Motorsports"
Comment1 "Corey Cochran-Lepiz"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:LT3045 U9
U 1 1 612445AB
P 4700 3400
F 0 "U9" H 5525 4465 50  0000 C CNN
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
P 4300 3750
F 0 "#PWR?" H 4300 3600 50  0001 C CNN
F 1 "+5V" H 4315 3923 50  0000 C CNN
F 2 "" H 4300 3750 50  0001 C CNN
F 3 "" H 4300 3750 50  0001 C CNN
	1    4300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4050 4300 4050
Wire Wire Line
	4300 4050 4300 3750
Text Label 4250 3950 2    50   ~ 0
Lin-IN
Wire Wire Line
	4250 3950 3900 3950
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
P 8300 2450
F 0 "#PWR?" H 8300 2300 50  0001 C CNN
F 1 "VBUS" H 8315 2623 50  0000 C CNN
F 2 "" H 8300 2450 50  0001 C CNN
F 3 "" H 8300 2450 50  0001 C CNN
	1    8300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2700 6050 2700
Wire Wire Line
	6050 2700 6050 2600
Connection ~ 6050 2600
Wire Wire Line
	6050 2600 6000 2600
$Comp
L formula:C_4.7uF_25V C26
U 1 1 612445CE
P 4700 2950
F 0 "C26" H 4450 3050 50  0000 L CNN
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
	6000 3000 6450 3000
Wire Wire Line
	6450 3000 6450 2600
Connection ~ 6450 2600
$Comp
L formula:C_10uF_25V C27
U 1 1 612445F2
P 6600 2750
F 0 "C27" H 6715 2796 50  0000 L CNN
F 1 "C_10uF_25V" H 6715 2705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6550 2550 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM21BR61E106KA73-01.pdf" H 6600 2750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/murata-electronics/GRM21BR61E106KA73K/490-16824-1-ND/7595732" H 6600 3250 50  0001 C CNN "Purchasing Link"
	1    6600 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 612445FA
P 6000 3500
F 0 "#PWR?" H 6000 3250 50  0001 C CNN
F 1 "GND" H 6005 3327 50  0000 C CNN
F 2 "" H 6000 3500 50  0001 C CNN
F 3 "" H 6000 3500 50  0001 C CNN
	1    6000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3200 6000 3300
$Comp
L power:+12V #PWR?
U 1 1 612611CA
P 3950 3700
F 0 "#PWR?" H 3950 3550 50  0001 C CNN
F 1 "+12V" H 3965 3873 50  0000 C CNN
F 2 "" H 3950 3700 50  0001 C CNN
F 3 "" H 3950 3700 50  0001 C CNN
	1    3950 3700
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_01X03 J20
U 1 1 612611D3
P 3650 3950
F 0 "J20" H 3678 3991 50  0000 L CNN
F 1 "CONN_01X03" H 3678 3900 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 3650 2750 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 3650 2750 50  0001 C CNN
F 4 "Mouser" H 3650 3950 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 3650 3950 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 4050 4550 60  0001 C CNN "PurchasingLink"
	1    3650 3950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 3850 3950 3850
Wire Wire Line
	3950 3850 3950 3700
$Comp
L formula:R_49.90k R41
U 1 1 6147FE31
P 6500 3550
F 0 "R41" H 6570 3596 50  0000 L CNN
F 1 "R_49.90k" V 6700 3400 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6430 4050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 6580 3550 50  0001 C CNN
F 4 "Panasonic" H 6500 4150 50  0001 C CNN "MFN"
F 5 "ERA-6AEB4992V" H 6500 4050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/panasonic-electronic-components/ERA-6AEB4992V/2025816" H 6500 4050 50  0001 C CNN "PurchasingLink"
	1    6500 3550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_33.2k R40
U 1 1 6148208D
P 6250 3550
F 0 "R40" H 6320 3596 50  0000 L CNN
F 1 "R_33.2k" V 6150 3400 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6180 4050 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773272&DocType=DS&DocLang=English" H 6330 3550 50  0001 C CNN
F 4 "TE" H 6250 4150 50  0001 C CNN "MFN"
F 5 "5-2176093-2" H 6250 4050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/5-2176093-2/4034157" H 6250 4050 50  0001 C CNN "PurchasingLink"
	1    6250 3550
	1    0    0    -1  
$EndComp
Text Notes 6150 4050 0    50   ~ 0
3.3V
Text Notes 6450 4050 0    50   ~ 0
5V
Text Notes 6000 4200 0    50   ~ 0
Only populate one!
Wire Wire Line
	6050 2600 6450 2600
Wire Wire Line
	6000 2900 6250 2900
Wire Wire Line
	6250 2900 6250 3350
Wire Wire Line
	6250 3350 6500 3350
Wire Wire Line
	6500 3350 6500 3400
Connection ~ 6250 3350
Wire Wire Line
	6250 3350 6250 3400
$Comp
L power:GND #PWR?
U 1 1 614868F7
P 6500 3700
F 0 "#PWR?" H 6500 3450 50  0001 C CNN
F 1 "GND" H 6505 3527 50  0000 C CNN
F 2 "" H 6500 3700 50  0001 C CNN
F 3 "" H 6500 3700 50  0001 C CNN
	1    6500 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61486B0E
P 6250 3700
F 0 "#PWR?" H 6250 3450 50  0001 C CNN
F 1 "GND" H 6255 3527 50  0000 C CNN
F 2 "" H 6250 3700 50  0001 C CNN
F 3 "" H 6250 3700 50  0001 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1000nF C28
U 1 1 6148908A
P 6850 3550
F 0 "C28" H 6965 3596 50  0000 L CNN
F 1 "C_1000nF" H 6965 3505 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 6888 3400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A475KQ8NNNC.jsp" H 6875 3650 50  0001 C CNN
F 4 "DK" H 6850 3550 60  0001 C CNN "MFN"
F 5 "1276-1946-1-ND" H 6850 3550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL10B105KP8NNNC/1276-1946-1-ND/3890032" H 6850 3550 60  0001 C CNN "PurchasingLink"
	1    6850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3500 6000 3300
Connection ~ 6000 3300
$Comp
L power:GND #PWR?
U 1 1 6148B044
P 6600 3050
F 0 "#PWR?" H 6600 2800 50  0001 C CNN
F 1 "GND" H 6605 2877 50  0000 C CNN
F 2 "" H 6600 3050 50  0001 C CNN
F 3 "" H 6600 3050 50  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3050 6600 2900
Wire Wire Line
	6850 3400 6850 3350
Wire Wire Line
	6850 3350 6500 3350
Connection ~ 6500 3350
$Comp
L power:GND #PWR?
U 1 1 6148C473
P 6850 3700
F 0 "#PWR?" H 6850 3450 50  0001 C CNN
F 1 "GND" H 6855 3527 50  0000 C CNN
F 2 "" H 6850 3700 50  0001 C CNN
F 3 "" H 6850 3700 50  0001 C CNN
	1    6850 3700
	1    0    0    -1  
$EndComp
Text Notes 2800 2050 0    50   ~ 0
Power flags are universal so this page doesn't require IN/OUT net labels
$Comp
L formula:R_0_2512 R43
U 1 1 62431B18
P 7900 2600
F 0 "R43" V 7693 2600 50  0000 C CNN
F 1 "R_0_2512" V 7784 2600 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 7830 2600 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 7980 2600 50  0001 C CNN
F 4 "DK" H 7900 2600 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 7900 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 7900 2600 60  0001 C CNN "PurchasingLink"
	1    7900 2600
	0    1    1    0   
$EndComp
Connection ~ 6600 2600
Wire Wire Line
	6600 2600 6450 2600
Wire Wire Line
	8050 2600 8300 2600
Wire Wire Line
	8300 2600 8300 2450
Wire Wire Line
	6600 2600 7550 2600
$Comp
L formula:LED_0805 D8
U 1 1 62436D3F
P 7550 3050
F 0 "D8" V 7589 2933 50  0000 R CNN
F 1 "LED_0805" V 7498 2933 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 7450 3050 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7550 3150 50  0001 C CNN
F 4 "DK" H 7550 3050 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7550 3050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7550 3050 60  0001 C CNN "PurchasingLink"
	1    7550 3050
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_330 R42
U 1 1 62437B1A
P 7550 2750
F 0 "R42" H 7620 2796 50  0000 L CNN
F 1 "R_330" H 7620 2705 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7480 2750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 7630 2750 50  0001 C CNN
F 4 "DK" H 7550 2750 60  0001 C CNN "MFN"
F 5 "RMCF0805FT330RCT-ND" H 7550 2750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT330R/RMCF0805FT330RCT-ND/1942351" H 7550 2750 60  0001 C CNN "PurchasingLink"
	1    7550 2750
	1    0    0    -1  
$EndComp
Connection ~ 7550 2600
Wire Wire Line
	7550 2600 7750 2600
$Comp
L power:GND #PWR?
U 1 1 624380CC
P 7550 3300
F 0 "#PWR?" H 7550 3050 50  0001 C CNN
F 1 "GND" H 7555 3127 50  0000 C CNN
F 2 "" H 7550 3300 50  0001 C CNN
F 3 "" H 7550 3300 50  0001 C CNN
	1    7550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3300 7550 3200
Text Notes 7900 2950 0    50   ~ 0
5V -> ~~9mA\n3.3V -> ~~3mA
$Comp
L formula:Test_Point_SMD TP12
U 1 1 6243B567
P 8350 2600
F 0 "TP12" V 8345 2778 50  0000 L CNN
F 1 "Test_Point_SMD" H 8428 2597 50  0001 L CNN
F 2 "footprints:Test_Point_SMD" H 8350 2450 50  0001 C CNN
F 3 "" H 8350 2600 50  0001 C CNN
	1    8350 2600
	0    1    1    0   
$EndComp
Connection ~ 8300 2600
$EndSCHEMATC
