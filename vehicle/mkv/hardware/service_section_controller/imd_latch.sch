EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:SSM3K333R Q302
U 1 1 610EBA87
P 9400 5900
F 0 "Q302" H 9606 5946 50  0000 L CNN
F 1 "SSM3K333R" H 9606 5855 50  0000 L CNN
F 2 "footprints:SOT-23F" H 9600 5825 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 9600 5975 50  0001 L CNN
F 4 "DK" H 9900 6275 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 9800 6175 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 9700 6075 60  0001 C CNN "PurchasingLink"
	1    9400 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBA8D
P 9500 6100
F 0 "#PWR?" H 9500 5850 50  0001 C CNN
F 1 "GND" H 9505 5927 50  0000 C CNN
F 2 "" H 9500 6100 50  0001 C CNN
F 3 "" H 9500 6100 50  0001 C CNN
	1    9500 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3350 9050 3150
Wire Wire Line
	9050 3150 9500 3150
Wire Wire Line
	9050 3850 9500 3850
Wire Wire Line
	9500 4050 9500 3850
Connection ~ 9500 3850
Wire Wire Line
	9500 3850 9500 3750
Wire Wire Line
	9800 3850 9800 3750
Text Notes 8900 2800 0    98   ~ 0
IMD Shutdown Relay
$Comp
L formula:R_604K R311
U 1 1 610EBBC0
P 8250 5200
F 0 "R311" H 8320 5246 50  0000 L CNN
F 1 "R_604K" H 8320 5155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8180 5200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8330 5200 50  0001 C CNN
F 4 "DK" H 8250 5200 60  0001 C CNN "MFN"
F 5 "RMCF0805FT604KCT-ND" H 8250 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT604K/RMCF0805FT604KCT-ND/4425214" H 8730 5600 60  0001 C CNN "PurchasingLink"
	1    8250 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBBC6
P 8250 5400
F 0 "#PWR?" H 8250 5150 50  0001 C CNN
F 1 "GND" H 8255 5227 50  0000 C CNN
F 2 "" H 8250 5400 50  0001 C CNN
F 3 "" H 8250 5400 50  0001 C CNN
	1    8250 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4850 9500 5000
$Comp
L power:GND #PWR?
U 1 1 610EBBE2
P 9500 4450
F 0 "#PWR?" H 9500 4200 50  0001 C CNN
F 1 "GND" H 9505 4277 50  0000 C CNN
F 2 "" H 9500 4450 50  0001 C CNN
F 3 "" H 9500 4450 50  0001 C CNN
	1    9500 4450
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q301
U 1 1 610EBBEB
P 9400 4250
F 0 "Q301" H 9606 4296 50  0000 L CNN
F 1 "SSM3K333R" H 9606 4205 50  0000 L CNN
F 2 "footprints:SOT-23F" H 9600 4175 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 9600 4325 50  0001 L CNN
F 4 "DK" H 9900 4625 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 9800 4525 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 9700 4425 60  0001 C CNN "PurchasingLink"
	1    9400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5300 9500 5400
Text Notes 10125 5650 0    50   ~ 0
SIGNAL LIGHT\nON = GOOD\n
Text Notes 10125 5175 0    50   ~ 0
I _lim: 20mA\n
$Comp
L formula:R_1K R315
U 1 1 610EBBF8
P 9500 5150
F 0 "R315" H 9570 5196 50  0000 L CNN
F 1 "R_1K" H 9570 5105 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9430 5150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 9580 5150 50  0001 C CNN
F 4 "DK" H 9500 5150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 9500 5150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 9980 5550 60  0001 C CNN "PurchasingLink"
	1    9500 5150
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D302
U 1 1 610EBC01
P 9500 5550
F 0 "D302" V 9539 5433 50  0000 R CNN
F 1 "LED_0805" V 9448 5433 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 9400 5550 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 9500 5650 50  0001 C CNN
F 4 "DK" H 9500 5550 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 9500 5550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9900 6050 60  0001 C CNN "PurchasingLink"
	1    9500 5550
	0    -1   -1   0   
$EndComp
Text Notes 10125 5450 0    50   ~ 0
IMD Output Status LED\n
Text GLabel 8600 4500 0    50   Input ~ 0
IMD_STATUS_OUTPUT
Text GLabel 10300 3850 2    50   Input ~ 0
TO_IMD_LATCH
Text GLabel 10200 2950 2    50   Input ~ 0
FROM_IMD_LATCH
Wire Wire Line
	10300 3850 9800 3850
Text Label 8100 5000 2    50   ~ 0
LATCH_OUTPUT
Wire Wire Line
	8100 5000 8250 5000
Connection ~ 8250 5000
Wire Wire Line
	8250 5000 8250 5050
Wire Wire Line
	8250 5350 8250 5400
NoConn ~ 5650 2000
Text Notes 5050 3350 0    50   ~ 0
Latch outputs 5V when the IMD Output is “Healthy”
Text Notes 5900 1600 0    50   ~ 0
NAND LATCH\n
Wire Wire Line
	7300 1400 7300 1500
Wire Wire Line
	6750 1400 7300 1400
Wire Wire Line
	6750 1500 6750 1400
Connection ~ 6750 1900
Wire Wire Line
	6750 1900 6750 1800
Wire Wire Line
	6600 1900 6750 1900
$Comp
L power:GND #PWR?
U 1 1 60DAD645
P 7300 1500
F 0 "#PWR?" H 7300 1250 50  0001 C CNN
F 1 "GND" H 7305 1327 50  0000 C CNN
F 2 "" H 7300 1500 50  0001 C CNN
F 3 "" H 7300 1500 50  0001 C CNN
	1    7300 1500
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C304
U 1 1 60DAC9D3
P 6750 1650
F 0 "C304" H 6850 1700 50  0000 L CNN
F 1 "C_0.1uF" H 6850 1600 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6788 1500 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6775 1750 50  0001 C CNN
F 4 "DK" H 6750 1650 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6750 1650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7175 2150 60  0001 C CNN "PurchasingLink"
	1    6750 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2000 7650 2150
Wire Wire Line
	6600 2000 7650 2000
Wire Wire Line
	7450 2100 7450 2150
Wire Wire Line
	6600 2100 7450 2100
$Comp
L power:GND #PWR?
U 1 1 60D82DEB
P 7650 2150
F 0 "#PWR?" H 7650 1900 50  0001 C CNN
F 1 "GND" H 7655 1977 50  0000 C CNN
F 2 "" H 7650 2150 50  0001 C CNN
F 3 "" H 7650 2150 50  0001 C CNN
	1    7650 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D828B8
P 7450 2150
F 0 "#PWR?" H 7450 1900 50  0001 C CNN
F 1 "GND" H 7455 1977 50  0000 C CNN
F 2 "" H 7450 2150 50  0001 C CNN
F 3 "" H 7450 2150 50  0001 C CNN
	1    7450 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2300 7000 2600
Wire Wire Line
	6600 2300 7000 2300
Wire Wire Line
	6800 2400 6800 2600
Wire Wire Line
	6600 2400 6800 2400
$Comp
L power:GND #PWR?
U 1 1 60D7C7D3
P 7000 2600
F 0 "#PWR?" H 7000 2350 50  0001 C CNN
F 1 "GND" H 7005 2427 50  0000 C CNN
F 2 "" H 7000 2600 50  0001 C CNN
F 3 "" H 7000 2600 50  0001 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D7BE93
P 6800 2600
F 0 "#PWR?" H 6800 2350 50  0001 C CNN
F 1 "GND" H 6805 2427 50  0000 C CNN
F 2 "" H 6800 2600 50  0001 C CNN
F 3 "" H 6800 2600 50  0001 C CNN
	1    6800 2600
	1    0    0    -1  
$EndComp
NoConn ~ 6600 2600
NoConn ~ 6600 2500
$Comp
L formula:CD4044BDR U?
U 1 1 60D455EC
P 6350 2600
F 0 "U?" H 6125 3525 50  0000 C CNN
F 1 "CD4044BDR" H 6125 3434 50  0000 C CNN
F 2 "footprints:SOIC127P600X175-16N" H 5850 1850 50  0001 L BNN
F 3 "https://www.ti.com/lit/ds/symlink/cd4043b.pdf" H 6350 2600 50  0001 L BNN
F 4 "DK" H 6350 2600 50  0001 C CNN "MNF"
F 5 "296-31498-1-ND" H 6300 2600 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/texas-instruments/CD4044BDR/1691063?s=N4IgTCBcDaIMIBEAsAGJSBCCBKIC6AvkA" H 6300 2600 50  0001 C CNN "Purchasing Link"
	1    6350 2600
	1    0    0    -1  
$EndComp
Text Label 6600 2200 0    50   ~ 0
LATCH_OUTPUT
NoConn ~ 5650 1900
Wire Wire Line
	5650 2300 5350 2300
Wire Wire Line
	5650 2600 5550 2600
Wire Wire Line
	5350 2500 5350 2600
Wire Wire Line
	5650 2500 5350 2500
Wire Wire Line
	5150 2400 5150 2600
Wire Wire Line
	5650 2400 5150 2400
$Comp
L power:GND #PWR?
U 1 1 60D52AB9
P 5150 2600
F 0 "#PWR?" H 5150 2350 50  0001 C CNN
F 1 "GND" H 5155 2427 50  0000 C CNN
F 2 "" H 5150 2600 50  0001 C CNN
F 3 "" H 5150 2600 50  0001 C CNN
	1    5150 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D526E3
P 5350 2600
F 0 "#PWR?" H 5350 2350 50  0001 C CNN
F 1 "GND" H 5355 2427 50  0000 C CNN
F 2 "" H 5350 2600 50  0001 C CNN
F 3 "" H 5350 2600 50  0001 C CNN
	1    5350 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D51F35
P 5550 2600
F 0 "#PWR?" H 5550 2350 50  0001 C CNN
F 1 "GND" H 5555 2427 50  0000 C CNN
F 2 "" H 5550 2600 50  0001 C CNN
F 3 "" H 5550 2600 50  0001 C CNN
	1    5550 2600
	1    0    0    -1  
$EndComp
Text Notes 2200 3450 0    50   ~ 0
Vout = 1.67V
Text GLabel 1300 4225 2    50   Input ~ 0
IMD_Output
Wire Wire Line
	2150 3900 2150 4000
Connection ~ 2150 3450
Wire Wire Line
	2150 3450 2150 3600
$Comp
L power:GND #PWR?
U 1 1 60DBD719
P 2150 4000
F 0 "#PWR?" H 2150 3750 50  0001 C CNN
F 1 "GND" H 2155 3827 50  0000 C CNN
F 2 "" H 2150 4000 50  0001 C CNN
F 3 "" H 2150 4000 50  0001 C CNN
	1    2150 4000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_604K R310
U 1 1 60DBD065
P 2150 3750
F 0 "R310" V 1943 3750 50  0000 C CNN
F 1 "R_604K" V 2034 3750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2080 3750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2230 3750 50  0001 C CNN
F 4 "DK" H 2150 3750 60  0001 C CNN "MFN"
F 5 "RMCF0805FT604KCT-ND" H 2150 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT604K/RMCF0805FT604KCT-ND/4425214" H 2630 4150 60  0001 C CNN "PurchasingLink"
	1    2150 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 3450 1850 3450
Wire Wire Line
	1500 3450 1550 3450
$Comp
L formula:R_2.2K R305
U 1 1 60DA1160
P 1350 3450
F 0 "R305" V 1143 3450 50  0000 C CNN
F 1 "R_2.2K" V 1234 3450 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1280 3450 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1430 3450 50  0001 C CNN
F 4 "DK" H 1350 3450 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 1350 3450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 1830 3850 60  0001 C CNN "PurchasingLink"
	1    1350 3450
	0    1    1    0   
$EndComp
$Comp
L formula:R_300K R308
U 1 1 60DA0541
P 1700 3450
F 0 "R308" V 1493 3450 50  0000 C CNN
F 1 "R_300K" V 1584 3450 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1630 3450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 1780 3450 50  0001 C CNN
F 4 "DK" H 1700 3450 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 1700 3450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB304V/P300KDACT-ND/1466006" H 2180 3850 60  0001 C CNN "PurchasingLink"
	1    1700 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3475 3450 3550 3450
Connection ~ 3475 3450
Wire Wire Line
	3450 3450 3475 3450
$Comp
L formula:C_0.1uF C303
U 1 1 610EBB70
P 3700 3450
F 0 "C303" V 3448 3450 50  0000 C CNN
F 1 "C_0.1uF" V 3539 3450 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 3738 3300 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3725 3550 50  0001 C CNN
F 4 "DK" H 3700 3450 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3700 3450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4125 3950 60  0001 C CNN "PurchasingLink"
	1    3700 3450
	0    1    1    0   
$EndComp
Text Notes 950  4975 1    50   ~ 0
This is IMD\n\n
Connection ~ 1950 4575
$Comp
L formula:TLV3701QDBVRG4Q1 U302
U 1 1 610EBC31
P 3575 3800
F 0 "U302" H 3600 3550 50  0000 L CNN
F 1 "TLV3701QDBVRG4Q1" H 3600 3650 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 3525 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv3702-q1.pdf" H 3525 4450 50  0001 C CNN
F 4 "DK" H 3875 4750 60  0001 C CNN "MFN"
F 5 "497-10249-1-ND" H 3775 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TLV3701QDBVRG4Q1/296-32395-6-ND/3507000" H 3675 4550 60  0001 C CNN "PurchasingLink"
	1    3575 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBB7A
P 3850 3450
F 0 "#PWR?" H 3850 3200 50  0001 C CNN
F 1 "GND" H 3855 3277 50  0000 C CNN
F 2 "" H 3850 3450 50  0001 C CNN
F 3 "" H 3850 3450 50  0001 C CNN
	1    3850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3475 3450 3475 3500
$Comp
L power:GND #PWR?
U 1 1 610EBB50
P 3475 4100
F 0 "#PWR?" H 3475 3850 50  0001 C CNN
F 1 "GND" H 3480 3927 50  0000 C CNN
F 2 "" H 3475 4100 50  0001 C CNN
F 3 "" H 3475 4100 50  0001 C CNN
	1    3475 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4725 1950 4575
Wire Wire Line
	1775 4675 1775 5025
$Comp
L power:GND #PWR?
U 1 1 610EBAF3
P 1775 5025
F 0 "#PWR?" H 1775 4775 50  0001 C CNN
F 1 "GND" H 1780 4852 50  0000 C CNN
F 2 "" H 1775 5025 50  0001 C CNN
F 3 "" H 1775 5025 50  0001 C CNN
	1    1775 5025
	1    0    0    -1  
$EndComp
$Comp
L formula:R_2.2K R307
U 1 1 610EBAED
P 1950 4875
F 0 "R307" H 2020 4921 50  0000 L CNN
F 1 "R_2.2K" H 2020 4830 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1880 4875 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2030 4875 50  0001 C CNN
F 4 "DK" H 1950 4875 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 1950 4875 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 2430 5275 60  0001 C CNN "PurchasingLink"
	1    1950 4875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBAE3
P 1950 5025
F 0 "#PWR?" H 1950 4775 50  0001 C CNN
F 1 "GND" H 1955 4852 50  0000 C CNN
F 2 "" H 1950 5025 50  0001 C CNN
F 3 "" H 1950 5025 50  0001 C CNN
	1    1950 5025
	1    0    0    -1  
$EndComp
Text Notes 900  5700 0    50   ~ 0
“GOOD” Output is Logical High in a range of 0V-12V; Threshold set to +1.67V\n
Text Notes 575  3850 0    50   ~ 0
IMD SIDE\nMakes analog imd signal digital\n
Wire Wire Line
	1900 2750 1900 2850
Wire Wire Line
	1900 2400 1900 2450
$Comp
L formula:C_2.2uF C301
U 1 1 610EBADA
P 1900 2650
F 0 "C301" H 2000 2650 50  0000 L CNN
F 1 "C_2.2uF" H 1925 2550 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 1938 2500 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 1925 2750 50  0001 C CNN
F 4 "DK" H 1900 2650 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 1900 2650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2325 3150 60  0001 C CNN "PurchasingLink"
	1    1900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2400 2350 2400
Connection ~ 1900 2400
Wire Wire Line
	1850 2400 1900 2400
Wire Wire Line
	1000 1400 1275 1400
Wire Wire Line
	1250 2400 1000 2400
Wire Wire Line
	1875 1400 2000 1400
$Comp
L formula:R_120K R303
U 1 1 610EBC62
P 1700 2400
F 0 "R303" V 1493 2400 50  0000 C CNN
F 1 "R_120K" V 1584 2400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1630 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1780 2400 50  0001 C CNN
F 4 "DK" H 1700 2400 60  0001 C CNN "MFN"
F 5 "RMCF0805FT120KCT-ND" H 1700 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT120K/RMCF0805FT120KCT-ND/2418248" H 2180 2800 60  0001 C CNN "PurchasingLink"
	1    1700 2400
	0    1    1    0   
$EndComp
$Comp
L formula:R_1K R301
U 1 1 610EBC59
P 1400 2400
F 0 "R301" V 1193 2400 50  0000 C CNN
F 1 "R_1K" V 1284 2400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1330 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1480 2400 50  0001 C CNN
F 4 "DK" H 1400 2400 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1400 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 1880 2800 60  0001 C CNN "PurchasingLink"
	1    1400 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 1550 2000 1675
$Comp
L formula:R_1.82M R309
U 1 1 610EBC4F
P 2350 2625
F 0 "R309" H 2420 2671 50  0000 L CNN
F 1 "R_1.82M" H 2420 2580 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2280 2625 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2430 2625 50  0001 C CNN
F 4 "DK" H 2350 2625 60  0001 C CNN "MFN"
F 5 "RMCF0805FT1M82CT-ND" H 2350 2625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT1M82/RMCF0805FT1M82CT-ND/2418309" H 2830 3025 60  0001 C CNN "PurchasingLink"
	1    2350 2625
	1    0    0    -1  
$EndComp
Connection ~ 2000 1550
$Comp
L formula:R_604K R306
U 1 1 610EBC28
P 2000 1825
F 0 "R306" V 1793 1825 50  0000 C CNN
F 1 "R_604K" V 1884 1825 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1930 1825 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2080 1825 50  0001 C CNN
F 4 "DK" H 2000 1825 60  0001 C CNN "MFN"
F 5 "RMCF0805FT604KCT-ND" H 2000 1825 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT604K/RMCF0805FT604KCT-ND/4425214" H 2480 2225 60  0001 C CNN "PurchasingLink"
	1    2000 1825
	-1   0    0    1   
$EndComp
$Comp
L formula:R_300K R304
U 1 1 610EBC1F
P 1725 1400
F 0 "R304" V 1518 1400 50  0000 C CNN
F 1 "R_300K" V 1609 1400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1655 1400 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 1805 1400 50  0001 C CNN
F 4 "DK" H 1725 1400 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 1725 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB304V/P300KDACT-ND/1466006" H 2205 1800 60  0001 C CNN "PurchasingLink"
	1    1725 1400
	0    1    1    0   
$EndComp
$Comp
L formula:R_2.2K R302
U 1 1 610EBC16
P 1425 1400
F 0 "R302" V 1218 1400 50  0000 C CNN
F 1 "R_2.2K" V 1309 1400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1355 1400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1505 1400 50  0001 C CNN
F 4 "DK" H 1425 1400 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 1425 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 1905 1800 60  0001 C CNN "PurchasingLink"
	1    1425 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 2775 2350 2850
Wire Wire Line
	2000 1975 2000 2025
Connection ~ 2350 2850
$Comp
L formula:TLV3701QDBVRG4Q1 U301
U 1 1 610EBC0A
P 3500 2100
F 0 "U301" H 3600 2000 50  0000 L CNN
F 1 "TLV3701QDBVRG4Q1" H 3600 1900 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 3500 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv3702-q1.pdf" H 3500 2300 50  0001 C CNN
F 4 "DK" H 3850 2600 60  0001 C CNN "MFN"
F 5 "497-10249-1-ND" H 3750 2500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TLV3701QDBVRG4Q1/296-32395-6-ND/3507000" H 3650 2400 60  0001 C CNN "PurchasingLink"
	1    3500 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBB66
P 3775 1750
F 0 "#PWR?" H 3775 1500 50  0001 C CNN
F 1 "GND" H 3780 1577 50  0000 C CNN
F 2 "" H 3775 1750 50  0001 C CNN
F 3 "" H 3775 1750 50  0001 C CNN
	1    3775 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1750 3400 1800
Connection ~ 3400 1750
Wire Wire Line
	3475 1750 3400 1750
$Comp
L formula:C_0.1uF C302
U 1 1 610EBB5C
P 3625 1750
F 0 "C302" V 3373 1750 50  0000 C CNN
F 1 "C_0.1uF" V 3464 1750 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 3663 1600 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3650 1850 50  0001 C CNN
F 4 "DK" H 3625 1750 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3625 1750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4050 2250 60  0001 C CNN "PurchasingLink"
	1    3625 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 1550 2550 1550
Wire Wire Line
	2000 1400 2000 1550
Connection ~ 2350 2400
Wire Wire Line
	2350 2475 2350 2400
Wire Wire Line
	2350 2850 2350 2925
$Comp
L power:GND #PWR?
U 1 1 610EBACF
P 3400 2400
F 0 "#PWR?" H 3400 2150 50  0001 C CNN
F 1 "GND" H 3405 2227 50  0000 C CNN
F 2 "" H 3400 2400 50  0001 C CNN
F 3 "" H 3400 2400 50  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBAC7
P 2350 2925
F 0 "#PWR?" H 2350 2675 50  0001 C CNN
F 1 "GND" H 2355 2752 50  0000 C CNN
F 2 "" H 2350 2925 50  0001 C CNN
F 3 "" H 2350 2925 50  0001 C CNN
	1    2350 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2850 2350 2850
$Comp
L power:GND #PWR?
U 1 1 610EBABF
P 2000 2025
F 0 "#PWR?" H 2000 1775 50  0001 C CNN
F 1 "GND" H 2005 1852 50  0000 C CNN
F 2 "" H 2000 2025 50  0001 C CNN
F 3 "" H 2000 2025 50  0001 C CNN
	1    2000 2025
	1    0    0    -1  
$EndComp
Text Notes 2200 1200 0    50   ~ 0
DELAY SIDE:\ntimer gives the IMD time \nto power up
Text Notes 600  2800 0    50   ~ 0
t= -ln((10-x)/10)*2.662\n\n
Text Notes 575  2625 0    50   ~ 0
10V Output in 4.2 Sec delay\n
Wire Wire Line
	5650 2100 4100 2100
Wire Wire Line
	3875 3800 4050 3800
$Comp
L formula:G5Q-1A4-DC12 K?
U 1 1 60F0C2F5
P 9700 3450
AR Path="/60A3B220/60F0C2F5" Ref="K?"  Part="1" 
AR Path="/60A3BC90/60F0C2F5" Ref="K?"  Part="1" 
AR Path="/60A3B129/60F0C2F5" Ref="K301"  Part="1" 
F 0 "K301" H 10030 3496 50  0000 L CNN
F 1 "G5Q-1A4-DC12" H 10030 3405 50  0000 L CNN
F 2 "footprints:Relay_SPST_OMRON-G5Q-1A4_OEM" H 9550 3850 50  0001 C CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5q.pdf" H 9650 3950 50  0001 C CNN
	1    9700 3450
	1    0    0    -1  
$EndComp
Connection ~ 9500 3150
$Comp
L formula:BAS40-00 D?
U 1 1 60F1916A
P 9050 3500
AR Path="/60A3B220/60F1916A" Ref="D?"  Part="1" 
AR Path="/60A3BC90/60F1916A" Ref="D?"  Part="1" 
AR Path="/60A3B129/60F1916A" Ref="D301"  Part="1" 
F 0 "D301" V 9050 3200 50  0000 C CNN
F 1 "BAS40-00" V 8950 3200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8950 3500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAS40_1PSXXSB4X_SER.pdf" H 9050 3600 50  0001 C CNN
F 4 "DK" H 9150 3700 50  0001 C CNN "MFN"
F 5 "1727-4234-1-ND" H 9250 3800 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/nexperia-usa-inc/BAS40215/1727-4234-1-ND/2122190" H 9350 3900 50  0001 C CNN "PurchasingLink"
	1    9050 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 3850 9050 3650
Wire Wire Line
	9200 5000 9200 5900
Wire Wire Line
	9200 4250 9200 5000
Connection ~ 9200 5000
Text Notes 7975 4650 0    50   ~ 0
to ATmega16m1
Wire Wire Line
	4750 2200 5650 2200
Wire Wire Line
	4750 2200 4750 3800
Wire Notes Line
	11100 2550 7350 2550
Wire Notes Line
	7350 6500 11100 6500
$Comp
L formula:Test_Point_SMD TP303
U 1 1 61478C0F
P 2550 1750
F 0 "TP303" H 2450 1900 50  0000 R CNN
F 1 "Test_Point_SMD" H 2700 1950 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2550 1600 50  0001 C CNN
F 3 "" H 2550 1750 50  0001 C CNN
	1    2550 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 1550 2550 1700
Connection ~ 2550 1550
$Comp
L formula:Test_Point_SMD TP302
U 1 1 6147DE08
P 3000 2700
F 0 "TP302" V 3000 3000 50  0000 C CNN
F 1 "Test_Point_SMD" V 2900 2750 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3000 2550 50  0001 C CNN
F 3 "" H 3000 2700 50  0001 C CNN
	1    3000 2700
	-1   0    0    1   
$EndComp
$Comp
L formula:Test_Point_SMD TP305
U 1 1 6148B24D
P 4050 3650
F 0 "TP305" H 4128 3738 50  0000 L CNN
F 1 "OPAMP_OUTPUT" H 4128 3647 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4050 3500 50  0001 C CNN
F 3 "" H 4050 3650 50  0001 C CNN
	1    4050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3700 4050 3800
Connection ~ 4050 3800
Wire Wire Line
	4050 3800 4750 3800
$Comp
L formula:Test_Point_SMD TP304
U 1 1 6148EBF2
P 2700 3600
F 0 "TP304" V 2649 3778 50  0000 L CNN
F 1 "8V_OPAMP" V 2740 3778 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2700 3450 50  0001 C CNN
F 3 "" H 2700 3600 50  0001 C CNN
	1    2700 3600
	-1   0    0    1   
$EndComp
$Comp
L formula:Test_Point_SMD TP301
U 1 1 61492A6E
P 2525 4400
F 0 "TP301" H 2603 4488 50  0000 L CNN
F 1 "IMD_OUTPUT" H 2603 4397 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2525 4250 50  0001 C CNN
F 3 "" H 2525 4400 50  0001 C CNN
	1    2525 4400
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP306
U 1 1 6149A757
P 4100 1900
F 0 "TP306" H 4178 1988 50  0000 L CNN
F 1 "Test_Point_SMD" H 4178 1897 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4100 1750 50  0001 C CNN
F 3 "" H 4100 1900 50  0001 C CNN
	1    4100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1950 4100 2100
Connection ~ 4100 2100
Wire Wire Line
	4100 2100 3800 2100
Wire Notes Line
	7350 2550 7350 6500
Wire Notes Line
	11100 2550 11100 6500
$Comp
L formula:Test_Point_SMD TP308
U 1 1 614D7BB2
P 5450 5100
F 0 "TP308" V 5450 6100 50  0000 L CNN
F 1 "IMD_STATUS_OUTPUT" V 5450 5300 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5450 4950 50  0001 C CNN
F 3 "" H 5450 5100 50  0001 C CNN
	1    5450 5100
	0    1    1    0   
$EndComp
Text GLabel 5200 5100 0    50   Input ~ 0
IMD_STATUS_OUTPUT
Wire Wire Line
	5200 5100 5400 5100
$Comp
L formula:Test_Point_SMD TP307
U 1 1 6150BB06
P 5450 4900
F 0 "TP307" V 5450 5700 50  0000 L CNN
F 1 "LATCH_OUTPUT" V 5450 5100 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5450 4750 50  0001 C CNN
F 3 "" H 5450 4900 50  0001 C CNN
	1    5450 4900
	0    1    1    0   
$EndComp
Text Label 5150 4900 2    50   ~ 0
LATCH_OUTPUT
Wire Wire Line
	5150 4900 5400 4900
Wire Wire Line
	9800 2950 10200 2950
Wire Wire Line
	9800 2950 9800 3150
Wire Wire Line
	1075 4675 1775 4675
$Comp
L formula:UF_5_VT J301
U 1 1 610EBAFC
P 725 4775
F 0 "J301" H 833 5212 60  0000 C CNN
F 1 "UF_5_VT" H 833 5106 60  0000 C CNN
F 2 "footprints:Ultrafit_5" H 625 5025 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1008.pdf" H 725 5125 60  0001 C CNN
F 4 "DK" H 725 4775 60  0001 C CNN "MFN"
F 5 "WM11667-ND" H 725 4775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex-llc/1722861105/WM11667-ND/5360132" H 1225 5625 60  0001 C CNN "PurchasingLink"
	1    725  4775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A9CFCE
P 1200 5025
F 0 "#PWR?" H 1200 4775 50  0001 C CNN
F 1 "GND" H 1205 4852 50  0000 C CNN
F 2 "" H 1200 5025 50  0001 C CNN
F 3 "" H 1200 5025 50  0001 C CNN
	1    1200 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4975 1200 5025
Wire Wire Line
	1075 4975 1200 4975
Wire Wire Line
	1350 5025 1350 4875
Wire Wire Line
	1350 4875 1075 4875
Wire Wire Line
	1000 3450 1200 3450
Wire Wire Line
	6750 1900 7650 1900
Text GLabel 3400 1400 2    50   Input ~ 0
+5V_IMD
Wire Wire Line
	3400 1400 3400 1750
$Comp
L power:GND #PWR?
U 1 1 610EBB0C
P 1350 5025
F 0 "#PWR?" H 1350 4775 50  0001 C CNN
F 1 "GND" H 1355 4852 50  0000 C CNN
F 2 "" H 1350 5025 50  0001 C CNN
F 3 "" H 1350 5025 50  0001 C CNN
	1    1350 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3050 3450 3450
Text GLabel 9500 3000 0    50   Input ~ 0
+12V_SHUTDOWN
Wire Wire Line
	9500 3000 9500 3150
Wire Wire Line
	3000 2400 3000 2650
Wire Wire Line
	2350 2400 3000 2400
Wire Wire Line
	3200 1550 3200 2000
Wire Wire Line
	2550 1550 3200 1550
Wire Wire Line
	3000 2400 3000 2200
Wire Wire Line
	3000 2200 3200 2200
Connection ~ 3000 2400
Wire Wire Line
	2150 3450 2700 3450
Wire Wire Line
	2700 3450 2700 3550
Wire Wire Line
	3275 3700 3200 3700
Wire Wire Line
	3200 3700 3200 3450
Wire Wire Line
	3200 3450 2700 3450
Connection ~ 2700 3450
Wire Wire Line
	3275 3900 3050 3900
Wire Wire Line
	3050 3900 3050 4575
Wire Wire Line
	1075 4575 1225 4575
$Comp
L formula:R_3K R312
U 1 1 626D4614
P 1500 4575
F 0 "R312" V 1293 4575 50  0000 C CNN
F 1 "R_3K" V 1384 4575 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1430 4575 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1580 4575 50  0001 C CNN
F 4 "DK" H 1500 4575 60  0001 C CNN "MFN"
F 5 "RMCF0805FT3K00CT-ND" H 1500 4575 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT3K00/RMCF0805FT3K00CT-ND/2418389" H 1980 4975 60  0001 C CNN "PurchasingLink"
	1    1500 4575
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 4575 1950 4575
Wire Wire Line
	1300 4225 1225 4225
Wire Wire Line
	1225 4225 1225 4575
Connection ~ 1225 4575
Wire Wire Line
	1225 4575 1350 4575
Wire Wire Line
	8600 4500 8775 4500
Wire Wire Line
	8775 4500 8775 5000
Wire Wire Line
	8250 5000 8775 5000
Connection ~ 8775 5000
Wire Wire Line
	8775 5000 9200 5000
Text GLabel 3450 3050 2    50   Input ~ 0
+5V_IMD
Text GLabel 1000 3450 0    50   Input ~ 0
+5V_IMD
Text GLabel 1000 1400 0    50   Input ~ 0
+5V_IMD
Text GLabel 1000 2400 0    50   Input ~ 0
+5V_IMD
Text GLabel 5350 2300 0    50   Input ~ 0
+5V_IMD
Text GLabel 7650 1900 2    50   Input ~ 0
+5V_IMD
Text GLabel 9500 4850 2    50   Input ~ 0
+5V_IMD
Connection ~ 2525 4575
Wire Wire Line
	2525 4450 2525 4575
Wire Wire Line
	2525 4575 3050 4575
Wire Wire Line
	1950 4575 2525 4575
Text GLabel 1075 4775 2    50   Input ~ 0
+12V_SHUTDOWN
$EndSCHEMATC
