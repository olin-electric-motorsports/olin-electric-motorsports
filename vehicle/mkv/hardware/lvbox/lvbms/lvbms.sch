EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "OEM Project Template"
Date "2021-09-07"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Adi Ramachandran"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:C_2.2uF C102
U 1 1 5BEE2647
P 2950 9175
F 0 "C102" H 2975 9075 50  0000 L CNN
F 1 "C_2.2uF" H 2830 9425 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2988 9025 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_soft_en.pdf" H 2975 9275 50  0001 C CNN
F 4 "DK" H 2950 9175 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2950 9175 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C2012X7R1H225M125AE/445-172488-1-ND/4990030" H 3375 9675 60  0001 C CNN "PurchasingLink"
	1    2950 9175
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5BEE2923
P 2650 9125
F 0 "C101" H 2700 8975 50  0000 L CNN
F 1 "C_0.1uF" H 2480 9375 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2688 8975 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 2675 9225 50  0001 C CNN
F 4 "DK" H 2650 9125 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 2650 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 3075 9625 60  0001 C CNN "PurchasingLink"
	1    2650 9125
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 6100 9425
F 0 "D103" V 6125 9275 50  0000 R CNN
F 1 "LED_0805" V 6025 9275 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6000 9425 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6100 9525 50  0001 C CNN
F 4 "DK" H 6100 9425 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6100 9425 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6500 9925 60  0001 C CNN "PurchasingLink"
	1    6100 9425
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 6100 9125
F 0 "R105" H 6170 9171 50  0000 L CNN
F 1 "R_200" H 6170 9080 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6030 9125 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6180 9125 50  0001 C CNN
F 4 "DK" H 6100 9125 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6100 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6580 9525 60  0001 C CNN "PurchasingLink"
	1    6100 9125
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 1850 9275
F 0 "D101" H 1840 9465 50  0000 C CNN
F 1 "D_Zener_18V" H 1830 9375 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1750 9275 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1850 9375 50  0001 C CNN
F 4 "DK" H 2050 9575 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1950 9475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 2250 9775 60  0001 C CNN "PurchasingLink"
	1    1850 9275
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 2250 9525
F 0 "D102" V 2288 9408 50  0000 R CNN
F 1 "LED_0805" V 2197 9408 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2150 9525 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2250 9625 50  0001 C CNN
F 4 "DK" H 2250 9525 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2250 9525 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2650 10025 60  0001 C CNN "PurchasingLink"
	1    2250 9525
	0    -1   -1   0   
$EndComp
Text Notes 2250 8875 0    50   ~ 0
Input Capacitors\n\n
Text Notes 2150 9875 1    50   ~ 0
12V Indicator
Text Notes 1750 9525 1    50   ~ 0
Protection\n
Text Notes 900  8425 0    89   ~ 0
LINEAR REGULATOR\n
Text Notes 5950 9600 1    50   ~ 0
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
P 4375 3500
F 0 "R3" V 4295 3500 50  0000 C CNN
F 1 "R_10K" V 4425 3750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4305 3500 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4455 3500 50  0001 C CNN
F 4 "DK" H 4375 3500 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4375 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4855 3900 60  0001 C CNN "PurchasingLink"
	1    4375 3500
	0    1    1    0   
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
Text Label 14300 1850 2    50   ~ 0
CAN_TX
Text Label 14300 1950 2    50   ~ 0
CAN_RX
Text Label 15750 1900 0    50   ~ 0
CAN_P
Text Label 15750 2200 0    50   ~ 0
CAN_N
Text Notes 13750 1050 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2250 800  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 4950 4700 1    89   ~ 0
16 MHz CRYSTAL\n
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 14800 3400
F 0 "J1" H 14800 3610 50  0000 C CNN
F 1 "CONN_02X03" H 14690 3200 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 14800 2200 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 14800 2200 50  0001 C CNN
F 4 "DK" H 14800 3400 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 14800 3400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 15200 4000 60  0001 C CNN "PurchasingLink"
	1    14800 3400
	1    0    0    -1  
$EndComp
Text Label 14025 3300 2    50   ~ 0
MISO
Text Label 14250 3400 2    50   ~ 0
SCK
Text Label 14550 3500 2    50   ~ 0
RESET
Text Label 15400 3400 0    50   ~ 0
MOSI
Text Notes 13775 3050 0    89   ~ 0
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
	4525 3500 4675 3500
Wire Wire Line
	4675 3500 4675 3450
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
	1850 9425 1850 9525
Connection ~ 2650 8975
Wire Wire Line
	2250 9275 2250 9375
Wire Wire Line
	2250 9675 2250 9825
Connection ~ 3200 8975
Wire Wire Line
	15300 2150 15400 2150
$Comp
L formula:R_1K R101
U 1 1 5DE6EFCB
P 2250 9125
F 0 "R101" H 2320 9171 50  0000 L CNN
F 1 "R_1K" H 2320 9080 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2180 9125 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2330 9125 50  0001 C CNN
F 4 "DK" H 2250 9125 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2250 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2730 9525 60  0001 C CNN "PurchasingLink"
	1    2250 9125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 8975 2650 8975
Connection ~ 2250 8975
Wire Wire Line
	1750 8975 1850 8975
Wire Wire Line
	1850 9125 1850 8975
Connection ~ 1850 8975
Wire Wire Line
	1850 8975 2250 8975
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
	2650 8975 2950 8975
Connection ~ 2950 8975
Wire Wire Line
	2950 8975 3200 8975
Text Label 6100 5725 0    50   ~ 0
V-
Text Label 6100 5825 0    50   ~ 0
V-
Text Label 6100 7225 0    50   ~ 0
V-
Text Label 6100 7325 0    50   ~ 0
V-
Text Label 6100 7425 0    50   ~ 0
V-
Text Label 6100 7725 0    50   ~ 0
V-
Text Label 6100 7825 0    50   ~ 0
V-
Text Label 4100 5725 2    50   ~ 0
V-
Text Label 8825 1075 2    50   ~ 0
THERM_5_+
Text Label 8825 1225 2    50   ~ 0
THERM_5_-
Wire Wire Line
	15275 4700 15275 4600
Wire Wire Line
	15100 4800 15100 4600
Wire Wire Line
	14925 4900 14925 4600
Wire Wire Line
	14750 5000 14750 4600
$Comp
L formula:R_10K R15
U 1 1 60AEC253
P 14400 4450
F 0 "R15" H 14400 4300 50  0000 L CNN
F 1 "R_10K" V 14475 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14330 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 14480 4450 50  0001 C CNN
F 4 "DK" H 14400 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 14400 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 14880 4850 60  0001 C CNN "PurchasingLink"
	1    14400 4450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R16
U 1 1 60AED025
P 14575 4450
F 0 "R16" H 14575 4300 50  0000 L CNN
F 1 "R_10K" V 14650 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14505 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 14655 4450 50  0001 C CNN
F 4 "DK" H 14575 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 14575 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15055 4850 60  0001 C CNN "PurchasingLink"
	1    14575 4450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R17
U 1 1 60AEF73B
P 14750 4450
F 0 "R17" H 14750 4300 50  0000 L CNN
F 1 "R_10K" V 14825 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14680 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 14830 4450 50  0001 C CNN
F 4 "DK" H 14750 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 14750 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15230 4850 60  0001 C CNN "PurchasingLink"
	1    14750 4450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R30
U 1 1 60AF5E8D
P 15275 4450
F 0 "R30" H 15300 4300 50  0000 L CNN
F 1 "R_10K" V 15350 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 15205 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 15355 4450 50  0001 C CNN
F 4 "DK" H 15275 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 15275 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15755 4850 60  0001 C CNN "PurchasingLink"
	1    15275 4450
	1    0    0    -1  
$EndComp
Text Notes 8050 6750 0    39   ~ 0
Comparator logic chart \n\n|             | No Load | Charging | Discharging | FAULT |\n|--------|------|------|---------|-----|\n| comp_1_out | 1       | 1        | 0           | 0     |\n| comp_2_out | 1       | 0        | 1           | 0     |\n\nThe outputs of both comparators are fed into \nLOW Level Triggered External interrupts on the Atemga\nwhere C1 LOW indicates Discharge state & C2 LOW \nindicates Charge state. \n\nBoth C1 and C2 low triggers a WAKEUP Logic Fault \nas this state should be impossible to achieve with \ncorrect logic.
Wire Wire Line
	6100 7025 6600 7025
$Comp
L formula:NSS1C201MZ4 Q1
U 1 1 60DBB23E
P 6750 6650
F 0 "Q1" H 6925 6650 50  0000 L CNN
F 1 "NSS1C201MZ4" H 6300 6850 50  0000 L CNN
F 2 "footprints:SOT-223" H 6550 6750 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/NSS1C201MZ4-D.PDF" H 6650 6850 50  0001 C CNN
F 4 "NSS1C201MZ4T3GOSCT-ND " H 6994 6650 50  0001 L CNN "MPN"
F 5 "DK" H 6994 6559 50  0001 L CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/on-semiconductor/NSS1C201MZ4T3G/NSS1C201MZ4T3GOSCT-ND/9087487" H 6994 6468 50  0001 L CNN "PurchasingLink"
	1    6750 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 6825 6400 6825
Wire Wire Line
	6400 6825 6400 6650
$Comp
L formula:C_0.1uF C13
U 1 1 60DCC62A
P 7300 6600
F 0 "C13" H 7415 6646 50  0000 L CNN
F 1 "C_0.1uF" H 7415 6555 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7338 6450 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7325 6700 50  0001 C CNN
F 4 "DK" H 7300 6600 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7300 6600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7725 7100 60  0001 C CNN "PurchasingLink"
	1    7300 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 6450 6900 6450
$Comp
L formula:R_100 R14
U 1 1 60DDDF9C
P 6900 6200
F 0 "R14" H 6970 6246 50  0000 L CNN
F 1 "R_100" H 6970 6155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6100 6350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 6600 6700 50  0001 C CNN
F 4 "DK" H 6900 6200 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 6250 6450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 7380 6600 60  0001 C CNN "PurchasingLink"
	1    6900 6200
	1    0    0    -1  
$EndComp
Text Label 6475 6925 0    50   ~ 0
VREG
$Comp
L formula:Test_Point_SMD TP3
U 1 1 60DF50E3
P 6900 7025
F 0 "TP3" V 6800 7075 50  0000 L CNN
F 1 "Test_Point_SMD" V 6975 7175 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6900 6875 50  0001 C CNN
F 3 "" H 6900 7025 50  0001 C CNN
	1    6900 7025
	0    1    1    0   
$EndComp
Text Label 3650 1200 0    50   ~ 0
COMP_1_OUT
Text Label 3650 1500 0    50   ~ 0
COMP_2_OUT
Text Notes 4175 1425 0    50   ~ 0
level triggered external interrupt on \nPB2 & PB5 from comparator outputs\nto wake uC from standby mode\n
NoConn ~ 4100 5825
Wire Wire Line
	4100 7725 4100 7825
Text Label 4100 7825 2    50   ~ 0
V-
$Comp
L formula:C_10nF C10
U 1 1 60F23748
P 2700 7175
F 0 "C10" H 2815 7221 50  0000 L CNN
F 1 "C_10nF" H 2815 7130 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2738 7025 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 2725 7275 50  0001 C CNN
F 4 "Kemet" H 2700 7175 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 2700 7175 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 3125 7675 60  0001 C CNN "PurchasingLink"
	1    2700 7175
	1    0    0    -1  
$EndComp
Wire Wire Line
	2625 7025 2700 7025
Wire Wire Line
	3100 7025 3100 7225
Connection ~ 2700 7025
Wire Wire Line
	2700 7025 2800 7025
$Comp
L formula:C_10nF C9
U 1 1 60F6393A
P 2700 6775
F 0 "C9" H 2815 6821 50  0000 L CNN
F 1 "C_10nF" H 2815 6730 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2738 6625 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 2725 6875 50  0001 C CNN
F 4 "Kemet" H 2700 6775 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 2700 6775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 3125 7275 60  0001 C CNN "PurchasingLink"
	1    2700 6775
	1    0    0    -1  
$EndComp
Text Label 1525 7025 2    50   ~ 0
BATT_0
Wire Wire Line
	3175 7125 3175 6950
Wire Wire Line
	2625 6625 2700 6625
Connection ~ 2700 6625
Text Label 2000 6625 2    50   ~ 0
BATT_1
Wire Wire Line
	2150 6925 2150 6950
Wire Wire Line
	2150 6950 3175 6950
$Comp
L formula:R_100 R12
U 1 1 60FD0B59
P 2475 6625
F 0 "R12" V 2268 6625 50  0000 C CNN
F 1 "R_100" V 2359 6625 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1675 6775 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2175 7125 50  0001 C CNN
F 4 "DK" H 2475 6625 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1825 6875 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2955 7025 60  0001 C CNN "PurchasingLink"
	1    2475 6625
	0    1    1    0   
$EndComp
$Comp
L formula:C_10nF C8
U 1 1 60FD0B62
P 2700 6375
F 0 "C8" H 2815 6421 50  0000 L CNN
F 1 "C_10nF" H 2815 6330 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2738 6225 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 2725 6475 50  0001 C CNN
F 4 "Kemet" H 2700 6375 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 2700 6375 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 3125 6875 60  0001 C CNN "PurchasingLink"
	1    2700 6375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2625 6225 2700 6225
Connection ~ 2700 6225
Text Label 2000 6225 2    50   ~ 0
BATT_2
Wire Wire Line
	2150 6525 2150 6550
$Comp
L formula:C_10nF C7
U 1 1 60FEE88F
P 2700 5975
F 0 "C7" H 2815 6021 50  0000 L CNN
F 1 "C_10nF" H 2815 5930 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2738 5825 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 2725 6075 50  0001 C CNN
F 4 "Kemet" H 2700 5975 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 2700 5975 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 3125 6475 60  0001 C CNN "PurchasingLink"
	1    2700 5975
	1    0    0    -1  
$EndComp
Connection ~ 2700 5825
Text Label 2000 5825 2    50   ~ 0
BATT_3
Wire Wire Line
	2150 6125 2150 6150
$Comp
L formula:R_100 R9
U 1 1 60FF898B
P 2475 5425
F 0 "R9" V 2268 5425 50  0000 C CNN
F 1 "R_100" V 2359 5425 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1675 5575 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2175 5925 50  0001 C CNN
F 4 "DK" H 2475 5425 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1825 5675 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2955 5825 60  0001 C CNN "PurchasingLink"
	1    2475 5425
	0    1    1    0   
$EndComp
Text Label 2000 5425 2    50   ~ 0
BATT_4
Wire Wire Line
	2150 5725 2150 5750
Wire Wire Line
	2700 6625 2800 6625
Wire Wire Line
	3250 6625 3250 7025
Wire Wire Line
	3325 6550 3325 6925
Wire Wire Line
	2150 6550 3325 6550
Wire Wire Line
	3400 6225 3400 6825
Wire Wire Line
	2700 6225 2800 6225
Wire Wire Line
	3475 6150 3475 6725
Wire Wire Line
	2150 6150 3475 6150
Wire Wire Line
	3550 5825 3550 6625
Wire Wire Line
	3625 5750 3625 6525
$Comp
L formula:R_100 R10
U 1 1 60FF896F
P 2475 5825
F 0 "R10" V 2268 5825 50  0000 C CNN
F 1 "R_100" V 2359 5825 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1675 5975 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2175 6325 50  0001 C CNN
F 4 "DK" H 2475 5825 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1825 6075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2955 6225 60  0001 C CNN "PurchasingLink"
	1    2475 5825
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R11
U 1 1 60FEE886
P 2475 6225
F 0 "R11" V 2268 6225 50  0000 C CNN
F 1 "R_100" V 2359 6225 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1675 6375 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2175 6725 50  0001 C CNN
F 4 "DK" H 2475 6225 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1825 6475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2955 6625 60  0001 C CNN "PurchasingLink"
	1    2475 6225
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R13
U 1 1 60F1D4C3
P 2475 7025
F 0 "R13" V 2268 7025 50  0000 C CNN
F 1 "R_100" V 2359 7025 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1675 7175 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2175 7525 50  0001 C CNN
F 4 "DK" H 2475 7025 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1825 7275 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2955 7425 60  0001 C CNN "PurchasingLink"
	1    2475 7025
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 7125 6350 7125
$Comp
L formula:C_1uF C12
U 1 1 610C3794
P 6600 7325
F 0 "C12" H 6600 7475 50  0000 L CNN
F 1 "C_1uF" H 6525 7175 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6638 7925 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 6625 8175 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 7025 7825 60  0001 C CNN "PurchasingLink"
	1    6600 7325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7025 6600 7125
Text Label 6100 6025 0    50   ~ 0
MOSI_LIM
Text Label 6100 6425 0    50   ~ 0
SCK_LIM
Text Label 6100 6525 0    50   ~ 0
CSB
NoConn ~ 4100 7525
Text Label 13925 2250 3    50   ~ 0
CAN_STBY
Text Label 3650 1300 0    50   ~ 0
CAN_STBY
$Comp
L formula:Test_Point_SMD TP1
U 1 1 611F9BDC
P 3850 5575
F 0 "TP1" V 3799 5753 50  0000 L CNN
F 1 "Test_Point_SMD" V 3700 5750 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3850 5425 50  0001 C CNN
F 3 "" H 3850 5575 50  0001 C CNN
	1    3850 5575
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 7525 6300 7525
Wire Wire Line
	6300 7525 6300 7725
Wire Wire Line
	6300 7725 6100 7725
NoConn ~ 6100 5925
Wire Wire Line
	4100 6025 3900 6025
Wire Wire Line
	4100 6225 3975 6225
Wire Wire Line
	3975 6225 3975 6425
NoConn ~ 4100 6125
NoConn ~ 4100 6325
Connection ~ 3975 6425
Wire Wire Line
	3975 6425 4100 6425
Wire Wire Line
	3900 6425 3975 6425
Text Label 1000 8575 0    50   ~ 0
PACK_SIDE_CURRENT_PATH
$Comp
L formula:Test_Point_SMD TP4
U 1 1 613EC47A
P 10575 5325
F 0 "TP4" V 10675 5500 50  0000 L CNN
F 1 "Test_Point_SMD" V 10575 5500 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10575 5175 50  0001 C CNN
F 3 "" H 10575 5325 50  0001 C CNN
	1    10575 5325
	0    1    1    0   
$EndComp
Wire Notes Line
	16200 2875 13775 2875
Text Notes 8025 750  0    89   ~ 0
CONNECTORS\n
Text Notes 7975 3375 0    89   ~ 0
WAKEUP SHUNT & LOGIC
Text Label 3650 1700 0    50   ~ 0
CURRENT_SENSE_SIGNAL
Wire Wire Line
	3700 6425 3900 6425
Connection ~ 3900 6425
Wire Wire Line
	3625 6525 4100 6525
Wire Wire Line
	3550 6625 4100 6625
Wire Wire Line
	3475 6725 4100 6725
Wire Wire Line
	3400 6825 4100 6825
Wire Wire Line
	3325 6925 4100 6925
Wire Wire Line
	4100 7025 3250 7025
Wire Wire Line
	3175 7125 4100 7125
Wire Wire Line
	3100 7225 4100 7225
Text Label 3650 2600 0    50   ~ 0
LOAD_SWITCH_FET_DRIVE
$Comp
L formula:LED_0805_Red D1
U 1 1 617D5575
P 6625 2075
F 0 "D1" V 6625 2000 50  0000 R CNN
F 1 "LED_0805_Red" H 6875 2200 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6525 2075 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic8/00078869_0.pdf" H 6625 2175 50  0001 C CNN
F 4 "DK" H 6625 2075 60  0001 C CNN "MFN"
F 5 "475-1415-1-ND" H 6625 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/osram-opto-semiconductors-inc/LH-R974-LP-1/475-1415-1-ND/1802604" H 7025 2575 60  0001 C CNN "PurchasingLink"
	1    6625 2075
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805_Red D2
U 1 1 617D947A
P 6975 2075
F 0 "D2" V 6975 2000 50  0000 R CNN
F 1 "LED_0805_Red" H 7225 2175 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6875 2075 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic8/00078869_0.pdf" H 6975 2175 50  0001 C CNN
F 4 "DK" H 6975 2075 60  0001 C CNN "MFN"
F 5 "475-1415-1-ND" H 6975 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/osram-opto-semiconductors-inc/LH-R974-LP-1/475-1415-1-ND/1802604" H 7375 2575 60  0001 C CNN "PurchasingLink"
	1    6975 2075
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D3
U 1 1 617DB227
P 7300 2075
F 0 "D3" V 7300 2000 50  0000 R CNN
F 1 "LED_0805" H 7450 2175 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 7200 2075 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7300 2175 50  0001 C CNN
F 4 "DK" H 7300 2075 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7300 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7700 2575 60  0001 C CNN "PurchasingLink"
	1    7300 2075
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D4
U 1 1 617DC0FC
P 7625 2075
F 0 "D4" V 7625 2000 50  0000 R CNN
F 1 "LED_0805" H 7775 2150 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 7525 2075 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 7625 2175 50  0001 C CNN
F 4 "DK" H 7625 2075 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 7625 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 8025 2575 60  0001 C CNN "PurchasingLink"
	1    7625 2075
	0    -1   -1   0   
$EndComp
Text Label 3650 1000 0    50   ~ 0
LED_0_+
Text Label 3650 1100 0    50   ~ 0
LED_1_+
Text Label 3650 1400 0    50   ~ 0
LED_2_+
Text Label 3650 1900 0    50   ~ 0
ON_STATE_CMPNTS_FET_DRIVE
Text Label 6625 1625 1    50   ~ 0
LED_0_+
Text Label 6975 1625 1    50   ~ 0
LED_1_+
Text Label 7300 1625 1    50   ~ 0
LED_2_+
Text Label 7625 1625 1    50   ~ 0
ON_STATE_CMPNTS_FET_DRIVE
Wire Notes Line
	7925 1300 7925 2525
Text Notes 6350 1275 0    89   ~ 0
LEDS
Wire Notes Line
	7850 5050 7850 8175
Text Notes 1250 5025 0    89   ~ 0
LTC6810 BMS CHIP
NoConn ~ 3650 2800
NoConn ~ 3650 2900
$Comp
L formula:R_100K R37
U 1 1 61A93FF9
P 13925 2100
F 0 "R37" V 14025 2100 50  0000 L CNN
F 1 "R_100K" H 13995 2055 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 13855 2100 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 14005 2100 50  0001 C CNN
F 4 "DK" H 13925 2100 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 13925 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 14405 2500 60  0001 C CNN "PurchasingLink"
	1    13925 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	13925 2250 14300 2250
Text Label 6100 6125 0    50   ~ 0
MISO_LIM
Wire Wire Line
	2700 5825 2800 5825
Wire Wire Line
	2150 5750 3625 5750
Wire Wire Line
	2625 5825 2700 5825
Wire Wire Line
	2625 5425 2700 5425
Connection ~ 2700 5425
Wire Wire Line
	2700 5425 3700 5425
$Comp
L formula:C_10nF C6
U 1 1 60FF8978
P 2700 5575
F 0 "C6" H 2815 5621 50  0000 L CNN
F 1 "C_10nF" H 2815 5530 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2738 5425 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 2725 5675 50  0001 C CNN
F 4 "Kemet" H 2700 5575 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 2700 5575 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 3125 6075 60  0001 C CNN "PurchasingLink"
	1    2700 5575
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6925 2700 6975
Wire Wire Line
	2700 6975 2800 6975
Wire Wire Line
	2800 6975 2800 7025
Connection ~ 2800 7025
Wire Wire Line
	2800 7025 3100 7025
Wire Wire Line
	2700 6525 2700 6575
Wire Wire Line
	2700 6575 2800 6575
Wire Wire Line
	2800 6575 2800 6625
Connection ~ 2800 6625
Wire Wire Line
	2800 6625 3250 6625
Wire Wire Line
	2700 6125 2700 6175
Wire Wire Line
	2700 6175 2800 6175
Wire Wire Line
	2800 6175 2800 6225
Connection ~ 2800 6225
Wire Wire Line
	2800 6225 3400 6225
Wire Wire Line
	2700 5725 2700 5775
Wire Wire Line
	2700 5775 2800 5775
Wire Wire Line
	2800 5775 2800 5825
Connection ~ 2800 5825
Wire Wire Line
	2800 5825 3550 5825
$Comp
L formula:R_10K R24
U 1 1 60AF3BDF
P 15100 4450
F 0 "R24" H 15100 4300 50  0000 L CNN
F 1 "R_10K" V 15175 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 15030 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 15180 4450 50  0001 C CNN
F 4 "DK" H 15100 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 15100 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15580 4850 60  0001 C CNN "PurchasingLink"
	1    15100 4450
	1    0    0    -1  
$EndComp
Connection ~ 15100 4300
Wire Wire Line
	13900 4800 15100 4800
$Comp
L formula:R_10K R23
U 1 1 60AF1A21
P 14925 4450
F 0 "R23" H 14925 4300 50  0000 L CNN
F 1 "R_10K" V 15000 4350 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14855 4450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 15005 4450 50  0001 C CNN
F 4 "DK" H 14925 4450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 14925 4450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 15405 4850 60  0001 C CNN "PurchasingLink"
	1    14925 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14925 4300 15100 4300
Wire Wire Line
	13900 4900 14925 4900
Connection ~ 14750 4300
Connection ~ 14575 4300
Wire Wire Line
	14575 4300 14750 4300
Wire Wire Line
	14400 4300 14575 4300
Wire Wire Line
	13900 4700 15275 4700
Wire Wire Line
	14575 5100 14575 4600
Wire Wire Line
	13900 5200 14400 5200
Wire Wire Line
	14400 5200 14400 4600
Wire Wire Line
	14575 5100 13900 5100
Wire Wire Line
	14750 5000 13900 5000
Wire Wire Line
	14750 4300 14925 4300
Connection ~ 14925 4300
Wire Wire Line
	15100 4300 15275 4300
Text Label 13900 4700 2    50   ~ 0
THERM_0_+
Text Label 13900 4800 2    50   ~ 0
THERM_1_+
Text Label 13900 4900 2    50   ~ 0
THERM_2_+
Text Label 13900 5000 2    50   ~ 0
THERM_3_+
Text Label 13900 5100 2    50   ~ 0
THERM_4_+
Text Label 13900 5200 2    50   ~ 0
THERM_5_+
Text Label 3650 1600 0    50   ~ 0
THERM_0_+
Text Label 3650 2300 0    50   ~ 0
THERM_1_+
Text Label 3650 2400 0    50   ~ 0
THERM_2_+
Text Label 3650 2500 0    50   ~ 0
THERM_3_+
Text Label 3650 3300 0    50   ~ 0
THERM_4_+
Text Label 3650 3400 0    50   ~ 0
THERM_5_+
Text Label 10250 975  0    50   ~ 0
THERM_0_+
Text Label 10250 1075 0    50   ~ 0
THERM_0_-
Text Label 10250 1475 0    50   ~ 0
THERM_1_+
Text Label 10250 1575 0    50   ~ 0
THERM_1_-
Text Label 10250 1975 0    50   ~ 0
THERM_2_+
Text Label 10250 2075 0    50   ~ 0
THERM_2_-
Text Label 12925 4700 0    50   ~ 0
THERM_0_-
Text Label 12925 4800 0    50   ~ 0
THERM_1_-
Text Label 12925 4900 0    50   ~ 0
THERM_2_-
Text Label 12925 5000 0    50   ~ 0
THERM_3_-
Text Label 12925 5100 0    50   ~ 0
THERM_4_-
Text Label 12925 5200 0    50   ~ 0
THERM_5_-
NoConn ~ 6100 7625
NoConn ~ 4100 7425
NoConn ~ 4100 7625
$Comp
L formula:R_100K R21
U 1 1 61543A9B
P 9275 4100
F 0 "R21" H 9050 4175 50  0000 L CNN
F 1 "R_100K" H 8925 4100 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9205 4100 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9355 4100 50  0001 C CNN
F 4 "DK" H 9275 4100 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9275 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9755 4500 60  0001 C CNN "PurchasingLink"
	1    9275 4100
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R26
U 1 1 61546B15
P 10150 4100
F 0 "R26" H 10225 4175 50  0000 L CNN
F 1 "R_100K" H 10225 4075 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10080 4100 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 10230 4100 50  0001 C CNN
F 4 "DK" H 10150 4100 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 10150 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 10630 4500 60  0001 C CNN "PurchasingLink"
	1    10150 4100
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1M R27
U 1 1 61547C41
P 10150 4500
F 0 "R27" H 10220 4546 50  0000 L CNN
F 1 "R_1M" H 10220 4455 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10080 4500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 10230 4500 50  0001 C CNN
F 4 "DK" H 10150 4500 60  0001 C CNN "MFN"
F 5 "RMCF0805JT1M00CT-ND" H 10150 4500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805JT1M00/RMCF0805JT1M00CT-ND/1942600" H 10630 4900 60  0001 C CNN "PurchasingLink"
	1    10150 4500
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1M R22
U 1 1 615482E9
P 9275 4500
F 0 "R22" H 9050 4550 50  0000 L CNN
F 1 "R_1M" H 9000 4450 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9205 4500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 9355 4500 50  0001 C CNN
F 4 "DK" H 9275 4500 60  0001 C CNN "MFN"
F 5 "RMCF0805JT1M00CT-ND" H 9275 4500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805JT1M00/RMCF0805JT1M00CT-ND/1942600" H 9755 4900 60  0001 C CNN "PurchasingLink"
	1    9275 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4250 10275 4250
$Comp
L formula:Test_Point_SMD TP7
U 1 1 6158DF54
P 9325 4300
F 0 "TP7" H 9125 4400 50  0000 L CNN
F 1 "Test_Point_SMD" H 9425 4400 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9325 4150 50  0001 C CNN
F 3 "" H 9325 4300 50  0001 C CNN
	1    9325 4300
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP8
U 1 1 61598E6A
P 10100 4300
F 0 "TP8" H 10178 4388 50  0000 L CNN
F 1 "Test_Point_SMD" H 9450 4400 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10100 4150 50  0001 C CNN
F 3 "" H 10100 4300 50  0001 C CNN
	1    10100 4300
	0    -1   -1   0   
$EndComp
Text Notes 3250 8650 0    39   ~ 0
500mA micropower reg for simplicity features 70uA \nquiescent current draw during system off state
Wire Wire Line
	14400 4300 14400 4250
Connection ~ 14400 4300
Text Label 14450 5900 0    50   ~ 0
ON_STATE_CMPNTS_-
$Comp
L formula:Test_Point_SMD TP11
U 1 1 61614904
P 14400 5850
F 0 "TP11" V 14500 6100 50  0000 C CNN
F 1 "Test_Point_SMD" V 14400 6325 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 14400 5700 50  0001 C CNN
F 3 "" H 14400 5850 50  0001 C CNN
	1    14400 5850
	0    -1   -1   0   
$EndComp
Text Label 14000 6125 2    50   ~ 0
ON_STATE_CMPNTS_FET_DRIVE
Text Label 12925 5325 0    50   ~ 0
ON_STATE_CMPNTS_-
Wire Wire Line
	12925 4700 12925 5325
$Comp
L formula:R_402K R25
U 1 1 6169E370
P 9700 3950
F 0 "R25" V 9493 3950 50  0000 C CNN
F 1 "R_402K" V 9584 3950 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9630 3950 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 9780 3950 50  0001 C CNN
F 4 "DK" H 9700 3950 60  0001 C CNN "MFN"
F 5 "RMCF0805FT402KCT-ND" H 9700 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT402K/RMCF0805FT402KCT-ND/2418398" H 10180 4350 60  0001 C CNN "PurchasingLink"
	1    9700 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	9550 3950 9325 3950
Wire Wire Line
	9850 3950 10150 3950
$Comp
L formula:Test_Point_SMD TP5
U 1 1 616B682F
P 9325 3900
F 0 "TP5" H 9050 4000 50  0000 L CNN
F 1 "Test_Point_SMD" H 9050 4100 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9325 3750 50  0001 C CNN
F 3 "" H 9325 3900 50  0001 C CNN
	1    9325 3900
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP9
U 1 1 616C19C1
P 10200 3900
F 0 "TP9" H 10278 3988 50  0000 L CNN
F 1 "Test_Point_SMD" H 10275 4100 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10200 3750 50  0001 C CNN
F 3 "" H 10200 3900 50  0001 C CNN
	1    10200 3900
	1    0    0    -1  
$EndComp
Connection ~ 10150 3950
Wire Wire Line
	9275 3950 9000 3950
Connection ~ 9275 3950
Text Notes 11425 3875 0    39   ~ 0
Wakeup shunt resistor between top \ncell in pack and top of system load. \nRuns in parallel to load switch &\ncurrent sensor. Used to determine\nstate of BMS system - Charging, \nDischarging, or No Load. 
Text Notes 10150 5925 0    50   ~ 0
Wakeup Dual Comparator chosen for\nHV-capable inputs & low quiescent current of 30uA
Wire Wire Line
	9275 4250 9150 4250
Text Label 10275 4250 0    50   ~ 0
LOAD_SIDE_DIV_SIG
$Comp
L formula:Test_Point_SMD TP2
U 1 1 61208A06
P 5800 8925
F 0 "TP2" H 5600 9000 50  0000 L CNN
F 1 "Test_Point_SMD" H 5175 9075 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5800 8775 50  0001 C CNN
F 3 "" H 5800 8925 50  0001 C CNN
	1    5800 8925
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1.5k R19
U 1 1 6188163E
P 3200 9425
F 0 "R19" H 3275 9425 50  0000 L CNN
F 1 "R_1.5k" H 3275 9325 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3130 9425 50  0001 C CNN
F 3 "" H 3280 9425 50  0001 C CNN
F 4 "Vishay" H 3200 9425 60  0001 C CNN "MFN"
F 5 "CRCW20101K50FKEF" H 3200 9425 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/vishay-dale/CRCW20101K50FKEF/1198525" H 3680 9825 60  0001 C CNN "PurchasingLink"
	1    3200 9425
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R20
U 1 1 6150377A
P 3200 9725
F 0 "R20" H 3270 9771 50  0000 L CNN
F 1 "R_10K" H 3270 9680 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3130 9725 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3280 9725 50  0001 C CNN
F 4 "DK" H 3200 9725 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3200 9725 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3680 10125 60  0001 C CNN "PurchasingLink"
	1    3200 9725
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R18
U 1 1 61504C02
P 3200 9125
F 0 "R18" H 3270 9171 50  0000 L CNN
F 1 "R_100K" H 3270 9080 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3130 9125 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 3280 9125 50  0001 C CNN
F 4 "DK" H 3200 9125 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 3200 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 3680 9525 60  0001 C CNN "PurchasingLink"
	1    3200 9125
	1    0    0    -1  
$EndComp
Wire Wire Line
	3675 9475 3450 9475
Wire Wire Line
	3450 9475 3450 9275
Wire Wire Line
	3450 9275 3200 9275
Connection ~ 3200 9275
$Comp
L formula:C_470pF C14
U 1 1 6155E297
P 3575 10050
F 0 "C14" H 3690 10146 50  0000 L CNN
F 1 "C_470pF" H 3690 10055 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3613 10650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3600 10900 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805KRX7R9BB471/311-1124-1-ND/303034" H 4000 10550 60  0001 C CNN "PurchasingLink"
	1    3575 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3675 9275 3575 9275
Wire Wire Line
	3575 9275 3575 9850
Wire Wire Line
	3575 10150 4175 10150
Wire Wire Line
	4325 10150 4325 9925
Connection ~ 4325 10150
Wire Wire Line
	3200 8975 3675 8975
Wire Wire Line
	3675 9075 3675 8975
Text Notes 1875 10275 0    39   ~ 0
Resistor divider on ~SHDN~ to pull net below 1.1V \nwhen battery voltage falls lower than 10.6V. Disables \nLinreg\n
$Comp
L formula:C_10nF C15
U 1 1 615AE9E6
P 5025 10000
F 0 "C15" H 5140 10046 50  0000 L CNN
F 1 "C_10nF" H 5075 10150 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5063 9850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1010_X7R_HV_SMD.pdf" H 5050 10100 50  0001 C CNN
F 4 "Kemet" H 5025 10000 60  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 5025 10000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 5450 10500 60  0001 C CNN "PurchasingLink"
	1    5025 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 10150 4475 10150
$Comp
L formula:C_10uF C16
U 1 1 615C939F
P 5375 9175
F 0 "C16" H 5490 9271 50  0000 L CNN
F 1 "C_10uF" H 5490 9180 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 5413 9775 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A106KPFNNNE.pdf" H 5400 10025 50  0001 C CNN
F 4 "DK" H 5375 9225 60  0001 C CNN "MFN"
F 5 "1276-1052-1-ND" H 5375 9925 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A106KPFNNNE/1276-1052-1-ND/3889138" H 5800 9675 60  0001 C CNN "PurchasingLink"
	1    5375 9175
	1    0    0    -1  
$EndComp
Text Notes 5050 8650 0    39   ~ 0
SENSE pin must be connected directly \nto load according to datasheet  
Text Label 8975 5275 2    50   ~ 0
LOAD_SIDE_CURRENT_PATH
Text Label 8975 5575 2    50   ~ 0
LOAD_SIDE_DIV_SIG
Text Label 8975 5475 2    50   ~ 0
PACK_SIDE_CURRENT_PATH
Text Label 8975 5375 2    50   ~ 0
BATT_SIDE_DIV_SIG
Text Label 9150 4250 2    50   ~ 0
BATT_SIDE_DIV_SIG
$Comp
L formula:Test_Point_SMD TP10
U 1 1 61697B40
P 10575 5525
F 0 "TP10" V 10675 5700 50  0000 L CNN
F 1 "Test_Point_SMD" V 10575 5700 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10575 5375 50  0001 C CNN
F 3 "" H 10575 5525 50  0001 C CNN
	1    10575 5525
	0    1    1    0   
$EndComp
NoConn ~ 3675 9725
Wire Wire Line
	4175 9925 4175 10150
Connection ~ 4175 10150
Wire Wire Line
	4175 10150 4250 10150
Wire Wire Line
	5375 10150 5375 9275
Wire Wire Line
	5375 8975 5800 8975
Wire Wire Line
	10375 3950 10200 3950
Connection ~ 9325 3950
Wire Wire Line
	9325 3950 9275 3950
Connection ~ 10200 3950
Wire Wire Line
	10200 3950 10150 3950
Wire Wire Line
	9275 4250 9275 4300
Connection ~ 9275 4250
Connection ~ 9275 4300
Wire Wire Line
	9275 4300 9275 4350
Wire Wire Line
	10150 4250 10150 4300
Connection ~ 10150 4250
Connection ~ 10150 4300
Wire Wire Line
	10150 4300 10150 4350
Wire Wire Line
	9975 5525 10525 5525
Text Label 10025 5325 0    50   ~ 0
COMP_1_OUT
Text Label 10025 5525 0    50   ~ 0
COMP_2_OUT
Text Label 11350 1450 0    50   ~ 0
BATT_3
Text Label 11350 1550 0    50   ~ 0
BATT_4
Text Label 11350 1350 0    50   ~ 0
BATT_2
Text Label 11350 1250 0    50   ~ 0
BATT_1
Text Label 11350 1150 0    50   ~ 0
BATT_0
Text Notes 12825 5625 0    89   ~ 0
LSD FET's
$Comp
L formula:C_1uF C17
U 1 1 61B59ED3
P 6850 7325
F 0 "C17" H 6850 7475 50  0000 L CNN
F 1 "C_1uF" V 7025 7225 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6888 7925 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 6875 8175 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 7275 7825 60  0001 C CNN "PurchasingLink"
	1    6850 7325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7425 6850 7425
Connection ~ 6600 7425
Wire Wire Line
	6850 6925 6850 7025
Connection ~ 6850 7025
Wire Wire Line
	6850 7025 6850 7125
Connection ~ 6900 6450
Wire Wire Line
	6900 6450 6950 6450
Wire Wire Line
	6900 6450 6900 6350
Wire Wire Line
	6950 6450 7300 6450
Connection ~ 6950 6450
Wire Wire Line
	6850 6925 6850 6850
Connection ~ 6850 6925
Wire Wire Line
	6100 6925 6850 6925
Wire Wire Line
	6400 6650 6550 6650
Wire Wire Line
	6100 7425 6350 7425
Connection ~ 6350 7425
$Comp
L formula:C_1uF C11
U 1 1 610C4414
P 6350 7325
F 0 "C11" H 6350 7475 50  0000 L CNN
F 1 "C_1uF" H 6200 7175 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6388 7925 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 6375 8175 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 6775 7825 60  0001 C CNN "PurchasingLink"
	1    6350 7325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 7425 6475 7425
Wire Notes Line
	1250 5050 1250 8175
Wire Notes Line
	1250 8175 7850 8175
Wire Notes Line
	1250 5050 7850 5050
Wire Notes Line
	7850 8450 7850 10325
Wire Notes Line
	900  10325 900  8450
Wire Notes Line
	7975 3425 7975 6825
Wire Notes Line
	7975 6825 12575 6825
Wire Notes Line
	12575 6825 12575 3425
Wire Notes Line
	7975 3425 12575 3425
Wire Notes Line
	12850 5450 12850 3925
Wire Notes Line
	12850 3925 15475 3925
Wire Notes Line
	15475 3925 15475 5450
Wire Notes Line
	15475 5450 12850 5450
Text Notes 12825 3900 0    89   ~ 0
THERMISTORS
Text Notes 6725 5800 0    39   ~ 0
Drive pin used to drive NPN linear \nregulator to supply LTC chip 5V \nregulated power. Features low pass \nfilter on input.  
Wire Wire Line
	14450 5925 14450 5850
Text Notes 12875 4275 0    39   ~ 0
10K NTC thermistor \nresistor dividers, \nonly powered on \nafter Wakeup - \nexpect 2.5V @ 25C
Text Notes 9150 2900 0    39   ~ 0
5 individual nanofit connectors for thermistors \nto be distributed around the edges of the PCB\nhttps://www.digikey.com/en/products/detail\n/epcos-tdk/B57861S0103F040/739889
Text Notes 12925 6550 0    39   ~ 0
Low side driven FET to toggle \nthermistors & current sensor that\nonly need power after system state wakeup
Text Notes 12300 9425 0    39   ~ 0
~I will get shafted on this design review.~ -Adi R.
Wire Wire Line
	6850 7425 6900 7425
Connection ~ 6850 7425
Wire Notes Line
	550  550  5725 550 
Wire Notes Line
	5725 550  5725 4775
Wire Notes Line
	5725 4775 550  4775
Wire Notes Line
	550  4775 550  550 
Wire Notes Line
	13775 3800 13775 3075
Wire Notes Line
	13775 1075 16200 1075
Wire Notes Line
	16200 1075 16200 2875
Wire Notes Line
	13775 2875 13775 1075
$Comp
L formula:LT3066IMSE-5 U4
U 1 1 61380A59
P 4225 9425
F 0 "U4" H 4275 10140 50  0000 C CNN
F 1 "LT3066IMSE-5" H 4275 10049 50  0000 C CNN
F 2 "footprints:MSOP-12_MSE" H 4225 9425 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LT3066.pdf" H 4225 9425 50  0001 C CNN
F 4 "LT3066IMSE-5#PBF" H 4225 9425 50  0001 C CNN "MPN"
	1    4225 9425
	1    0    0    -1  
$EndComp
Connection ~ 3675 8975
$Comp
L formula:C_0.1uF C19
U 1 1 61433BFD
P 9850 4900
F 0 "C19" H 9875 4775 50  0000 L CNN
F 1 "C_0.1uF" V 9725 4700 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9888 4750 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9875 5000 50  0001 C CNN
F 4 "DK" H 9850 4900 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 9850 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 10275 5400 60  0001 C CNN "PurchasingLink"
	1    9850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3000 3925 3000
Wire Wire Line
	3650 3100 3925 3100
Wire Wire Line
	3650 3200 3925 3200
Text Label 4300 3000 0    50   ~ 0
MISO_LIM
Text Label 4300 3100 0    50   ~ 0
MOSI_LIM
Text Label 4300 3200 0    50   ~ 0
SCK_LIM
Wire Wire Line
	6100 6125 6575 6125
Text Label 3650 3500 0    50   ~ 0
CSB
Wire Wire Line
	4225 3500 4225 3700
Connection ~ 4225 3700
Wire Wire Line
	4225 3700 4300 3700
Wire Wire Line
	3650 3700 4225 3700
Wire Wire Line
	3650 3500 3850 3500
$Comp
L formula:R_10K R28
U 1 1 6152CEDC
P 4000 3500
F 0 "R28" V 4100 3325 50  0000 C CNN
F 1 "R_10K" V 4100 3500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3930 3500 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4080 3500 50  0001 C CNN
F 4 "DK" H 4000 3500 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4000 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4480 3900 60  0001 C CNN "PurchasingLink"
	1    4000 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	4225 3200 4300 3200
Wire Wire Line
	4225 3100 4300 3100
Wire Wire Line
	4300 3000 4225 3000
Connection ~ 5800 8975
$Comp
L formula:C_0.1uF C18
U 1 1 615ABD15
P 3800 6075
F 0 "C18" H 3775 5975 50  0000 R CNN
F 1 "C_0.1uF" V 3650 6325 50  0000 R CNN
F 2 "footprints:C_0805_OEM" H 3838 5925 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3825 6175 50  0001 C CNN
F 4 "DK" H 3800 6075 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3800 6075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4225 6575 60  0001 C CNN "PurchasingLink"
	1    3800 6075
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 5925 4100 5925
Text Notes 10525 7325 0    39   ~ 0
Bidirectional Hall Effect Isolated \nRatiometric current sensor \nGLV system - ACHS-7121 | 10A 185mV/A\nCooling Pack system - ACHS-7124 | 40A 50mV/A
Text Notes 1275 8150 0    39   ~ 0
Both packs will see single digits of total discharge cycles --> where\ncells and segments can't get that imbalanced --> balancing is lower\npriority --> we'll use LTC's internal balancing FET's that can limit us \nto 150mA of balancing current, instead of more capable external FET's. \nExpecting 4.2V/30Ohms = 140mA of balancing current thru resistors\n& 4.2V*.140A = .588W of power dissipated thru resistors\n\n(120mA nominal discharge current * 4Hr charge time) / (3350*6mAh\nbattery capacity) = 2.3% imbalance can be resolved over 1 charge for \ncooling pack
$Comp
L formula:Test_Point_SMD TP12
U 1 1 614015B5
P 1050 8775
F 0 "TP12" V 975 9025 50  0000 L CNN
F 1 "Test_Point_SMD" V 1050 8950 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1050 8625 50  0001 C CNN
F 3 "" H 1050 8775 50  0001 C CNN
	1    1050 8775
	0    1    1    0   
$EndComp
Connection ~ 1000 8775
Wire Wire Line
	1000 8775 1000 8975
$Comp
L formula:LT1017IS8 U5
U 1 1 6145B5F2
P 8775 5275
F 0 "U5" H 9125 5500 50  0000 C CNN
F 1 "LT1017IS8" H 9275 5425 50  0000 C CNN
F 2 "footprints:SO-8_S" H 9075 4475 50  0001 L BNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/10178ff.pdf" H 8775 5275 50  0001 L BNN
F 4 "lt1017is8#pbf" H 9075 4575 50  0001 L BNN "MPN"
F 5 "Linear Technology" H 9075 4675 50  0001 L BNN "VENDOR"
	1    8775 5275
	1    0    0    -1  
$EndComp
Text Label 6900 6000 0    50   ~ 0
BATT_4
Wire Wire Line
	6900 6050 6900 6000
Text Notes 11625 1150 0    39   ~ 0
Battery (-) Side
Text Notes 11625 1550 0    39   ~ 0
Battery (+) Side
Text Notes 6900 8775 0    39   ~ 0
Entire system pulls 170uA of \ncurrent in STANDBY state\nEntire system pulls ~~250mA of \ncurrent in ON state
Text Label 8475 2625 2    50   ~ 0
CAN_P
Text Label 8475 2725 2    50   ~ 0
CAN_N
Text Notes 8950 3000 1    39   ~ 0
CAN connector
Wire Wire Line
	14000 6125 14100 6125
$Comp
L formula:R_100K R39
U 1 1 616204FC
P 14100 6275
F 0 "R39" H 14170 6321 50  0000 L CNN
F 1 "R_100K" H 14170 6230 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14030 6275 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 14180 6275 50  0001 C CNN
F 4 "DK" H 14100 6275 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 14100 6275 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 14580 6675 60  0001 C CNN "PurchasingLink"
	1    14100 6275
	1    0    0    -1  
$EndComp
Connection ~ 14100 6125
Wire Wire Line
	14100 6125 14150 6125
Wire Wire Line
	14100 6425 14450 6425
Wire Wire Line
	14450 6325 14450 6425
Text Label 8475 2825 2    50   ~ 0
SHIELD
$Comp
L formula:R_0_2512 R104
U 1 1 5C0C29A9
P 6625 8975
F 0 "R104" V 6425 8975 50  0000 C CNN
F 1 "R_0_2512" V 6525 9025 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 6555 8975 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 6705 8975 50  0001 C CNN
F 4 "DK" H 6625 8975 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 6625 8975 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 7105 9375 60  0001 C CNN "PurchasingLink"
	1    6625 8975
	0    -1   -1   0   
$EndComp
Text Notes 6425 8875 0    50   ~ 0
5V Jumper\n
Wire Wire Line
	6775 8975 7025 8975
Wire Wire Line
	5800 8975 6100 8975
Connection ~ 6100 8975
Wire Wire Line
	6100 8975 6475 8975
$Comp
L formula:redcube-7461057 U11
U 1 1 6141885F
P 11325 8700
F 0 "U11" H 11342 8825 50  0000 C CNN
F 1 "redcube-7461057" H 11342 8734 50  0000 C CNN
F 2 "footprints:redcube_pressfit_6pin" H 11325 8700 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/445/7461057-1723744.pdf" H 11325 8700 50  0001 C CNN
F 4 "7461057" H 11325 8700 50  0001 C CNN "MPN"
	1    11325 8700
	1    0    0    -1  
$EndComp
$Comp
L formula:ACHS-7124 U10
U 1 1 61447EAA
P 9700 7250
F 0 "U10" H 9725 7315 50  0000 C CNN
F 1 "ACHS-7124" H 9725 7224 50  0000 C CNN
F 2 "footprints:OPTO_HCPL-070A-000E" H 9700 7250 50  0001 C CNN
F 3 "https://www.pololu.com/file/0J1707/ACHS-7124-7125-DS101_2019-02-15.pdf" H 9700 7250 50  0001 C CNN
F 4 "ACHS-7124-000E" H 9700 7250 50  0001 C CNN "MPN"
	1    9700 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 7650 10425 7650
$Comp
L formula:C_1uF C21
U 1 1 61470621
P 10775 7850
F 0 "C21" H 10890 7946 50  0000 L CNN
F 1 "C_1uF" H 10890 7855 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10813 8450 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 10800 8700 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 11200 8350 60  0001 C CNN "PurchasingLink"
	1    10775 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 7750 10200 7950
Text Label 10875 7950 0    50   ~ 0
ON_STATE_CMPNTS_-
Connection ~ 10775 7950
Wire Wire Line
	10775 7950 10875 7950
Wire Wire Line
	10200 7550 10775 7550
Wire Wire Line
	10775 7550 10775 7650
Wire Wire Line
	10200 7950 10425 7950
Text Label 10200 7450 0    50   ~ 0
CURRENT_SENSE_SIGNAL
Wire Wire Line
	9250 7450 9250 7550
Connection ~ 9250 7450
Wire Wire Line
	9250 7650 9250 7750
Connection ~ 9250 7750
$Comp
L formula:C_1nf C20
U 1 1 6157E14C
P 10425 7800
F 0 "C20" H 10540 7846 50  0000 L CNN
F 1 "C_1nf" H 10540 7755 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10425 7800 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0805X102KARECAUTO.pdf" H 10425 7800 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/kemet/C0805X102KARECAUTO/8653410" H 10425 7800 50  0001 C CNN "Purchasing Link"
	1    10425 7800
	1    0    0    -1  
$EndComp
Connection ~ 10425 7950
Wire Wire Line
	10425 7950 10775 7950
$Comp
L formula:SQM110P06 Q2
U 1 1 61487F0F
P 9975 8850
F 0 "Q2" V 10150 8850 50  0000 C CNN
F 1 "SQM110P06" V 10575 9175 50  0000 C CNN
F 2 "footprints:TO-263-3-TabPin2" H 9925 9450 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 9975 8850 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 9925 9350 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 10025 9550 50  0001 C CNN "MPN"
	1    9975 8850
	0    -1   -1   0   
$EndComp
$Comp
L formula:SQM110P06 Q5
U 1 1 6148C0A4
P 10625 8850
F 0 "Q5" V 10800 8850 50  0000 C CNN
F 1 "SQM110P06" V 11225 9275 50  0000 C CNN
F 2 "footprints:TO-263-3-TabPin2" H 10575 9450 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 10625 8850 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 10575 9350 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 10675 9550 50  0001 C CNN "MPN"
	1    10625 8850
	0    1    -1   0   
$EndComp
Wire Wire Line
	10300 8800 10300 8900
Connection ~ 10300 8800
$Comp
L formula:R_10K R40
U 1 1 614D511D
P 10300 9050
F 0 "R40" V 10450 8975 50  0000 L CNN
F 1 "R_10K" V 10150 8950 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10230 9050 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10380 9050 50  0001 C CNN
F 4 "DK" H 10300 9050 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10300 9050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10780 9450 60  0001 C CNN "PurchasingLink"
	1    10300 9050
	1    0    0    -1  
$EndComp
Connection ~ 10300 9200
Wire Wire Line
	10250 9200 10250 9275
Wire Wire Line
	10250 9275 10300 9275
Wire Wire Line
	10300 9275 10300 9325
Connection ~ 10250 9200
Wire Wire Line
	10250 9200 10300 9200
$Comp
L formula:R_10 R41
U 1 1 6150E131
P 10300 9475
F 0 "R41" H 10370 9521 50  0000 L CNN
F 1 "R_10" H 10370 9430 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10230 9475 50  0001 C CNN
F 3 "" H 10380 9475 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 10300 9475 60  0001 C CNN "MFN"
F 5 "ERJ-P06F10R0V" H 10300 9475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/panasonic-electronic-components/ERJ-P06F10R0V/5722444" H 10780 9875 60  0001 C CNN "PurchasingLink"
	1    10300 9475
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 9825 9875 9825
$Comp
L formula:R_100K R38
U 1 1 6158878F
P 9875 9975
F 0 "R38" H 9945 10021 50  0000 L CNN
F 1 "R_100K" H 9945 9930 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9805 9975 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9955 9975 50  0001 C CNN
F 4 "DK" H 9875 9975 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9875 9975 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 10355 10375 60  0001 C CNN "PurchasingLink"
	1    9875 9975
	1    0    0    -1  
$EndComp
Connection ~ 9875 9825
Wire Wire Line
	9875 9825 10000 9825
Wire Wire Line
	9875 10125 10300 10125
Wire Wire Line
	10300 10025 10300 10125
Text Label 9700 9825 2    50   ~ 0
LOAD_SWITCH_FET_DRIVE
Text Notes 10700 9825 0    39   ~ 0
Low side driven FET to enable \nand disable load switch
$Comp
L formula:Test_Point_SMD TP13
U 1 1 61650710
P 10675 9200
F 0 "TP13" V 10624 9378 50  0000 L CNN
F 1 "Test_Point_SMD" V 10715 9378 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10675 9050 50  0001 C CNN
F 3 "" H 10675 9200 50  0001 C CNN
	1    10675 9200
	0    1    1    0   
$EndComp
Wire Wire Line
	10300 9200 10400 9200
Wire Wire Line
	10625 9100 10625 9200
Connection ~ 10625 9200
$Comp
L formula:Test_Point_SMD TP6
U 1 1 6169859F
P 10325 8275
F 0 "TP6" H 10250 8475 50  0000 L CNN
F 1 "Test_Point_SMD" H 10850 7225 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10325 8125 50  0001 C CNN
F 3 "" H 10325 8275 50  0001 C CNN
	1    10325 8275
	1    0    0    -1  
$EndComp
Text Label 9075 7150 2    50   ~ 0
PACK_SIDE_CURRENT_PATH
Wire Wire Line
	8850 7450 8975 7450
Connection ~ 9075 7450
Wire Wire Line
	9075 7450 9250 7450
Wire Wire Line
	11025 8800 11025 8975
Connection ~ 11025 8800
Wire Wire Line
	11025 8800 11175 8800
Text Label 11025 8975 0    50   ~ 0
LOAD_SIDE_CURRENT_PATH
Text Label 9000 3950 2    50   ~ 0
PACK_SIDE_CURRENT_PATH
Text Label 10375 3950 0    50   ~ 0
LOAD_SIDE_CURRENT_PATH
Wire Notes Line
	12850 5650 15475 5650
Text Notes 8025 7000 0    89   ~ 0
HIGH CURRENT PATH\n
Text Notes 9400 9350 0    39   ~ 0
Bidirectional Discrete \nDual-PMOS Load switch
$Comp
L formula:Test_Point_SMD TP14
U 1 1 6163A4CE
P 8875 1075
F 0 "TP14" V 8824 1253 50  0000 L CNN
F 1 "Test_Point_SMD" V 8725 1175 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8875 925 50  0001 C CNN
F 3 "" H 8875 1075 50  0001 C CNN
	1    8875 1075
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP15
U 1 1 6163AEE7
P 8875 1225
F 0 "TP15" V 8824 1403 50  0000 L CNN
F 1 "Test_Point_SMD" V 8475 1325 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8875 1075 50  0001 C CNN
F 3 "" H 8875 1225 50  0001 C CNN
	1    8875 1225
	0    1    1    0   
$EndComp
Text Notes 8375 950  0    39   ~ 0
Thermistor on Board
$Comp
L formula:redcube-7461057 U9
U 1 1 614200A6
P 8100 7550
F 0 "U9" H 8100 7675 50  0000 C CNN
F 1 "redcube-7461057" H 7800 7575 50  0000 C CNN
F 2 "footprints:redcube_pressfit_6pin" H 8100 7550 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/445/7461057-1723744.pdf" H 8100 7550 50  0001 C CNN
F 4 "7461057" H 8100 7550 50  0001 C CNN "MPN"
	1    8100 7550
	-1   0    0    1   
$EndComp
Wire Notes Line
	7975 7025 12125 7025
Wire Wire Line
	9075 7150 9075 7450
$Comp
L formula:LTC6810HG-2 U3
U 1 1 617F09B1
P 5100 6875
F 0 "U3" H 5100 8290 50  0000 C CNN
F 1 "LTC6810HG-2" H 5100 8199 50  0000 C CNN
F 2 "footprints:SOP50P780X200-44N" H 5100 6875 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/609/LTC6810_1_6810_2-1843357.pdf" H 5100 6875 50  0001 C CNN
F 4 "LTC6810HG-2#3ZZPBF" H 5100 6875 50  0001 C CNN "MFN"
F 5 "https://www.digikey.com/en/products/detail/LTC6810HG-2%25233ZZPBF/LTC6810HG-2%25233ZZPBF-ND/9658986?utm_campaign=buynow&utm_medium=aggregator&curr=usd&utm_source=octopart" H 5100 6875 50  0001 C CNN "order_link"
	1    5100 6875
	1    0    0    -1  
$EndComp
Text Label 6100 6625 0    50   ~ 0
V-
Text Label 6100 6725 0    50   ~ 0
V-
Text Label 6100 6325 0    50   ~ 0
V-
Text Label 6100 6225 0    50   ~ 0
V-
$Comp
L formula:Test_Point_SMD TP16
U 1 1 6181F84F
P 6475 7675
F 0 "TP16" H 6400 7875 50  0000 L CNN
F 1 "Test_Point_SMD" H 6325 8025 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6475 7525 50  0001 C CNN
F 3 "" H 6475 7675 50  0001 C CNN
	1    6475 7675
	-1   0    0    1   
$EndComp
Wire Wire Line
	6475 7625 6475 7425
Connection ~ 6475 7425
Wire Wire Line
	6475 7425 6600 7425
Text Notes 5525 5375 0    39   ~ 0
Since we are using an LTC6810-2 chip, we have to use the address pins.\nWe've tied all address pins to V- (LTC GND) and can use 0000 when\nselecting address in commands.
$Comp
L Transistor_FET:BSS138 Q6
U 1 1 617DAFFB
P 10200 9825
F 0 "Q6" H 10404 9871 50  0000 L CNN
F 1 "BSS138" H 10404 9780 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10400 9750 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 10200 9825 50  0001 L CNN
	1    10200 9825
	1    0    0    -1  
$EndComp
Text Notes 4450 2850 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.\n\nBecause ISP uses same SPI bus \nas LTC chip comms, we place \nresistors to limit current 
Text Label 3650 2000 0    50   ~ 0
FAN_PWM
Text Label 14450 6875 0    50   ~ 0
FAN_PWM_LSD
$Comp
L formula:Test_Point_SMD TP17
U 1 1 61815579
P 14400 6825
F 0 "TP17" V 14500 7075 50  0000 C CNN
F 1 "Test_Point_SMD" V 14400 7300 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 14400 6675 50  0001 C CNN
F 3 "" H 14400 6825 50  0001 C CNN
	1    14400 6825
	0    -1   -1   0   
$EndComp
Text Label 14000 7100 2    50   ~ 0
FAN_PWM
Wire Wire Line
	14450 6900 14450 6825
Text Notes 12925 7775 0    39   ~ 0
Low side driven FET to toggle external \nrelay for FAN PWM. Likely won't use\nthis feature, backup incase of poor\nPCB thermal performance in Cooling \nPack
Wire Wire Line
	14000 7100 14100 7100
$Comp
L formula:R_100K R42
U 1 1 61815586
P 14100 7250
F 0 "R42" H 14170 7296 50  0000 L CNN
F 1 "R_100K" H 14170 7205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 14030 7250 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 14180 7250 50  0001 C CNN
F 4 "DK" H 14100 7250 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 14100 7250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 14580 7650 60  0001 C CNN "PurchasingLink"
	1    14100 7250
	1    0    0    -1  
$EndComp
Connection ~ 14100 7100
Wire Wire Line
	14100 7100 14150 7100
Wire Wire Line
	14100 7400 14450 7400
Wire Wire Line
	14450 7300 14450 7400
Text Label 11500 2300 0    50   ~ 0
FAN_PWM_LSD
Wire Notes Line
	15475 7875 12850 7875
Wire Notes Line
	12850 5650 12850 7875
$Comp
L power:+5V #PWR?
U 1 1 6193AA5F
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
U 1 1 61962B80
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
U 1 1 61977052
P 15050 3300
F 0 "#PWR?" H 15050 3150 50  0001 C CNN
F 1 "+5V" H 15065 3473 50  0000 C CNN
F 2 "" H 15050 3300 50  0001 C CNN
F 3 "" H 15050 3300 50  0001 C CNN
	1    15050 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6198AEF9
P 4675 3450
F 0 "#PWR?" H 4675 3300 50  0001 C CNN
F 1 "+5V" H 4690 3623 50  0000 C CNN
F 2 "" H 4675 3450 50  0001 C CNN
F 3 "" H 4675 3450 50  0001 C CNN
	1    4675 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6199EDFF
P 6575 5825
F 0 "#PWR?" H 6575 5675 50  0001 C CNN
F 1 "+5V" H 6590 5998 50  0000 C CNN
F 2 "" H 6575 5825 50  0001 C CNN
F 3 "" H 6575 5825 50  0001 C CNN
	1    6575 5825
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 619C68FC
P 14400 4250
F 0 "#PWR?" H 14400 4100 50  0001 C CNN
F 1 "+5V" H 14415 4423 50  0000 C CNN
F 2 "" H 14400 4250 50  0001 C CNN
F 3 "" H 14400 4250 50  0001 C CNN
	1    14400 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 619EE823
P 4150 3500
F 0 "#PWR?" H 4150 3350 50  0001 C CNN
F 1 "+5V" H 4165 3673 50  0000 C CNN
F 2 "" H 4150 3500 50  0001 C CNN
F 3 "" H 4150 3500 50  0001 C CNN
	1    4150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A028B2
P 13925 1950
F 0 "#PWR?" H 13925 1800 50  0001 C CNN
F 1 "+5V" H 13940 2123 50  0000 C CNN
F 2 "" H 13925 1950 50  0001 C CNN
F 3 "" H 13925 1950 50  0001 C CNN
	1    13925 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A166FA
P 7025 8975
F 0 "#PWR?" H 7025 8825 50  0001 C CNN
F 1 "+5V" H 7040 9148 50  0000 C CNN
F 2 "" H 7025 8975 50  0001 C CNN
F 3 "" H 7025 8975 50  0001 C CNN
	1    7025 8975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A3E0AC
P 10775 7550
F 0 "#PWR?" H 10775 7400 50  0001 C CNN
F 1 "+5V" H 10875 7600 50  0000 C CNN
F 2 "" H 10775 7550 50  0001 C CNN
F 3 "" H 10775 7550 50  0001 C CNN
	1    10775 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A6D154
P 1850 9525
F 0 "#PWR?" H 1850 9275 50  0001 C CNN
F 1 "GND" H 1855 9352 50  0000 C CNN
F 2 "" H 1850 9525 50  0001 C CNN
F 3 "" H 1850 9525 50  0001 C CNN
	1    1850 9525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A82CB6
P 2950 9275
F 0 "#PWR?" H 2950 9025 50  0001 C CNN
F 1 "GND" H 2955 9102 50  0000 C CNN
F 2 "" H 2950 9275 50  0001 C CNN
F 3 "" H 2950 9275 50  0001 C CNN
	1    2950 9275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A96DC6
P 2650 9275
F 0 "#PWR?" H 2650 9025 50  0001 C CNN
F 1 "GND" H 2655 9102 50  0000 C CNN
F 2 "" H 2650 9275 50  0001 C CNN
F 3 "" H 2650 9275 50  0001 C CNN
	1    2650 9275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AAAC98
P 3200 9875
F 0 "#PWR?" H 3200 9625 50  0001 C CNN
F 1 "GND" H 3205 9702 50  0000 C CNN
F 2 "" H 3200 9875 50  0001 C CNN
F 3 "" H 3200 9875 50  0001 C CNN
	1    3200 9875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61ABEC41
P 4250 10150
F 0 "#PWR?" H 4250 9900 50  0001 C CNN
F 1 "GND" H 4400 10050 50  0000 C CNN
F 2 "" H 4250 10150 50  0001 C CNN
F 3 "" H 4250 10150 50  0001 C CNN
	1    4250 10150
	1    0    0    -1  
$EndComp
Connection ~ 4250 10150
Wire Wire Line
	4250 10150 4325 10150
$Comp
L power:GND #PWR?
U 1 1 61AD3199
P 2250 9825
F 0 "#PWR?" H 2250 9575 50  0001 C CNN
F 1 "GND" H 2255 9652 50  0000 C CNN
F 2 "" H 2250 9825 50  0001 C CNN
F 3 "" H 2250 9825 50  0001 C CNN
	1    2250 9825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AEB36F
P 6100 9575
F 0 "#PWR?" H 6100 9325 50  0001 C CNN
F 1 "GND" H 6105 9402 50  0000 C CNN
F 2 "" H 6100 9575 50  0001 C CNN
F 3 "" H 6100 9575 50  0001 C CNN
	1    6100 9575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AFFAA9
P 1150 1600
F 0 "#PWR?" H 1150 1350 50  0001 C CNN
F 1 "GND" H 1155 1427 50  0000 C CNN
F 2 "" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0001 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61B13CBB
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
U 1 1 61B2879C
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
U 1 1 61B3CC16
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
U 1 1 61B5169C
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
U 1 1 61B66157
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
U 1 1 61B7AC85
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
L power:GND #PWR?
U 1 1 61B8F832
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
U 1 1 61BA3A82
P 14500 1600
F 0 "#PWR?" H 14500 1350 50  0001 C CNN
F 1 "GND" H 14350 1550 50  0000 C CNN
F 2 "" H 14500 1600 50  0001 C CNN
F 3 "" H 14500 1600 50  0001 C CNN
	1    14500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61BB84B2
P 15050 3500
F 0 "#PWR?" H 15050 3250 50  0001 C CNN
F 1 "GND" H 15055 3327 50  0000 C CNN
F 2 "" H 15050 3500 50  0001 C CNN
F 3 "" H 15050 3500 50  0001 C CNN
	1    15050 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61BCE195
P 7300 6750
F 0 "#PWR?" H 7300 6500 50  0001 C CNN
F 1 "GND" H 7305 6577 50  0000 C CNN
F 2 "" H 7300 6750 50  0001 C CNN
F 3 "" H 7300 6750 50  0001 C CNN
	1    7300 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61BE306E
P 6900 7425
F 0 "#PWR?" H 6900 7175 50  0001 C CNN
F 1 "GND" H 7050 7350 50  0000 C CNN
F 2 "" H 6900 7425 50  0001 C CNN
F 3 "" H 6900 7425 50  0001 C CNN
	1    6900 7425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61BFA98B
P 4100 7825
F 0 "#PWR?" H 4100 7575 50  0001 C CNN
F 1 "GND" H 4105 7652 50  0000 C CNN
F 2 "" H 4100 7825 50  0001 C CNN
F 3 "" H 4100 7825 50  0001 C CNN
	1    4100 7825
	1    0    0    -1  
$EndComp
Connection ~ 4100 7825
$Comp
L power:GND #PWR?
U 1 1 61C1271C
P 1875 7275
F 0 "#PWR?" H 1875 7025 50  0001 C CNN
F 1 "GND" H 1880 7102 50  0000 C CNN
F 2 "" H 1875 7275 50  0001 C CNN
F 3 "" H 1875 7275 50  0001 C CNN
	1    1875 7275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C288EA
P 3800 6225
F 0 "#PWR?" H 3800 5975 50  0001 C CNN
F 1 "GND" H 3800 6075 50  0000 C CNN
F 2 "" H 3800 6225 50  0001 C CNN
F 3 "" H 3800 6225 50  0001 C CNN
	1    3800 6225
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6025 3900 6425
$Comp
L power:GND #PWR?
U 1 1 61C58BFB
P 7625 2225
F 0 "#PWR?" H 7625 1975 50  0001 C CNN
F 1 "GND" H 7630 2052 50  0000 C CNN
F 2 "" H 7625 2225 50  0001 C CNN
F 3 "" H 7625 2225 50  0001 C CNN
	1    7625 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C6CB76
P 7300 2225
F 0 "#PWR?" H 7300 1975 50  0001 C CNN
F 1 "GND" H 7305 2052 50  0000 C CNN
F 2 "" H 7300 2225 50  0001 C CNN
F 3 "" H 7300 2225 50  0001 C CNN
	1    7300 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C80B43
P 6975 2225
F 0 "#PWR?" H 6975 1975 50  0001 C CNN
F 1 "GND" H 6980 2052 50  0000 C CNN
F 2 "" H 6975 2225 50  0001 C CNN
F 3 "" H 6975 2225 50  0001 C CNN
	1    6975 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C94A4E
P 6625 2225
F 0 "#PWR?" H 6625 1975 50  0001 C CNN
F 1 "GND" H 6630 2052 50  0000 C CNN
F 2 "" H 6625 2225 50  0001 C CNN
F 3 "" H 6625 2225 50  0001 C CNN
	1    6625 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CAB32C
P 14450 7400
F 0 "#PWR?" H 14450 7150 50  0001 C CNN
F 1 "GND" H 14455 7227 50  0000 C CNN
F 2 "" H 14450 7400 50  0001 C CNN
F 3 "" H 14450 7400 50  0001 C CNN
	1    14450 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CBF45F
P 9275 4650
F 0 "#PWR?" H 9275 4400 50  0001 C CNN
F 1 "GND" H 9280 4477 50  0000 C CNN
F 2 "" H 9275 4650 50  0001 C CNN
F 3 "" H 9275 4650 50  0001 C CNN
	1    9275 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CD3D80
P 10150 4650
F 0 "#PWR?" H 10150 4400 50  0001 C CNN
F 1 "GND" H 10155 4477 50  0000 C CNN
F 2 "" H 10150 4650 50  0001 C CNN
F 3 "" H 10150 4650 50  0001 C CNN
	1    10150 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CE7F07
P 9850 5050
F 0 "#PWR?" H 9850 4800 50  0001 C CNN
F 1 "GND" H 9975 4975 50  0000 C CNN
F 2 "" H 9850 5050 50  0001 C CNN
F 3 "" H 9850 5050 50  0001 C CNN
	1    9850 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61D19C8C
P 8475 3000
F 0 "#PWR?" H 8475 2750 50  0001 C CNN
F 1 "GND" H 8325 2925 50  0000 C CNN
F 2 "" H 8475 3000 50  0001 C CNN
F 3 "" H 8475 3000 50  0001 C CNN
	1    8475 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61D2E0F0
P 10300 10125
F 0 "#PWR?" H 10300 9875 50  0001 C CNN
F 1 "GND" H 10450 10050 50  0000 C CNN
F 2 "" H 10300 10125 50  0001 C CNN
F 3 "" H 10300 10125 50  0001 C CNN
	1    10300 10125
	1    0    0    -1  
$EndComp
Text Notes 8000 9325 0    47   ~ 0
The high current path on this \nPCB will see 20A continuous, \n30A peak for 1 hour with the \ncooling pack, and 5A continuous \nwith the GLV pack. Our high \ncurrent path features a current \nsensor, bidirectional load switch, \nand fuse.  \n\nThe fuse and current sensor are \ndifferent between GLV system \nand cooling pack system. \n\nThe bidirectional load switch was \ntested with the LV BMS Tester \nBoard. As a switch, it functionally \nworks, but thermals still need to \nbe tested on this PCB.  
Wire Notes Line
	15475 5650 15475 7875
$Comp
L formula:R_499 R34
U 1 1 61F1075A
P 6625 1775
F 0 "R34" V 6525 1750 50  0000 L CNN
F 1 "R_499" V 6725 1675 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6555 1775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6705 1775 50  0001 C CNN
F 4 "DK" H 6625 1775 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 6625 1775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 7105 2175 60  0001 C CNN "PurchasingLink"
	1    6625 1775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F144A3
P 14450 6425
F 0 "#PWR?" H 14450 6175 50  0001 C CNN
F 1 "GND" H 14455 6252 50  0000 C CNN
F 2 "" H 14450 6425 50  0001 C CNN
F 3 "" H 14450 6425 50  0001 C CNN
	1    14450 6425
	1    0    0    -1  
$EndComp
Connection ~ 14450 6425
Connection ~ 14450 7400
Text Notes 3150 8875 0    50   ~ 0
10V - 16.8V \nInput Voltage
Text Notes 6900 9450 0    39   ~ 0
Linreg will dissipate 2.35W \nnominally continuously w/\nsystem in ON state. \nWith 400mm Cu, an Rth J-A \nof 37C/W, Junction temp \n=86.95C
Wire Wire Line
	2150 7325 2150 7375
Wire Wire Line
	2150 7375 4000 7375
Wire Wire Line
	4000 7375 4000 7325
Wire Wire Line
	4000 7325 4100 7325
$Comp
L power:GND #PWR?
U 1 1 61F71E38
P 2700 7400
F 0 "#PWR?" H 2700 7150 50  0001 C CNN
F 1 "GND" H 2850 7350 50  0000 C CNN
F 2 "" H 2700 7400 50  0001 C CNN
F 3 "" H 2700 7400 50  0001 C CNN
	1    2700 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7400 2700 7325
$Comp
L formula:R_15_1W_.5% R8
U 1 1 61FA96DC
P 2150 7175
F 0 "R8" V 2200 7350 50  0000 R CNN
F 1 "R_15_1W_.5%" V 2125 7750 50  0000 R CNN
F 2 "footprints:Fuse_1206" H 2150 7425 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition24_en.pdf" H 2150 7275 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/HRG3216Q-15R0-D-T1/5762555" H 1650 7025 50  0001 C CNN "Purchasing Link"
F 5 "HRG3216Q-15R0-D-T1" H 2150 6925 50  0001 C CNN "MPN"
	1    2150 7175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 5425 2150 5425
Wire Wire Line
	2000 5825 2150 5825
Wire Wire Line
	2000 6225 2150 6225
Wire Wire Line
	2000 6625 2150 6625
Connection ~ 2150 7025
Wire Wire Line
	2150 7025 2325 7025
$Comp
L formula:R_15_1W_.5% R7
U 1 1 61FABA7D
P 2150 6775
F 0 "R7" V 2200 6950 50  0000 R CNN
F 1 "R_15_1W_.5%" V 2125 7350 50  0000 R CNN
F 2 "footprints:Fuse_1206" H 2150 7025 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition24_en.pdf" H 2150 6875 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/HRG3216Q-15R0-D-T1/5762555" H 1650 6625 50  0001 C CNN "Purchasing Link"
F 5 "HRG3216Q-15R0-D-T1" H 2150 6525 50  0001 C CNN "MPN"
	1    2150 6775
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_15_1W_.5% R6
U 1 1 61FBFA1B
P 2150 6375
F 0 "R6" V 2200 6550 50  0000 R CNN
F 1 "R_15_1W_.5%" V 2125 6950 50  0000 R CNN
F 2 "footprints:Fuse_1206" H 2150 6625 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition24_en.pdf" H 2150 6475 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/HRG3216Q-15R0-D-T1/5762555" H 1650 6225 50  0001 C CNN "Purchasing Link"
F 5 "HRG3216Q-15R0-D-T1" H 2150 6125 50  0001 C CNN "MPN"
	1    2150 6375
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_15_1W_.5% R5
U 1 1 61FD3C36
P 2150 5975
F 0 "R5" V 2200 6150 50  0000 R CNN
F 1 "R_15_1W_.5%" V 2125 6550 50  0000 R CNN
F 2 "footprints:Fuse_1206" H 2150 6225 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition24_en.pdf" H 2150 6075 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/HRG3216Q-15R0-D-T1/5762555" H 1650 5825 50  0001 C CNN "Purchasing Link"
F 5 "HRG3216Q-15R0-D-T1" H 2150 5725 50  0001 C CNN "MPN"
	1    2150 5975
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_15_1W_.5% R4
U 1 1 61FE7E3A
P 2150 5575
F 0 "R4" V 2200 5750 50  0000 R CNN
F 1 "R_15_1W_.5%" V 2125 6150 50  0000 R CNN
F 2 "footprints:Fuse_1206" H 2150 5825 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition24_en.pdf" H 2150 5675 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/HRG3216Q-15R0-D-T1/5762555" H 1650 5425 50  0001 C CNN "Purchasing Link"
F 5 "HRG3216Q-15R0-D-T1" H 2150 5325 50  0001 C CNN "MPN"
	1    2150 5575
	0    -1   -1   0   
$EndComp
Connection ~ 2150 5425
Wire Wire Line
	2150 5425 2325 5425
Connection ~ 2150 5825
Wire Wire Line
	2150 5825 2325 5825
Connection ~ 2150 6225
Wire Wire Line
	2150 6225 2325 6225
Connection ~ 2150 6625
Wire Wire Line
	2150 6625 2325 6625
Wire Wire Line
	1500 7025 2150 7025
$Comp
L formula:F_50A_32V F2
U 1 1 61F0CFDC
P 8550 7450
F 0 "F2" H 8550 7675 50  0000 C CNN
F 1 "F_50A_32V" H 8550 7584 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 8550 7200 50  0001 C CNN
F 3 "https://belfuse.com/resources/datasheets/circuitprotection/ds-CP-0685P-series.pdf" H 8550 7450 50  0001 C CNN
F 4 "0685P9500-01" H 8550 7100 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/bel-fuse-inc/0685P9500-01/10057390" H 8200 7300 50  0001 C CNN "Purchasing Link"
	1    8550 7450
	1    0    0    -1  
$EndComp
$Comp
L formula:F_500mA_60V F1
U 1 1 61F32446
P 1450 8975
F 0 "F1" H 1425 9075 50  0000 C CNN
F 1 "F_500mA_60V" H 1450 8875 50  0000 C CNN
F 2 "footprints:Fuse_1812_4532Metric" H 1300 8775 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/resettable_ptcs/littelfuse_ptc_1812l_datasheet.pdf.pdf" H 1450 8975 50  0001 C CNN
F 4 "1812L050/60MR-A" H 1450 8575 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/littelfuse-inc/1812L050-60MR-A/11205755" H 1200 8675 50  0001 C CNN "Purchasing LInk"
	1    1450 8975
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 8975 1150 8975
Wire Notes Line
	900  8450 7850 8450
Wire Notes Line
	900  10325 7850 10325
$Comp
L formula:R_499 R35
U 1 1 61F8E921
P 6975 1775
F 0 "R35" V 6875 1750 50  0000 L CNN
F 1 "R_499" V 7075 1675 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6905 1775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 7055 1775 50  0001 C CNN
F 4 "DK" H 6975 1775 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 6975 1775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 7455 2175 60  0001 C CNN "PurchasingLink"
	1    6975 1775
	1    0    0    -1  
$EndComp
$Comp
L formula:R_499 R36
U 1 1 61FA3A49
P 7300 1775
F 0 "R36" V 7200 1750 50  0000 L CNN
F 1 "R_499" V 7400 1675 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7230 1775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 7380 1775 50  0001 C CNN
F 4 "DK" H 7300 1775 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 7300 1775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 7780 2175 60  0001 C CNN "PurchasingLink"
	1    7300 1775
	1    0    0    -1  
$EndComp
$Comp
L formula:R_499 R43
U 1 1 61FB8CC9
P 7625 1775
F 0 "R43" V 7525 1750 50  0000 L CNN
F 1 "R_499" V 7725 1675 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7555 1775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 7705 1775 50  0001 C CNN
F 4 "DK" H 7625 1775 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 7625 1775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 8105 2175 60  0001 C CNN "PurchasingLink"
	1    7625 1775
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805_Red D5
U 1 1 61FCFB99
P 6300 2075
F 0 "D5" V 6300 2000 50  0000 R CNN
F 1 "LED_0805_Red" H 6550 2200 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 6200 2075 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic8/00078869_0.pdf" H 6300 2175 50  0001 C CNN
F 4 "DK" H 6300 2075 60  0001 C CNN "MFN"
F 5 "475-1415-1-ND" H 6300 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/osram-opto-semiconductors-inc/LH-R974-LP-1/475-1415-1-ND/1802604" H 6700 2575 60  0001 C CNN "PurchasingLink"
	1    6300 2075
	0    -1   -1   0   
$EndComp
Text Label 6300 1625 1    50   ~ 0
VREG
$Comp
L power:GND #PWR?
U 1 1 61FCFBA0
P 6300 2225
F 0 "#PWR?" H 6300 1975 50  0001 C CNN
F 1 "GND" H 6305 2052 50  0000 C CNN
F 2 "" H 6300 2225 50  0001 C CNN
F 3 "" H 6300 2225 50  0001 C CNN
	1    6300 2225
	1    0    0    -1  
$EndComp
$Comp
L formula:R_499 R32
U 1 1 61FCFBA9
P 6300 1775
F 0 "R32" V 6200 1750 50  0000 L CNN
F 1 "R_499" V 6400 1675 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6230 1775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6380 1775 50  0001 C CNN
F 4 "DK" H 6300 1775 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 6300 1775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 6780 2175 60  0001 C CNN "PurchasingLink"
	1    6300 1775
	1    0    0    -1  
$EndComp
Wire Notes Line
	6100 1300 6100 2525
Wire Notes Line
	6100 2525 7925 2525
Wire Notes Line
	6100 1300 7925 1300
Wire Wire Line
	9975 5325 10525 5325
Wire Wire Line
	1000 8575 1000 8775
$Comp
L power:GND #PWR?
U 1 1 620CB857
P 9625 5775
F 0 "#PWR?" H 9625 5525 50  0001 C CNN
F 1 "GND" H 9775 5700 50  0000 C CNN
F 2 "" H 9625 5775 50  0001 C CNN
F 3 "" H 9625 5775 50  0001 C CNN
	1    9625 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	9625 4750 9625 5075
Wire Wire Line
	9625 4750 9850 4750
$Comp
L power:+5V #PWR?
U 1 1 620F687A
P 9625 4750
F 0 "#PWR?" H 9625 4600 50  0001 C CNN
F 1 "+5V" H 9640 4923 50  0000 C CNN
F 2 "" H 9625 4750 50  0001 C CNN
F 3 "" H 9625 4750 50  0001 C CNN
	1    9625 4750
	1    0    0    -1  
$EndComp
Connection ~ 9625 4750
$Comp
L formula:R_5K R33
U 1 1 62119C18
P 6575 5975
F 0 "R33" H 6645 6021 50  0000 L CNN
F 1 "R_5K" H 6645 5930 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6575 5425 50  0001 C CNN
F 3 "https://www.vishay.com/docs/20008/dcrcw.pdf" H 6575 5975 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-dale/CRCW08055K00FKTA/5075661" H 6325 5525 50  0001 C CNN "Purchasing LInk"
	1    6575 5975
	1    0    0    -1  
$EndComp
Wire Wire Line
	8475 2825 8475 2925
$Comp
L formula:NanoFit_RA_SMT_04 J2
U 1 1 6214BC31
P 8675 2775
F 0 "J2" H 8547 2734 50  0000 R CNN
F 1 "NanoFit_RA_SMT_04" H 8975 2500 50  0000 R CNN
F 2 "footprints:NanoFit_RA_SMT_04" H 8675 2525 50  0001 C CNN
F 3 "" H 8675 3025 50  0001 C CNN
	1    8675 2775
	-1   0    0    1   
$EndComp
Wire Wire Line
	8475 2925 8475 3000
Connection ~ 8475 2925
Text Notes 10525 4450 0    50   ~ 0
Resistor dividers set at ~~90% to \nact as inputs for comparators 
$Comp
L formula:NanoFit_RA_SMT_02 J3
U 1 1 62184A03
P 8825 1475
F 0 "J3" H 9075 1575 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 9350 950 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 9225 975 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 8825 1475 60  0001 C CNN
F 4 "1054301102" H 9025 775 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 8875 875 50  0001 C CNN "Purchasing Link"
	1    8825 1475
	1    0    0    -1  
$EndComp
Text Label 8825 1575 2    50   ~ 0
THERM_4_-
Text Label 8825 1475 2    50   ~ 0
THERM_4_+
Text Label 8825 2075 2    50   ~ 0
THERM_3_-
Text Label 8825 1975 2    50   ~ 0
THERM_3_+
$Comp
L formula:NanoFit_RA_SMT_02 J4
U 1 1 61F58B45
P 8825 1975
F 0 "J4" H 9100 2075 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 9450 1450 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 9225 1475 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 8825 1975 60  0001 C CNN
F 4 "1054301102" H 9025 1275 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 8875 1375 50  0001 C CNN "Purchasing Link"
	1    8825 1975
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_SMT_02 J5
U 1 1 61F6DB51
P 10250 975
F 0 "J5" H 10550 1075 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 10750 275 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 10650 475 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 10250 975 60  0001 C CNN
F 4 "1054301102" H 10450 275 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 10300 375 50  0001 C CNN "Purchasing Link"
	1    10250 975 
	-1   0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_SMT_02 J6
U 1 1 61FE69F9
P 10250 1475
F 0 "J6" H 10550 1575 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 10875 900 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 10650 975 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 10250 1475 60  0001 C CNN
F 4 "1054301102" H 10450 775 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 10300 875 50  0001 C CNN "Purchasing Link"
	1    10250 1475
	-1   0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_SMT_02 J7
U 1 1 61FFB14C
P 10250 1975
F 0 "J7" H 10550 2075 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 10750 1375 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 10650 1475 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 10250 1975 60  0001 C CNN
F 4 "1054301102" H 10450 1275 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 10300 1375 50  0001 C CNN "Purchasing Link"
	1    10250 1975
	-1   0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_SMT_02 J9
U 1 1 62039588
P 11500 2200
F 0 "J9" H 11775 2300 60  0000 L CNN
F 1 "NanoFit_RA_SMT_02" V 12000 1675 60  0000 L CNN
F 2 "footprints:NanoFit_RA_SMT_02" H 11900 1700 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1223.PDF" H 11500 2200 60  0001 C CNN
F 4 "1054301102" H 11700 1500 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054301102/9959376" H 11550 1600 50  0001 C CNN "Purchasing Link"
	1    11500 2200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62064BF9
P 10250 2275
F 0 "#PWR?" H 10250 2025 50  0001 C CNN
F 1 "GND" H 10400 2200 50  0000 C CNN
F 2 "" H 10250 2275 50  0001 C CNN
F 3 "" H 10250 2275 50  0001 C CNN
	1    10250 2275
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2175 10250 2275
Connection ~ 10250 2275
Wire Wire Line
	10250 1675 10250 1775
Wire Wire Line
	10250 1175 10250 1275
Wire Wire Line
	8825 1675 8825 1775
Wire Wire Line
	8825 2175 8825 2275
$Comp
L power:GND #PWR?
U 1 1 620CDFDC
P 8825 2275
F 0 "#PWR?" H 8825 2025 50  0001 C CNN
F 1 "GND" H 8975 2200 50  0000 C CNN
F 2 "" H 8825 2275 50  0001 C CNN
F 3 "" H 8825 2275 50  0001 C CNN
	1    8825 2275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620E26A6
P 8825 1775
F 0 "#PWR?" H 8825 1525 50  0001 C CNN
F 1 "GND" H 8975 1700 50  0000 C CNN
F 2 "" H 8825 1775 50  0001 C CNN
F 3 "" H 8825 1775 50  0001 C CNN
	1    8825 1775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620F6E21
P 10250 1275
F 0 "#PWR?" H 10250 1025 50  0001 C CNN
F 1 "GND" H 10400 1200 50  0000 C CNN
F 2 "" H 10250 1275 50  0001 C CNN
F 3 "" H 10250 1275 50  0001 C CNN
	1    10250 1275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6210B498
P 10250 1775
F 0 "#PWR?" H 10250 1525 50  0001 C CNN
F 1 "GND" H 10400 1700 50  0000 C CNN
F 2 "" H 10250 1775 50  0001 C CNN
F 3 "" H 10250 1775 50  0001 C CNN
	1    10250 1775
	1    0    0    -1  
$EndComp
Connection ~ 10250 1775
Connection ~ 10250 1275
Connection ~ 8825 1775
Connection ~ 8825 2275
$Comp
L power:GND #PWR?
U 1 1 621264E1
P 11500 2500
F 0 "#PWR?" H 11500 2250 50  0001 C CNN
F 1 "GND" H 11505 2327 50  0000 C CNN
F 2 "" H 11500 2500 50  0001 C CNN
F 3 "" H 11500 2500 50  0001 C CNN
	1    11500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11500 2500 11500 2400
Connection ~ 11500 2500
$Comp
L power:GND #PWR?
U 1 1 621C5CF4
P 11350 1750
F 0 "#PWR?" H 11350 1500 50  0001 C CNN
F 1 "GND" H 11355 1577 50  0000 C CNN
F 2 "" H 11350 1750 50  0001 C CNN
F 3 "" H 11350 1750 50  0001 C CNN
	1    11350 1750
	1    0    0    -1  
$EndComp
Wire Notes Line
	8050 775  8050 3175
$Comp
L formula:R_0 R44
U 1 1 6223F8F7
P 1650 7275
F 0 "R44" V 1725 7225 50  0000 C CNN
F 1 "R_0" V 1800 7250 50  0000 C CNN
F 2 "footprints:R_0603_1608Metric" H 1580 7275 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 1730 7275 50  0001 C CNN
F 4 "DK" H 1650 7275 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 1650 7275 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 2130 7675 60  0001 C CNN "PurchasingLink"
	1    1650 7275
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 7025 1500 7275
Wire Wire Line
	1800 7275 1875 7275
Text Notes 11750 1000 0    39   ~ 0
Optional Battery (-)\nGND Power Lead \nwire connection
Connection ~ 11350 1750
Wire Wire Line
	11350 1650 11350 1750
$Comp
L formula:NanoFit_RA_SMT_06_A J8
U 1 1 621AEB66
P 11150 1400
F 0 "J8" H 11150 950 60  0000 C CNN
F 1 "NanoFit_RA_SMT_06_A" V 11300 1350 60  0000 C CNN
F 2 "footprints:NanoFit_RA_SMT_06" V 11410 1400 60  0001 C CNN
F 3 "https://www.molex.com/webdocs/datasheets/pdf/en-us/1054302106_PCB_HEADERS.pdf" H 10750 850 60  0001 C CNN
F 4 "1054302106" H 11150 1400 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/en/products/detail/molex/1054302106/9959390" H 11150 1400 50  0001 C CNN "Purchasing LInk"
	1    11150 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	11350 1050 11350 875 
Wire Wire Line
	11350 875  11525 875 
$Comp
L power:GND #PWR?
U 1 1 62074885
P 11525 875
F 0 "#PWR?" H 11525 625 50  0001 C CNN
F 1 "GND" H 11650 800 50  0000 C CNN
F 2 "" H 11525 875 50  0001 C CNN
F 3 "" H 11525 875 50  0001 C CNN
	1    11525 875 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_500 R29
U 1 1 621CC2E1
P 4075 3000
F 0 "R29" H 4025 3000 50  0000 C CNN
F 1 "R_500" H 4075 3125 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4075 3000 50  0001 C CNN
F 3 "" H 4075 3000 50  0001 C CNN
	1    4075 3000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_500 R45
U 1 1 621CD37D
P 4075 3100
F 0 "R45" H 4025 3100 50  0000 C CNN
F 1 "R_500" H 4075 3475 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4075 3100 50  0001 C CNN
F 3 "" H 4075 3100 50  0001 C CNN
	1    4075 3100
	1    0    0    -1  
$EndComp
$Comp
L formula:R_500 R46
U 1 1 621CE438
P 4075 3200
F 0 "R46" H 4025 3200 50  0000 C CNN
F 1 "R_500" H 4075 3600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4075 3200 50  0001 C CNN
F 3 "" H 4075 3200 50  0001 C CNN
	1    4075 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5925 3800 5575
Wire Wire Line
	3700 5425 3700 6425
Connection ~ 3800 5925
Connection ~ 3800 5575
Text Label 3800 5350 0    50   ~ 0
BATT_4
Wire Wire Line
	3800 5350 3800 5575
Text Label 11575 2875 2    50   ~ 0
THERM_3_+
Text Label 11575 3025 2    50   ~ 0
THERM_3_-
$Comp
L formula:Test_Point_SMD TP18
U 1 1 6219D6D3
P 11625 2875
F 0 "TP18" V 11574 3053 50  0000 L CNN
F 1 "Test_Point_SMD" V 11475 2975 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 11625 2725 50  0001 C CNN
F 3 "" H 11625 2875 50  0001 C CNN
	1    11625 2875
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP19
U 1 1 6219D6D9
P 11625 3025
F 0 "TP19" V 11574 3203 50  0000 L CNN
F 1 "Test_Point_SMD" V 11225 3125 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 11625 2875 50  0001 C CNN
F 3 "" H 11625 3025 50  0001 C CNN
	1    11625 3025
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP20
U 1 1 62292F47
P 6600 7675
F 0 "TP20" H 6500 7575 50  0000 L CNN
F 1 "Test_Point_SMD" H 6050 8100 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6600 7525 50  0001 C CNN
F 3 "" H 6600 7675 50  0001 C CNN
	1    6600 7675
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 7625 6475 7625
Connection ~ 6475 7625
$Comp
L formula:SSM3K333R Q4
U 1 1 622C2DA5
P 14350 7100
F 0 "Q4" H 14556 7146 50  0000 L CNN
F 1 "SSM3K333R" H 14556 7055 50  0000 L CNN
F 2 "footprints:SOT-23F" H 14550 7025 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 14550 7175 50  0001 L CNN
F 4 "DK" H 14850 7475 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 14750 7375 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 14650 7275 60  0001 C CNN "PurchasingLink"
	1    14350 7100
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q3
U 1 1 622C76D2
P 14350 6125
F 0 "Q3" H 14556 6171 50  0000 L CNN
F 1 "SSM3K333R" H 14556 6080 50  0000 L CNN
F 2 "footprints:SOT-23F" H 14550 6050 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 14550 6200 50  0001 L CNN
F 4 "DK" H 14850 6500 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 14750 6400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 14650 6300 60  0001 C CNN "PurchasingLink"
	1    14350 6125
	1    0    0    -1  
$EndComp
Text Label 11500 2200 0    50   ~ 0
PACK_SIDE_CURRENT_PATH
Wire Wire Line
	4475 9925 4475 10150
Connection ~ 4475 10150
Connection ~ 5025 10150
Wire Wire Line
	5025 10150 5375 10150
Wire Wire Line
	5025 9850 5025 9725
Wire Wire Line
	4475 10150 5025 10150
NoConn ~ 5025 9475
Wire Wire Line
	5025 9275 5025 9075
Wire Wire Line
	5025 8975 5375 8975
Connection ~ 5025 8975
Connection ~ 5025 9075
Wire Wire Line
	5025 9075 5025 8975
Connection ~ 5375 8975
$Comp
L formula:Test_Point_SMD TP21
U 1 1 61F97971
P 6725 7675
F 0 "TP21" H 6650 7875 50  0000 L CNN
F 1 "Test_Point_SMD" H 6700 7950 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6725 7525 50  0001 C CNN
F 3 "" H 6725 7675 50  0001 C CNN
	1    6725 7675
	-1   0    0    1   
$EndComp
$Comp
L formula:Test_Point_SMD TP22
U 1 1 61F97977
P 6850 7675
F 0 "TP22" H 6775 7575 50  0000 L CNN
F 1 "Test_Point_SMD" H 6350 8025 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 6850 7525 50  0001 C CNN
F 3 "" H 6850 7675 50  0001 C CNN
	1    6850 7675
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 7625 6725 7625
Connection ~ 6600 7625
Connection ~ 6725 7625
Wire Wire Line
	6725 7625 6850 7625
Text Label 13075 875  0    50   ~ 0
THERM_0_+
Text Label 13075 975  0    50   ~ 0
THERM_0_-
Text Label 13075 1175 0    50   ~ 0
THERM_1_+
Text Label 13075 1275 0    50   ~ 0
THERM_1_-
Text Label 13075 1500 0    50   ~ 0
THERM_2_+
Text Label 13075 1600 0    50   ~ 0
THERM_2_-
$Comp
L formula:Test_Point_SMD TP24
U 1 1 61FECA9A
P 13025 975
F 0 "TP24" V 12974 1153 50  0000 L CNN
F 1 "Test_Point_SMD" V 11975 950 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 825 50  0001 C CNN
F 3 "" H 13025 975 50  0001 C CNN
	1    13025 975 
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP23
U 1 1 61FECAA0
P 13025 875
F 0 "TP23" V 12974 1053 50  0000 L CNN
F 1 "Test_Point_SMD" V 11725 850 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 725 50  0001 C CNN
F 3 "" H 13025 875 50  0001 C CNN
	1    13025 875 
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP26
U 1 1 62001CD1
P 13025 1275
F 0 "TP26" V 12974 1453 50  0000 L CNN
F 1 "Test_Point_SMD" V 12200 1250 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 1125 50  0001 C CNN
F 3 "" H 13025 1275 50  0001 C CNN
	1    13025 1275
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP25
U 1 1 62001CD7
P 13025 1175
F 0 "TP25" V 12974 1353 50  0000 L CNN
F 1 "Test_Point_SMD" V 12400 1150 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 1025 50  0001 C CNN
F 3 "" H 13025 1175 50  0001 C CNN
	1    13025 1175
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP28
U 1 1 62017168
P 13025 1600
F 0 "TP28" V 12974 1778 50  0000 L CNN
F 1 "Test_Point_SMD" V 12750 1575 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 1450 50  0001 C CNN
F 3 "" H 13025 1600 50  0001 C CNN
	1    13025 1600
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP27
U 1 1 6201716E
P 13025 1500
F 0 "TP27" V 12974 1678 50  0000 L CNN
F 1 "Test_Point_SMD" V 12575 1475 50  0000 L CNN
F 2 "footprints:Test_Point_SMD" H 13025 1350 50  0001 C CNN
F 3 "" H 13025 1500 50  0001 C CNN
	1    13025 1500
	0    -1   -1   0   
$EndComp
Connection ~ 10300 10125
$Comp
L formula:SQM110P06 Q7
U 1 1 61FD94D4
P 9975 8375
F 0 "Q7" V 10268 8375 50  0000 C CNN
F 1 "SQM110P06" V 10177 8375 50  0000 C CNN
F 2 "footprints:TO-263-3-TabPin2" H 9925 8975 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 9975 8375 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 9925 8875 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 10025 9075 50  0001 C CNN "MPN"
	1    9975 8375
	0    -1   -1   0   
$EndComp
$Comp
L formula:SQM110P06 Q8
U 1 1 61FD94DC
P 10625 8375
F 0 "Q8" V 10918 8375 50  0000 C CNN
F 1 "SQM110P06" V 10825 8450 50  0000 C CNN
F 2 "footprints:TO-263-3-TabPin2" H 10575 8975 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 10625 8375 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 10575 8875 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 10675 9075 50  0001 C CNN "MPN"
	1    10625 8375
	0    1    -1   0   
$EndComp
Wire Wire Line
	9975 9100 9975 9200
Wire Wire Line
	9975 9200 10200 9200
Wire Wire Line
	9775 8325 9775 8800
Wire Wire Line
	10175 8800 10250 8800
Wire Wire Line
	10300 8800 10425 8800
Wire Wire Line
	10175 8325 10250 8325
Wire Wire Line
	9975 8625 10200 8625
Wire Wire Line
	10200 8625 10200 9200
Connection ~ 10200 9200
Wire Wire Line
	10200 9200 10250 9200
Wire Wire Line
	10625 8625 10400 8625
Wire Wire Line
	10400 8625 10400 9200
Connection ~ 10400 9200
Wire Wire Line
	10400 9200 10625 9200
Wire Wire Line
	10250 8800 10250 8325
Connection ~ 10250 8800
Wire Wire Line
	10250 8800 10300 8800
Connection ~ 10250 8325
Wire Wire Line
	10250 8325 10325 8325
Wire Wire Line
	10825 8800 11025 8800
Wire Wire Line
	10825 8325 10825 8800
Connection ~ 10825 8800
Wire Wire Line
	9775 8800 9250 8800
Wire Wire Line
	9250 7750 9250 8800
Connection ~ 9775 8800
Connection ~ 10325 8325
Wire Wire Line
	10325 8325 10425 8325
Wire Notes Line
	12125 10325 7975 10325
Wire Notes Line
	12125 7025 12125 10325
Wire Notes Line
	7975 7025 7975 10325
Text Notes 10850 8450 0    50   ~ 0
DNP\nFET
Text Notes 9600 8450 0    50   ~ 0
DNP\nFET
Wire Notes Line
	13625 775  13625 3175
Wire Notes Line
	8050 775  13625 775 
Wire Notes Line
	8050 3175 13625 3175
Wire Wire Line
	8975 7450 8975 7550
Connection ~ 8975 7450
Wire Wire Line
	8975 7450 9075 7450
$Comp
L formula:R_0 R?
U 1 1 62672ADF
P 8975 7700
F 0 "R?" H 9045 7746 50  0000 L CNN
F 1 "R_0" H 9045 7655 50  0000 L CNN
F 2 "footprints:R_0603_1608Metric" H 8905 7700 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 9055 7700 50  0001 C CNN
F 4 "DK" H 8975 7700 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 8975 7700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 9455 8100 60  0001 C CNN "PurchasingLink"
	1    8975 7700
	1    0    0    -1  
$EndComp
Text Label 8825 7850 2    50   ~ 0
BATT_4
Wire Wire Line
	8825 7850 8975 7850
Wire Wire Line
	15050 3400 15325 3400
Wire Wire Line
	14550 3400 14250 3400
Wire Wire Line
	14025 3300 14250 3300
$Comp
L formula:Test_Point_SMD TP?
U 1 1 62705BA6
P 14250 3250
F 0 "TP?" H 14300 3350 50  0000 L CNN
F 1 "Test_Point_SMD" H 15225 2775 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 14250 3100 50  0001 C CNN
F 3 "" H 14250 3250 50  0001 C CNN
	1    14250 3250
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP?
U 1 1 6271D460
P 14250 3450
F 0 "TP?" H 14175 3650 50  0000 L CNN
F 1 "Test_Point_SMD" H 12700 3650 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 14250 3300 50  0001 C CNN
F 3 "" H 14250 3450 50  0001 C CNN
	1    14250 3450
	-1   0    0    1   
$EndComp
$Comp
L formula:Test_Point_SMD TP?
U 1 1 62734A65
P 15325 3350
F 0 "TP?" H 15350 3550 50  0000 L CNN
F 1 "Test_Point_SMD" H 15225 3125 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 15325 3200 50  0001 C CNN
F 3 "" H 15325 3350 50  0001 C CNN
	1    15325 3350
	1    0    0    -1  
$EndComp
Wire Notes Line
	15975 3075 15975 3800
Wire Notes Line
	13775 3075 15975 3075
Wire Notes Line
	13775 3800 15975 3800
Connection ~ 15325 3400
Wire Wire Line
	15325 3400 15400 3400
Connection ~ 14250 3300
Wire Wire Line
	14250 3300 14550 3300
Connection ~ 14250 3400
$EndSCHEMATC
