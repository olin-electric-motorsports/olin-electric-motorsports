EESchema Schematic File Version 4
EELAYER 30 0
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
$Comp
L formula:LTC2489CDEPBF U6
U 1 1 6144820F
P 4050 2700
F 0 "U6" H 4400 3965 50  0000 C CNN
F 1 "LTC2489CDEPBF" H 4400 3874 50  0000 C CNN
F 2 "footprints:DFN-14_DE_AD" H 4300 4400 50  0001 L BNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf" H 3750 3600 50  0001 L BNN
F 4 "ltc2489cde#pbf" H 4250 4300 50  0001 L BNN "MPN"
F 5 "LinearTech" H 4650 4350 50  0001 L BNN "MFN"
F 6 "https://www.digikey.com/en/products/detail/analog-devices-inc/LTC2489CDE-PBF/1745796" H 5400 4250 50  0001 C CNN "PurchasingLink"
	1    4050 2700
	1    0    0    -1  
$EndComp
Text Label 3450 2100 0    50   ~ 0
SCL
Wire Wire Line
	3450 2100 3750 2100
Text Label 3450 2200 0    50   ~ 0
SDA
Wire Wire Line
	3450 2200 3750 2200
Text Label 5400 2150 2    50   ~ 0
ADC1
Text Label 5400 2350 2    50   ~ 0
ADC3
Text Label 5400 2450 2    50   ~ 0
ADC4
Wire Wire Line
	5400 2150 5050 2150
Wire Wire Line
	5050 2250 5400 2250
Wire Wire Line
	5050 2450 5400 2450
Wire Wire Line
	6200 1750 6200 2350
Wire Wire Line
	5050 2350 6200 2350
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
Wire Wire Line
	6200 1750 6950 1750
Text Label 6500 2050 0    50   ~ 0
gpio26
Text Label 6500 2150 0    50   ~ 0
gpio28
Wire Wire Line
	6500 2050 6950 2050
Text Label 5400 2250 2    50   ~ 0
ADC2
$Comp
L formula:C_0.1uF C20
U 1 1 61448238
P 8150 2850
F 0 "C20" H 8265 2896 50  0000 L CNN
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
$Comp
L power:GND #PWR?
U 1 1 61448244
P 3750 2800
F 0 "#PWR?" H 3750 2550 50  0001 C CNN
F 1 "GND" H 3755 2627 50  0000 C CNN
F 2 "" H 3750 2800 50  0001 C CNN
F 3 "" H 3750 2800 50  0001 C CNN
	1    3750 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2500 3750 2600
Connection ~ 3750 2600
Wire Wire Line
	3750 2600 3750 2800
$Comp
L power:GND #PWR?
U 1 1 6144824D
P 5050 2750
F 0 "#PWR?" H 5050 2500 50  0001 C CNN
F 1 "GND" H 5055 2577 50  0000 C CNN
F 2 "" H 5050 2750 50  0001 C CNN
F 3 "" H 5050 2750 50  0001 C CNN
	1    5050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2750 5050 2600
Wire Wire Line
	5150 1650 5150 1700
Wire Wire Line
	5150 1700 5050 1700
Wire Wire Line
	5050 1900 5150 1900
Wire Wire Line
	5150 1900 5150 1700
Connection ~ 5150 1700
$Comp
L power:GND #PWR?
U 1 1 61448259
P 5700 2000
F 0 "#PWR?" H 5700 1750 50  0001 C CNN
F 1 "GND" H 5705 1827 50  0000 C CNN
F 2 "" H 5700 2000 50  0001 C CNN
F 3 "" H 5700 2000 50  0001 C CNN
	1    5700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2000 5700 2000
$Comp
L power:GND #PWR?
U 1 1 61448260
P 3100 1700
F 0 "#PWR?" H 3100 1450 50  0001 C CNN
F 1 "GND" H 3105 1527 50  0000 C CNN
F 2 "" H 3100 1700 50  0001 C CNN
F 3 "" H 3100 1700 50  0001 C CNN
	1    3100 1700
	1    0    0    -1  
$EndComp
Text Label 3350 1800 0    50   ~ 0
ADC-CA0
Wire Wire Line
	3100 1700 3750 1700
Text Label 3350 1900 0    50   ~ 0
ADC-CA1
Wire Wire Line
	3750 1800 3350 1800
Wire Wire Line
	3350 1900 3750 1900
$Comp
L formula:C_10uF_25V C19
U 1 1 61448296
P 4550 3150
F 0 "C19" H 4665 3196 50  0000 L CNN
F 1 "C_10uF_25V" H 4665 3105 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4500 2950 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM21BR61E106KA73-01.pdf" H 4550 3150 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/murata-electronics/GRM21BR61E106KA73K/490-16824-1-ND/7595732" H 4550 3650 50  0001 C CNN "Purchasing Link"
	1    4550 3150
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C18
U 1 1 6144829F
P 4000 3150
F 0 "C18" H 4115 3196 50  0000 L CNN
F 1 "C_0.1uF" H 4115 3105 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4038 3000 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4025 3250 50  0001 C CNN
F 4 "DK" H 4000 3150 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 4000 3150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4425 3650 60  0001 C CNN "PurchasingLink"
	1    4000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3000 4550 2950
Wire Wire Line
	4000 2950 4000 3000
Wire Wire Line
	4550 3300 4550 3350
Wire Wire Line
	4550 3350 4300 3350
Wire Wire Line
	4000 3350 4000 3300
$Comp
L power:GND #PWR?
U 1 1 614482AA
P 4300 3350
F 0 "#PWR?" H 4300 3100 50  0001 C CNN
F 1 "GND" H 4305 3177 50  0000 C CNN
F 2 "" H 4300 3350 50  0001 C CNN
F 3 "" H 4300 3350 50  0001 C CNN
	1    4300 3350
	1    0    0    -1  
$EndComp
Connection ~ 4300 3350
Wire Wire Line
	4300 3350 4000 3350
Text Notes 4500 3500 0    50   ~ 0
Not a tantalum...\n
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
F 1 "VBUS" H 7265 1723 50  0000 C CNN
F 2 "" H 7250 1550 50  0001 C CNN
F 3 "" H 7250 1550 50  0001 C CNN
	1    7250 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 614482BF
P 5150 1650
F 0 "#PWR?" H 5150 1500 50  0001 C CNN
F 1 "VBUS" H 5165 1823 50  0000 C CNN
F 2 "" H 5150 1650 50  0001 C CNN
F 3 "" H 5150 1650 50  0001 C CNN
	1    5150 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2950 4300 2950
$Comp
L power:VBUS #PWR?
U 1 1 614482D2
P 4300 2950
F 0 "#PWR?" H 4300 2800 50  0001 C CNN
F 1 "VBUS" H 4315 3123 50  0000 C CNN
F 2 "" H 4300 2950 50  0001 C CNN
F 3 "" H 4300 2950 50  0001 C CNN
	1    4300 2950
	1    0    0    -1  
$EndComp
Connection ~ 4300 2950
Wire Wire Line
	4300 2950 4550 2950
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
L formula:R_10K R30
U 1 1 614482E3
P 6450 2550
F 0 "R30" H 6520 2596 50  0000 L CNN
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
gpio23
Wire Wire Line
	6500 2150 6950 2150
Text Label 6500 1950 0    50   ~ 0
gpio24
Wire Wire Line
	6450 2400 6450 1950
Wire Wire Line
	6450 1950 6950 1950
Wire Wire Line
	6000 2800 6450 2800
Wire Wire Line
	6450 2800 6450 2700
Connection ~ 7250 2650
$Comp
L formula:74HCT4051 U?
U 1 1 614482F1
P 7250 2050
AR Path="/614482F1" Ref="U?"  Part="1" 
AR Path="/6143EE2A/614482F1" Ref="U7"  Part="1" 
F 0 "U7" H 7500 2500 50  0000 C CNN
F 1 "74HCT4051" H 7700 1350 50  0000 C CNN
F 2 "footprints:TSSOP-16-OEM" H 7250 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hct4051.pdf" H 7250 1650 50  0001 C CNN
	1    7250 2050
	1    0    0    -1  
$EndComp
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
Text HLabel 10250 2450 2    50   Input ~ 0
AMUX-8
Wire Wire Line
	9800 1450 10250 1450
Wire Wire Line
	10250 1550 9800 1550
$Comp
L formula:CONN_01X03 J?
U 1 1 614CF3D0
P 9550 5450
AR Path="/614CF3D0" Ref="J?"  Part="1" 
AR Path="/6143EE2A/614CF3D0" Ref="J24"  Part="1" 
F 0 "J24" H 9578 5491 50  0000 L CNN
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
AR Path="/6143EE2A/614D231B" Ref="R38"  Part="1" 
F 0 "R38" H 10770 5746 50  0000 L CNN
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
AR Path="/6143EE2A/614D232B" Ref="R37"  Part="1" 
F 0 "R37" H 10770 5396 50  0000 L CNN
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
	7650 2450 10250 2450
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
AR Path="/6143EE2A/614FD52B" Ref="J23"  Part="1" 
F 0 "J23" H 7128 5441 50  0000 L CNN
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
AR Path="/6143EE2A/614FD72A" Ref="R32"  Part="1" 
F 0 "R32" H 8320 5696 50  0000 L CNN
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
AR Path="/6143EE2A/614FD742" Ref="R31"  Part="1" 
F 0 "R31" H 8320 5346 50  0000 L CNN
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
AR Path="/6143EE2A/614FFE73" Ref="J22"  Part="1" 
F 0 "J22" H 9578 4041 50  0000 L CNN
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
AR Path="/6143EE2A/615000B6" Ref="R36"  Part="1" 
F 0 "R36" H 10770 4296 50  0000 L CNN
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
AR Path="/6143EE2A/615000CE" Ref="R35"  Part="1" 
F 0 "R35" H 10770 3946 50  0000 L CNN
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
AR Path="/6143EE2A/615031D4" Ref="J21"  Part="1" 
F 0 "J21" H 7228 3991 50  0000 L CNN
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
AR Path="/6143EE2A/6150345B" Ref="R34"  Part="1" 
F 0 "R34" H 8420 4246 50  0000 L CNN
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
AR Path="/6143EE2A/61503473" Ref="R33"  Part="1" 
F 0 "R33" H 8420 3896 50  0000 L CNN
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
GPIO-23
Text Label 1550 2600 2    50   ~ 0
gpio23
Text Label 1550 2750 2    50   ~ 0
gpio24
Text Label 1550 2900 2    50   ~ 0
gpio26
Text Label 1550 3050 2    50   ~ 0
gpio28
Text HLabel 1100 2750 0    50   Input ~ 0
GPIO-24
Text HLabel 1100 2900 0    50   Input ~ 0
GPIO-26
Text HLabel 1100 3050 0    50   Input ~ 0
GPIO-28
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
$EndSCHEMATC
