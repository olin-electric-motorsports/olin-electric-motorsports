EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp "Olin Electric Motorsports"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L bspd_brakelight-rescue:PWR_FLAG-power #FLG?
U 1 1 5C00B3D7
P 6600 9920
F 0 "#FLG?" H 6600 9995 50  0001 C CNN
F 1 "PWR_FLAG" H 6600 10070 50  0000 C CNN
F 2 "" H 6600 9920 50  0001 C CNN
F 3 "" H 6600 9920 50  0001 C CNN
	1    6600 9920
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:PWR_FLAG-power #FLG?
U 1 1 59E0A773
P 6980 9920
F 0 "#FLG?" H 6980 9995 50  0001 C CNN
F 1 "PWR_FLAG" H 6980 10070 50  0000 C CNN
F 2 "" H 6980 9920 50  0001 C CNN
F 3 "" H 6980 9920 50  0001 C CNN
	1    6980 9920
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:PWR_FLAG-power #FLG?
U 1 1 5C031BDC
P 7380 9920
F 0 "#FLG?" H 7380 9995 50  0001 C CNN
F 1 "PWR_FLAG" H 7380 10070 50  0000 C CNN
F 2 "" H 7380 9920 50  0001 C CNN
F 3 "" H 7380 9920 50  0001 C CNN
	1    7380 9920
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:+12V-power #PWR?
U 1 1 59E0A7D7
P 6600 9940
F 0 "#PWR?" H 6600 9790 50  0001 C CNN
F 1 "+12V" H 6600 10080 50  0000 C CNN
F 2 "" H 6600 9940 50  0001 C CNN
F 3 "" H 6600 9940 50  0001 C CNN
	1    6600 9940
	-1   0    0    1   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 59E0A859
P 7380 9950
F 0 "#PWR?" H 7380 9700 50  0001 C CNN
F 1 "GND" H 7380 9800 50  0000 C CNN
F 2 "" H 7380 9950 50  0001 C CNN
F 3 "" H 7380 9950 50  0001 C CNN
	1    7380 9950
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C9
U 1 1 5C00B3CC
P 14410 3160
F 0 "C9" V 14360 3010 50  0000 L CNN
F 1 "C_0.1uF" V 14460 2810 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 14448 3010 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14435 3260 50  0001 C CNN
F 4 "478-3352-1-ND" H 14410 3160 60  0001 C CNN "MPN"
F 5 "DK" H 14410 3160 60  0001 C CNN "MFN"
F 6 "Value" H 14410 3160 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 14835 3660 60  0001 C CNN "PurchasingLink"
	1    14410 3160
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 59E080E5
P 13760 3810
F 0 "#PWR?" H 13760 3560 50  0001 C CNN
F 1 "GND" H 13760 3660 50  0000 C CNN
F 2 "" H 13760 3810 50  0001 C CNN
F 3 "" H 13760 3810 50  0001 C CNN
	1    13760 3810
	1    0    0    -1  
$EndComp
NoConn ~ 14760 3610
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 59E082CD
P 14260 4010
F 0 "#PWR?" H 14260 3760 50  0001 C CNN
F 1 "GND" H 14260 3860 50  0000 C CNN
F 2 "" H 14260 4010 50  0001 C CNN
F 3 "" H 14260 4010 50  0001 C CNN
	1    14260 4010
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C00B3D0
P 14760 3160
F 0 "#PWR?" H 14760 2910 50  0001 C CNN
F 1 "GND" H 14760 3010 50  0000 C CNN
F 2 "" H 14760 3160 50  0001 C CNN
F 3 "" H 14760 3160 50  0001 C CNN
	1    14760 3160
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C00B3D3
P 6980 9950
F 0 "#PWR?" H 6980 9800 50  0001 C CNN
F 1 "VCC" H 6980 10100 50  0000 C CNN
F 2 "" H 6980 9950 50  0001 C CNN
F 3 "" H 6980 9950 50  0001 C CNN
	1    6980 9950
	-1   0    0    1   
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C00B3D5
P 14260 3160
F 0 "#PWR?" H 14260 3010 50  0001 C CNN
F 1 "VCC" H 14260 3310 50  0000 C CNN
F 2 "" H 14260 3160 50  0001 C CNN
F 3 "" H 14260 3160 50  0001 C CNN
	1    14260 3160
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 59E0C6BE
P 11860 2290
F 0 "#PWR?" H 11860 2140 50  0001 C CNN
F 1 "VCC" H 11860 2440 50  0000 C CNN
F 2 "" H 11860 2290 50  0001 C CNN
F 3 "" H 11860 2290 50  0001 C CNN
	1    11860 2290
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C00B3DD
P 11910 2490
F 0 "#PWR?" H 11910 2240 50  0001 C CNN
F 1 "GND" H 11910 2340 50  0000 C CNN
F 2 "" H 11910 2490 50  0001 C CNN
F 3 "" H 11910 2490 50  0001 C CNN
	1    11910 2490
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U3
U 1 1 5C00B3DF
P 14260 3610
F 0 "U3" H 13860 3960 50  0000 L CNN
F 1 "CAN_Transceiver" H 14310 3260 50  0000 L CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 14260 3110 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 13860 3960 50  0001 C CNN
F 4 "DK" H 14260 3610 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 14260 3610 60  0001 C CNN "MPN"
F 6 "Value" H 14260 3610 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 14260 4360 60  0001 C CNN "PurchasingLink"
	1    14260 3610
	1    0    0    -1  
$EndComp
Text Label 15085 3760 0    60   ~ 0
CAN_LOW
Text Label 15085 3460 0    60   ~ 0
CAN_HIGH
Text Label 13760 3410 2    60   ~ 0
TXCAN
Text Label 13760 3510 2    60   ~ 0
RXCAN
Text Label 11360 2290 2    60   ~ 0
MISO
Text Label 11360 2390 2    60   ~ 0
SCK
Text Label 11360 2490 2    60   ~ 0
RESET
Text Label 11860 2390 0    60   ~ 0
MOSI
Wire Wire Line
	14260 3160 14260 3210
Wire Wire Line
	14560 3160 14760 3160
Wire Wire Line
	11860 2490 11910 2490
Wire Wire Line
	14760 3460 14760 3510
Wire Wire Line
	14760 3760 14760 3710
Connection ~ 14260 3160
Wire Wire Line
	1210 4270 1360 4270
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BFFA62E
P 1690 3910
F 0 "#PWR?" H 1690 3660 50  0001 C CNN
F 1 "GND" H 1695 3737 50  0000 C CNN
F 2 "" H 1690 3910 50  0001 C CNN
F 3 "" H 1690 3910 50  0001 C CNN
	1    1690 3910
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:+12V-power #PWR?
U 1 1 5BFFA71A
P 1910 4320
F 0 "#PWR?" H 1910 4170 50  0001 C CNN
F 1 "+12V" H 1925 4493 50  0000 C CNN
F 2 "" H 1910 4320 50  0001 C CNN
F 3 "" H 1910 4320 50  0001 C CNN
	1    1910 4320
	1    0    0    -1  
$EndComp
Wire Wire Line
	3980 2800 3980 2500
Wire Wire Line
	3980 2800 4030 2800
$Comp
L formula:R_100K R4
U 1 1 5C008673
P 4180 2800
F 0 "R4" V 4280 2800 50  0000 C CNN
F 1 "R_100K" V 4064 2800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4110 2800 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 4260 2800 50  0001 C CNN
F 4 "DK" H 4180 2800 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 4180 2800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 4660 3200 60  0001 C CNN "PurchasingLink"
	1    4180 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	4330 2800 4480 2800
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C00A330
P 4480 2800
F 0 "#PWR?" H 4480 2550 50  0001 C CNN
F 1 "GND" H 4485 2627 50  0000 C CNN
F 2 "" H 4480 2800 50  0001 C CNN
F 3 "" H 4480 2800 50  0001 C CNN
	1    4480 2800
	1    0    0    -1  
$EndComp
$Comp
L formula:SN74LVC1G08DBVR U1
U 1 1 5C023975
P 4730 2450
F 0 "U1" H 4490 2870 60  0000 L CNN
F 1 "SN74LVC1G08" H 4040 2780 60  0000 L CNN
F 2 "footprints:RJ45-Vertical" H 4830 2450 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g08.pdf" H 5121 2397 60  0001 L CNN
F 4 "DK" H 4880 2750 60  0001 L CNN "MFN"
F 5 "296-11601-2-ND" H 4930 2060 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/SN74LVC1G08DBVR/296-11601-2-ND/385718" H 5130 2260 60  0001 C CNN "PurchasingLink"
	1    4730 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3980 2500 4430 2500
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C02BFF1
P 4730 2100
F 0 "#PWR?" H 4730 1950 50  0001 C CNN
F 1 "VCC" H 4747 2273 50  0000 C CNN
F 2 "" H 4730 2100 50  0001 C CNN
F 3 "" H 4730 2100 50  0001 C CNN
	1    4730 2100
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R5
U 1 1 5C02C4F0
P 5080 2600
F 0 "R5" V 5180 2550 50  0000 L CNN
F 1 "R_200" V 4980 2500 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5010 2600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5160 2600 50  0001 C CNN
F 4 "DK" H 5080 2600 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5080 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5560 3000 60  0001 C CNN "PurchasingLink"
	1    5080 2600
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D1
U 1 1 5C02C9A2
P 5080 3060
F 0 "D1" V 5080 3310 50  0000 R CNN
F 1 "LED_0805" V 4980 3460 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 4980 3060 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5080 3160 50  0001 C CNN
F 4 "DK" H 5080 3060 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5080 3060 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5480 3560 60  0001 C CNN "PurchasingLink"
	1    5080 3060
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C02CB4F
P 5080 3210
F 0 "#PWR?" H 5080 2960 50  0001 C CNN
F 1 "GND" H 5085 3037 50  0000 C CNN
F 2 "" H 5080 3210 50  0001 C CNN
F 3 "" H 5080 3210 50  0001 C CNN
	1    5080 3210
	1    0    0    -1  
$EndComp
Wire Wire Line
	5630 2450 5630 2650
$Comp
L formula:C_10uF C5
U 1 1 5C032CA5
P 5630 2850
F 0 "C5" H 5630 2950 50  0000 L CNN
F 1 "C_10uF" H 5630 2750 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5668 2700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A106KPFNNNE.pdf" H 5655 2950 50  0001 C CNN
F 4 "DK" H 5630 2850 60  0001 C CNN "MFN"
F 5 "1276-1052-1-ND" H 5630 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A106KPFNNNE/1276-1052-1-ND/3889138" H 6055 3350 60  0001 C CNN "PurchasingLink"
	1    5630 2850
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C032D9D
P 5630 2950
F 0 "#PWR?" H 5630 2700 50  0001 C CNN
F 1 "GND" H 5635 2777 50  0000 C CNN
F 2 "" H 5630 2950 50  0001 C CNN
F 3 "" H 5630 2950 50  0001 C CNN
	1    5630 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5630 2450 5800 2450
$Comp
L formula:MCP6001 U2
U 1 1 5C0360FA
P 6280 2550
F 0 "U2" H 6380 2300 50  0000 L CNN
F 1 "MCP6001" H 6330 2400 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 6180 2650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 6280 2750 50  0001 C CNN
F 4 "DK" H 6380 2850 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 6480 2950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 6580 3050 60  0001 C CNN "PurchasingLink"
	1    6280 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5980 3380 5780 3380
Wire Wire Line
	5980 3380 6180 3380
Connection ~ 5980 3380
$Comp
L formula:R_10K R8
U 1 1 5C03C74C
P 5630 3380
F 0 "R8" V 5730 3380 50  0000 C CNN
F 1 "R_10K" V 5530 3380 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 5560 3380 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5710 3380 50  0001 C CNN
F 4 "DK" H 5630 3380 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5630 3380 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6110 3780 60  0001 C CNN "PurchasingLink"
	1    5630 3380
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C03FCD3
P 5430 3380
F 0 "#PWR?" H 5430 3230 50  0001 C CNN
F 1 "VCC" H 5447 3553 50  0000 C CNN
F 2 "" H 5430 3380 50  0001 C CNN
F 3 "" H 5430 3380 50  0001 C CNN
	1    5430 3380
	1    0    0    -1  
$EndComp
Wire Wire Line
	5480 3380 5430 3380
$Comp
L formula:R_10K R11
U 1 1 5C0433E7
P 6330 3380
F 0 "R11" V 6430 3380 50  0000 C CNN
F 1 "R_10K" V 6230 3380 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6260 3380 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6410 3380 50  0001 C CNN
F 4 "DK" H 6330 3380 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6330 3380 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6810 3780 60  0001 C CNN "PurchasingLink"
	1    6330 3380
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6480 3380 6630 3380
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C04D081
P 6630 3380
F 0 "#PWR?" H 6630 3130 50  0001 C CNN
F 1 "GND" H 6635 3207 50  0000 C CNN
F 2 "" H 6630 3380 50  0001 C CNN
F 3 "" H 6630 3380 50  0001 C CNN
	1    6630 3380
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R13
U 1 1 5C04D53E
P 6730 2550
F 0 "R13" V 6830 2600 50  0000 C CNN
F 1 "R_10K" V 6614 2550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6660 2550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6810 2550 50  0001 C CNN
F 4 "DK" H 6730 2550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6730 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 7210 2950 60  0001 C CNN "PurchasingLink"
	1    6730 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	6180 2250 6180 2150
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C050C08
P 6180 2100
F 0 "#PWR?" H 6180 1950 50  0001 C CNN
F 1 "VCC" H 6197 2273 50  0000 C CNN
F 2 "" H 6180 2100 50  0001 C CNN
F 3 "" H 6180 2100 50  0001 C CNN
	1    6180 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6180 2150 6330 2150
Connection ~ 6180 2150
Wire Wire Line
	6180 2150 6180 2100
$Comp
L formula:C_0.1uF C8
U 1 1 5C054521
P 6480 2100
F 0 "C8" H 6530 2200 50  0000 L CNN
F 1 "C_0.1uF" H 6530 2000 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6518 1950 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6505 2200 50  0001 C CNN
F 4 "DK" H 6480 2100 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6480 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6905 2600 60  0001 C CNN "PurchasingLink"
	1    6480 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6330 1950 6330 2150
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C05F402
P 6480 2250
F 0 "#PWR?" H 6480 2000 50  0001 C CNN
F 1 "GND" H 6485 2077 50  0000 C CNN
F 2 "" H 6480 2250 50  0001 C CNN
F 3 "" H 6480 2250 50  0001 C CNN
	1    6480 2250
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C05F611
P 6180 2850
F 0 "#PWR?" H 6180 2600 50  0001 C CNN
F 1 "GND" H 6185 2677 50  0000 C CNN
F 2 "" H 6180 2850 50  0001 C CNN
F 3 "" H 6180 2850 50  0001 C CNN
	1    6180 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6880 2550 6980 2550
Wire Wire Line
	6980 2550 6980 2650
$Comp
L formula:C_1uF C10
U 1 1 5C06327B
P 6980 2850
F 0 "C10" H 6710 2820 50  0000 L CNN
F 1 "C_1uF" H 6710 2730 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7018 2700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 7005 2950 50  0001 C CNN
F 4 "DK" H 6980 2850 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 6980 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 7405 3350 60  0001 C CNN "PurchasingLink"
	1    6980 2850
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0633A3
P 6980 2950
F 0 "#PWR?" H 6980 2700 50  0001 C CNN
F 1 "GND" H 6985 2777 50  0000 C CNN
F 2 "" H 6980 2950 50  0001 C CNN
F 3 "" H 6980 2950 50  0001 C CNN
	1    6980 2950
	1    0    0    -1  
$EndComp
Connection ~ 6980 2550
Wire Wire Line
	6980 2550 7430 2550
$Comp
L formula:SN74LVC1G02DBVR U5
U 1 1 5C0875CE
P 7490 3900
F 0 "U5" H 7520 4040 60  0000 L CNN
F 1 "SN74LVC1G02" H 7540 3700 60  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7490 3900 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g02.pdf" H 7861 3847 60  0001 L CNN
F 4 "DK" H 7840 3800 60  0001 L CNN "MFN"
F 5 "296-11597-1-ND" H 7690 3510 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/SN74LVC1G02DBVR/296-11597-2-ND/385714" H 7890 3710 60  0001 C CNN "PurchasingLink"
	1    7490 3900
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C08D2ED
P 7490 3550
F 0 "#PWR?" H 7490 3400 50  0001 C CNN
F 1 "VCC" H 7640 3600 50  0000 C CNN
F 2 "" H 7490 3550 50  0001 C CNN
F 3 "" H 7490 3550 50  0001 C CNN
	1    7490 3550
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C08D9A2
P 7740 2260
F 0 "#PWR?" H 7740 2110 50  0001 C CNN
F 1 "VCC" H 7757 2433 50  0000 C CNN
F 2 "" H 7740 2260 50  0001 C CNN
F 3 "" H 7740 2260 50  0001 C CNN
	1    7740 2260
	1    0    0    -1  
$EndComp
Wire Wire Line
	5710 3960 5160 3960
$Comp
L formula:R_100K R9
U 1 1 5C0ABE7D
P 5860 3960
F 0 "R9" V 5960 3960 50  0000 C CNN
F 1 "R_100K" V 5744 3960 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 5790 3960 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 5940 3960 50  0001 C CNN
F 4 "DK" H 5860 3960 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 5860 3960 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6340 4360 60  0001 C CNN "PurchasingLink"
	1    5860 3960
	0    1    1    0   
$EndComp
$Comp
L formula:R_10K R6
U 1 1 5C0AC30A
P 5160 4240
F 0 "R6" H 5230 4286 50  0000 L CNN
F 1 "R_10K" H 5230 4195 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5090 4240 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5240 4240 50  0001 C CNN
F 4 "DK" H 5160 4240 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5160 4240 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5640 4640 60  0001 C CNN "PurchasingLink"
	1    5160 4240
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q1
U 1 1 5C0AC646
P 6210 4440
F 0 "Q1" H 6416 4486 50  0000 L CNN
F 1 "SSM3K333R" H 6416 4395 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6410 4365 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6410 4515 50  0001 L CNN
F 4 "DK" H 6710 4815 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6610 4715 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6510 4615 60  0001 C CNN "PurchasingLink"
	1    6210 4440
	1    0    0    -1  
$EndComp
Wire Wire Line
	5160 4390 5160 4440
Wire Wire Line
	5160 4440 5660 4440
Wire Wire Line
	5660 4440 5660 4540
Connection ~ 5660 4440
Wire Wire Line
	5660 4440 6010 4440
$Comp
L formula:C_0.1uF C6
U 1 1 5C0BABAC
P 5660 4690
F 0 "C6" H 5775 4736 50  0000 L CNN
F 1 "C_0.1uF" H 5775 4645 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5698 4540 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5685 4790 50  0001 C CNN
F 4 "DK" H 5660 4690 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 5660 4690 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6085 5190 60  0001 C CNN "PurchasingLink"
	1    5660 4690
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0C9250
P 7490 4250
F 0 "#PWR?" H 7490 4000 50  0001 C CNN
F 1 "GND" H 7495 4077 50  0000 C CNN
F 2 "" H 7490 4250 50  0001 C CNN
F 3 "" H 7490 4250 50  0001 C CNN
	1    7490 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5660 4840 5660 4990
Wire Wire Line
	5660 4990 6310 4990
Wire Wire Line
	6310 4990 6310 4640
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0D0648
P 6310 4990
F 0 "#PWR?" H 6310 4740 50  0001 C CNN
F 1 "GND" H 6315 4817 50  0000 C CNN
F 2 "" H 6310 4990 50  0001 C CNN
F 3 "" H 6310 4990 50  0001 C CNN
	1    6310 4990
	1    0    0    -1  
$EndComp
Connection ~ 6310 4990
Wire Wire Line
	8390 2610 8390 2760
$Comp
L formula:R_200 R17
U 1 1 5C0E3A7E
P 8390 2910
F 0 "R17" V 8490 2910 50  0000 L CNN
F 1 "R_200" V 8290 2810 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8320 2910 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8470 2910 50  0001 C CNN
F 4 "DK" H 8390 2910 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 8390 2910 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 8870 3310 60  0001 C CNN "PurchasingLink"
	1    8390 2910
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D4
U 1 1 5C0E3DF5
P 8390 3210
F 0 "D4" H 8428 3093 50  0000 R CNN
F 1 "LED_0805" H 8540 3310 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 8290 3210 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 8390 3310 50  0001 C CNN
F 4 "DK" H 8390 3210 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 8390 3210 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 8790 3710 60  0001 C CNN "PurchasingLink"
	1    8390 3210
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0E3F66
P 8390 3360
F 0 "#PWR?" H 8390 3110 50  0001 C CNN
F 1 "GND" H 8395 3187 50  0000 C CNN
F 2 "" H 8390 3360 50  0001 C CNN
F 3 "" H 8390 3360 50  0001 C CNN
	1    8390 3360
	1    0    0    -1  
$EndComp
Connection ~ 8590 2610
Wire Wire Line
	8590 2610 8790 2610
Wire Wire Line
	8390 2610 8590 2610
Text Label 8590 4410 0    50   ~ 0
BSPD_RELAY_INTENTION
Wire Wire Line
	8590 2610 8590 4410
Wire Wire Line
	8790 2610 8790 2810
$Comp
L formula:R_10K R18
U 1 1 5C0F4327
P 8790 2960
F 0 "R18" V 8890 2910 50  0000 L CNN
F 1 "R_10K" V 8690 2860 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8720 2960 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8870 2960 50  0001 C CNN
F 4 "DK" H 8790 2960 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8790 2960 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 9270 3360 60  0001 C CNN "PurchasingLink"
	1    8790 2960
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0F4A52
P 8790 3110
F 0 "#PWR?" H 8790 2860 50  0001 C CNN
F 1 "GND" H 8795 2937 50  0000 C CNN
F 2 "" H 8790 3110 50  0001 C CNN
F 3 "" H 8790 3110 50  0001 C CNN
	1    8790 3110
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q2
U 1 1 5C0F4B67
P 8990 2610
F 0 "Q2" H 9196 2656 50  0000 L CNN
F 1 "SSM3K333R" H 9196 2565 50  0000 L CNN
F 2 "footprints:SOT-23F" H 9190 2535 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 9190 2685 50  0001 L CNN
F 4 "DK" H 9490 2985 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 9390 2885 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 9290 2785 60  0001 C CNN "PurchasingLink"
	1    8990 2610
	1    0    0    -1  
$EndComp
Connection ~ 8790 2610
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C0F4DFB
P 9090 2810
F 0 "#PWR?" H 9090 2560 50  0001 C CNN
F 1 "GND" H 9095 2637 50  0000 C CNN
F 2 "" H 9090 2810 50  0001 C CNN
F 3 "" H 9090 2810 50  0001 C CNN
	1    9090 2810
	1    0    0    -1  
$EndComp
Wire Wire Line
	7160 3840 7180 3840
Wire Wire Line
	6310 3960 6310 4240
Wire Wire Line
	6010 3960 6310 3960
Connection ~ 6310 3960
Wire Wire Line
	6310 3960 7180 3960
Wire Wire Line
	5160 3960 5160 4090
Wire Wire Line
	7940 3900 7960 3900
$Comp
L formula:R_71.5k R7
U 1 1 5C081446
P 5380 2450
F 0 "R7" V 5587 2450 50  0000 C CNN
F 1 "R_71.5K" V 5496 2450 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 5310 2450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 5460 2450 50  0001 C CNN
F 4 "DK" H 5380 2450 60  0001 C CNN "MFN"
F 5 "P1.07KDACT-ND" H 5380 2450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB1071V/P1.07KDACT-ND/3074919" H 0   0   50  0001 C CNN "PurchasingLink"
	1    5380 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5530 2450 5630 2450
Connection ~ 5630 2450
Wire Wire Line
	5230 2450 5080 2450
$Comp
L formula:SN74LVC1G02DBVR U6
U 1 1 5C0740FC
P 7740 2610
F 0 "U6" H 7790 2760 60  0000 L CNN
F 1 "SN74LVC1G02" H 7040 2850 60  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7740 2610 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g02.pdf" H 8111 2557 60  0001 L CNN
F 4 "DK" H 8111 2451 60  0001 L CNN "MFN"
F 5 "296-11597-1-ND" H 7940 2220 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/SN74LVC1G02DBVR/296-11597-2-ND/385714" H 8140 2420 60  0001 C CNN "PurchasingLink"
	1    7740 2610
	1    0    0    -1  
$EndComp
Wire Wire Line
	7430 3210 7960 3210
Wire Wire Line
	5080 2750 5080 2910
$Comp
L formula:R_100 R1
U 1 1 5BEE980E
P 1050 7000
F 0 "R1" V 950 7100 50  0000 C CNN
F 1 "R_100" V 1150 7000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 980 7000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1130 7000 50  0001 C CNN
F 4 "DK" H 1050 7000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1050 7000 60  0001 C CNN "MPN"
F 6 "Value" H 1050 7000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1530 7400 60  0001 C CNN "PurchasingLink"
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5BEE9819
P 850 7000
F 0 "C1" V 900 6850 50  0000 L CNN
F 1 "C_0.1uF" V 700 6850 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 888 6850 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 875 7100 50  0001 C CNN
F 4 "478-3352-1-ND" H 850 7000 60  0001 C CNN "MPN"
F 5 "DK" H 850 7000 60  0001 C CNN "MFN"
F 6 "Value" H 850 7000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1275 7500 60  0001 C CNN "PurchasingLink"
	1    850  7000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C2
U 1 1 5BEE9824
P 1050 7300
F 0 "C2" H 1075 7400 50  0000 L CNN
F 1 "C_100pF" H 1075 7200 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1088 7150 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1075 7400 50  0001 C CNN
F 4 "732-7852-1-ND" H 1050 7300 60  0001 C CNN "MPN"
F 5 "DK" H 1050 7300 60  0001 C CNN "MFN"
F 6 "Value" H 1050 7300 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1475 7800 60  0001 C CNN "PurchasingLink"
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5BEE982F
P 3750 10000
F 0 "C4" H 3775 10100 50  0000 L CNN
F 1 "C_30pF" H 3775 9900 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3788 9850 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 3775 10100 50  0001 C CNN
F 4 "1276-1130-1-ND" H 3750 10000 60  0001 C CNN "MPN"
F 5 "DK" H 3750 10000 60  0001 C CNN "MFN"
F 6 "Value" H 3750 10000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4175 10500 60  0001 C CNN "PurchasingLink"
	1    3750 10000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C3
U 1 1 5BEE983A
P 3450 10000
F 0 "C3" H 3350 10100 50  0000 L CNN
F 1 "C_30pF" H 3150 9900 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3488 9850 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 3475 10100 50  0001 C CNN
F 4 "1276-1130-1-ND" H 3450 10000 60  0001 C CNN "MPN"
F 5 "DK" H 3450 10000 60  0001 C CNN "MFN"
F 6 "Value" H 3450 10000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 3875 10500 60  0001 C CNN "PurchasingLink"
	1    3450 10000
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE9841
P 1250 9750
F 0 "#PWR?" H 1250 9500 50  0001 C CNN
F 1 "GND" H 1250 9600 50  0000 C CNN
F 2 "" H 1250 9750 50  0001 C CNN
F 3 "" H 1250 9750 50  0001 C CNN
	1    1250 9750
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE9847
P 1050 7450
F 0 "#PWR?" H 1050 7200 50  0001 C CNN
F 1 "GND" H 1050 7300 50  0000 C CNN
F 2 "" H 1050 7450 50  0001 C CNN
F 3 "" H 1050 7450 50  0001 C CNN
	1    1050 7450
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE984D
P 850 7150
F 0 "#PWR?" H 850 6900 50  0001 C CNN
F 1 "GND" H 850 7000 50  0000 C CNN
F 2 "" H 850 7150 50  0001 C CNN
F 3 "" H 850 7150 50  0001 C CNN
	1    850  7150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5BEE9857
P 4260 9400
F 0 "R3" V 4340 9400 50  0000 C CNN
F 1 "R_10k" V 4160 9400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4190 9400 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4340 9400 50  0001 C CNN
F 4 "CRS0805-FX-1002ELFCT-ND" H 4260 9400 60  0001 C CNN "MPN"
F 5 "DK" H 4260 9400 60  0001 C CNN "MFN"
F 6 "Value" H 4260 9400 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4740 9800 60  0001 C CNN "PurchasingLink"
	1    4260 9400
	0    1    1    0   
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5BEE985E
P 1050 6850
F 0 "#PWR?" H 1050 6700 50  0001 C CNN
F 1 "VCC" H 1050 7000 50  0000 C CNN
F 2 "" H 1050 6850 50  0001 C CNN
F 3 "" H 1050 6850 50  0001 C CNN
	1    1050 6850
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE9864
P 3600 10000
F 0 "#PWR?" H 3600 9750 50  0001 C CNN
F 1 "GND" H 3600 9850 50  0000 C CNN
F 2 "" H 3600 10000 50  0001 C CNN
F 3 "" H 3600 10000 50  0001 C CNN
	1    3600 10000
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE986A
P 3450 10150
F 0 "#PWR?" H 3450 9900 50  0001 C CNN
F 1 "GND" H 3450 10000 50  0000 C CNN
F 2 "" H 3450 10150 50  0001 C CNN
F 3 "" H 3450 10150 50  0001 C CNN
	1    3450 10150
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE9870
P 3750 10150
F 0 "#PWR?" H 3750 9900 50  0001 C CNN
F 1 "GND" H 3750 10000 50  0000 C CNN
F 2 "" H 3750 10150 50  0001 C CNN
F 3 "" H 3750 10150 50  0001 C CNN
	1    3750 10150
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BEE9876
P 3950 9800
F 0 "#PWR?" H 3950 9550 50  0001 C CNN
F 1 "GND" H 3950 9650 50  0000 C CNN
F 2 "" H 3950 9800 50  0001 C CNN
F 3 "" H 3950 9800 50  0001 C CNN
	1    3950 9800
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5BEE987C
P 4410 9400
F 0 "#PWR?" H 4410 9250 50  0001 C CNN
F 1 "VCC" H 4410 9550 50  0000 C CNN
F 2 "" H 4410 9400 50  0001 C CNN
F 3 "" H 4410 9400 50  0001 C CNN
	1    4410 9400
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5BEE9891
P 3600 9850
F 0 "Y1" H 3650 10025 50  0000 L CNN
F 1 "Crystal_SMD" H 3650 9950 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 3550 9925 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 3650 10025 50  0001 C CNN
F 4 "DK" H 3600 9850 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 3600 9850 60  0001 C CNN "MPN"
F 6 "Value" H 3600 9850 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4050 10425 60  0001 C CNN "PurchasingLink"
	1    3600 9850
	1    0    0    -1  
$EndComp
Text Label 3450 8050 0    60   ~ 0
RXCAN
Text Label 3450 8850 0    60   ~ 0
MISO
Text Label 3450 8950 0    60   ~ 0
MOSI
Text Label 3450 9050 0    60   ~ 0
SCK
Text Label 4310 9550 0    60   ~ 0
RESET
NoConn ~ 1250 7550
Wire Wire Line
	1250 7150 1050 7150
Wire Wire Line
	3450 9750 3450 9850
Wire Wire Line
	3450 9850 3500 9850
Wire Wire Line
	3450 9650 3750 9650
Wire Wire Line
	3750 9650 3750 9850
Wire Wire Line
	3750 9850 3700 9850
Wire Wire Line
	3600 9700 3950 9700
Wire Wire Line
	3950 9700 3950 9800
Wire Wire Line
	850  6850 1050 6850
Connection ~ 1050 6850
Wire Wire Line
	4110 9400 4110 9550
Connection ~ 4110 9550
Wire Wire Line
	1050 6850 1250 6850
Wire Wire Line
	4110 9550 4310 9550
Text Label 3450 7950 0    60   ~ 0
TXCAN
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BF9EE1D
P 13960 6690
F 0 "#PWR?" H 13960 6440 50  0001 C CNN
F 1 "GND" H 14110 6640 50  0000 C CNN
F 2 "" H 13960 6690 50  0001 C CNN
F 3 "" H 13960 6690 50  0001 C CNN
	1    13960 6690
	1    0    0    -1  
$EndComp
Wire Wire Line
	11870 6990 12420 6990
Wire Wire Line
	12220 7340 12320 7340
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5BF9EE33
P 12320 7340
F 0 "#PWR?" H 12320 7090 50  0001 C CNN
F 1 "GND" H 12325 7167 50  0000 C CNN
F 2 "" H 12320 7340 50  0001 C CNN
F 3 "" H 12320 7340 50  0001 C CNN
	1    12320 7340
	1    0    0    -1  
$EndComp
Wire Wire Line
	11870 6990 11870 7340
Wire Wire Line
	11870 7340 11920 7340
Wire Wire Line
	11570 7340 11470 7340
$Comp
L formula:R_10K R34
U 1 1 5C0080C5
P 15090 6490
F 0 "R34" H 15160 6536 50  0000 L CNN
F 1 "R_10K" H 15160 6445 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 15020 6490 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 15170 6490 50  0001 C CNN
F 4 "DK" H 15090 6490 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 15090 6490 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15570 6890 60  0001 C CNN "PurchasingLink"
	1    15090 6490
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C008230
P 15090 6640
F 0 "#PWR?" H 15090 6390 50  0001 C CNN
F 1 "GND" H 15095 6467 50  0000 C CNN
F 2 "" H 15090 6640 50  0001 C CNN
F 3 "" H 15090 6640 50  0001 C CNN
	1    15090 6640
	1    0    0    -1  
$EndComp
Text Label 15330 6340 1    50   ~ 0
BRAKELIGHT_GATE
$Comp
L formula:SSM3K333R Q6
U 1 1 5C00D6C3
P 15530 6340
F 0 "Q6" H 15736 6386 50  0000 L CNN
F 1 "SSM3K333R" H 15736 6295 50  0000 L CNN
F 2 "footprints:SOT-23F" H 15730 6265 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 15730 6415 50  0001 L CNN
F 4 "DK" H 16030 6715 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 15930 6615 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 15830 6515 60  0001 C CNN "PurchasingLink"
	1    15530 6340
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C00D7EA
P 15630 6540
F 0 "#PWR?" H 15630 6290 50  0001 C CNN
F 1 "GND" H 15635 6367 50  0000 C CNN
F 2 "" H 15630 6540 50  0001 C CNN
F 3 "" H 15630 6540 50  0001 C CNN
	1    15630 6540
	1    0    0    -1  
$EndComp
Text Label 15630 6040 0    50   ~ 0
BRAKELIGHT_LSD
Text Notes 15630 6140 0    31   ~ 0
(To brake light connector)\n
Connection ~ 1050 7150
Connection ~ 3450 9850
Connection ~ 3750 9850
$Comp
L formula:MCP6001 U7
U 1 1 5BF0964E
P 12720 6890
F 0 "U7" H 12770 6990 50  0000 L CNN
F 1 "MCP6001" H 12770 6790 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 12620 6990 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 12720 7090 50  0001 C CNN
F 4 "DK" H 12820 7190 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 12920 7290 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 13020 7390 60  0001 C CNN "PurchasingLink"
	1    12720 6890
	1    0    0    -1  
$EndComp
Text Label 1210 5970 0    50   ~ 0
SHUTDOWN_SENSE_BSPD
Text Label 1210 5870 0    50   ~ 0
BSPD_RELAY_LSD
Text Label 1210 5770 0    50   ~ 0
RJ45_LED_O
Text Label 1210 5370 0    50   ~ 0
BRAKE_PRESSURE-
Text Label 1210 5270 0    50   ~ 0
BRAKE_PRESSURE_SENSE
Text Label 1210 5170 0    50   ~ 0
BRAKE_PRESSURE+
Text Label 1210 4570 0    50   ~ 0
CAN_LOW
Text Label 1210 5070 0    50   ~ 0
RESET
Text Label 1210 4970 0    50   ~ 0
SCK
Text Label 1210 4470 0    50   ~ 0
CAN_HIGH
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C20CC65
P 4730 2800
F 0 "#PWR?" H 4730 2550 50  0001 C CNN
F 1 "GND" H 4735 2627 50  0000 C CNN
F 2 "" H 4730 2800 50  0001 C CNN
F 3 "" H 4730 2800 50  0001 C CNN
	1    4730 2800
	1    0    0    -1  
$EndComp
Text Label 3450 8150 0    50   ~ 0
BSPD_CURRENT_SENSE
Text Label 3740 2800 2    50   ~ 0
BSPD_TEST_SWITCH
Wire Wire Line
	1360 3910 1360 4270
Wire Wire Line
	1360 3910 1690 3910
Wire Wire Line
	1210 4370 1910 4370
Wire Wire Line
	1910 4370 1910 4320
Text Label 3740 2500 2    50   ~ 0
BSPD_CURRENT_SENSE
Wire Wire Line
	5980 2650 5980 3380
Wire Wire Line
	3980 2800 3740 2800
Connection ~ 3980 2800
Wire Wire Line
	3980 2500 3880 2500
Connection ~ 3980 2500
Connection ~ 8390 2610
Wire Wire Line
	6330 1950 6480 1950
Wire Wire Line
	8190 2610 8390 2610
Wire Wire Line
	7160 3160 8190 3160
Wire Wire Line
	8190 3160 8190 2610
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C4ECE17
P 7740 2960
F 0 "#PWR?" H 7740 2710 50  0001 C CNN
F 1 "GND" H 7740 2830 50  0000 C CNN
F 2 "" H 7740 2960 50  0001 C CNN
F 3 "" H 7740 2960 50  0001 C CNN
	1    7740 2960
	1    0    0    -1  
$EndComp
Wire Wire Line
	7430 2670 7430 3210
Text Label 4350 6950 0    50   ~ 0
RJ45_LED_O
Text Label 4350 6850 0    50   ~ 0
RJ45_LED_G
$Comp
L formula:R_200 R41
U 1 1 5C6A3DFA
P 4200 6850
F 0 "R41" V 3993 6850 50  0000 C CNN
F 1 "R_200" V 4084 6850 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4130 6850 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4280 6850 50  0001 C CNN
F 4 "DK" H 4200 6850 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4200 6850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4680 7250 60  0001 C CNN "PurchasingLink"
	1    4200 6850
	0    1    1    0   
$EndComp
$Comp
L formula:R_200 R42
U 1 1 5C6A40BE
P 4200 6950
F 0 "R42" V 4030 6950 50  0000 C CNN
F 1 "R_200" V 4130 6950 50  0000 C BNN
F 2 "footprints:R_0805_OEM" H 4130 6950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4280 6950 50  0001 C CNN
F 4 "DK" H 4200 6950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4200 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4680 7350 60  0001 C CNN "PurchasingLink"
	1    4200 6950
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C7E27E9
P 11470 7340
F 0 "#PWR?" H 11470 7190 50  0001 C CNN
F 1 "VCC" H 11487 7513 50  0000 C CNN
F 2 "" H 11470 7340 50  0001 C CNN
F 3 "" H 11470 7340 50  0001 C CNN
	1    11470 7340
	1    0    0    -1  
$EndComp
Text Label 3450 8350 0    50   ~ 0
BRAKE_PRESSURE_SENSE
Text Notes 2750 1180 0    98   ~ 0
BSPD (Brake System Plausability Device)
Wire Notes Line
	7090 1770 7090 3610
Text Notes 5850 1760 0    50   ~ 0
Op-Amp Timer\n
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C583B22
P 5160 3960
F 0 "#PWR?" H 5160 3810 50  0001 C CNN
F 1 "VCC" H 5177 4133 50  0000 C CNN
F 2 "" H 5160 3960 50  0001 C CNN
F 3 "" H 5160 3960 50  0001 C CNN
	1    5160 3960
	1    0    0    -1  
$EndComp
Connection ~ 5160 3960
Wire Wire Line
	7960 3210 7960 3900
Wire Wire Line
	7160 3160 7160 3840
Wire Notes Line
	5010 3670 6910 3670
Wire Notes Line
	6910 3670 6910 5130
Wire Notes Line
	6910 5130 5010 5130
Wire Notes Line
	5010 5130 5010 3670
Text Notes 5090 5090 0    50   ~ 0
Set-Reset Latch\n
Wire Notes Line
	8220 4670 8220 2040
Wire Notes Line
	8220 2040 7140 2040
Wire Notes Line
	7140 2040 7140 4670
Wire Notes Line
	7140 4670 8220 4670
Text Notes 7200 4650 0    50   ~ 0
Set-Reset NOR Gates\n
Text Notes 10130 5330 0    98   ~ 0
Brake Light\n
Text Label 9090 2410 0    50   ~ 0
BSPD_RELAY_LSD
Wire Wire Line
	11470 3170 11620 3170
$Comp
L formula:R_200 R44
U 1 1 5C65460B
P 11770 3170
F 0 "R44" V 11870 3170 50  0000 L CNN
F 1 "R_200" V 11670 3070 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11700 3170 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 11850 3170 50  0001 C CNN
F 4 "DK" H 11770 3170 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 11770 3170 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 12250 3570 60  0001 C CNN "PurchasingLink"
	1    11770 3170
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D5
U 1 1 5C654615
P 12070 3170
F 0 "D5" H 12108 3053 50  0000 R CNN
F 1 "LED_0805" H 12220 3270 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 11970 3170 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 12070 3270 50  0001 C CNN
F 4 "DK" H 12070 3170 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 12070 3170 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12470 3670 60  0001 C CNN "PurchasingLink"
	1    12070 3170
	-1   0    0    1   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C6400B5
P 12540 3580
F 0 "#PWR?" H 12540 3330 50  0001 C CNN
F 1 "GND" H 12545 3407 50  0000 C CNN
F 2 "" H 12540 3580 50  0001 C CNN
F 3 "" H 12540 3580 50  0001 C CNN
	1    12540 3580
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D12
U 1 1 5C6400AE
P 12070 3580
F 0 "D12" H 12108 3463 50  0000 R CNN
F 1 "LED_0805" H 12220 3680 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 11970 3580 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 12070 3680 50  0001 C CNN
F 4 "DK" H 12070 3580 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 12070 3580 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12470 4080 60  0001 C CNN "PurchasingLink"
	1    12070 3580
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R45
U 1 1 5C6400A4
P 11770 3580
F 0 "R45" V 11870 3580 50  0000 L CNN
F 1 "R_200" V 11670 3480 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11700 3580 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 11850 3580 50  0001 C CNN
F 4 "DK" H 11770 3580 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 11770 3580 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 12250 3980 60  0001 C CNN "PurchasingLink"
	1    11770 3580
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11470 3580 11620 3580
Wire Wire Line
	11470 4010 11620 4010
$Comp
L formula:R_200 R46
U 1 1 5C691FFA
P 11770 4010
F 0 "R46" V 11870 4010 50  0000 L CNN
F 1 "R_200" V 11670 3910 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11700 4010 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 11850 4010 50  0001 C CNN
F 4 "DK" H 11770 4010 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 11770 4010 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 12250 4410 60  0001 C CNN "PurchasingLink"
	1    11770 4010
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D13
U 1 1 5C692004
P 12070 4010
F 0 "D13" H 12108 3893 50  0000 R CNN
F 1 "LED_0805" H 12220 4110 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 11970 4010 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 12070 4110 50  0001 C CNN
F 4 "DK" H 12070 4010 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 12070 4010 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12470 4510 60  0001 C CNN "PurchasingLink"
	1    12070 4010
	-1   0    0    1   
$EndComp
Text Label 11470 4010 2    50   ~ 0
DEBUG_LED_1
Text Label 11470 3580 2    50   ~ 0
DEBUG_LED_2
Text Label 11470 3170 2    50   ~ 0
DEBUG_LED_3
Text Label 3450 7350 0    50   ~ 0
DEBUG_LED_1
Text Label 3450 7450 0    50   ~ 0
DEBUG_LED_2
Text Label 3450 7550 0    50   ~ 0
DEBUG_LED_3
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C7972C7
P 12540 3170
F 0 "#PWR?" H 12540 2920 50  0001 C CNN
F 1 "GND" H 12545 2997 50  0000 C CNN
F 2 "" H 12540 3170 50  0001 C CNN
F 3 "" H 12540 3170 50  0001 C CNN
	1    12540 3170
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5C7A176B
P 12540 4010
F 0 "#PWR?" H 12540 3760 50  0001 C CNN
F 1 "GND" H 12545 3837 50  0000 C CNN
F 2 "" H 12540 4010 50  0001 C CNN
F 3 "" H 12540 4010 50  0001 C CNN
	1    12540 4010
	1    0    0    -1  
$EndComp
Wire Wire Line
	12220 4010 12540 4010
Wire Wire Line
	12220 3580 12540 3580
Wire Wire Line
	12220 3170 12540 3170
Text Notes 7150 4880 0    50   ~ 0
Explanation for NOR Latch functionality\nhttp://hyperphysics.phy-astr.gsu.edu/hbase/Electronic/norlatch.html
Wire Wire Line
	6600 9920 6600 9940
Wire Wire Line
	6980 9920 6980 9950
Wire Wire Line
	7380 9920 7380 9950
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC79406
P 7510 9330
AR Path="/5CC68CC1/5CC79406" Ref="#PWR?"  Part="1" 
AR Path="/5CC79406" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7510 9080 50  0001 C CNN
F 1 "GND" H 7515 9157 50  0000 C CNN
F 2 "" H 7510 9330 50  0001 C CNN
F 3 "" H 7510 9330 50  0001 C CNN
	1    7510 9330
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC7940C
P 6760 9030
AR Path="/5CC68CC1/5CC7940C" Ref="#PWR?"  Part="1" 
AR Path="/5CC7940C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6760 8780 50  0001 C CNN
F 1 "GND" H 6760 8880 50  0000 C CNN
F 2 "" H 6760 9030 50  0001 C CNN
F 3 "" H 6760 9030 50  0001 C CNN
	1    6760 9030
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC79412
P 6460 9030
AR Path="/5CC68CC1/5CC79412" Ref="#PWR?"  Part="1" 
AR Path="/5CC79412" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6460 8780 50  0001 C CNN
F 1 "GND" H 6465 8857 50  0000 C CNN
F 2 "" H 6460 9030 50  0001 C CNN
F 3 "" H 6460 9030 50  0001 C CNN
	1    6460 9030
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C?
U 1 1 5CC7941B
P 6760 8930
AR Path="/5CC68CC1/5CC7941B" Ref="C?"  Part="1" 
AR Path="/5CC7941B" Ref="C102"  Part="1" 
F 0 "C102" H 6810 8780 50  0000 L CNN
F 1 "C_2.2uF" H 6660 9230 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 6798 8780 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 6785 9030 50  0001 C CNN
F 4 "DK" H 6760 8930 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 6760 8930 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 7185 9430 60  0001 C CNN "PurchasingLink"
	1    6760 8930
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C?
U 1 1 5CC79425
P 6460 8880
AR Path="/5CC68CC1/5CC79425" Ref="C?"  Part="1" 
AR Path="/5CC79425" Ref="C101"  Part="1" 
F 0 "C101" H 6510 8730 50  0000 L CNN
F 1 "C_0.1uF" H 6310 9130 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6498 8730 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6485 8980 50  0001 C CNN
F 4 "DK" H 6460 8880 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6460 8880 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6885 9380 60  0001 C CNN "PurchasingLink"
	1    6460 8880
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CC7942F
P 8960 9480
AR Path="/5CC68CC1/5CC7942F" Ref="R?"  Part="1" 
AR Path="/5CC7942F" Ref="R103"  Part="1" 
F 0 "R103" V 9060 9380 50  0000 L CNN
F 1 "R_100K" V 8860 9330 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8890 9480 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9040 9480 50  0001 C CNN
F 4 "DK" H 8960 9480 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 8960 9480 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9440 9880 60  0001 C CNN "PurchasingLink"
	1    8960 9480
	0    1    1    0   
$EndComp
Wire Wire Line
	7510 9280 7510 9330
$Comp
L formula:C_22uF COUT?
U 1 1 5CC7943A
P 8960 8980
AR Path="/5CC68CC1/5CC7943A" Ref="COUT?"  Part="1" 
AR Path="/5CC7943A" Ref="COUT101"  Part="1" 
F 0 "COUT101" H 8860 9230 50  0000 L CNN
F 1 "C_22uF" H 9010 8880 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 9010 8580 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 9010 9330 50  0001 C CNN
F 4 "DK" H 8760 8980 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 9010 8480 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 9385 9480 60  0001 C CNN "PurchasingLink"
	1    8960 8980
	1    0    0    -1  
$EndComp
$Comp
L formula:C_47uF COUT?
U 1 1 5CC79444
P 9660 8980
AR Path="/5CC68CC1/5CC79444" Ref="COUT?"  Part="1" 
AR Path="/5CC79444" Ref="COUT103"  Part="1" 
F 0 "COUT103" H 9560 9230 50  0000 L CNN
F 1 "C_47uF" H 9710 8880 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9698 8830 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/22/CL21A476MQYNNNG.pdf" H 9685 9080 50  0001 C CNN
F 4 "DK" H 9660 8980 60  0001 C CNN "MFN"
F 5 "1276-6467-1-ND" H 9660 8980 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A476MQYNNNG/1276-6467-1-ND/5958095" H 10085 9480 60  0001 C CNN "PurchasingLink"
	1    9660 8980
	1    0    0    -1  
$EndComp
$Comp
L formula:C_33uF COUT?
U 1 1 5CC7944E
P 9310 8980
AR Path="/5CC68CC1/5CC7944E" Ref="COUT?"  Part="1" 
AR Path="/5CC7944E" Ref="COUT102"  Part="1" 
F 0 "COUT102" H 9210 9230 50  0000 L CNN
F 1 "C_33uF" H 9360 8880 50  0000 L CNN
F 2 "footprints:Fuse_1812" H 9360 8580 50  0001 C CNN
F 3 "" H 9310 9630 50  0001 C CNN
F 4 "DK" H 9360 8480 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 9310 9330 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 9560 9480 60  0001 C CNN "PurchasingLink"
	1    9310 8980
	1    0    0    -1  
$EndComp
$Comp
L formula:R_25K R?
U 1 1 5CC79458
P 8460 9480
AR Path="/5CC68CC1/5CC79458" Ref="R?"  Part="1" 
AR Path="/5CC79458" Ref="R102"  Part="1" 
F 0 "R102" V 8560 9380 50  0000 L CNN
F 1 "R_25K" V 8360 9380 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8510 8930 50  0001 C CNN
F 3 "" H 8460 9080 50  0001 C CNN
F 4 "DK" H 7860 9480 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B25KE" H 8510 9980 60  0001 C CNN "Digi-key Part Number"
F 6 "https://www.digikey.com/product-detail/en/te-connectivity-passive-product/CPF-A-0805B25KE/A124124CT-ND/5970044" H 8510 9880 60  0001 C CNN "PurchasingLink"
F 7 "A124124CT-ND" H 0   0   50  0001 C CNN "MPN"
	1    8460 9480
	0    1    1    0   
$EndComp
$Comp
L formula:F_500mA_16V F?
U 1 1 5CC79462
P 5460 8730
AR Path="/5CC68CC1/5CC79462" Ref="F?"  Part="1" 
AR Path="/5CC79462" Ref="F101"  Part="1" 
F 0 "F101" V 5560 8730 50  0000 C CNN
F 1 "F_500mA_16V" V 5310 8730 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 5390 8730 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 5540 8730 50  0001 C CNN
F 4 "DK" H 5460 8730 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 5460 8730 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 5940 9130 60  0001 C CNN "PurchasingLink"
	1    5460 8730
	0    1    1    0   
$EndComp
$Comp
L formula:D_Zener_18V D?
U 1 1 5CC79490
P 5610 9330
AR Path="/5CC68CC1/5CC79490" Ref="D?"  Part="1" 
AR Path="/5CC79490" Ref="D101"  Part="1" 
F 0 "D101" H 5560 9530 50  0000 C CNN
F 1 "D_Zener_18V" H 5460 9430 50  0000 C CNN
F 2 "footprints:DO-214AA" H 5510 9330 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 5610 9430 50  0001 C CNN
F 4 "DK" H 5810 9630 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 5710 9530 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 6010 9830 60  0001 C CNN "PurchasingLink"
	1    5610 9330
	0    1    1    0   
$EndComp
Wire Wire Line
	5610 9480 5610 9630
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC79498
P 5610 9630
AR Path="/5CC68CC1/5CC79498" Ref="#PWR?"  Part="1" 
AR Path="/5CC79498" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5610 9380 50  0001 C CNN
F 1 "GND" H 5615 9457 50  0000 C CNN
F 2 "" H 5610 9630 50  0001 C CNN
F 3 "" H 5610 9630 50  0001 C CNN
	1    5610 9630
	1    0    0    -1  
$EndComp
Wire Wire Line
	5610 8730 5610 9180
$Comp
L formula:LED_0805 D?
U 1 1 5CC794A3
P 6010 9430
AR Path="/5CC68CC1/5CC794A3" Ref="D?"  Part="1" 
AR Path="/5CC794A3" Ref="D102"  Part="1" 
F 0 "D102" V 6048 9313 50  0000 R CNN
F 1 "LED_0805" V 5957 9313 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5910 9430 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6010 9530 50  0001 C CNN
F 4 "DK" H 6010 9430 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6010 9430 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6410 9930 60  0001 C CNN "PurchasingLink"
	1    6010 9430
	0    -1   -1   0   
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC794B4
P 6010 9930
AR Path="/5CC68CC1/5CC794B4" Ref="#PWR?"  Part="1" 
AR Path="/5CC794B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6010 9680 50  0001 C CNN
F 1 "GND" H 6015 9757 50  0000 C CNN
F 2 "" H 6010 9930 50  0001 C CNN
F 3 "" H 6010 9930 50  0001 C CNN
	1    6010 9930
	1    0    0    -1  
$EndComp
Wire Wire Line
	6010 9180 6010 9280
Wire Wire Line
	6010 8730 6010 8880
Wire Wire Line
	6010 9580 6010 9930
Text Notes 6310 8580 0    50   ~ 0
Input Capacitors\n\n
Text Notes 5940 9640 1    50   ~ 0
12V Indicator
Text Notes 5500 9450 1    50   ~ 0
Protection\n
Text Notes 6960 8280 0    89   ~ 0
BUCK CONVERTER\n
Wire Wire Line
	8310 9480 8160 9480
Wire Wire Line
	8160 9480 8160 9630
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC794C3
P 8160 9630
AR Path="/5CC68CC1/5CC794C3" Ref="#PWR?"  Part="1" 
AR Path="/5CC794C3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8160 9380 50  0001 C CNN
F 1 "GND" H 8165 9457 50  0000 C CNN
F 2 "" H 8160 9630 50  0001 C CNN
F 3 "" H 8160 9630 50  0001 C CNN
	1    8160 9630
	1    0    0    -1  
$EndComp
Text Notes 8460 9730 0    50   ~ 0
Feedback Divider\n
Text Notes 8460 8780 0    50   ~ 0
Inductor\n
Text Notes 7810 8430 0    50   ~ 0
Bootstrap Capacitor\n
Text Notes 9010 8680 0    50   ~ 0
Output Capacitors\n
$Comp
L formula:L_100uH L?
U 1 1 5CC794D0
P 8310 8830
AR Path="/5CC68CC1/5CC794D0" Ref="L?"  Part="1" 
AR Path="/5CC794D0" Ref="L101"  Part="1" 
F 0 "L101" H 8310 8680 50  0000 C CNN
F 1 "L_100uH" H 8310 8780 50  0000 C CNN
F 2 "footprints:L_100uH_OEM" H 8210 8630 50  0001 C CNN
F 3 "" H 8210 8680 50  0001 C CNN
F 4 "DK" H 8410 8630 50  0001 C CNN "MFN"
F 5 "445-15759-1-ND" H 8310 9080 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 8610 9030 50  0001 C CNN "Link"
F 7 "https://www.digikey.com/product-detail/en/tdk-corporation/NLFV32T-101K-EF/445-15759-1-ND/4328055" H 0   0   50  0001 C CNN "PurchasingLink"
	1    8310 8830
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC794D7
P 8960 9130
AR Path="/5CC68CC1/5CC794D7" Ref="#PWR?"  Part="1" 
AR Path="/5CC794D7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8960 8880 50  0001 C CNN
F 1 "GND" H 8965 8957 50  0000 C CNN
F 2 "" H 8960 9130 50  0001 C CNN
F 3 "" H 8960 9130 50  0001 C CNN
	1    8960 9130
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC794DD
P 9310 9130
AR Path="/5CC68CC1/5CC794DD" Ref="#PWR?"  Part="1" 
AR Path="/5CC794DD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9310 8880 50  0001 C CNN
F 1 "GND" H 9315 8957 50  0000 C CNN
F 2 "" H 9310 9130 50  0001 C CNN
F 3 "" H 9310 9130 50  0001 C CNN
	1    9310 9130
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC794E3
P 9660 9130
AR Path="/5CC68CC1/5CC794E3" Ref="#PWR?"  Part="1" 
AR Path="/5CC794E3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9660 8880 50  0001 C CNN
F 1 "GND" H 9665 8957 50  0000 C CNN
F 2 "" H 9660 9130 50  0001 C CNN
F 3 "" H 9660 9130 50  0001 C CNN
	1    9660 9130
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5CC794EA
P 11160 8630
AR Path="/5CC68CC1/5CC794EA" Ref="#PWR?"  Part="1" 
AR Path="/5CC794EA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11160 8480 50  0001 C CNN
F 1 "VCC" H 11177 8803 50  0000 C CNN
F 2 "" H 11160 8630 50  0001 C CNN
F 3 "" H 11160 8630 50  0001 C CNN
	1    11160 8630
	1    0    0    -1  
$EndComp
Text Notes 11310 8480 0    50   ~ 0
5V
Wire Wire Line
	7110 8980 7010 8980
Wire Wire Line
	7860 9030 8710 9030
$Comp
L formula:TPS560430YF U?
U 1 1 5CC794F9
P 7460 8880
AR Path="/5CC68CC1/5CC794F9" Ref="U?"  Part="1" 
AR Path="/5CC794F9" Ref="U101"  Part="1" 
F 0 "U101" H 7485 9345 50  0000 C CNN
F 1 "TPS560430YF" H 7485 9254 50  0000 C CNN
F 2 "footprints:SOT-23-6_OEM" H 7410 9580 50  0001 C CNN
F 3 "" H 7460 9430 50  0001 C CNN
F 4 "TPS560430YFDBVR-ND" H 7410 7780 50  0001 C CNN "MPN"
F 5 "DK" H 7460 7880 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 8210 7980 50  0001 C CNN "Purchasing Link"
F 7 "https://www.digikey.com/product-detail/en/texas-instruments/TPS560430XDBVR/296-50420-6-ND/9685813" H 0   0   50  0001 C CNN "PurchasingLink"
	1    7460 8880
	1    0    0    -1  
$EndComp
Wire Wire Line
	7010 8980 7010 8730
Connection ~ 7010 8730
Wire Wire Line
	7010 8730 7110 8730
Connection ~ 6460 8730
Wire Wire Line
	6460 8730 6760 8730
Connection ~ 6760 8730
Wire Wire Line
	6760 8730 7010 8730
Wire Wire Line
	6010 8730 6460 8730
Connection ~ 6010 8730
Wire Wire Line
	5310 8730 5310 8380
Wire Wire Line
	7860 8680 7960 8680
Wire Wire Line
	7960 8680 7960 8480
Wire Wire Line
	7960 8480 8060 8480
Wire Wire Line
	7860 8830 8060 8830
$Comp
L formula:C_0.1uF C?
U 1 1 5CC79514
P 8060 8680
AR Path="/5CC68CC1/5CC79514" Ref="C?"  Part="1" 
AR Path="/5CC79514" Ref="C103"  Part="1" 
F 0 "C103" H 7810 8680 50  0000 C CNN
F 1 "C_0.1uF" H 7810 8580 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 8098 8530 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8085 8780 50  0001 C CNN
F 4 "DK" H 8060 8680 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8060 8680 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8485 9180 60  0001 C CNN "PurchasingLink"
	1    8060 8680
	-1   0    0    1   
$EndComp
Wire Wire Line
	8060 8480 8060 8530
Wire Wire Line
	8060 8830 8210 8830
Connection ~ 8060 8830
Connection ~ 9660 8830
Wire Wire Line
	9660 8830 10060 8830
Wire Wire Line
	8410 8830 8960 8830
Connection ~ 8960 8830
Wire Wire Line
	8960 8830 9310 8830
Connection ~ 9310 8830
Wire Wire Line
	9310 8830 9660 8830
Wire Wire Line
	10060 8830 10060 9480
Wire Wire Line
	10060 9480 9110 9480
Wire Wire Line
	10910 8830 11160 8830
Wire Wire Line
	11160 8630 11160 8830
Wire Wire Line
	8610 9480 8710 9480
Wire Wire Line
	8710 9030 8710 9480
Connection ~ 8710 9480
Wire Wire Line
	8710 9480 8810 9480
$Comp
L formula:R_10K R15
U 1 1 5CE147CB
P 11920 5590
F 0 "R15" H 11990 5636 50  0000 L CNN
F 1 "R_10K" H 11990 5545 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11850 5590 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 12000 5590 50  0001 C CNN
F 4 "DK" H 11920 5590 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11920 5590 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12400 5990 60  0001 C CNN "PurchasingLink"
	1    11920 5590
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CE209D2
P 11920 6040
F 0 "#PWR?" H 11920 5790 50  0001 C CNN
F 1 "GND" H 11925 5867 50  0000 C CNN
F 2 "" H 11920 6040 50  0001 C CNN
F 3 "" H 11920 6040 50  0001 C CNN
	1    11920 6040
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5CE20ACC
P 11920 5440
F 0 "#PWR?" H 11920 5290 50  0001 C CNN
F 1 "VCC" H 11937 5613 50  0000 C CNN
F 2 "" H 11920 5440 50  0001 C CNN
F 3 "" H 11920 5440 50  0001 C CNN
	1    11920 5440
	1    0    0    -1  
$EndComp
Wire Wire Line
	11920 5740 12420 5740
Wire Wire Line
	12370 6790 12370 5940
Wire Wire Line
	12370 5940 12420 5940
Connection ~ 12370 6790
Wire Wire Line
	12370 6790 12420 6790
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CE37426
P 12620 6140
F 0 "#PWR?" H 12620 5890 50  0001 C CNN
F 1 "GND" H 12625 5967 50  0000 C CNN
F 2 "" H 12620 6140 50  0001 C CNN
F 3 "" H 12620 6140 50  0001 C CNN
	1    12620 6140
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R16
U 1 1 5CE378E5
P 11920 5890
F 0 "R16" H 11990 5936 50  0000 L CNN
F 1 "R_1K" H 11990 5845 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11850 5890 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12000 5890 50  0001 C CNN
F 4 "DK" H 11920 5890 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 11920 5890 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 12400 6290 60  0001 C CNN "PurchasingLink"
	1    11920 5890
	1    0    0    -1  
$EndComp
Connection ~ 11920 5740
Text Label 11390 6790 2    50   ~ 0
BRAKE_PRESSURE_SENSE
$Comp
L formula:R_10K R10
U 1 1 5CE3B0B1
P 11800 6640
F 0 "R10" H 11870 6686 50  0000 L CNN
F 1 "R_10K" H 11870 6595 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11730 6640 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11880 6640 50  0001 C CNN
F 4 "DK" H 11800 6640 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11800 6640 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12280 7040 60  0001 C CNN "PurchasingLink"
	1    11800 6640
	1    0    0    -1  
$EndComp
Connection ~ 11800 6790
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5CE3B3B0
P 11800 6490
F 0 "#PWR?" H 11800 6340 50  0001 C CNN
F 1 "VCC" H 11817 6663 50  0000 C CNN
F 2 "" H 11800 6490 50  0001 C CNN
F 3 "" H 11800 6490 50  0001 C CNN
	1    11800 6490
	1    0    0    -1  
$EndComp
$Comp
L formula:SN74LVC1G32DBVR U8
U 1 1 5CE649E5
P 13960 6340
F 0 "U8" H 14160 6190 50  0000 L CNN
F 1 "SN74LVC1G32" H 14060 6090 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 13310 6390 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g32.pdf" H 13410 6490 50  0001 C CNN
F 4 "DK" H 13510 6590 50  0001 C CNN "MFN"
F 5 "296-9847-1-ND" H 13610 6690 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/SN74LVC1G32DBVR/296-9847-1-ND/380102" H 13710 6790 50  0001 C CNN "PurchasingLink"
	1    13960 6340
	1    0    0    -1  
$EndComp
Wire Wire Line
	13660 5840 13660 6240
Wire Wire Line
	13660 6890 13660 6440
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5CE7C747
P 13960 5960
F 0 "#PWR?" H 13960 5810 50  0001 C CNN
F 1 "VCC" H 13977 6133 50  0000 C CNN
F 2 "" H 13960 5960 50  0001 C CNN
F 3 "" H 13960 5960 50  0001 C CNN
	1    13960 5960
	1    0    0    -1  
$EndComp
Wire Wire Line
	3740 2400 4430 2400
Text Label 3740 2400 2    50   ~ 0
BRAKELIGHT_GATE
$Comp
L formula:R_499 R19
U 1 1 5CEDC942
P 12070 7340
F 0 "R19" V 11863 7340 50  0000 C CNN
F 1 "R_499" V 11954 7340 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12000 7340 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12150 7340 50  0001 C CNN
F 4 "DK" H 12070 7340 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 12070 7340 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 12550 7740 60  0001 C CNN "PurchasingLink"
	1    12070 7340
	0    1    1    0   
$EndComp
$Comp
L formula:R_2.2K R12
U 1 1 5CEDCCEB
P 11720 7340
F 0 "R12" V 11513 7340 50  0000 C CNN
F 1 "R_2.2K" V 11604 7340 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11650 7340 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 11800 7340 50  0001 C CNN
F 4 "DK" H 11720 7340 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 11720 7340 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 12200 7740 60  0001 C CNN "PurchasingLink"
	1    11720 7340
	0    1    1    0   
$EndComp
Connection ~ 11870 7340
Text Notes 11770 7490 0    50   ~ 0
0.92V
Text Notes 11620 5790 0    50   ~ 0
0.45V
Text Notes 10440 6870 0    50   ~ 0
0.5-4.5V
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CF09EC0
P 12620 7190
F 0 "#PWR?" H 12620 6940 50  0001 C CNN
F 1 "GND" H 12625 7017 50  0000 C CNN
F 2 "" H 12620 7190 50  0001 C CNN
F 3 "" H 12620 7190 50  0001 C CNN
	1    12620 7190
	1    0    0    -1  
$EndComp
Text Notes 11220 6540 0    50   ~ 0
OPEN CIRCUIT\nDETECTION
Wire Notes Line
	9890 990  9890 5640
Wire Notes Line
	2730 990  9890 990 
Text Notes 12160 5560 0    50   ~ 0
GND SHORT\nDETECTION
$Comp
L bspd_brakelight-rescue:+12V-power #PWR?
U 1 1 5CF66C0F
P 5310 8380
F 0 "#PWR?" H 5310 8230 50  0001 C CNN
F 1 "+12V" H 5310 8520 50  0000 C CNN
F 2 "" H 5310 8380 50  0001 C CNN
F 3 "" H 5310 8380 50  0001 C CNN
	1    5310 8380
	1    0    0    -1  
$EndComp
Text Notes 2250 5400 0    39   ~ 0
Brake_Pressure_Sense is an off board\ncomponent that measures the pressure\nbeing applied to the brakes. 
Wire Notes Line
	16530 4830 16530 4850
Connection ~ 1250 9750
Wire Wire Line
	1250 9350 1250 9750
$Comp
L formula:ATMEGA16M1 IC1
U 1 1 5BEE9886
P 2350 8550
F 0 "IC1" H 1400 10380 50  0000 L BNN
F 1 "ATMEGA16M1" H 2850 7150 50  0000 L BNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2350 8550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1400 10380 50  0001 C CNN
F 4 "ATMEGA16M1-AU-ND" H 2350 8550 60  0001 C CNN "MPN"
F 5 "DK" H 2350 8550 60  0001 C CNN "MFN"
F 6 "Value" H 2350 8550 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 1800 10780 60  0001 C CNN "PurchasingLink"
	1    2350 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 9550 4110 9550
Wire Notes Line
	12660 2920 10750 2920
Wire Notes Line
	10750 2920 10750 4240
Wire Notes Line
	10750 4240 12660 4240
Wire Notes Line
	12660 4240 12660 2920
Wire Notes Line
	5030 8020 5030 10310
Wire Notes Line
	5030 10310 11450 10310
Wire Notes Line
	11450 10310 11450 8020
Wire Notes Line
	11450 8020 5030 8020
Text Notes 13450 3060 0    50   ~ 0
CAN Transceiver
Wire Notes Line
	13400 2940 13400 4230
Wire Notes Line
	13400 4230 15590 4230
Wire Notes Line
	15590 4230 15590 2940
Wire Notes Line
	15590 2940 13400 2940
Text Notes 10800 2090 0    50   ~ 0
Programming Header
Wire Notes Line
	10770 1970 10770 2720
Wire Notes Line
	10770 2720 12140 2720
Wire Notes Line
	12140 2720 12140 1970
Wire Notes Line
	12140 1970 10770 1970
$Comp
L formula:R_10K R2
U 1 1 5DF78FED
P 13230 5840
F 0 "R2" V 13330 5890 50  0000 C CNN
F 1 "R_10K" V 13114 5840 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 13160 5840 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 13310 5840 50  0001 C CNN
F 4 "DK" H 13230 5840 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 13230 5840 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 13710 6240 60  0001 C CNN "PurchasingLink"
	1    13230 5840
	0    1    1    0   
$EndComp
Wire Wire Line
	13380 5840 13480 5840
Wire Wire Line
	13480 5840 13480 5940
$Comp
L formula:C_1uF C7
U 1 1 5DF78FF8
P 13480 6140
F 0 "C7" H 13210 6110 50  0000 L CNN
F 1 "C_1uF" H 13210 6020 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13518 5990 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 13505 6240 50  0001 C CNN
F 4 "DK" H 13480 6140 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 13480 6140 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 13905 6640 60  0001 C CNN "PurchasingLink"
	1    13480 6140
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DF78FFE
P 13480 6240
F 0 "#PWR?" H 13480 5990 50  0001 C CNN
F 1 "GND" H 13485 6067 50  0000 C CNN
F 2 "" H 13480 6240 50  0001 C CNN
F 3 "" H 13480 6240 50  0001 C CNN
	1    13480 6240
	1    0    0    -1  
$EndComp
Wire Wire Line
	13020 5840 13080 5840
Wire Wire Line
	13480 5840 13660 5840
Connection ~ 13480 5840
$Comp
L formula:R_10K R20
U 1 1 5DFD6EC6
P 13230 6890
F 0 "R20" V 13330 6940 50  0000 C CNN
F 1 "R_10K" V 13114 6890 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 13160 6890 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 13310 6890 50  0001 C CNN
F 4 "DK" H 13230 6890 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 13230 6890 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 13710 7290 60  0001 C CNN "PurchasingLink"
	1    13230 6890
	0    1    1    0   
$EndComp
Wire Wire Line
	13380 6890 13480 6890
Wire Wire Line
	13480 6890 13480 6990
$Comp
L formula:C_1uF C11
U 1 1 5DFD6ED1
P 13480 7190
F 0 "C11" H 13210 7160 50  0000 L CNN
F 1 "C_1uF" H 13210 7070 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13518 7040 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 13505 7290 50  0001 C CNN
F 4 "DK" H 13480 7190 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 13480 7190 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 13905 7690 60  0001 C CNN "PurchasingLink"
	1    13480 7190
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DFD6ED7
P 13480 7290
F 0 "#PWR?" H 13480 7040 50  0001 C CNN
F 1 "GND" H 13485 7117 50  0000 C CNN
F 2 "" H 13480 7290 50  0001 C CNN
F 3 "" H 13480 7290 50  0001 C CNN
	1    13480 7290
	1    0    0    -1  
$EndComp
Wire Wire Line
	13020 6890 13080 6890
Connection ~ 13480 6890
Wire Wire Line
	13480 6890 13660 6890
Wire Notes Line
	10090 7810 16050 7810
Wire Notes Line
	10090 5160 16050 5160
Text Notes 10770 3010 0    50   ~ 0
Debugging LEDs
Wire Wire Line
	3450 6850 4050 6850
Wire Wire Line
	4050 6950 3450 6950
Wire Notes Line
	590  6560 590  10390
Wire Notes Line
	590  10390 4810 10390
Wire Notes Line
	4810 10390 4810 6560
Wire Notes Line
	4810 6560 590  6560
Wire Notes Line
	2730 990  2730 3640
Wire Notes Line
	2730 3640 4640 3640
Wire Notes Line
	4640 3640 4640 5640
Wire Notes Line
	4640 5640 9890 5640
Wire Notes Line
	670  3840 3880 3840
Wire Notes Line
	3880 3840 3880 6300
Wire Notes Line
	3880 6300 670  6300
Wire Notes Line
	670  6300 670  3840
Text Notes 3440 3950 0    50   ~ 0
Connector
Wire Notes Line
	5210 1770 5210 3610
Wire Notes Line
	5210 3610 7090 3610
Wire Notes Line
	5210 1770 7090 1770
Text Label 1210 4770 0    50   ~ 0
MISO
Text Label 1210 4870 0    50   ~ 0
MOSI
Text Label 1210 5470 0    50   ~ 0
BRAKELIGHT_LSD
Text Label 1210 5570 0    50   ~ 0
BSPD_TEST_SWITCH
Text Label 1210 5670 0    50   ~ 0
RJ45_LED_G
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5DDD089A
P 2130 5100
F 0 "#PWR?" H 2130 4950 50  0001 C CNN
F 1 "VCC" H 2147 5273 50  0000 C CNN
F 2 "" H 2130 5100 50  0001 C CNN
F 3 "" H 2130 5100 50  0001 C CNN
	1    2130 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1210 5170 2130 5170
Wire Wire Line
	2130 5170 2130 5100
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DDD99A9
P 2130 5420
F 0 "#PWR?" H 2130 5170 50  0001 C CNN
F 1 "GND" H 2135 5247 50  0000 C CNN
F 2 "" H 2130 5420 50  0001 C CNN
F 3 "" H 2130 5420 50  0001 C CNN
	1    2130 5420
	1    0    0    -1  
$EndComp
Wire Wire Line
	1210 5370 2130 5370
Wire Wire Line
	2130 5370 2130 5420
Text Label 6050 6500 2    50   ~ 0
SHUTDOWN_SENSE_BSPD
$Comp
L formula:SSM3K333R Q3
U 1 1 5DE63113
P 6830 6720
F 0 "Q3" H 7036 6766 50  0000 L CNN
F 1 "SSM3K333R" H 7036 6675 50  0000 L CNN
F 2 "footprints:SOT-23F" H 7030 6645 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 7030 6795 50  0001 L CNN
F 4 "DK" H 7330 7095 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 7230 6995 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 7130 6895 60  0001 C CNN "PurchasingLink"
	1    6830 6720
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D2
U 1 1 5DE6EA14
P 6050 7240
F 0 "D2" V 6089 7123 50  0000 R CNN
F 1 "LED_0805" V 5998 7123 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5950 7240 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6050 7340 50  0001 C CNN
F 4 "DK" H 6050 7240 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6050 7240 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6450 7740 60  0001 C CNN "PurchasingLink"
	1    6050 7240
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_10K R23
U 1 1 5DE7535C
P 6930 6250
F 0 "R23" H 7000 6296 50  0000 L CNN
F 1 "R_10K" H 7000 6205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6860 6250 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 7010 6250 50  0001 C CNN
F 4 "DK" H 6930 6250 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6930 6250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 7410 6650 60  0001 C CNN "PurchasingLink"
	1    6930 6250
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R22
U 1 1 5DE849C5
P 6450 6870
F 0 "R22" V 6330 6870 50  0000 C CNN
F 1 "R_100K" V 6550 6870 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6380 6870 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6530 6870 50  0001 C CNN
F 4 "DK" H 6450 6870 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6450 6870 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6930 7270 60  0001 C CNN "PurchasingLink"
	1    6450 6870
	-1   0    0    1   
$EndComp
$Comp
L formula:R_10K R21
U 1 1 5DE8EE19
P 6050 6870
F 0 "R21" V 6150 6790 50  0000 L CNN
F 1 "R_10K" V 5940 6750 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5980 6870 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6130 6870 50  0001 C CNN
F 4 "DK" H 6050 6870 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6050 6870 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6530 7270 60  0001 C CNN "PurchasingLink"
	1    6050 6870
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DE9EE7F
P 6930 7480
F 0 "#PWR?" H 6930 7230 50  0001 C CNN
F 1 "GND" H 6935 7307 50  0000 C CNN
F 2 "" H 6930 7480 50  0001 C CNN
F 3 "" H 6930 7480 50  0001 C CNN
	1    6930 7480
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DE9F491
P 6050 7480
F 0 "#PWR?" H 6050 7230 50  0001 C CNN
F 1 "GND" H 6055 7307 50  0000 C CNN
F 2 "" H 6050 7480 50  0001 C CNN
F 3 "" H 6050 7480 50  0001 C CNN
	1    6050 7480
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5DEA853C
P 6930 6050
F 0 "#PWR?" H 6930 5900 50  0001 C CNN
F 1 "VCC" H 6947 6223 50  0000 C CNN
F 2 "" H 6930 6050 50  0001 C CNN
F 3 "" H 6930 6050 50  0001 C CNN
	1    6930 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6930 6050 6930 6100
Wire Wire Line
	6930 6400 6930 6460
Wire Wire Line
	6630 6720 6450 6720
Wire Wire Line
	6450 6720 6290 6720
Connection ~ 6450 6720
Wire Wire Line
	6050 7020 6050 7090
Wire Wire Line
	6050 7390 6050 7480
Wire Wire Line
	6050 6720 6050 6500
Connection ~ 6050 6720
Wire Wire Line
	6450 7020 6930 7020
Wire Wire Line
	6930 7020 6930 6920
Wire Wire Line
	6930 7480 6930 7020
Connection ~ 6930 7020
Text Label 7100 6460 0    50   ~ 0
~SHUTDOWN_SENSE_BSPD_PIN
Wire Wire Line
	7100 6460 6930 6460
Connection ~ 6930 6460
Wire Wire Line
	6930 6460 6930 6520
Text Label 3450 8450 0    50   ~ 0
~SHUTDOWN_SENSE_BSPD_PIN
Text Label 1210 6070 0    50   ~ 0
BSPD_CURRENT_SENSE
Wire Notes Line
	8260 5810 5070 5810
Wire Notes Line
	5070 5810 5070 7780
Wire Notes Line
	5070 7780 8260 7780
Wire Notes Line
	8260 7780 8260 5810
Text Notes 5130 5920 0    50   ~ 0
Shutdown Sense
Text Label 3450 9150 0    50   ~ 0
BSPD_RELAY_INTENTION
Text Label 3450 8250 0    50   ~ 0
BRAKELIGHT_GATE
$Comp
L formula:C_0.1uF C13
U 1 1 5DD366E8
P 13020 5430
F 0 "C13" H 13070 5530 50  0000 L CNN
F 1 "C_0.1uF" H 13070 5330 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13058 5280 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 13045 5530 50  0001 C CNN
F 4 "DK" H 13020 5430 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 13020 5430 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 13445 5930 60  0001 C CNN "PurchasingLink"
	1    13020 5430
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DD4609C
P 13020 5580
F 0 "#PWR?" H 13020 5330 50  0001 C CNN
F 1 "GND" H 13025 5407 50  0000 C CNN
F 2 "" H 13020 5580 50  0001 C CNN
F 3 "" H 13020 5580 50  0001 C CNN
	1    13020 5580
	1    0    0    -1  
$EndComp
Wire Wire Line
	12830 5280 13020 5280
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5CE37519
P 12620 5540
F 0 "#PWR?" H 12620 5390 50  0001 C CNN
F 1 "VCC" H 12637 5713 50  0000 C CNN
F 2 "" H 12620 5540 50  0001 C CNN
F 3 "" H 12620 5540 50  0001 C CNN
	1    12620 5540
	1    0    0    -1  
$EndComp
Wire Wire Line
	12620 5540 12830 5540
Wire Wire Line
	12830 5540 12830 5280
Connection ~ 12620 5540
$Comp
L formula:MCP6001 U4
U 1 1 5CE1303D
P 12720 5840
F 0 "U4" H 12770 5940 50  0000 L CNN
F 1 "MCP6001" H 12720 5660 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 12620 5940 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 12720 6040 50  0001 C CNN
F 4 "DK" H 12820 6140 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 12920 6240 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 13020 6340 60  0001 C CNN "PurchasingLink"
	1    12720 5840
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C12
U 1 1 5DD7624A
P 13000 6430
F 0 "C12" H 13050 6530 50  0000 L CNN
F 1 "C_0.1uF" H 13050 6330 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13038 6280 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 13025 6530 50  0001 C CNN
F 4 "DK" H 13000 6430 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 13000 6430 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 13425 6930 60  0001 C CNN "PurchasingLink"
	1    13000 6430
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DD76AA2
P 13000 6580
F 0 "#PWR?" H 13000 6330 50  0001 C CNN
F 1 "GND" H 13005 6407 50  0000 C CNN
F 2 "" H 13000 6580 50  0001 C CNN
F 3 "" H 13000 6580 50  0001 C CNN
	1    13000 6580
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5C8151B6
P 12620 6590
F 0 "#PWR?" H 12620 6440 50  0001 C CNN
F 1 "VCC" H 12637 6763 50  0000 C CNN
F 2 "" H 12620 6590 50  0001 C CNN
F 3 "" H 12620 6590 50  0001 C CNN
	1    12620 6590
	1    0    0    -1  
$EndComp
Wire Wire Line
	12620 6590 12830 6590
Wire Wire Line
	12830 6590 12830 6280
Wire Wire Line
	12830 6280 13000 6280
Connection ~ 12620 6590
$Comp
L formula:C_0.1uF C14
U 1 1 5DD95940
P 14380 5840
F 0 "C14" H 14430 5940 50  0000 L CNN
F 1 "C_0.1uF" H 14430 5740 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 14418 5690 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14405 5940 50  0001 C CNN
F 4 "DK" H 14380 5840 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 14380 5840 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 14805 6340 60  0001 C CNN "PurchasingLink"
	1    14380 5840
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5DD96370
P 14380 5990
F 0 "#PWR?" H 14380 5740 50  0001 C CNN
F 1 "GND" H 14385 5817 50  0000 C CNN
F 2 "" H 14380 5990 50  0001 C CNN
F 3 "" H 14380 5990 50  0001 C CNN
	1    14380 5990
	1    0    0    -1  
$EndComp
Wire Wire Line
	13960 5990 14190 5990
Wire Wire Line
	14190 5990 14190 5690
Wire Wire Line
	14190 5690 14380 5690
Wire Wire Line
	11800 6790 12370 6790
Wire Wire Line
	11390 6790 11510 6790
Wire Wire Line
	14410 6340 14560 6340
Wire Wire Line
	14760 3460 14920 3460
Wire Wire Line
	14760 3760 14920 3760
$Comp
L formula:R_120_DNP R24
U 1 1 5DD7C58B
P 14920 3610
F 0 "R24" H 14990 3680 50  0000 L CNN
F 1 "R_120_DNP" H 14990 3590 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 13720 3760 50  0001 L CNN
F 3 "" H 13720 4060 50  0001 L CNN
F 4 "DK" H 14920 3610 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 13720 3860 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 13720 3960 60  0001 L CNN "PurchasingLink"
	1    14920 3610
	1    0    0    -1  
$EndComp
Connection ~ 14920 3460
Wire Wire Line
	14920 3460 15085 3460
Connection ~ 14920 3760
Wire Wire Line
	14920 3760 15085 3760
$Comp
L formula:R_1K R101
U 1 1 5DE90F79
P 6010 9030
F 0 "R101" H 6080 9076 50  0000 L CNN
F 1 "R_1K" H 6080 8985 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5940 9030 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 6090 9030 50  0001 C CNN
F 4 "DK" H 6010 9030 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 6010 9030 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6490 9430 60  0001 C CNN "PurchasingLink"
	1    6010 9030
	1    0    0    -1  
$EndComp
NoConn ~ 3450 7150
NoConn ~ 3450 7250
NoConn ~ 3450 7050
$Comp
L formula:Test_Point_SMD TP1
U 1 1 5E3C5FC8
P 11510 6740
F 0 "TP1" H 11588 6828 50  0000 L CNN
F 1 "Test_Point_SMD" H 11220 6610 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 11510 6590 50  0001 C CNN
F 3 "" H 11510 6740 50  0001 C CNN
	1    11510 6740
	1    0    0    -1  
$EndComp
Connection ~ 11510 6790
Wire Wire Line
	11510 6790 11800 6790
$Comp
L formula:Test_Point_SMD TP2
U 1 1 5E3CA9BA
P 14560 6290
F 0 "TP2" H 14500 6480 50  0000 L CNN
F 1 "Test_Point_SMD" H 14490 6550 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 14560 6140 50  0001 C CNN
F 3 "" H 14560 6290 50  0001 C CNN
	1    14560 6290
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 5E424713
P 8390 2560
F 0 "TP3" H 8468 2648 50  0000 L CNN
F 1 "Test_Point_SMD" H 8460 2710 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8390 2410 50  0001 C CNN
F 3 "" H 8390 2560 50  0001 C CNN
	1    8390 2560
	1    0    0    -1  
$EndComp
Wire Wire Line
	5610 8730 6010 8730
Connection ~ 5610 8730
$Comp
L formula:Test_Point_SMD TP4
U 1 1 5E4F4223
P 1470 2020
F 0 "TP4" H 1548 2108 50  0000 L CNN
F 1 "Test_Point_SMD" H 1548 2017 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 1470 1870 50  0001 C CNN
F 3 "" H 1470 2020 50  0001 C CNN
	1    1470 2020
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5E4FFA44
P 1290 2380
F 0 "#PWR?" H 1290 2230 50  0001 C CNN
F 1 "VCC" H 1307 2553 50  0000 C CNN
F 2 "" H 1290 2380 50  0001 C CNN
F 3 "" H 1290 2380 50  0001 C CNN
	1    1290 2380
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP5
U 1 1 5E500707
P 1480 2330
F 0 "TP5" H 1558 2418 50  0000 L CNN
F 1 "Test_Point_SMD" H 1558 2327 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 1480 2180 50  0001 C CNN
F 3 "" H 1480 2330 50  0001 C CNN
	1    1480 2330
	1    0    0    -1  
$EndComp
Wire Wire Line
	1290 2380 1480 2380
$Comp
L bspd_brakelight-rescue:+12V-power #PWR?
U 1 1 5E50C39C
P 1280 2070
F 0 "#PWR?" H 1280 1920 50  0001 C CNN
F 1 "+12V" H 1295 2243 50  0000 C CNN
F 2 "" H 1280 2070 50  0001 C CNN
F 3 "" H 1280 2070 50  0001 C CNN
	1    1280 2070
	1    0    0    -1  
$EndComp
Wire Wire Line
	1280 2070 1470 2070
$Comp
L formula:Test_Point_SMD TP6
U 1 1 5E55C85A
P 1480 2620
F 0 "TP6" H 1558 2708 50  0000 L CNN
F 1 "Test_Point_SMD" H 1558 2617 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 1480 2470 50  0001 C CNN
F 3 "" H 1480 2620 50  0001 C CNN
	1    1480 2620
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5E55CE3E
P 1480 2670
F 0 "#PWR?" H 1480 2420 50  0001 C CNN
F 1 "GND" H 1485 2497 50  0000 C CNN
F 2 "" H 1480 2670 50  0001 C CNN
F 3 "" H 1480 2670 50  0001 C CNN
	1    1480 2670
	1    0    0    -1  
$EndComp
Connection ~ 8190 2610
Wire Wire Line
	14860 6340 15090 6340
Connection ~ 15090 6340
Wire Wire Line
	15090 6340 15330 6340
Connection ~ 14560 6340
$Comp
L formula:R_0 R33
U 1 1 5BFFEC6F
P 14710 6340
F 0 "R33" V 14503 6340 50  0000 C CNN
F 1 "R_0" V 14594 6340 50  0000 C CNN
F 2 "footprints:R_0603_1608Metric" H 14640 6340 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 14790 6340 50  0001 C CNN
F 4 "DK" H 14710 6340 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 14710 6340 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 15190 6740 60  0001 C CNN "PurchasingLink"
	1    14710 6340
	0    1    1    0   
$EndComp
$Comp
L formula:CONN_02X03 J3
U 1 1 5C00B3DE
P 11610 2390
F 0 "J3" H 11610 2590 50  0000 C CNN
F 1 "CONN_02X03" H 11610 2190 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 11610 1190 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 11610 1190 50  0001 C CNN
F 4 "DK" H 11610 2390 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 11610 2390 60  0001 C CNN "MPN"
F 6 "Value" H 11610 2390 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 12010 2990 60  0001 C CNN "PurchasingLink"
	1    11610 2390
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:VCC-power #PWR?
U 1 1 5E726D8B
P 1660 4670
F 0 "#PWR?" H 1660 4520 50  0001 C CNN
F 1 "VCC" H 1677 4843 50  0000 C CNN
F 2 "" H 1660 4670 50  0001 C CNN
F 3 "" H 1660 4670 50  0001 C CNN
	1    1660 4670
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_F_RA_20 J2
U 1 1 5BEA89C8
P 1060 5370
F 0 "J2" H 1016 6717 60  0000 C CNN
F 1 "MM_F_RA_20" H 1016 6611 60  0000 C CNN
F 2 "footprints:micromatch_female_ra_20" H 860 6470 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=338070&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=2-338070-0" H 960 6570 60  0001 C CNN
F 4 "TE" H 1160 6770 60  0001 C CNN "MFN"
F 5 "2-338070-0" H 1260 6870 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-2-338070-0.html" H 1060 6670 60  0001 C CNN "PurchasingLink"
	1    1060 5370
	1    0    0    -1  
$EndComp
Wire Wire Line
	1660 4670 1210 4670
$Comp
L formula:C_0.1uF C15
U 1 1 5E742866
P 4990 2030
F 0 "C15" H 5105 2076 50  0000 L CNN
F 1 "C_0.1uF" H 5105 1985 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5028 1880 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5015 2130 50  0001 C CNN
F 4 "DK" H 4990 2030 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 4990 2030 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 5415 2530 60  0001 C CNN "PurchasingLink"
	1    4990 2030
	1    0    0    -1  
$EndComp
Wire Wire Line
	4730 2100 4860 2100
Wire Wire Line
	4860 2100 4860 1880
Wire Wire Line
	4860 1880 4990 1880
Connection ~ 4730 2100
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5E750304
P 4990 2180
F 0 "#PWR?" H 4990 1930 50  0001 C CNN
F 1 "GND" H 4995 2007 50  0000 C CNN
F 2 "" H 4990 2180 50  0001 C CNN
F 3 "" H 4990 2180 50  0001 C CNN
	1    4990 2180
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C17
U 1 1 5E7566FD
P 8130 2100
F 0 "C17" H 8245 2146 50  0000 L CNN
F 1 "C_0.1uF" H 8245 2055 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8168 1950 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8155 2200 50  0001 C CNN
F 4 "DK" H 8130 2100 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8130 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8555 2600 60  0001 C CNN "PurchasingLink"
	1    8130 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7970 1950 8130 1950
Wire Wire Line
	7740 2260 7970 2260
Connection ~ 7740 2260
Wire Wire Line
	7970 2260 7970 1950
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5E77C068
P 8130 2250
F 0 "#PWR?" H 8130 2000 50  0001 C CNN
F 1 "GND" H 8135 2077 50  0000 C CNN
F 2 "" H 8130 2250 50  0001 C CNN
F 3 "" H 8130 2250 50  0001 C CNN
	1    8130 2250
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C16
U 1 1 5E77F35C
P 7820 3430
F 0 "C16" H 7935 3476 50  0000 L CNN
F 1 "C_0.1uF" H 7935 3385 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7858 3280 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7845 3530 50  0001 C CNN
F 4 "DK" H 7820 3430 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7820 3430 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 8245 3930 60  0001 C CNN "PurchasingLink"
	1    7820 3430
	1    0    0    -1  
$EndComp
Wire Wire Line
	7490 3550 7630 3550
Wire Wire Line
	7630 3550 7630 3280
Wire Wire Line
	7630 3280 7820 3280
Connection ~ 7490 3550
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5E78B2F8
P 7820 3580
F 0 "#PWR?" H 7820 3330 50  0001 C CNN
F 1 "GND" H 7825 3407 50  0000 C CNN
F 2 "" H 7820 3580 50  0001 C CNN
F 3 "" H 7820 3580 50  0001 C CNN
	1    7820 3580
	1    0    0    -1  
$EndComp
Text Notes 11320 7740 0    50   ~ 0
V_out = VCC * R19 / (R19 + R12)\n5 * 499 / (499 + 2200) = .92V
Wire Notes Line
	10090 5160 10090 7810
Text Notes 10140 5830 0    50   ~ 0
V_out = VCC * R16 / (R15 + R16)\n5 * 1000 / (10000 + 1000) = .45
Text Notes 13250 9080 0    50   ~ 0
Break Pressure Sensor\nhttps://www.digikey.com/product-detail/en/honeywell-sensing-and\n-productivity-solutions/MLH02KPSB06A/480-2534-ND/1248869\n\nVoltage range of .5-4.5V\nThis circuit uses the following ranges with corresponding behaivors:\n\n0-.45V (open circuit): Since the voltage is too low, we treat this as \nan open circuit, so we keep the brakelight on.\n\n.45-.92V: Brake isn't being pressed hard enough to be effective, so we\ndon't turn the brakelight on\n\n>.92V: Brake is being pressed enough for the driver to feel it, so we\nturn the brakelight on
Wire Notes Line
	16050 9170 13220 9170
Wire Notes Line
	13220 9170 13220 7810
Wire Notes Line
	16050 5160 16050 9170
Text Notes 6990 1680 0    50   ~ 0
BSPD circuit is tripped when the motor controller is still providing power \nto the motor while the brake is being pressed. This means the brake \nis not behaving correctly and this is a very dangerous situation, so the\nBSPD relay is tripped and the shutdown circuit is opened (car shuts \ndown).\n\nThere is a BSPD test switch included for testing to make sure the\ncircuit works, and also because it is rules-required.
Text Notes 830  1060 0    118  ~ 0
VCC = 5V
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5E8310A8
P 1210 6170
F 0 "#PWR?" H 1210 5920 50  0001 C CNN
F 1 "GND" H 1215 5997 50  0000 C CNN
F 2 "" H 1210 6170 50  0001 C CNN
F 3 "" H 1210 6170 50  0001 C CNN
	1    1210 6170
	1    0    0    -1  
$EndComp
Text Notes 2770 1750 0    50   ~ 0
V_cap = V_source * (1 - e ^ (-t / RC))\nt = -RC * ln(1 - (V_cap / V_source))\nt = -(71500 * .00001 * ln(2.5 / 5))\n  = .5 s
Text Notes 4580 1670 0    50   ~ 0
V_cap = 2.5V because that is the \nvalue we compare to using the\nop amp (U2).
Text Notes 2770 1400 0    79   ~ 0
Timer Calculations
Wire Wire Line
	13960 5960 13960 5990
Connection ~ 13960 5990
Text Notes 10240 9810 1    50   ~ 0
5V Indicator
Connection ~ 10060 8830
Wire Wire Line
	10060 8830 10310 8830
$Comp
L formula:LED_0805 D?
U 1 1 5CC79476
P 10310 9570
AR Path="/5CC68CC1/5CC79476" Ref="D?"  Part="1" 
AR Path="/5CC79476" Ref="D103"  Part="1" 
F 0 "D103" V 10348 9453 50  0000 R CNN
F 1 "LED_0805" V 10257 9453 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 10210 9570 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10310 9670 50  0001 C CNN
F 4 "DK" H 10310 9570 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10310 9570 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10710 10070 60  0001 C CNN "PurchasingLink"
	1    10310 9570
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R?
U 1 1 5CC79480
P 10310 9020
AR Path="/5CC68CC1/5CC79480" Ref="R?"  Part="1" 
AR Path="/5CC79480" Ref="R105"  Part="1" 
F 0 "R105" H 10380 9066 50  0000 L CNN
F 1 "R_200" H 10380 8975 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10240 9020 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 10390 9020 50  0001 C CNN
F 4 "DK" H 10310 9020 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 10310 9020 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10790 9420 60  0001 C CNN "PurchasingLink"
	1    10310 9020
	1    0    0    -1  
$EndComp
$Comp
L bspd_brakelight-rescue:GND-power #PWR?
U 1 1 5CC79487
P 10310 10020
AR Path="/5CC68CC1/5CC79487" Ref="#PWR?"  Part="1" 
AR Path="/5CC79487" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10310 9770 50  0001 C CNN
F 1 "GND" H 10315 9847 50  0000 C CNN
F 2 "" H 10310 10020 50  0001 C CNN
F 3 "" H 10310 10020 50  0001 C CNN
	1    10310 10020
	1    0    0    -1  
$EndComp
Wire Wire Line
	10310 9170 10310 9420
Wire Wire Line
	10310 9720 10310 10020
$Comp
L formula:R_0_2512 R?
U 1 1 5CC7946C
P 10760 8830
AR Path="/5CC68CC1/5CC7946C" Ref="R?"  Part="1" 
AR Path="/5CC7946C" Ref="R104"  Part="1" 
F 0 "R104" V 10560 8830 50  0000 C CNN
F 1 "R_0_2512" V 10660 8830 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 10690 8830 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 10840 8830 50  0001 C CNN
F 4 "DK" H 10760 8830 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 10760 8830 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 11240 9230 60  0001 C CNN "PurchasingLink"
	1    10760 8830
	0    1    1    0   
$EndComp
Text Notes 10610 8970 0    50   ~ 0
VCC Jumper\n
Wire Wire Line
	10310 8830 10310 8870
Wire Wire Line
	10610 8830 10310 8830
Connection ~ 10310 8830
$Comp
L formula:Test_Point_SMD TP102
U 1 1 615C090D
P 3780 2610
F 0 "TP102" V 3760 2900 50  0000 L CNN
F 1 "Test_Point_SMD" V 3840 2820 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3780 2460 50  0001 C CNN
F 3 "" H 3780 2610 50  0001 C CNN
	1    3780 2610
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3830 2610 3880 2610
Wire Wire Line
	3880 2610 3880 2500
Connection ~ 3880 2500
Wire Wire Line
	3880 2500 3740 2500
$Comp
L formula:Test_Point_SMD TP103
U 1 1 615CE8A1
P 15630 5860
F 0 "TP103" H 15770 6020 50  0000 L CNN
F 1 "Test_Point_SMD" H 15750 5950 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 15630 5710 50  0001 C CNN
F 3 "" H 15630 5860 50  0001 C CNN
	1    15630 5860
	1    0    0    -1  
$EndComp
Wire Wire Line
	15630 5910 15630 6140
$Comp
L formula:Test_Point_SMD TP101
U 1 1 615DD9DB
P 5800 2400
F 0 "TP101" H 5740 2680 50  0000 L CNN
F 1 "Test_Point_SMD" H 5530 2610 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5800 2250 50  0001 C CNN
F 3 "" H 5800 2400 50  0001 C CNN
	1    5800 2400
	1    0    0    -1  
$EndComp
Connection ~ 5800 2450
Wire Wire Line
	5800 2450 5980 2450
$Comp
L formula:Test_Point_SMD TP105
U 1 1 615DE43F
P 6290 6670
F 0 "TP105" H 6230 6950 50  0000 L CNN
F 1 "Test_Point_SMD" H 6020 6880 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6290 6520 50  0001 C CNN
F 3 "" H 6290 6670 50  0001 C CNN
	1    6290 6670
	1    0    0    -1  
$EndComp
Connection ~ 6290 6720
Wire Wire Line
	6290 6720 6050 6720
$Comp
L formula:Test_Point_SMD TP104
U 1 1 615DF84C
P 6980 6520
F 0 "TP104" V 7090 7120 50  0000 L CNN
F 1 "Test_Point_SMD" V 6990 6710 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6980 6370 50  0001 C CNN
F 3 "" H 6980 6520 50  0001 C CNN
	1    6980 6520
	0    1    1    0   
$EndComp
Connection ~ 6930 6520
Wire Wire Line
	3450 7850 3450 7750
Wire Wire Line
	3450 8750 3450 8650
Wire Wire Line
	3450 9350 3450 9250
$EndSCHEMATC
