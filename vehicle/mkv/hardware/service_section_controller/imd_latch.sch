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
Text GLabel 8650 5800 0    50   Input ~ 0
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
Latch outputs 12V when the IMD Output is “Healthy”
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
Text Notes 3000 4700 0    50   ~ 0
Vout = 8V
Text GLabel 1750 3600 2    50   Input ~ 0
IMD_Output
Wire Wire Line
	1750 3600 1750 3700
Connection ~ 1750 3700
Wire Wire Line
	1750 3700 2350 3700
Wire Wire Line
	2950 3900 3275 3900
Wire Wire Line
	2950 5150 2950 5250
Connection ~ 2950 4700
Wire Wire Line
	2950 4700 2950 4850
$Comp
L power:GND #PWR?
U 1 1 60DBD719
P 2950 5250
F 0 "#PWR?" H 2950 5000 50  0001 C CNN
F 1 "GND" H 2955 5077 50  0000 C CNN
F 2 "" H 2950 5250 50  0001 C CNN
F 3 "" H 2950 5250 50  0001 C CNN
	1    2950 5250
	1    0    0    -1  
$EndComp
$Comp
L formula:R_604K R310
U 1 1 60DBD065
P 2950 5000
F 0 "R310" V 2743 5000 50  0000 C CNN
F 1 "R_604K" V 2834 5000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2880 5000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 3030 5000 50  0001 C CNN
F 4 "DK" H 2950 5000 60  0001 C CNN "MFN"
F 5 "RMCF0805FT604KCT-ND" H 2950 5000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT604K/RMCF0805FT604KCT-ND/4425214" H 3430 5400 60  0001 C CNN "PurchasingLink"
	1    2950 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 3900 2950 4450
Wire Wire Line
	2950 4700 2650 4700
Wire Wire Line
	2300 4700 2350 4700
$Comp
L formula:R_2.2K R305
U 1 1 60DA1160
P 2150 4700
F 0 "R305" V 1943 4700 50  0000 C CNN
F 1 "R_2.2K" V 2034 4700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2080 4700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2230 4700 50  0001 C CNN
F 4 "DK" H 2150 4700 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 2150 4700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 2630 5100 60  0001 C CNN "PurchasingLink"
	1    2150 4700
	0    1    1    0   
$EndComp
$Comp
L formula:R_300K R308
U 1 1 60DA0541
P 2500 4700
F 0 "R308" V 2293 4700 50  0000 C CNN
F 1 "R_300K" V 2384 4700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2430 4700 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 2580 4700 50  0001 C CNN
F 4 "DK" H 2500 4700 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 2500 4700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB304V/P300KDACT-ND/1466006" H 2980 5100 60  0001 C CNN "PurchasingLink"
	1    2500 4700
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
Text Notes 1350 4100 1    50   ~ 0
This is IMD\n\n
Connection ~ 2350 3700
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
	2350 3700 2600 3700
Wire Wire Line
	2350 3850 2350 3700
Wire Wire Line
	2175 3800 2175 4150
$Comp
L power:GND #PWR?
U 1 1 610EBAF3
P 2175 4150
F 0 "#PWR?" H 2175 3900 50  0001 C CNN
F 1 "GND" H 2180 3977 50  0000 C CNN
F 2 "" H 2175 4150 50  0001 C CNN
F 3 "" H 2175 4150 50  0001 C CNN
	1    2175 4150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_2.2K R307
U 1 1 610EBAED
P 2350 4000
F 0 "R307" H 2420 4046 50  0000 L CNN
F 1 "R_2.2K" H 2420 3955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2280 4000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2430 4000 50  0001 C CNN
F 4 "DK" H 2350 4000 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 2350 4000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 2830 4400 60  0001 C CNN "PurchasingLink"
	1    2350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EBAE3
P 2350 4150
F 0 "#PWR?" H 2350 3900 50  0001 C CNN
F 1 "GND" H 2355 3977 50  0000 C CNN
F 2 "" H 2350 4150 50  0001 C CNN
F 3 "" H 2350 4150 50  0001 C CNN
	1    2350 4150
	1    0    0    -1  
$EndComp
Text Notes 900  5700 0    50   ~ 0
“GOOD” Output is Logical High in a range of 0V-12V; Threshold set to +8V\n
Text Notes 1650 3375 0    50   ~ 0
IMD SIDE\nMakes analog imd signal digital\n
Wire Wire Line
	2150 1500 2150 1600
Wire Wire Line
	2150 1150 2150 1200
$Comp
L formula:C_2.2uF C301
U 1 1 610EBADA
P 2150 1400
F 0 "C301" H 2250 1400 50  0000 L CNN
F 1 "C_2.2uF" H 2175 1300 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2188 1250 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2175 1500 50  0001 C CNN
F 4 "DK" H 2150 1400 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2150 1400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2575 1900 60  0001 C CNN "PurchasingLink"
	1    2150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1150 2600 1150
Connection ~ 2150 1150
Wire Wire Line
	2100 1150 2150 1150
Wire Wire Line
	1250 2050 1525 2050
Wire Wire Line
	1500 1150 1250 1150
Wire Wire Line
	2125 2050 2250 2050
$Comp
L formula:R_120K R303
U 1 1 610EBC62
P 1950 1150
F 0 "R303" V 1743 1150 50  0000 C CNN
F 1 "R_120K" V 1834 1150 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1880 1150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2030 1150 50  0001 C CNN
F 4 "DK" H 1950 1150 60  0001 C CNN "MFN"
F 5 "RMCF0805FT120KCT-ND" H 1950 1150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT120K/RMCF0805FT120KCT-ND/2418248" H 2430 1550 60  0001 C CNN "PurchasingLink"
	1    1950 1150
	0    1    1    0   
$EndComp
$Comp
L formula:R_1K R301
U 1 1 610EBC59
P 1650 1150
F 0 "R301" V 1443 1150 50  0000 C CNN
F 1 "R_1K" V 1534 1150 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1580 1150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1730 1150 50  0001 C CNN
F 4 "DK" H 1650 1150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1650 1150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2130 1550 60  0001 C CNN "PurchasingLink"
	1    1650 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 2200 2250 2325
$Comp
L formula:R_1.82M R309
U 1 1 610EBC4F
P 2600 1375
F 0 "R309" H 2670 1421 50  0000 L CNN
F 1 "R_1.82M" H 2670 1330 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2530 1375 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2680 1375 50  0001 C CNN
F 4 "DK" H 2600 1375 60  0001 C CNN "MFN"
F 5 "RMCF0805FT1M82CT-ND" H 2600 1375 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT1M82/RMCF0805FT1M82CT-ND/2418309" H 3080 1775 60  0001 C CNN "PurchasingLink"
	1    2600 1375
	1    0    0    -1  
$EndComp
Connection ~ 2250 2200
$Comp
L formula:R_604K R306
U 1 1 610EBC28
P 2250 2475
F 0 "R306" V 2043 2475 50  0000 C CNN
F 1 "R_604K" V 2134 2475 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2180 2475 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2330 2475 50  0001 C CNN
F 4 "DK" H 2250 2475 60  0001 C CNN "MFN"
F 5 "RMCF0805FT604KCT-ND" H 2250 2475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT604K/RMCF0805FT604KCT-ND/4425214" H 2730 2875 60  0001 C CNN "PurchasingLink"
	1    2250 2475
	-1   0    0    1   
$EndComp
$Comp
L formula:R_300K R304
U 1 1 610EBC1F
P 1975 2050
F 0 "R304" V 1768 2050 50  0000 C CNN
F 1 "R_300K" V 1859 2050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1905 2050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 2055 2050 50  0001 C CNN
F 4 "DK" H 1975 2050 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 1975 2050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB304V/P300KDACT-ND/1466006" H 2455 2450 60  0001 C CNN "PurchasingLink"
	1    1975 2050
	0    1    1    0   
$EndComp
$Comp
L formula:R_2.2K R302
U 1 1 610EBC16
P 1675 2050
F 0 "R302" V 1468 2050 50  0000 C CNN
F 1 "R_2.2K" V 1559 2050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1605 2050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1755 2050 50  0001 C CNN
F 4 "DK" H 1675 2050 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 1675 2050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 2155 2450 60  0001 C CNN "PurchasingLink"
	1    1675 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 1525 2600 1600
Wire Wire Line
	2250 2625 2250 2675
Connection ~ 2600 1600
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
	2250 2200 2800 2200
Wire Wire Line
	2250 2050 2250 2200
Wire Wire Line
	2600 1150 2950 1150
Connection ~ 2600 1150
Wire Wire Line
	2600 1225 2600 1150
Wire Wire Line
	2600 1600 2600 1675
Wire Wire Line
	2950 1150 2950 2000
Wire Wire Line
	2950 2000 3200 2000
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
P 2600 1675
F 0 "#PWR?" H 2600 1425 50  0001 C CNN
F 1 "GND" H 2605 1502 50  0000 C CNN
F 2 "" H 2600 1675 50  0001 C CNN
F 3 "" H 2600 1675 50  0001 C CNN
	1    2600 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1600 2600 1600
$Comp
L power:GND #PWR?
U 1 1 610EBABF
P 2250 2675
F 0 "#PWR?" H 2250 2425 50  0001 C CNN
F 1 "GND" H 2255 2502 50  0000 C CNN
F 2 "" H 2250 2675 50  0001 C CNN
F 3 "" H 2250 2675 50  0001 C CNN
	1    2250 2675
	1    0    0    -1  
$EndComp
Text Notes 1550 800  0    50   ~ 0
DELAY SIDE:\ntimer gives the IMD time to power up
Text Notes 3050 1275 0    50   ~ 0
t= -ln((10-x)/10)*2.662\n\n
Text Notes 3025 1075 0    50   ~ 0
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
$Comp
L formula:R_1.13K R314
U 1 1 60D069DE
P 8750 6050
F 0 "R314" H 8820 6096 50  0000 L CNN
F 1 "R_1.13K" H 8820 6005 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8680 6050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 8830 6050 50  0001 C CNN
F 4 "DK" H 8750 6050 60  0001 C CNN "MFN"
F 5 "P1.13KDACT-ND" H 8750 6050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB1131V/P1.13KDACT-ND/3074923" H 9230 6450 60  0001 C CNN "PurchasingLink"
	1    8750 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D0BB14
P 8750 6200
F 0 "#PWR?" H 8750 5950 50  0001 C CNN
F 1 "GND" H 8755 6027 50  0000 C CNN
F 2 "" H 8750 6200 50  0001 C CNN
F 3 "" H 8750 6200 50  0001 C CNN
	1    8750 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5000 9200 5900
Wire Wire Line
	9200 4250 9200 5000
Connection ~ 9200 5000
Wire Wire Line
	8750 5000 9200 5000
Connection ~ 8750 5000
Wire Wire Line
	8250 5000 8750 5000
$Comp
L formula:R_2.2K R312
U 1 1 60D03BAD
P 8750 5200
F 0 "R312" H 8820 5246 50  0000 L CNN
F 1 "R_2.2K" H 8820 5155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8680 5200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8830 5200 50  0001 C CNN
F 4 "DK" H 8750 5200 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 8750 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 9230 5600 60  0001 C CNN "PurchasingLink"
	1    8750 5200
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R313
U 1 1 60DAD819
P 8750 5550
F 0 "R313" H 8820 5596 50  0000 L CNN
F 1 "R_1K" H 8820 5505 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8680 5550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 8830 5550 50  0001 C CNN
F 4 "DK" H 8750 5550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 8750 5550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 9230 5950 60  0001 C CNN "PurchasingLink"
	1    8750 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5000 8750 5050
Wire Wire Line
	8750 5350 8750 5400
Wire Wire Line
	8650 5800 8750 5800
Connection ~ 8750 5800
Wire Wire Line
	8750 5800 8750 5900
Text Notes 7900 5950 0    50   ~ 0
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
P 2800 2400
F 0 "TP303" H 2700 2550 50  0000 R CNN
F 1 "Test_Point_SMD" H 2950 2600 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2800 2250 50  0001 C CNN
F 3 "" H 2800 2400 50  0001 C CNN
	1    2800 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 2200 2800 2350
Connection ~ 2800 2200
Wire Wire Line
	2800 2200 3200 2200
$Comp
L formula:Test_Point_SMD TP302
U 1 1 6147DE08
P 2650 2000
F 0 "TP302" V 2650 2300 50  0000 C CNN
F 1 "Test_Point_SMD" V 2550 2050 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2650 1850 50  0001 C CNN
F 3 "" H 2650 2000 50  0001 C CNN
	1    2650 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 2000 2950 2000
Connection ~ 2950 2000
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
P 3100 4450
F 0 "TP304" V 3049 4628 50  0000 L CNN
F 1 "8V_OPAMP" V 3140 4628 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3100 4300 50  0001 C CNN
F 3 "" H 3100 4450 50  0001 C CNN
	1    3100 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 4450 3050 4450
Connection ~ 2950 4450
Wire Wire Line
	2950 4450 2950 4700
$Comp
L formula:Test_Point_SMD TP301
U 1 1 61492A6E
P 2600 3550
F 0 "TP301" H 2678 3638 50  0000 L CNN
F 1 "IMD_OUTPUT" H 2678 3547 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2600 3400 50  0001 C CNN
F 3 "" H 2600 3550 50  0001 C CNN
	1    2600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3600 2600 3700
Connection ~ 2600 3700
Wire Wire Line
	2600 3700 3275 3700
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
Wire Wire Line
	8750 5700 8750 5800
$Comp
L formula:Test_Point_SMD TP307
U 1 1 6150BB06
P 5450 4900
F 0 "TP307" V 5450 5700 50  0000 L CNN
F 1 "Test_Point_SMD" V 5450 5100 50  0000 L CNN
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
	1475 3800 2175 3800
Wire Wire Line
	1750 3700 1475 3700
$Comp
L formula:UF_5_VT J301
U 1 1 610EBAFC
P 1125 3900
F 0 "J301" H 1233 4337 60  0000 C CNN
F 1 "UF_5_VT" H 1233 4231 60  0000 C CNN
F 2 "footprints:Ultrafit_5" H 1025 4150 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1008.pdf" H 1125 4250 60  0001 C CNN
F 4 "DK" H 1125 3900 60  0001 C CNN "MFN"
F 5 "WM11667-ND" H 1125 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex-llc/1722861105/WM11667-ND/5360132" H 1625 4750 60  0001 C CNN "PurchasingLink"
	1    1125 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A9CFCE
P 1600 4150
F 0 "#PWR?" H 1600 3900 50  0001 C CNN
F 1 "GND" H 1605 3977 50  0000 C CNN
F 2 "" H 1600 4150 50  0001 C CNN
F 3 "" H 1600 4150 50  0001 C CNN
	1    1600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4100 1600 4150
Wire Wire Line
	1475 4100 1600 4100
Wire Wire Line
	1750 4150 1750 4000
Wire Wire Line
	1750 4000 1475 4000
Wire Wire Line
	1475 3900 1700 3900
Wire Wire Line
	1800 4700 2000 4700
Wire Wire Line
	6750 1900 7650 1900
Text GLabel 1250 1150 0    50   Input ~ 0
+12V_IMD
Text GLabel 3400 1400 2    50   Input ~ 0
+12V_IMD
Wire Wire Line
	3400 1400 3400 1750
Text GLabel 1250 2050 0    50   Input ~ 0
+12V_IMD
Text GLabel 1700 3900 2    50   Input ~ 0
+12V_IMD
$Comp
L power:GND #PWR?
U 1 1 610EBB0C
P 1750 4150
F 0 "#PWR?" H 1750 3900 50  0001 C CNN
F 1 "GND" H 1755 3977 50  0000 C CNN
F 2 "" H 1750 4150 50  0001 C CNN
F 3 "" H 1750 4150 50  0001 C CNN
	1    1750 4150
	1    0    0    -1  
$EndComp
Text GLabel 3450 3050 2    50   Input ~ 0
+12V_IMD
Wire Wire Line
	3450 3050 3450 3450
Text GLabel 1800 4700 0    50   Input ~ 0
+12V_IMD
Text GLabel 5350 2300 0    50   Input ~ 0
+12V_IMD
Text GLabel 7650 1900 2    50   Input ~ 0
+12V_IMD
Text GLabel 9500 3000 0    50   Input ~ 0
+12V_SHUTDOWN
Wire Wire Line
	9500 3000 9500 3150
Text GLabel 9500 4850 2    50   Input ~ 0
+12V_IMD
$EndSCHEMATC
