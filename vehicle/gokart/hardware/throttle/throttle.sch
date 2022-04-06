EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Go-Kart Throttle Board"
Date "2022-02-14"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Amit Kumar"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 15450 8600
F 0 "#PWR?" H 15450 8350 50  0001 C CNN
F 1 "GND" H 15455 8427 50  0000 C CNN
F 2 "" H 15450 8600 50  0001 C CNN
F 3 "" H 15450 8600 50  0001 C CNN
	1    15450 8600
	1    0    0    -1  
$EndComp
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
L power:GND #PWR?
U 1 1 5D58E5E0
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
U 1 1 5D591138
P 1150 1600
F 0 "#PWR?" H 1150 1350 50  0001 C CNN
F 1 "GND" H 1155 1427 50  0000 C CNN
F 2 "" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0001 C CNN
	1    1150 1600
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
P 4150 3500
F 0 "R3" V 4070 3500 50  0000 C CNN
F 1 "R_10K" V 4200 3750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4080 3500 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4230 3500 50  0001 C CNN
F 4 "DK" H 4150 3500 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4150 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4630 3900 60  0001 C CNN "PurchasingLink"
	1    4150 3500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
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
U 1 1 5D5F26EE
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
U 1 1 5D5F2774
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
U 1 1 5D5F27E1
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
U 1 1 5D5F86E8
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
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 14500 1600
F 0 "#PWR?" H 14500 1350 50  0001 C CNN
F 1 "GND" H 14400 1600 50  0000 C CNN
F 2 "" H 14500 1600 50  0001 C CNN
F 3 "" H 14500 1600 50  0001 C CNN
	1    14500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
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
U 1 1 5D607469
P 14300 2250
F 0 "#PWR?" H 14300 2000 50  0001 C CNN
F 1 "GND" H 14305 2077 50  0000 C CNN
F 2 "" H 14300 2250 50  0001 C CNN
F 3 "" H 14300 2250 50  0001 C CNN
	1    14300 2250
	1    0    0    -1  
$EndComp
Text Label 14300 1850 2    50   ~ 0
CAN_TX
Text Label 14300 1950 2    50   ~ 0
CAN_RX
Text Label 15750 1900 0    50   ~ 0
CAN_+
Text Label 15750 2200 0    50   ~ 0
CAN_-
Text Notes 14200 1050 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2250 800  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3550 4900 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 14600 8150 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 14550 8600
F 0 "#FLG?" H 14550 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 14550 8774 50  0000 C CNN
F 2 "" H 14550 8600 50  0001 C CNN
F 3 "~" H 14550 8600 50  0001 C CNN
	1    14550 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 15000 8600
F 0 "#FLG?" H 15000 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 15000 8774 50  0000 C CNN
F 2 "" H 15000 8600 50  0001 C CNN
F 3 "~" H 15000 8600 50  0001 C CNN
	1    15000 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 15450 8450
F 0 "#FLG?" H 15450 8525 50  0001 C CNN
F 1 "PWR_FLAG" H 15450 8624 50  0000 C CNN
F 2 "" H 15450 8450 50  0001 C CNN
F 3 "~" H 15450 8450 50  0001 C CNN
	1    15450 8450
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 14850 3750
F 0 "J1" H 14850 3960 50  0000 C CNN
F 1 "CONN_02X03" H 14740 3550 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 14850 2550 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 14850 2550 50  0001 C CNN
F 4 "DK" H 14850 3750 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 14850 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 15250 4350 60  0001 C CNN "PurchasingLink"
	1    14850 3750
	1    0    0    -1  
$EndComp
Text Label 14600 3650 2    50   ~ 0
MISO
Text Label 14600 3750 2    50   ~ 0
SCK
Text Label 14600 3850 2    50   ~ 0
RESET
Text Label 15100 3750 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 15100 3850
F 0 "#PWR?" H 15100 3600 50  0001 C CNN
F 1 "GND" H 15105 3677 50  0000 C CNN
F 2 "" H 15100 3850 50  0001 C CNN
F 3 "" H 15100 3850 50  0001 C CNN
	1    15100 3850
	1    0    0    -1  
$EndComp
Text Notes 13850 3400 0    89   ~ 0
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
	3650 3700 4000 3700
Wire Wire Line
	4000 3700 4000 3500
Connection ~ 4000 3700
Wire Wire Line
	4000 3700 4300 3700
Wire Wire Line
	4300 3500 4450 3500
Wire Wire Line
	4450 3500 4450 3350
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
	15000 8600 15000 8450
Wire Wire Line
	15450 8450 15450 8600
Wire Wire Line
	15300 2150 15400 2150
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
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
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
U 1 1 5FD3B2BE
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
U 1 1 5FD3C2F8
P 15100 3650
F 0 "#PWR?" H 15100 3500 50  0001 C CNN
F 1 "+5V" H 15115 3823 50  0000 C CNN
F 2 "" H 15100 3650 50  0001 C CNN
F 3 "" H 15100 3650 50  0001 C CNN
	1    15100 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 15000 8450
F 0 "#PWR?" H 15000 8300 50  0001 C CNN
F 1 "+5V" H 15015 8623 50  0000 C CNN
F 2 "" H 15000 8450 50  0001 C CNN
F 3 "" H 15000 8450 50  0001 C CNN
	1    15000 8450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 4450 3350
F 0 "#PWR?" H 4450 3200 50  0001 C CNN
F 1 "+5V" H 4465 3523 50  0000 C CNN
F 2 "" H 4450 3350 50  0001 C CNN
F 3 "" H 4450 3350 50  0001 C CNN
	1    4450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 8450 14550 8600
$Comp
L formula:LED_0805 D1
U 1 1 620B51AE
P 14450 6050
F 0 "D1" H 14443 6266 50  0000 C CNN
F 1 "LED_0805" H 14443 6175 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 14350 6050 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 14450 6150 50  0001 C CNN
F 4 "DK" H 14450 6050 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 14450 6050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 14850 6550 60  0001 C CNN "PurchasingLink"
	1    14450 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621B291F
P 14300 6050
F 0 "#PWR?" H 14300 5800 50  0001 C CNN
F 1 "GND" H 14305 5877 50  0000 C CNN
F 2 "" H 14300 6050 50  0001 C CNN
F 3 "" H 14300 6050 50  0001 C CNN
	1    14300 6050
	0    1    1    0   
$EndComp
Text Label 3650 1200 0    50   ~ 0
VOUT1
Text Label 3650 1500 0    50   ~ 0
VOUT2
Text Label 3650 1600 0    50   ~ 0
VOUT3
Text Label 3650 1700 0    50   ~ 0
VOUT4
$Comp
L formula:LED_0805_Red D3
U 1 1 620CA300
P 14450 7000
F 0 "D3" H 14443 7216 50  0000 C CNN
F 1 "LED_0805_Red" H 14443 7125 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 14350 7000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic8/00078869_0.pdf" H 14450 7100 50  0001 C CNN
F 4 "DK" H 14450 7000 60  0001 C CNN "MFN"
F 5 "475-1415-1-ND" H 14450 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/osram-opto-semiconductors-inc/LH-R974-LP-1/475-1415-1-ND/1802604" H 14850 7500 60  0001 C CNN "PurchasingLink"
	1    14450 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620CB538
P 14300 7000
F 0 "#PWR?" H 14300 6750 50  0001 C CNN
F 1 "GND" H 14305 6827 50  0000 C CNN
F 2 "" H 14300 7000 50  0001 C CNN
F 3 "" H 14300 7000 50  0001 C CNN
	1    14300 7000
	0    1    1    0   
$EndComp
Text Label 15150 6050 0    50   ~ 0
PROGRAMMINGLED1
Text Label 15150 6550 0    50   ~ 0
PROGRAMMINGLED2
Text Label 3650 2300 0    50   ~ 0
PROGRAMMINGLED1
Text Label 3650 2400 0    50   ~ 0
PROGRAMMINGLED2
Text Label 3650 1000 0    50   ~ 0
PROGRAMMINGLED3
Text Notes 14350 5650 0    89   ~ 0
Programming LEDs
Text Notes 3900 3050 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L formula:R_200 R16
U 1 1 620E6F8F
P 15000 6050
F 0 "R16" V 14793 6050 50  0000 C CNN
F 1 "R_200" V 14884 6050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 14930 6050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 15080 6050 50  0001 C CNN
F 4 "DK" H 15000 6050 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 15000 6050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 15480 6450 60  0001 C CNN "PurchasingLink"
	1    15000 6050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620C8FDA
P 14300 6550
F 0 "#PWR?" H 14300 6300 50  0001 C CNN
F 1 "GND" H 14305 6377 50  0000 C CNN
F 2 "" H 14300 6550 50  0001 C CNN
F 3 "" H 14300 6550 50  0001 C CNN
	1    14300 6550
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805_Amber D2
U 1 1 620B64AC
P 14450 6550
F 0 "D2" H 14443 6766 50  0000 C CNN
F 1 "LED_0805_Amber" H 14443 6675 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 14350 6550 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Chicago%20Miniature%20Lamps%20PDFs/CMDA5_Series_Rev_Aug_2014.pdf" H 14450 6650 50  0001 C CNN
F 4 "DK" H 14450 6550 60  0001 C CNN "MFN"
F 5 "L71517CT-ND" H 14450 6550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/visual-communications-company-vcc/CMDA5DY7D1S/L71517CT-ND/614867" H 14850 7050 60  0001 C CNN "PurchasingLink"
	1    14450 6550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R17
U 1 1 62108213
P 15000 6550
F 0 "R17" V 14793 6550 50  0000 C CNN
F 1 "R_200" V 14884 6550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 14930 6550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 15080 6550 50  0001 C CNN
F 4 "DK" H 15000 6550 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 15000 6550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 15480 6950 60  0001 C CNN "PurchasingLink"
	1    15000 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	14600 6550 14850 6550
$Comp
L formula:R_200 R18
U 1 1 62124070
P 15000 7000
F 0 "R18" V 14793 7000 50  0000 C CNN
F 1 "R_200" V 14884 7000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 14930 7000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 15080 7000 50  0001 C CNN
F 4 "DK" H 15000 7000 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 15000 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 15480 7400 60  0001 C CNN "PurchasingLink"
	1    15000 7000
	0    1    1    0   
$EndComp
Text Label 15150 7000 0    50   ~ 0
PROGRAMMINGLED3
Wire Wire Line
	14600 7000 14850 7000
Wire Wire Line
	14600 6050 14850 6050
Wire Notes Line
	13850 5400 16000 5400
Wire Notes Line
	16000 5400 16000 7250
Wire Notes Line
	16000 7250 13850 7250
Wire Notes Line
	13850 7250 13850 5400
$Comp
L formula:MicroFit_12 J4
U 1 1 622A89A0
P 2200 5750
F 0 "J4" H 2583 5797 60  0000 C CNN
F 1 "MicroFit_12" H 2583 5691 60  0000 C CNN
F 2 "footprints:MicroFit12_ra" H 2350 5550 60  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/276/0436501212_PCB_HEADERS-148915.pdf" H 2450 5650 60  0001 C CNN
F 4 "Mouser" H 2550 5750 60  0001 C CNN "MFN"
F 5 "538-43650-1212" H 2650 5850 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Molex/43650-1212?qs=sGAEpiMZZMs%252bGHln7q6pmzorV8rj9woRbgLd20ftk7I%3d" H 2750 5950 60  0001 C CNN "PurchasingLink"
	1    2200 5750
	1    0    0    -1  
$EndComp
Text Label 2750 5950 0    50   ~ 0
GND
Text Label 2750 6950 0    50   ~ 0
VIN1
Text Label 2750 6250 0    50   ~ 0
GND
Text Label 2750 6550 0    50   ~ 0
GND
Text Label 2750 6850 0    50   ~ 0
GND
Text Label 2750 6650 0    50   ~ 0
VIN2
Text Label 2750 6350 0    50   ~ 0
VIN3
Text Label 2750 6050 0    50   ~ 0
VIN4
Text Notes 1800 5550 0    89   ~ 0
Connectors
NoConn ~ 3650 1300
NoConn ~ 3650 1400
NoConn ~ 3650 1900
NoConn ~ 3650 2000
NoConn ~ 3650 2600
NoConn ~ 3650 2800
NoConn ~ 3650 2900
NoConn ~ 3650 3300
NoConn ~ 3650 3400
Wire Notes Line
	1300 5350 1300 7200
Wire Notes Line
	1300 7200 3100 7200
Wire Notes Line
	3100 7200 3100 5350
Wire Notes Line
	3100 5350 1300 5350
$Comp
L formula:AP7370 U7
U 1 1 621865CC
P 3100 8500
F 0 "U7" H 3100 8742 50  0000 C CNN
F 1 "AP7370" H 3100 8651 50  0000 C CNN
F 2 "footprints:SOT-23-5" H 3050 8700 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP7370.pdf" H 3200 8250 50  0001 C CNN
F 4 "DK" H 3150 8825 60  0001 C CNN "MFN"
F 5 "AP7370-50W5-7DICT-ND" H 3250 8925 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/diodes-incorporated/AP7370-50W5-7/10235827" H 3250 8925 60  0001 C CNN "PurchasingLink"
	1    3100 8500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62188C46
P 3100 8800
F 0 "#PWR?" H 3100 8550 50  0001 C CNN
F 1 "GND" H 3105 8627 50  0000 C CNN
F 2 "" H 3100 8800 50  0001 C CNN
F 3 "" H 3100 8800 50  0001 C CNN
	1    3100 8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 8500 3550 8500
$Comp
L power:+5V #PWR?
U 1 1 6218F3B2
P 4650 8300
F 0 "#PWR?" H 4650 8150 50  0001 C CNN
F 1 "+5V" H 4665 8473 50  0000 C CNN
F 2 "" H 4650 8300 50  0001 C CNN
F 3 "" H 4650 8300 50  0001 C CNN
	1    4650 8300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 6160D1CA
P 14550 8450
F 0 "#PWR?" H 14550 8300 50  0001 C CNN
F 1 "+BATT" H 14565 8623 50  0000 C CNN
F 2 "" H 14550 8450 50  0001 C CNN
F 3 "" H 14550 8450 50  0001 C CNN
	1    14550 8450
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 62196DD9
P 1050 8500
F 0 "#PWR?" H 1050 8350 50  0001 C CNN
F 1 "+BATT" H 1065 8673 50  0000 C CNN
F 2 "" H 1050 8500 50  0001 C CNN
F 3 "" H 1050 8500 50  0001 C CNN
	1    1050 8500
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C7
U 1 1 62198FDD
P 3550 8700
F 0 "C7" H 3665 8796 50  0000 L CNN
F 1 "C_1uF" H 3665 8705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3588 9300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 3575 9550 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 3975 9200 60  0001 C CNN "PurchasingLink"
	1    3550 8700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62199AFF
P 3550 8800
F 0 "#PWR?" H 3550 8550 50  0001 C CNN
F 1 "GND" H 3555 8627 50  0000 C CNN
F 2 "" H 3550 8800 50  0001 C CNN
F 3 "" H 3550 8800 50  0001 C CNN
	1    3550 8800
	1    0    0    -1  
$EndComp
Connection ~ 3550 8500
Wire Wire Line
	3550 8500 4300 8500
$Comp
L formula:C_1uF C6
U 1 1 6219D59E
P 2450 8700
F 0 "C6" H 2565 8796 50  0000 L CNN
F 1 "C_1uF" H 2565 8705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2488 9300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 2475 9550 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 2875 9200 60  0001 C CNN "PurchasingLink"
	1    2450 8700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6219D5A4
P 2450 8800
F 0 "#PWR?" H 2450 8550 50  0001 C CNN
F 1 "GND" H 2455 8627 50  0000 C CNN
F 2 "" H 2450 8800 50  0001 C CNN
F 3 "" H 2450 8800 50  0001 C CNN
	1    2450 8800
	1    0    0    -1  
$EndComp
Connection ~ 2450 8500
Wire Wire Line
	2450 8500 2800 8500
Text Notes 2500 8150 0    89   ~ 0
Linear Regulator
Text Label 2750 7050 0    50   ~ 0
+5V
Text Label 2750 6750 0    50   ~ 0
+5V
Text Label 2750 6450 0    50   ~ 0
+5V
Text Label 2750 6150 0    50   ~ 0
+5V
$Comp
L formula:MicroFit_RA_4 J5
U 1 1 621BC136
P 1700 6100
F 0 "J5" H 1758 6475 50  0000 C CNN
F 1 "MicroFit_RA_4" H 1758 6384 50  0000 C CNN
F 2 "footprints:MicroFit_RA_4" H 1700 5800 50  0001 C CNN
F 3 "" H 1700 6100 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 1700 6100 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 1700 6100 50  0001 C CNN "PurchasingLink"
	1    1700 6100
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C10
U 1 1 62225665
P 10700 4750
F 0 "C10" H 10815 4846 50  0000 L CNN
F 1 "C_1uF" H 10815 4755 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10738 5350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 10725 5600 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 11125 5250 60  0001 C CNN "PurchasingLink"
	1    10700 4750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62208969
P 6900 6300
F 0 "#PWR?" H 6900 6050 50  0001 C CNN
F 1 "GND" H 6905 6127 50  0000 C CNN
F 2 "" H 6900 6300 50  0001 C CNN
F 3 "" H 6900 6300 50  0001 C CNN
	1    6900 6300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C9
U 1 1 62207FAF
P 7100 6300
F 0 "C9" H 7215 6396 50  0000 L CNN
F 1 "C_1uF" H 7215 6305 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7138 6900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 7125 7150 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 7525 6800 60  0001 C CNN "PurchasingLink"
	1    7100 6300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621E4075
P 6950 4750
F 0 "#PWR?" H 6950 4500 50  0001 C CNN
F 1 "GND" H 6955 4577 50  0000 C CNN
F 2 "" H 6950 4750 50  0001 C CNN
F 3 "" H 6950 4750 50  0001 C CNN
	1    6950 4750
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C8
U 1 1 621AFD26
P 7150 4750
F 0 "C8" H 7265 4846 50  0000 L CNN
F 1 "C_1uF" H 7265 4755 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7188 5350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 7175 5600 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 7575 5250 60  0001 C CNN "PurchasingLink"
	1    7150 4750
	0    -1   -1   0   
$EndComp
$Comp
L formula:MCP6001 U5
U 1 1 620E0E33
P 11000 5150
F 0 "U5" H 11344 5196 50  0000 L CNN
F 1 "MCP6001" H 11344 5105 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 10900 5250 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 11000 5350 50  0001 C CNN
F 4 "DK" H 11100 5450 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 11200 5550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 11300 5650 60  0001 C CNN "PurchasingLink"
	1    11000 5150
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U4
U 1 1 620E07FC
P 7400 6700
F 0 "U4" H 7744 6746 50  0000 L CNN
F 1 "MCP6001" H 7744 6655 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7300 6800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7400 6900 50  0001 C CNN
F 4 "DK" H 7500 7000 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 7600 7100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 7700 7200 60  0001 C CNN "PurchasingLink"
	1    7400 6700
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U3
U 1 1 620D9172
P 7400 5150
F 0 "U3" H 7744 5196 50  0000 L CNN
F 1 "MCP6001" H 7744 5105 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7300 5250 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7400 5350 50  0001 C CNN
F 4 "DK" H 7500 5450 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 7600 5550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 7700 5650 60  0001 C CNN "PurchasingLink"
	1    7400 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622824A4
P 9500 5350
F 0 "#PWR?" H 9500 5100 50  0001 C CNN
F 1 "GND" H 9505 5177 50  0000 C CNN
F 2 "" H 9500 5350 50  0001 C CNN
F 3 "" H 9500 5350 50  0001 C CNN
	1    9500 5350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R10
U 1 1 6228249E
P 9500 5200
F 0 "R10" H 9430 5154 50  0000 R CNN
F 1 "R_100K" H 9430 5245 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 9430 5200 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9580 5200 50  0001 C CNN
F 4 "DK" H 9500 5200 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9500 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9980 5600 60  0001 C CNN "PurchasingLink"
	1    9500 5200
	-1   0    0    1   
$EndComp
Connection ~ 9500 5050
Wire Wire Line
	9400 5050 9500 5050
$Comp
L formula:R_10K R12
U 1 1 62282447
P 11650 5450
F 0 "R12" H 11720 5496 50  0000 L CNN
F 1 "R_10K" H 11720 5405 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11580 5450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11730 5450 50  0001 C CNN
F 4 "DK" H 11650 5450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11650 5450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12130 5850 60  0001 C CNN "PurchasingLink"
	1    11650 5450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R13
U 1 1 6228243E
P 11650 5900
F 0 "R13" H 11720 5946 50  0000 L CNN
F 1 "R_10K_DNP" H 11720 5855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11580 5900 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11730 5900 50  0001 C CNN
F 4 "DK" H 11650 5900 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11650 5900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12130 6300 60  0001 C CNN "PurchasingLink"
	1    11650 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 5250 10700 5250
$Comp
L power:GND #PWR?
U 1 1 62282434
P 10900 5450
F 0 "#PWR?" H 10900 5200 50  0001 C CNN
F 1 "GND" H 10905 5277 50  0000 C CNN
F 2 "" H 10900 5450 50  0001 C CNN
F 3 "" H 10900 5450 50  0001 C CNN
	1    10900 5450
	1    0    0    -1  
$EndComp
Connection ~ 11650 5700
Wire Wire Line
	11650 5700 11650 5750
Wire Wire Line
	10550 5250 10550 5700
$Comp
L power:GND #PWR?
U 1 1 6228242B
P 11650 6050
F 0 "#PWR?" H 11650 5800 50  0001 C CNN
F 1 "GND" H 11655 5877 50  0000 C CNN
F 2 "" H 11650 6050 50  0001 C CNN
F 3 "" H 11650 6050 50  0001 C CNN
	1    11650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 5600 11650 5700
Wire Wire Line
	11300 5150 11650 5150
Wire Wire Line
	11650 5300 11650 5150
Connection ~ 11650 5150
Wire Wire Line
	11650 5150 12300 5150
Wire Wire Line
	11650 5700 10550 5700
Text Label 12300 5150 0    50   ~ 0
VOUT2
$Comp
L power:+5V #PWR?
U 1 1 6228241E
P 10900 4650
F 0 "#PWR?" H 10900 4500 50  0001 C CNN
F 1 "+5V" H 10915 4823 50  0000 C CNN
F 2 "" H 10900 4650 50  0001 C CNN
F 3 "" H 10900 4650 50  0001 C CNN
	1    10900 4650
	1    0    0    -1  
$EndComp
Text Label 9400 5050 2    50   ~ 0
VIN2
$Comp
L power:GND #PWR?
U 1 1 62206F7F
P 6050 6900
F 0 "#PWR?" H 6050 6650 50  0001 C CNN
F 1 "GND" H 6055 6727 50  0000 C CNN
F 2 "" H 6050 6900 50  0001 C CNN
F 3 "" H 6050 6900 50  0001 C CNN
	1    6050 6900
	1    0    0    -1  
$EndComp
Connection ~ 6050 6600
Wire Wire Line
	5750 6600 6050 6600
$Comp
L power:GND #PWR?
U 1 1 621C4303
P 6050 5350
F 0 "#PWR?" H 6050 5100 50  0001 C CNN
F 1 "GND" H 6055 5177 50  0000 C CNN
F 2 "" H 6050 5350 50  0001 C CNN
F 3 "" H 6050 5350 50  0001 C CNN
	1    6050 5350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R4
U 1 1 6213C1C2
P 6050 5200
F 0 "R4" H 5980 5154 50  0000 R CNN
F 1 "R_100K" H 5980 5245 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5980 5200 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6130 5200 50  0001 C CNN
F 4 "DK" H 6050 5200 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6050 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6530 5600 60  0001 C CNN "PurchasingLink"
	1    6050 5200
	-1   0    0    1   
$EndComp
Connection ~ 6050 5050
Wire Wire Line
	5750 5050 6050 5050
$Comp
L formula:R_100K R5
U 1 1 62174556
P 6050 6750
F 0 "R5" H 5980 6704 50  0000 R CNN
F 1 "R_100K" H 5980 6795 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5980 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6130 6750 50  0001 C CNN
F 4 "DK" H 6050 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6050 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6530 7150 60  0001 C CNN "PurchasingLink"
	1    6050 6750
	-1   0    0    1   
$EndComp
Text Label 5750 6600 2    50   ~ 0
VIN3
$Comp
L power:GND #PWR?
U 1 1 6222C2C2
P 7300 7000
F 0 "#PWR?" H 7300 6750 50  0001 C CNN
F 1 "GND" H 7305 6827 50  0000 C CNN
F 2 "" H 7300 7000 50  0001 C CNN
F 3 "" H 7300 7000 50  0001 C CNN
	1    7300 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6222C2AC
P 7300 6200
F 0 "#PWR?" H 7300 6050 50  0001 C CNN
F 1 "+5V" H 7315 6373 50  0000 C CNN
F 2 "" H 7300 6200 50  0001 C CNN
F 3 "" H 7300 6200 50  0001 C CNN
	1    7300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 6700 8100 6700
Wire Wire Line
	7000 6800 7100 6800
Text Notes 8550 4500 0    89   ~ 0
Sensing Circuits
$Comp
L formula:R_10K R8
U 1 1 6222C2D5
P 8100 7000
F 0 "R8" H 8170 7046 50  0000 L CNN
F 1 "R_10K" H 8170 6955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8030 7000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8180 7000 50  0001 C CNN
F 4 "DK" H 8100 7000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8100 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8580 7400 60  0001 C CNN "PurchasingLink"
	1    8100 7000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R9
U 1 1 6222C2CC
P 8100 7450
F 0 "R9" H 8170 7496 50  0000 L CNN
F 1 "R_10K_DNP" H 8170 7405 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8030 7450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8180 7450 50  0001 C CNN
F 4 "DK" H 8100 7450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8100 7450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8580 7850 60  0001 C CNN "PurchasingLink"
	1    8100 7450
	1    0    0    -1  
$EndComp
Connection ~ 8100 7250
Wire Wire Line
	8100 7250 8100 7300
Wire Wire Line
	7000 6800 7000 7250
$Comp
L power:GND #PWR?
U 1 1 6222C2B9
P 8100 7600
F 0 "#PWR?" H 8100 7350 50  0001 C CNN
F 1 "GND" H 8105 7427 50  0000 C CNN
F 2 "" H 8100 7600 50  0001 C CNN
F 3 "" H 8100 7600 50  0001 C CNN
	1    8100 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 7150 8100 7250
Wire Wire Line
	8100 6850 8100 6700
Connection ~ 8100 6700
Wire Wire Line
	8100 6700 8750 6700
Wire Wire Line
	8100 7250 7000 7250
Text Label 8750 6700 0    50   ~ 0
VOUT3
$Comp
L formula:R_10K R6
U 1 1 62221DD6
P 8050 5450
F 0 "R6" H 8120 5496 50  0000 L CNN
F 1 "R_10K" H 8120 5405 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7980 5450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8130 5450 50  0001 C CNN
F 4 "DK" H 8050 5450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8050 5450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8530 5850 60  0001 C CNN "PurchasingLink"
	1    8050 5450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R7
U 1 1 62221DCD
P 8050 5900
F 0 "R7" H 8120 5946 50  0000 L CNN
F 1 "R_10K_DNP" H 8120 5855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7980 5900 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8130 5900 50  0001 C CNN
F 4 "DK" H 8050 5900 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8050 5900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8530 6300 60  0001 C CNN "PurchasingLink"
	1    8050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5250 7100 5250
$Comp
L power:GND #PWR?
U 1 1 62221DC3
P 7300 5450
F 0 "#PWR?" H 7300 5200 50  0001 C CNN
F 1 "GND" H 7305 5277 50  0000 C CNN
F 2 "" H 7300 5450 50  0001 C CNN
F 3 "" H 7300 5450 50  0001 C CNN
	1    7300 5450
	1    0    0    -1  
$EndComp
Connection ~ 8050 5700
Wire Wire Line
	8050 5700 8050 5750
Wire Wire Line
	6950 5250 6950 5700
$Comp
L power:GND #PWR?
U 1 1 62221DBA
P 8050 6050
F 0 "#PWR?" H 8050 5800 50  0001 C CNN
F 1 "GND" H 8055 5877 50  0000 C CNN
F 2 "" H 8050 6050 50  0001 C CNN
F 3 "" H 8050 6050 50  0001 C CNN
	1    8050 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5600 8050 5700
Wire Wire Line
	7700 5150 8050 5150
Wire Wire Line
	8050 5300 8050 5150
Connection ~ 8050 5150
Wire Wire Line
	8050 5150 8700 5150
Wire Wire Line
	8050 5700 6950 5700
Text Label 8700 5150 0    50   ~ 0
VOUT1
$Comp
L power:+5V #PWR?
U 1 1 62221DAD
P 7300 4650
F 0 "#PWR?" H 7300 4500 50  0001 C CNN
F 1 "+5V" H 7315 4823 50  0000 C CNN
F 2 "" H 7300 4650 50  0001 C CNN
F 3 "" H 7300 4650 50  0001 C CNN
	1    7300 4650
	1    0    0    -1  
$EndComp
Text Label 5750 5050 2    50   ~ 0
VIN1
Wire Wire Line
	11300 6700 11700 6700
$Comp
L formula:R_10K R14
U 1 1 62282471
P 11700 7000
F 0 "R14" H 11770 7046 50  0000 L CNN
F 1 "R_10K" H 11770 6955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11630 7000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11780 7000 50  0001 C CNN
F 4 "DK" H 11700 7000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11700 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12180 7400 60  0001 C CNN "PurchasingLink"
	1    11700 7000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R15
U 1 1 62282468
P 11700 7450
F 0 "R15" H 11770 7496 50  0000 L CNN
F 1 "R_10K_DNP" H 11770 7405 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11630 7450 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11780 7450 50  0001 C CNN
F 4 "DK" H 11700 7450 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 11700 7450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 12180 7850 60  0001 C CNN "PurchasingLink"
	1    11700 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6228245C
P 11700 7600
F 0 "#PWR?" H 11700 7350 50  0001 C CNN
F 1 "GND" H 11705 7427 50  0000 C CNN
F 2 "" H 11700 7600 50  0001 C CNN
F 3 "" H 11700 7600 50  0001 C CNN
	1    11700 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 6850 11700 6700
Connection ~ 11700 6700
Wire Wire Line
	11700 6700 12350 6700
Text Label 12350 6700 0    50   ~ 0
VOUT4
$Comp
L formula:MCP6001 U6
U 1 1 620E1616
P 11000 6700
F 0 "U6" H 11344 6746 50  0000 L CNN
F 1 "MCP6001" H 11344 6655 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 10900 6800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 11000 6900 50  0001 C CNN
F 4 "DK" H 11100 7000 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 11200 7100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 11300 7200 60  0001 C CNN "PurchasingLink"
	1    11000 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622824AD
P 9550 6900
F 0 "#PWR?" H 9550 6650 50  0001 C CNN
F 1 "GND" H 9555 6727 50  0000 C CNN
F 2 "" H 9550 6900 50  0001 C CNN
F 3 "" H 9550 6900 50  0001 C CNN
	1    9550 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6600 9550 6600
Connection ~ 9550 6600
$Comp
L formula:R_100K R11
U 1 1 62282492
P 9550 6750
F 0 "R11" H 9480 6704 50  0000 R CNN
F 1 "R_100K" H 9480 6795 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 9480 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9630 6750 50  0001 C CNN
F 4 "DK" H 9550 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9550 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 10030 7150 60  0001 C CNN "PurchasingLink"
	1    9550 6750
	-1   0    0    1   
$EndComp
Text Label 9400 6600 2    50   ~ 0
VIN4
$Comp
L power:GND #PWR?
U 1 1 6228247F
P 10900 7000
F 0 "#PWR?" H 10900 6750 50  0001 C CNN
F 1 "GND" H 10905 6827 50  0000 C CNN
F 2 "" H 10900 7000 50  0001 C CNN
F 3 "" H 10900 7000 50  0001 C CNN
	1    10900 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62282479
P 10900 6200
F 0 "#PWR?" H 10900 6050 50  0001 C CNN
F 1 "+5V" H 10915 6373 50  0000 C CNN
F 2 "" H 10900 6200 50  0001 C CNN
F 3 "" H 10900 6200 50  0001 C CNN
	1    10900 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 6800 10700 6800
Wire Wire Line
	10600 6800 10600 7250
Wire Wire Line
	11700 7250 11700 7300
Wire Wire Line
	11700 7150 11700 7250
Connection ~ 11700 7250
Wire Wire Line
	11700 7250 10600 7250
$Comp
L formula:C_1uF C11
U 1 1 622CB044
P 10650 6300
F 0 "C11" H 10765 6396 50  0000 L CNN
F 1 "C_1uF" H 10765 6305 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10688 6900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 10675 7150 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 11075 6800 60  0001 C CNN "PurchasingLink"
	1    10650 6300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622CB8E2
P 10450 6300
F 0 "#PWR?" H 10450 6050 50  0001 C CNN
F 1 "GND" H 10455 6127 50  0000 C CNN
F 2 "" H 10450 6300 50  0001 C CNN
F 3 "" H 10450 6300 50  0001 C CNN
	1    10450 6300
	1    0    0    -1  
$EndComp
Wire Notes Line
	12800 8000 12800 4300
Wire Notes Line
	12800 4300 5350 4300
Wire Notes Line
	5350 4300 5350 8000
Wire Notes Line
	5350 8000 12800 8000
Text Label 1900 5950 0    50   ~ 0
GND
Text Label 1900 6150 0    50   ~ 0
CAN_+
Text Label 1900 6250 0    50   ~ 0
CAN_-
$Comp
L formula:MicroFit_RA_4 J2
U 1 1 62330E0D
P 1700 6750
F 0 "J2" H 1758 7125 50  0000 C CNN
F 1 "MicroFit_RA_4" H 1758 7034 50  0000 C CNN
F 2 "footprints:MicroFit_RA_4" H 1700 6450 50  0001 C CNN
F 3 "" H 1700 6750 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 1700 6750 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 1700 6750 50  0001 C CNN "PurchasingLink"
	1    1700 6750
	1    0    0    -1  
$EndComp
Text Label 1900 6600 0    50   ~ 0
GND
Text Label 1900 6800 0    50   ~ 0
CAN_+
Text Label 1900 6900 0    50   ~ 0
CAN_-
Wire Wire Line
	6050 5050 7100 5050
Wire Wire Line
	7300 4650 7300 4750
Wire Wire Line
	7250 4750 7300 4750
Connection ~ 7300 4750
Wire Wire Line
	7300 4750 7300 4850
Wire Wire Line
	9500 5050 10700 5050
Wire Wire Line
	10900 4650 10900 4750
Wire Wire Line
	10800 4750 10900 4750
Connection ~ 10900 4750
Wire Wire Line
	10900 4750 10900 4850
Wire Wire Line
	6050 6600 7100 6600
Wire Wire Line
	7300 6200 7300 6300
Wire Wire Line
	7200 6300 7300 6300
Connection ~ 7300 6300
Wire Wire Line
	7300 6300 7300 6400
Wire Wire Line
	9550 6600 10700 6600
Wire Wire Line
	10900 6200 10900 6300
Wire Wire Line
	10750 6300 10900 6300
Connection ~ 10900 6300
Wire Wire Line
	10900 6300 10900 6400
$Comp
L formula:MicroFit_RA_4 J3
U 1 1 62265EEC
P 7400 9350
F 0 "J3" H 7458 9725 50  0000 C CNN
F 1 "MicroFit_RA_4" H 7458 9634 50  0000 C CNN
F 2 "footprints:MicroFit_RA_4" H 7400 9050 50  0001 C CNN
F 3 "" H 7400 9350 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7400 9350 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7400 9350 50  0001 C CNN "PurchasingLink"
	1    7400 9350
	1    0    0    -1  
$EndComp
Text Label 7600 9200 0    50   ~ 0
START_BUTTON
Text Label 7600 9300 0    50   ~ 0
GND
Text Label 7600 9500 0    50   ~ 0
GND
Text Label 8450 9400 0    50   ~ 0
READY_TO_DRIVE_LED
$Comp
L formula:R_200 R19
U 1 1 6226D5CB
P 8300 9400
F 0 "R19" V 8093 9400 50  0000 C CNN
F 1 "R_200" V 8184 9400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 8230 9400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 8380 9400 50  0001 C CNN
F 4 "DK" H 8300 9400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 8300 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 8780 9800 60  0001 C CNN "PurchasingLink"
	1    8300 9400
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 9400 8150 9400
Wire Notes Line
	7100 8700 9350 8700
Wire Notes Line
	9350 8700 9350 9650
Wire Notes Line
	9350 9650 7100 9650
Wire Notes Line
	7100 9650 7100 8700
Text Notes 8050 8850 0    50   ~ 0
DRIVER UX
Text Label 3650 1100 0    50   ~ 0
START_BUTTON
Wire Wire Line
	3650 3500 3850 3500
Wire Wire Line
	3850 3500 3850 3100
Wire Wire Line
	3850 3100 4600 3100
Text Label 4600 3100 0    50   ~ 0
READY_TO_DRIVE_LED
$Comp
L power:+BATT #PWR?
U 1 1 6222643F
P 2150 6050
F 0 "#PWR?" H 2150 5900 50  0001 C CNN
F 1 "+BATT" H 2165 6223 50  0000 C CNN
F 2 "" H 2150 6050 50  0001 C CNN
F 3 "" H 2150 6050 50  0001 C CNN
	1    2150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6050 2150 6050
$Comp
L power:+BATT #PWR?
U 1 1 6222C4E4
P 2150 6700
F 0 "#PWR?" H 2150 6550 50  0001 C CNN
F 1 "+BATT" H 2165 6873 50  0000 C CNN
F 2 "" H 2150 6700 50  0001 C CNN
F 3 "" H 2150 6700 50  0001 C CNN
	1    2150 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6700 2150 6700
$Comp
L power:GND #PWR?
U 1 1 622260BD
P 10500 4750
F 0 "#PWR?" H 10500 4500 50  0001 C CNN
F 1 "GND" H 10505 4577 50  0000 C CNN
F 2 "" H 10500 4750 50  0001 C CNN
F 3 "" H 10500 4750 50  0001 C CNN
	1    10500 4750
	1    0    0    -1  
$EndComp
NoConn ~ 3650 2500
$Comp
L formula:R_200 R21
U 1 1 62286D84
P 4300 8650
F 0 "R21" H 4370 8696 50  0000 L CNN
F 1 "R_200" H 4370 8605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4230 8650 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4380 8650 50  0001 C CNN
F 4 "DK" H 4300 8650 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4300 8650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4780 9050 60  0001 C CNN "PurchasingLink"
	1    4300 8650
	1    0    0    -1  
$EndComp
Connection ~ 4300 8500
Wire Wire Line
	4300 8500 4650 8500
$Comp
L formula:LED_0805 D6
U 1 1 622882D2
P 4300 9000
F 0 "D6" V 4339 8883 50  0000 R CNN
F 1 "LED_0805" V 4248 8883 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 4200 9000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4300 9100 50  0001 C CNN
F 4 "DK" H 4300 9000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4300 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4700 9500 60  0001 C CNN "PurchasingLink"
	1    4300 9000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 8800 4300 8850
$Comp
L power:GND #PWR?
U 1 1 6228BE72
P 4300 9300
F 0 "#PWR?" H 4300 9050 50  0001 C CNN
F 1 "GND" H 4305 9127 50  0000 C CNN
F 2 "" H 4300 9300 50  0001 C CNN
F 3 "" H 4300 9300 50  0001 C CNN
	1    4300 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 9150 4300 9300
$Comp
L formula:R_1K R20
U 1 1 62294AC8
P 2000 8650
F 0 "R20" H 2070 8696 50  0000 L CNN
F 1 "R_1K" H 2070 8605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1930 8650 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2080 8650 50  0001 C CNN
F 4 "DK" H 2000 8650 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2000 8650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2480 9050 60  0001 C CNN "PurchasingLink"
	1    2000 8650
	1    0    0    -1  
$EndComp
Connection ~ 2000 8500
Wire Wire Line
	2000 8500 2450 8500
$Comp
L formula:LED_0805 D5
U 1 1 62295515
P 2000 9100
F 0 "D5" V 2039 8983 50  0000 R CNN
F 1 "LED_0805" V 1948 8983 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1900 9100 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2000 9200 50  0001 C CNN
F 4 "DK" H 2000 9100 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2000 9100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2400 9600 60  0001 C CNN "PurchasingLink"
	1    2000 9100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 8800 2000 8950
$Comp
L power:GND #PWR?
U 1 1 622A2F56
P 2000 9400
F 0 "#PWR?" H 2000 9150 50  0001 C CNN
F 1 "GND" H 2005 9227 50  0000 C CNN
F 2 "" H 2000 9400 50  0001 C CNN
F 3 "" H 2000 9400 50  0001 C CNN
	1    2000 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 9250 2000 9400
$Comp
L formula:F_500mA_16V F1
U 1 1 622A7605
P 1450 8500
F 0 "F1" V 1253 8500 50  0000 C CNN
F 1 "F_500mA_16V" V 1344 8500 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 1380 8500 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1530 8500 50  0001 C CNN
F 4 "DK" H 1450 8500 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1450 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1930 8900 60  0001 C CNN "PurchasingLink"
	1    1450 8500
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 8500 1650 8500
$Comp
L formula:D_Zener_18V D4
U 1 1 622B4E74
P 1650 8850
F 0 "D4" H 1650 9050 50  0000 L CNN
F 1 "D_Zener_18V" H 1450 8950 50  0000 L CNN
F 2 "footprints:DO-214AA" H 1550 8850 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1650 8950 50  0001 C CNN
F 4 "DK" H 1850 9150 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1750 9050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 2050 9350 60  0001 C CNN "PurchasingLink"
	1    1650 8850
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 8500 1650 8700
Connection ~ 1650 8500
Wire Wire Line
	1650 8500 2000 8500
$Comp
L power:GND #PWR?
U 1 1 622BB256
P 1650 9150
F 0 "#PWR?" H 1650 8900 50  0001 C CNN
F 1 "GND" H 1655 8977 50  0000 C CNN
F 2 "" H 1650 9150 50  0001 C CNN
F 3 "" H 1650 9150 50  0001 C CNN
	1    1650 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 9000 1650 9150
Wire Notes Line
	5250 7650 5250 9700
Wire Notes Line
	5250 9700 850  9700
Wire Notes Line
	850  9700 850  7650
Wire Notes Line
	850  7650 5250 7650
Wire Wire Line
	1050 8500 1300 8500
Wire Wire Line
	4650 8300 4650 8500
$EndSCHEMATC
