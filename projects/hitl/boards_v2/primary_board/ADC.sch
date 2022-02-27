EESchema Schematic File Version 4
LIBS:hitl-primary-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Hardware In The Loop: Primary Board"
Date ""
Rev "0A"
Comp "Olin Electric Motorsports"
Comment1 "Corey Cochran-Lepiz"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2600 2250 0    50   ~ 0
SCL
Wire Wire Line
	2600 2250 2900 2250
Text Label 2600 2150 0    50   ~ 0
SDA
Wire Wire Line
	2600 2150 2900 2150
Text Label 5200 1850 2    50   ~ 0
ADC1
Text Label 5200 2250 2    50   ~ 0
ADC3
Text Label 5200 2450 2    50   ~ 0
ADC4
Wire Wire Line
	5200 1850 4850 1850
Wire Wire Line
	4850 2050 5200 2050
Wire Wire Line
	4850 2450 5200 2450
Wire Wire Line
	4850 2250 5800 2250
$Comp
L power:GND #PWR?
U 1 1 61448221
P 7250 2750
F 0 "#PWR?" H 7250 2500 50  0001 C CNN
F 1 "GND" H 7255 2577 50  0000 C CNN
F 2 "" H 7250 2750 50  0001 C CNN
F 3 "" H 7250 2750 50  0001 C CNN
	1    7250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2650 7250 2650
Text Label 8250 1750 2    50   ~ 0
Analog-MUX1
Text Label 8250 1850 2    50   ~ 0
Analog-MUX2
Text Label 8250 1950 2    50   ~ 0
Analog-MUX3
Text Label 8250 2050 2    50   ~ 0
Analog-MUX4
Text Label 6500 2050 0    50   ~ 0
gpio20
Text Label 6500 2150 0    50   ~ 0
gpio21
Wire Wire Line
	6500 2050 6950 2050
Text Label 5200 2050 2    50   ~ 0
ADC2
$Comp
L formula:C_0.1uF C25
U 1 1 61448238
P 8150 2850
F 0 "C25" H 8265 2896 50  0000 L CNN
F 1 "C_0.1uF" H 8265 2805 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8188 2700 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8175 2950 50  0001 C CNN
F 4 "DK" H 8150 2850 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8150 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8575 3350 60  0001 C CNN "PurchasingLink"
	1    8150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6144823E
P 8150 3000
F 0 "#PWR?" H 8150 2750 50  0001 C CNN
F 1 "GND" H 8155 2827 50  0000 C CNN
F 2 "" H 8150 3000 50  0001 C CNN
F 3 "" H 8150 3000 50  0001 C CNN
	1    8150 3000
	1    0    0    -1  
$EndComp
Text Label 2500 2450 0    50   ~ 0
ADC-CA0
Text Label 2500 2550 0    50   ~ 0
ADC-CA1
Wire Wire Line
	2900 2450 2500 2450
Wire Wire Line
	2500 2550 2900 2550
Wire Wire Line
	7250 2650 7250 2700
Wire Wire Line
	6950 2350 6950 2700
Wire Wire Line
	6950 2700 7250 2700
Connection ~ 7250 2700
Wire Wire Line
	7250 2700 7250 2750
$Comp
L power:VBUS #PWR?
U 1 1 614482B9
P 7250 1550
F 0 "#PWR?" H 7250 1400 50  0001 C CNN
F 1 "VBUS" H 7150 1700 50  0000 C CNN
F 2 "" H 7250 1550 50  0001 C CNN
F 3 "" H 7250 1550 50  0001 C CNN
	1    7250 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 614482DA
P 8150 2700
F 0 "#PWR?" H 8150 2550 50  0001 C CNN
F 1 "VBUS" H 8165 2873 50  0000 C CNN
F 2 "" H 8150 2700 50  0001 C CNN
F 3 "" H 8150 2700 50  0001 C CNN
	1    8150 2700
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R31
U 1 1 614482E3
P 6450 2550
F 0 "R31" H 6520 2596 50  0000 L CNN
F 1 "R_10K" H 6520 2505 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6380 2550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6530 2550 50  0001 C CNN
F 4 "DK" H 6450 2550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6450 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6930 2950 60  0001 C CNN "PurchasingLink"
	1    6450 2550
	1    0    0    -1  
$EndComp
Text Label 6000 2800 0    50   ~ 0
gpio18
Wire Wire Line
	6500 2150 6950 2150
Text Label 6500 1950 0    50   ~ 0
gpio19
Wire Wire Line
	6450 2400 6450 1950
Wire Wire Line
	6450 1950 6950 1950
Wire Wire Line
	6000 2800 6450 2800
Wire Wire Line
	6450 2800 6450 2700
Text Label 8250 2150 2    50   ~ 0
Analog-MUX5
Text Label 8250 2250 2    50   ~ 0
Analog-MUX6
Text Label 8250 2350 2    50   ~ 0
Analog-MUX7
Text Label 8250 2450 2    50   ~ 0
Analog-MUX8
Text HLabel 1100 1950 0    50   Input ~ 0
SCL
Text HLabel 1100 2100 0    50   Input ~ 0
SDA
Text HLabel 10250 1450 2    50   Input ~ 0
ADC-1
Text HLabel 10250 1550 2    50   Input ~ 0
ADC-2
Text HLabel 10250 1750 2    50   Input ~ 0
AMUX-1
Text Label 9800 1450 0    50   ~ 0
ADC1
Text Label 9800 1550 0    50   ~ 0
ADC2
Text Label 1400 1950 2    50   ~ 0
SCL
Text Label 1400 2100 2    50   ~ 0
SDA
Wire Wire Line
	1400 2100 1100 2100
Wire Wire Line
	1100 1950 1400 1950
Text HLabel 10250 1850 2    50   Input ~ 0
AMUX-2
Text HLabel 10250 1950 2    50   Input ~ 0
AMUX-3
Text HLabel 10250 2050 2    50   Input ~ 0
AMUX-4
Text HLabel 10250 2150 2    50   Input ~ 0
AMUX-5
Text HLabel 10250 2250 2    50   Input ~ 0
AMUX-6
Text HLabel 10250 2350 2    50   Input ~ 0
AMUX-7
Wire Wire Line
	9800 1450 10250 1450
Wire Wire Line
	10250 1550 9800 1550
$Comp
L formula:CONN_01X03 J?
U 1 1 614CF3D0
P 9550 5450
AR Path="/614CF3D0" Ref="J?"  Part="1" 
AR Path="/6143EE2A/614CF3D0" Ref="J19"  Part="1" 
F 0 "J19" H 9578 5491 50  0000 L CNN
F 1 "CONN_01X03" H 9578 5400 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 9550 4250 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 9550 4250 50  0001 C CNN
F 4 "Mouser" H 9550 5450 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 9550 5450 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 9950 6050 60  0001 C CNN "PurchasingLink"
	1    9550 5450
	-1   0    0    -1  
$EndComp
$Comp
L formula:R_3.01K R?
U 1 1 614D231B
P 10700 5700
AR Path="/614D231B" Ref="R?"  Part="1" 
AR Path="/6143EE2A/614D231B" Ref="R39"  Part="1" 
F 0 "R39" H 10770 5746 50  0000 L CNN
F 1 "R_3.01K" H 10770 5655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10630 5700 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 10780 5700 50  0001 C CNN
F 4 "DK" H 10700 5700 60  0001 C CNN "MFN"
F 5 "311-3.01KCRCT-ND" H 10700 5700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-3.01KCRCT-ND" H 11180 6100 60  0001 C CNN "PurchasingLink"
	1    10700 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614D2321
P 10700 5850
AR Path="/614D2321" Ref="#PWR?"  Part="1" 
AR Path="/6143EE2A/614D2321" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10700 5600 50  0001 C CNN
F 1 "GND" H 10705 5677 50  0000 C CNN
F 2 "" H 10700 5850 50  0001 C CNN
F 3 "" H 10700 5850 50  0001 C CNN
	1    10700 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 5550 10700 5500
$Comp
L formula:R_12K R?
U 1 1 614D232B
P 10700 5350
AR Path="/614D232B" Ref="R?"  Part="1" 
AR Path="/6143EE2A/614D232B" Ref="R38"  Part="1" 
F 0 "R38" H 10770 5396 50  0000 L CNN
F 1 "R_12K" H 10770 5305 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 10630 5350 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-9&DocType=DS&DocLang=English" V 10780 5350 50  0001 C CNN
F 4 "TE" V 10880 5450 60  0001 C CNN "MFN"
F 5 "CRGP0805F12K" V 10980 5550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGP0805F12K/8577092" V 11080 5650 60  0001 C CNN "PurchasingLink"
	1    10700 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 5550 10700 5550
Connection ~ 10700 5550
Wire Wire Line
	8250 1750 7650 1750
Wire Wire Line
	7650 1850 8250 1850
Wire Wire Line
	8250 1950 7650 1950
Wire Wire Line
	7650 2050 8250 2050
Wire Wire Line
	7650 2350 10250 2350
Wire Wire Line
	7650 2250 10250 2250
Wire Wire Line
	7650 2150 10250 2150
Text Label 10400 5450 2    50   ~ 0
Analog-MUX4
Wire Wire Line
	10400 5450 9800 5450
Wire Wire Line
	9800 5350 9800 4950
Wire Wire Line
	9800 4950 10700 4950
Text Label 10750 4950 0    50   ~ 0
amux4
Wire Wire Line
	10700 5200 10700 4950
Connection ~ 10700 4950
Wire Wire Line
	10700 4950 10750 4950
Text Label 9800 2050 0    50   ~ 0
amux4
Text Label 9800 1950 0    50   ~ 0
amux3
Text Label 9800 1850 0    50   ~ 0
amux2
Text Label 9800 1750 0    50   ~ 0
amux1
Wire Wire Line
	9800 1750 10250 1750
Wire Wire Line
	10250 1850 9800 1850
Wire Wire Line
	9800 1950 10250 1950
Wire Wire Line
	10250 2050 9800 2050
$Comp
L formula:CONN_01X03 J?
U 1 1 614FD52B
P 7100 5400
AR Path="/614FD52B" Ref="J?"  Part="1" 
AR Path="/6143EE2A/614FD52B" Ref="J16"  Part="1" 
F 0 "J16" H 7128 5441 50  0000 L CNN
F 1 "CONN_01X03" H 7128 5350 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7100 4200 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7100 4200 50  0001 C CNN
F 4 "Mouser" H 7100 5400 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7100 5400 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7500 6000 60  0001 C CNN "PurchasingLink"
	1    7100 5400
	-1   0    0    -1  
$EndComp
$Comp
L formula:R_3.01K R?
U 1 1 614FD72A
P 8250 5650
AR Path="/614FD72A" Ref="R?"  Part="1" 
AR Path="/6143EE2A/614FD72A" Ref="R33"  Part="1" 
F 0 "R33" H 8320 5696 50  0000 L CNN
F 1 "R_3.01K" H 8320 5605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8180 5650 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 8330 5650 50  0001 C CNN
F 4 "DK" H 8250 5650 60  0001 C CNN "MFN"
F 5 "311-3.01KCRCT-ND" H 8250 5650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-3.01KCRCT-ND" H 8730 6050 60  0001 C CNN "PurchasingLink"
	1    8250 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614FD734
P 8250 5800
AR Path="/614FD734" Ref="#PWR?"  Part="1" 
AR Path="/6143EE2A/614FD734" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8250 5550 50  0001 C CNN
F 1 "GND" H 8255 5627 50  0000 C CNN
F 2 "" H 8250 5800 50  0001 C CNN
F 3 "" H 8250 5800 50  0001 C CNN
	1    8250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5500 8250 5450
$Comp
L formula:R_12K R?
U 1 1 614FD742
P 8250 5300
AR Path="/614FD742" Ref="R?"  Part="1" 
AR Path="/6143EE2A/614FD742" Ref="R32"  Part="1" 
F 0 "R32" H 8320 5346 50  0000 L CNN
F 1 "R_12K" H 8320 5255 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 8180 5300 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-9&DocType=DS&DocLang=English" V 8330 5300 50  0001 C CNN
F 4 "TE" V 8430 5400 60  0001 C CNN "MFN"
F 5 "CRGP0805F12K" V 8530 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGP0805F12K/8577092" V 8630 5600 60  0001 C CNN "PurchasingLink"
	1    8250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 5500 8250 5500
Connection ~ 8250 5500
Text Label 7950 5400 2    50   ~ 0
Analog-MUX3
Wire Wire Line
	7950 5400 7350 5400
Wire Wire Line
	7350 5300 7350 4900
Wire Wire Line
	7350 4900 8250 4900
Text Label 8300 4900 0    50   ~ 0
amux3
Wire Wire Line
	8250 5150 8250 4900
Connection ~ 8250 4900
Wire Wire Line
	8250 4900 8300 4900
$Comp
L formula:CONN_01X03 J?
U 1 1 614FFE73
P 9550 4000
AR Path="/614FFE73" Ref="J?"  Part="1" 
AR Path="/6143EE2A/614FFE73" Ref="J18"  Part="1" 
F 0 "J18" H 9578 4041 50  0000 L CNN
F 1 "CONN_01X03" H 9578 3950 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 9550 2800 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 9550 2800 50  0001 C CNN
F 4 "Mouser" H 9550 4000 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 9550 4000 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 9950 4600 60  0001 C CNN "PurchasingLink"
	1    9550 4000
	-1   0    0    -1  
$EndComp
$Comp
L formula:R_3.01K R?
U 1 1 615000B6
P 10700 4250
AR Path="/615000B6" Ref="R?"  Part="1" 
AR Path="/6143EE2A/615000B6" Ref="R37"  Part="1" 
F 0 "R37" H 10770 4296 50  0000 L CNN
F 1 "R_3.01K" H 10770 4205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10630 4250 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 10780 4250 50  0001 C CNN
F 4 "DK" H 10700 4250 60  0001 C CNN "MFN"
F 5 "311-3.01KCRCT-ND" H 10700 4250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-3.01KCRCT-ND" H 11180 4650 60  0001 C CNN "PurchasingLink"
	1    10700 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615000C0
P 10700 4400
AR Path="/615000C0" Ref="#PWR?"  Part="1" 
AR Path="/6143EE2A/615000C0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10700 4150 50  0001 C CNN
F 1 "GND" H 10705 4227 50  0000 C CNN
F 2 "" H 10700 4400 50  0001 C CNN
F 3 "" H 10700 4400 50  0001 C CNN
	1    10700 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4100 10700 4050
$Comp
L formula:R_12K R?
U 1 1 615000CE
P 10700 3900
AR Path="/615000CE" Ref="R?"  Part="1" 
AR Path="/6143EE2A/615000CE" Ref="R36"  Part="1" 
F 0 "R36" H 10770 3946 50  0000 L CNN
F 1 "R_12K" H 10770 3855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 10630 3900 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-9&DocType=DS&DocLang=English" V 10780 3900 50  0001 C CNN
F 4 "TE" V 10880 4000 60  0001 C CNN "MFN"
F 5 "CRGP0805F12K" V 10980 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGP0805F12K/8577092" V 11080 4200 60  0001 C CNN "PurchasingLink"
	1    10700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4100 10700 4100
Connection ~ 10700 4100
Text Label 10400 4000 2    50   ~ 0
Analog-MUX2
Wire Wire Line
	10400 4000 9800 4000
Wire Wire Line
	9800 3900 9800 3500
Wire Wire Line
	9800 3500 10700 3500
Text Label 10750 3500 0    50   ~ 0
amux2
Wire Wire Line
	10700 3750 10700 3500
Connection ~ 10700 3500
Wire Wire Line
	10700 3500 10750 3500
$Comp
L formula:CONN_01X03 J?
U 1 1 615031D4
P 7200 3950
AR Path="/615031D4" Ref="J?"  Part="1" 
AR Path="/6143EE2A/615031D4" Ref="J17"  Part="1" 
F 0 "J17" H 7228 3991 50  0000 L CNN
F 1 "CONN_01X03" H 7228 3900 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7200 2750 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7200 2750 50  0001 C CNN
F 4 "Mouser" H 7200 3950 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7200 3950 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7600 4550 60  0001 C CNN "PurchasingLink"
	1    7200 3950
	-1   0    0    -1  
$EndComp
$Comp
L formula:R_3.01K R?
U 1 1 6150345B
P 8350 4200
AR Path="/6150345B" Ref="R?"  Part="1" 
AR Path="/6143EE2A/6150345B" Ref="R35"  Part="1" 
F 0 "R35" H 8420 4246 50  0000 L CNN
F 1 "R_3.01K" H 8420 4155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8280 4200 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 8430 4200 50  0001 C CNN
F 4 "DK" H 8350 4200 60  0001 C CNN "MFN"
F 5 "311-3.01KCRCT-ND" H 8350 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-3.01KCRCT-ND" H 8830 4600 60  0001 C CNN "PurchasingLink"
	1    8350 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61503465
P 8350 4350
AR Path="/61503465" Ref="#PWR?"  Part="1" 
AR Path="/6143EE2A/61503465" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8350 4100 50  0001 C CNN
F 1 "GND" H 8355 4177 50  0000 C CNN
F 2 "" H 8350 4350 50  0001 C CNN
F 3 "" H 8350 4350 50  0001 C CNN
	1    8350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 4050 8350 4000
$Comp
L formula:R_12K R?
U 1 1 61503473
P 8350 3850
AR Path="/61503473" Ref="R?"  Part="1" 
AR Path="/6143EE2A/61503473" Ref="R34"  Part="1" 
F 0 "R34" H 8420 3896 50  0000 L CNN
F 1 "R_12K" H 8420 3805 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 8280 3850 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-9&DocType=DS&DocLang=English" V 8430 3850 50  0001 C CNN
F 4 "TE" V 8530 3950 60  0001 C CNN "MFN"
F 5 "CRGP0805F12K" V 8630 4050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGP0805F12K/8577092" V 8730 4150 60  0001 C CNN "PurchasingLink"
	1    8350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4050 8350 4050
Connection ~ 8350 4050
Text Label 8050 3950 2    50   ~ 0
Analog-MUX1
Wire Wire Line
	8050 3950 7450 3950
Wire Wire Line
	7450 3850 7450 3450
Wire Wire Line
	7450 3450 8350 3450
Text Label 8400 3450 0    50   ~ 0
amux1
Wire Wire Line
	8350 3700 8350 3450
Connection ~ 8350 3450
Wire Wire Line
	8350 3450 8400 3450
Text HLabel 1100 2600 0    50   Input ~ 0
GPIO-18
Text Label 1550 2600 2    50   ~ 0
gpio18
Text Label 1550 2750 2    50   ~ 0
gpio19
Text Label 1550 2900 2    50   ~ 0
gpio20
Text Label 1550 3050 2    50   ~ 0
gpio21
Text HLabel 1100 2750 0    50   Input ~ 0
GPIO-19
Text HLabel 1100 2900 0    50   Input ~ 0
GPIO-20
Text HLabel 1100 3050 0    50   Input ~ 0
GPIO-21
Wire Wire Line
	1100 2600 1550 2600
Wire Wire Line
	1550 2750 1100 2750
Wire Wire Line
	1100 2900 1550 2900
Wire Wire Line
	1550 3050 1100 3050
Text HLabel 10250 1650 2    50   Input ~ 0
ADC-4
Text Label 9800 1650 0    50   ~ 0
ADC4
Wire Wire Line
	9800 1650 10250 1650
Text Notes 8150 4050 0    50   ~ 0
1/5
Text Notes 8050 5500 0    50   ~ 0
1/5
Text Notes 10500 5550 0    50   ~ 0
1/5
Text Notes 10500 4100 0    50   ~ 0
1/5
$Comp
L formula:D_Zener_2V D7
U 1 1 61689171
P 4700 5650
F 0 "D7" V 4654 5729 50  0000 L CNN
F 1 "D_Zener_2V" V 4745 5729 50  0000 L CNN
F 2 "footprints:SOD-323" H 4600 5650 50  0001 C CNN
F 3 "https://www.vishay.com/docs/83334/gdzg.pdf" H 4700 5750 50  0001 C CNN
F 4 "Vishay" H 4900 5950 60  0001 C CNN "MFN"
F 5 "GDZ2V0B-G3-08" H 4800 5850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/vishay-general-semiconductor-diodes-division/GDZ2V0B-G3-08/4831605" H 4800 5850 60  0001 C CNN "PurchasingLink"
	1    4700 5650
	0    1    1    0   
$EndComp
$Comp
L formula:R_10K R29
U 1 1 6168A7D4
P 4700 5250
F 0 "R29" H 4770 5296 50  0000 L CNN
F 1 "R_10K" H 4770 5205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4630 5250 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4780 5250 50  0001 C CNN
F 4 "DK" H 4700 5250 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4700 5250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4700 5250 60  0001 C CNN "PurchasingLink"
	1    4700 5250
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R28
U 1 1 6168A9F3
P 4700 4850
F 0 "R28" H 4770 4896 50  0000 L CNN
F 1 "R_10K" H 4770 4805 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4630 4850 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4780 4850 50  0001 C CNN
F 4 "DK" H 4700 4850 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4700 4850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4700 4850 60  0001 C CNN "PurchasingLink"
	1    4700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6168DE0E
P 4700 5850
F 0 "#PWR?" H 4700 5600 50  0001 C CNN
F 1 "GND" H 4705 5677 50  0000 C CNN
F 2 "" H 4700 5850 50  0001 C CNN
F 3 "" H 4700 5850 50  0001 C CNN
	1    4700 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5850 4700 5800
Wire Wire Line
	4700 5100 4700 5050
$Comp
L power:VBUS #PWR?
U 1 1 616966DB
P 4700 4700
F 0 "#PWR?" H 4700 4550 50  0001 C CNN
F 1 "VBUS" H 4715 4873 50  0000 C CNN
F 2 "" H 4700 4700 50  0001 C CNN
F 3 "" H 4700 4700 50  0001 C CNN
	1    4700 4700
	1    0    0    -1  
$EndComp
Text Label 5600 5050 2    50   ~ 0
Analog-MUX8
Wire Wire Line
	4700 5400 4700 5500
Wire Wire Line
	5600 5050 4700 5050
Connection ~ 4700 5050
Wire Wire Line
	4700 5050 4700 5000
Text Notes 3450 5150 0    50   ~ 0
Vo = VBus - (Vbus - 2V)/2\n|Vbus = 3.3V -> Vo ~~2.65V\n|Vbus = 5V   -> Vo ~~3.5V
Text HLabel 1100 3300 0    50   Input ~ 0
CA0
Text HLabel 1100 3450 0    50   Input ~ 0
CA1
Text Label 1550 3300 2    50   ~ 0
ADC-CA0
Wire Wire Line
	1550 3300 1100 3300
Text Label 1550 3450 2    50   ~ 0
ADC-CA1
Wire Wire Line
	1550 3450 1100 3450
Text Notes 8600 3250 0    50   ~ 0
For input voltages higher than Vbus
$Comp
L formula:74HCT4051D U8
U 1 1 62116DF9
P 7050 1650
F 0 "U8" H 7500 1900 60  0000 C CNN
F 1 "74HCT4051D" H 7600 1800 60  0000 C CNN
F 2 "footprints:74HCT4051D" H 7850 1890 60  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT4051.pdf" H 7300 2119 60  0001 C CNN
F 4 "1727-2850-1-ND" H 7300 1931 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/nexperia-usa-inc/74HCT4051D-118/763152" H 7300 1930 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 7300 1839 50  0001 C CNN "MFN"
	1    7050 1650
	1    0    0    -1  
$EndComp
Connection ~ 7250 2650
$Comp
L formula:AD7091R-5BRUZ U6
U 1 1 620B5468
P 3200 1600
F 0 "U6" H 3875 1765 50  0000 C CNN
F 1 "AD7091R-5BRUZ" H 3875 1674 50  0000 C CNN
F 2 "footprints:AD7091R-5BRUZ" H 3300 2300 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD7091R-5.pdf" H 3150 1600 50  0001 C CNN
F 4 "AD7091R-5BRUZ-ND" H 3300 1850 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/analog-devices-inc/AD7091R-5BRUZ/5441090" H 3400 1950 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 3500 2050 50  0001 C CNN "MFN"
	1    3200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2250 5800 1750
Wire Wire Line
	2900 1800 2900 1700
Wire Wire Line
	1650 1700 1650 1650
$Comp
L power:VBUS #PWR?
U 1 1 620D891D
P 1650 1350
F 0 "#PWR?" H 1650 1200 50  0001 C CNN
F 1 "VBUS" H 1550 1500 50  0000 C CNN
F 2 "" H 1650 1350 50  0001 C CNN
F 3 "" H 1650 1350 50  0001 C CNN
	1    1650 1350
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U7
U 1 1 620DB879
P 5750 3350
F 0 "U7" H 5700 3100 50  0000 L CNN
F 1 "MCP6001" H 5700 3200 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 5650 3450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 5750 3550 50  0001 C CNN
F 4 "DK" H 5850 3650 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 5950 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 6050 3850 60  0001 C CNN "PurchasingLink"
	1    5750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3450 5300 3450
Wire Wire Line
	6100 3350 6050 3350
$Comp
L power:VBUS #PWR?
U 1 1 620E0D7B
P 5650 2950
F 0 "#PWR?" H 5650 2800 50  0001 C CNN
F 1 "VBUS" H 5550 3100 50  0000 C CNN
F 2 "" H 5650 2950 50  0001 C CNN
F 3 "" H 5650 2950 50  0001 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2950 5650 3000
$Comp
L power:GND #PWR?
U 1 1 620E3CFC
P 5650 3650
F 0 "#PWR?" H 5650 3400 50  0001 C CNN
F 1 "GND" H 5655 3477 50  0000 C CNN
F 2 "" H 5650 3650 50  0001 C CNN
F 3 "" H 5650 3650 50  0001 C CNN
	1    5650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3950 5300 3950
Wire Wire Line
	5300 3450 5300 3950
Wire Wire Line
	6100 3350 6100 3950
$Comp
L formula_old:C_30pF C24
U 1 1 620E7351
P 6550 3500
F 0 "C24" H 6665 3546 50  0000 L CNN
F 1 "C_30pF" H 6665 3455 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6588 3350 50  0001 C CNN
F 3 "" H 6575 3600 50  0001 C CNN
F 4 "DK" H 6550 3500 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 6550 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 6550 3500 60  0001 C CNN "PurchasingLink"
	1    6550 3500
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R30
U 1 1 620E7EF8
P 6300 3350
F 0 "R30" V 6093 3350 50  0000 C CNN
F 1 "R_1K" V 6184 3350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6230 3350 50  0001 C CNN
F 3 "" H 6380 3350 50  0001 C CNN
F 4 "DK" H 6300 3350 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 6300 3350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6780 3750 60  0001 C CNN "PurchasingLink"
	1    6300 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3350 6150 3350
Connection ~ 6100 3350
Wire Wire Line
	6450 3350 6550 3350
$Comp
L power:GND #PWR?
U 1 1 620EE098
P 6550 3650
F 0 "#PWR?" H 6550 3400 50  0001 C CNN
F 1 "GND" H 6555 3477 50  0000 C CNN
F 2 "" H 6550 3650 50  0001 C CNN
F 3 "" H 6550 3650 50  0001 C CNN
	1    6550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3350 6850 3350
Connection ~ 6550 3350
Text Label 6850 3350 2    50   ~ 0
ADCIN
Wire Wire Line
	5800 1750 6950 1750
Wire Wire Line
	4850 3250 5450 3250
Text Label 5150 3550 2    50   ~ 0
ADCIN
Wire Wire Line
	5150 3550 4850 3550
$Comp
L formula:C_1uF C23
U 1 1 6210801F
P 5750 3000
F 0 "C23" V 5498 3050 50  0000 C CNN
F 1 "C_1uF" V 5589 3050 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 5788 3600 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 5775 3850 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 6175 3500 60  0001 C CNN "PurchasingLink"
	1    5750 3000
	0    1    1    0   
$EndComp
Connection ~ 5650 3000
Wire Wire Line
	5650 3000 5650 3050
$Comp
L power:GND #PWR?
U 1 1 62109452
P 6000 3000
F 0 "#PWR?" H 6000 2750 50  0001 C CNN
F 1 "GND" H 6005 2827 50  0000 C CNN
F 2 "" H 6000 3000 50  0001 C CNN
F 3 "" H 6000 3000 50  0001 C CNN
	1    6000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3000 5950 3000
Text Notes 6450 3150 0    50   ~ 0
Cutoff Freq: 5MHz
$Comp
L power:GND #PWR?
U 1 1 6210D3C9
P 2850 3650
F 0 "#PWR?" H 2850 3400 50  0001 C CNN
F 1 "GND" H 2855 3477 50  0000 C CNN
F 2 "" H 2850 3650 50  0001 C CNN
F 3 "" H 2850 3650 50  0001 C CNN
	1    2850 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3450 2850 3450
Wire Wire Line
	2850 3450 2850 3550
Wire Wire Line
	2900 3550 2850 3550
Connection ~ 2850 3550
Wire Wire Line
	2850 3550 2850 3650
NoConn ~ 2900 2750
NoConn ~ 2900 2850
NoConn ~ 2900 2950
$Comp
L formula:C_10uF_16V C20
U 1 1 62125738
P 1750 1850
F 0 "C20" H 1865 1896 50  0000 L CNN
F 1 "C_10uF_16V" H 1865 1805 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1788 1700 50  0001 C CNN
F 3 "" H 1775 1950 50  0001 C CNN
F 4 "DK" H 1750 1850 60  0001 C CNN "MFN"
F 5 "1276-2399-1-ND" H 1750 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A106KOCLRNC/1276-2399-1-ND/3890485" H 2175 2350 60  0001 C CNN "PurchasingLink"
	1    1750 1850
	1    0    0    -1  
$EndComp
Connection ~ 1750 1700
Wire Wire Line
	1750 1700 1650 1700
Connection ~ 2900 1700
$Comp
L formula:C_1uF C22
U 1 1 621393BD
P 2500 2000
F 0 "C22" H 2615 2096 50  0000 L CNN
F 1 "C_1uF" H 2615 2005 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2538 2600 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 2525 2850 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 2925 2500 60  0001 C CNN "PurchasingLink"
	1    2500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1900 2750 1900
Wire Wire Line
	2750 1900 2750 1800
Wire Wire Line
	2750 1800 2500 1800
$Comp
L power:GND #PWR?
U 1 1 6213DBE2
P 2500 2100
F 0 "#PWR?" H 2500 1850 50  0001 C CNN
F 1 "GND" H 2505 1927 50  0000 C CNN
F 2 "" H 2500 2100 50  0001 C CNN
F 3 "" H 2500 2100 50  0001 C CNN
	1    2500 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3050 2450 3050
Wire Wire Line
	2900 3300 2900 3050
Connection ~ 2900 3050
$Comp
L formula:C_2.2uF C21
U 1 1 62146BE5
P 2450 3250
F 0 "C21" H 2565 3346 50  0000 L CNN
F 1 "C_2.2uF" H 2565 3255 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2488 3850 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_soft_en.pdf" H 2475 4100 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/tdk-corporation/C2012X7R1H225M125AE/445-172488-1-ND/4990030" H 2875 3750 60  0001 C CNN "PurchasingLink"
	1    2450 3250
	1    0    0    -1  
$EndComp
Connection ~ 2450 3050
Wire Wire Line
	2450 3050 2300 3050
$Comp
L power:GND #PWR?
U 1 1 62147429
P 2450 3350
F 0 "#PWR?" H 2450 3100 50  0001 C CNN
F 1 "GND" H 2455 3177 50  0000 C CNN
F 2 "" H 2450 3350 50  0001 C CNN
F 3 "" H 2450 3350 50  0001 C CNN
	1    2450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2450 7650 2450
$Comp
L power:GND #PWR?
U 1 1 621501F0
P 1750 2000
F 0 "#PWR?" H 1750 1750 50  0001 C CNN
F 1 "GND" H 1755 1827 50  0000 C CNN
F 2 "" H 1750 2000 50  0001 C CNN
F 3 "" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_0 R46
U 1 1 6263F0D1
P 1650 1500
F 0 "R46" H 1580 1454 50  0000 R CNN
F 1 "R_0" H 1580 1545 50  0000 R CNN
F 2 "footprints:R_0603_1608Metric" H 1580 1500 50  0001 C CNN
F 3 "" H 1730 1500 50  0001 C CNN
F 4 "DK" H 1650 1500 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 1650 1500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 2130 1900 60  0001 C CNN "PurchasingLink"
	1    1650 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 1700 2300 1700
Wire Wire Line
	2300 1700 2300 3050
Connection ~ 2300 1700
Wire Wire Line
	2300 1700 2900 1700
$EndSCHEMATC
