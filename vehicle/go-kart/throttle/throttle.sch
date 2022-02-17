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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:PWR_FLAG-power #FLG?
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
L throttle-rescue:PWR_FLAG-power #FLG?
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
L throttle-rescue:PWR_FLAG-power #FLG?
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
L throttle-rescue:GND-power #PWR?
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
L throttle-rescue:+5V-power #PWR?
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
L throttle-rescue:+5V-power #PWR?
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
L throttle-rescue:+5V-power #PWR?
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
L throttle-rescue:+5V-power #PWR?
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
L throttle-rescue:+5V-power #PWR?
U 1 1 5FD477AE
P 4450 3350
F 0 "#PWR?" H 4450 3200 50  0001 C CNN
F 1 "+5V" H 4465 3523 50  0000 C CNN
F 2 "" H 4450 3350 50  0001 C CNN
F 3 "" H 4450 3350 50  0001 C CNN
	1    4450 3350
	1    0    0    -1  
$EndComp
$Comp
L throttle-rescue:+BATT-power #PWR?
U 1 1 6160D1CA
P 14550 8450
F 0 "#PWR?" H 14550 8300 50  0001 C CNN
F 1 "+BATT" H 14565 8623 50  0000 C CNN
F 2 "" H 14550 8450 50  0001 C CNN
F 3 "" H 14550 8450 50  0001 C CNN
	1    14550 8450
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
L throttle-rescue:GND-power #PWR?
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
Text Label 6400 3800 2    50   ~ 0
VIN1
$Comp
L throttle-rescue:+5V-power #PWR?
U 1 1 62221DAD
P 7200 3600
F 0 "#PWR?" H 7200 3450 50  0001 C CNN
F 1 "+5V" H 7215 3773 50  0000 C CNN
F 2 "" H 7200 3600 50  0001 C CNN
F 3 "" H 7200 3600 50  0001 C CNN
	1    7200 3600
	1    0    0    -1  
$EndComp
Text Label 8600 3900 0    50   ~ 0
VOUT1
Wire Wire Line
	7950 4450 6850 4450
Wire Wire Line
	7950 3900 8600 3900
Connection ~ 7950 3900
Wire Wire Line
	7950 4050 7950 3900
Wire Wire Line
	7600 3900 7950 3900
Wire Wire Line
	7950 4350 7950 4450
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 62221DBA
P 7950 4800
F 0 "#PWR?" H 7950 4550 50  0001 C CNN
F 1 "GND" H 7955 4627 50  0000 C CNN
F 2 "" H 7950 4800 50  0001 C CNN
F 3 "" H 7950 4800 50  0001 C CNN
	1    7950 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4000 6850 4450
Wire Wire Line
	7950 4450 7950 4500
Connection ~ 7950 4450
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 62221DC3
P 7200 4200
F 0 "#PWR?" H 7200 3950 50  0001 C CNN
F 1 "GND" H 7205 4027 50  0000 C CNN
F 2 "" H 7200 4200 50  0001 C CNN
F 3 "" H 7200 4200 50  0001 C CNN
	1    7200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4000 7000 4000
$Comp
L formula:R_10K R7
U 1 1 62221DCD
P 7950 4650
F 0 "R7" H 8020 4696 50  0000 L CNN
F 1 "R_10K" H 8020 4605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7880 4650 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8030 4650 50  0001 C CNN
F 4 "DK" H 7950 4650 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 7950 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8430 5050 60  0001 C CNN "PurchasingLink"
	1    7950 4650
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R6
U 1 1 62221DD6
P 7950 4200
F 0 "R6" H 8020 4246 50  0000 L CNN
F 1 "R_10K" H 8020 4155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7880 4200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8030 4200 50  0001 C CNN
F 4 "DK" H 7950 4200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 7950 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8430 4600 60  0001 C CNN "PurchasingLink"
	1    7950 4200
	1    0    0    -1  
$EndComp
Text Label 3650 1500 0    50   ~ 0
VOUT2
Text Label 8650 5450 0    50   ~ 0
VOUT3
Wire Wire Line
	8000 6000 6900 6000
Wire Wire Line
	8000 5450 8650 5450
Connection ~ 8000 5450
Wire Wire Line
	8000 5600 8000 5450
Wire Wire Line
	8000 5900 8000 6000
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 6222C2B9
P 8000 6350
F 0 "#PWR?" H 8000 6100 50  0001 C CNN
F 1 "GND" H 8005 6177 50  0000 C CNN
F 2 "" H 8000 6350 50  0001 C CNN
F 3 "" H 8000 6350 50  0001 C CNN
	1    8000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5550 6900 6000
Wire Wire Line
	8000 6000 8000 6050
Connection ~ 8000 6000
$Comp
L formula:R_10K R9
U 1 1 6222C2CC
P 8000 6200
F 0 "R9" H 8070 6246 50  0000 L CNN
F 1 "R_10K" H 8070 6155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7930 6200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8080 6200 50  0001 C CNN
F 4 "DK" H 8000 6200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8000 6200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8480 6600 60  0001 C CNN "PurchasingLink"
	1    8000 6200
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R8
U 1 1 6222C2D5
P 8000 5750
F 0 "R8" H 8070 5796 50  0000 L CNN
F 1 "R_10K" H 8070 5705 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7930 5750 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8080 5750 50  0001 C CNN
F 4 "DK" H 8000 5750 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8000 5750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8480 6150 60  0001 C CNN "PurchasingLink"
	1    8000 5750
	1    0    0    -1  
$EndComp
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
L throttle-rescue:GND-power #PWR?
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
Text Label 3650 2500 0    50   ~ 0
PROGRAMMINGLED3
$Comp
L formula:MM_F_RA_04 J2
U 1 1 620F767C
P 1650 6150
F 0 "J2" H 1708 6597 60  0000 C CNN
F 1 "MM_F_RA_04" H 1708 6491 60  0000 C CNN
F 2 "footprints:micromatch_female_ra_4" H 1450 7250 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338070%7FG1%7Fpdf%7FEnglish%7FENG_CD_338070_G1.pdf%7F338070-4" H 1550 7350 60  0001 C CNN
F 4 "TE" H 1750 7550 60  0001 C CNN "MFN"
F 5 "338070-4" H 1850 7650 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-338070-4.html" H 1650 7450 60  0001 C CNN "PurchasingLink"
	1    1650 6150
	1    0    0    -1  
$EndComp
Text Label 1900 5950 0    50   ~ 0
GND
Text Label 1900 6050 0    50   ~ 0
5V
Text Label 1900 6150 0    50   ~ 0
CAN_+
Text Label 1900 6250 0    50   ~ 0
CAN_-
Text Notes 14350 5650 0    89   ~ 0
Programming LEDs
Text Notes 8450 3250 0    89   ~ 0
Sensing Circuits
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
L throttle-rescue:GND-power #PWR?
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
Wire Wire Line
	6900 5550 7000 5550
Wire Wire Line
	7600 5450 8000 5450
$Comp
L throttle-rescue:+5V-power #PWR?
U 1 1 6222C2AC
P 7200 5150
F 0 "#PWR?" H 7200 5000 50  0001 C CNN
F 1 "+5V" H 7215 5323 50  0000 C CNN
F 2 "" H 7200 5150 50  0001 C CNN
F 3 "" H 7200 5150 50  0001 C CNN
	1    7200 5150
	1    0    0    -1  
$EndComp
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 6222C2C2
P 7200 5750
F 0 "#PWR?" H 7200 5500 50  0001 C CNN
F 1 "GND" H 7205 5577 50  0000 C CNN
F 2 "" H 7200 5750 50  0001 C CNN
F 3 "" H 7200 5750 50  0001 C CNN
	1    7200 5750
	1    0    0    -1  
$EndComp
Text Label 6400 5350 2    50   ~ 0
VIN3
$Comp
L formula:R_100K R5
U 1 1 62174556
P 6500 5500
F 0 "R5" H 6430 5454 50  0000 R CNN
F 1 "R_100K" H 6430 5545 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 6430 5500 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6580 5500 50  0001 C CNN
F 4 "DK" H 6500 5500 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6500 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6980 5900 60  0001 C CNN "PurchasingLink"
	1    6500 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 3800 6500 3800
Connection ~ 6500 3800
Wire Wire Line
	6500 3800 7000 3800
$Comp
L formula:R_100K R4
U 1 1 6213C1C2
P 6500 3950
F 0 "R4" H 6430 3904 50  0000 R CNN
F 1 "R_100K" H 6430 3995 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 6430 3950 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6580 3950 50  0001 C CNN
F 4 "DK" H 6500 3950 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 6500 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6980 4350 60  0001 C CNN "PurchasingLink"
	1    6500 3950
	-1   0    0    1   
$EndComp
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 621C4303
P 6500 4100
F 0 "#PWR?" H 6500 3850 50  0001 C CNN
F 1 "GND" H 6505 3927 50  0000 C CNN
F 2 "" H 6500 4100 50  0001 C CNN
F 3 "" H 6500 4100 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5350 6500 5350
Connection ~ 6500 5350
Wire Wire Line
	6500 5350 7000 5350
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 62206F7F
P 6500 5650
F 0 "#PWR?" H 6500 5400 50  0001 C CNN
F 1 "GND" H 6505 5477 50  0000 C CNN
F 2 "" H 6500 5650 50  0001 C CNN
F 3 "" H 6500 5650 50  0001 C CNN
	1    6500 5650
	1    0    0    -1  
$EndComp
Text Label 9350 3800 2    50   ~ 0
VIN2
$Comp
L throttle-rescue:+5V-power #PWR?
U 1 1 6228241E
P 10150 3600
F 0 "#PWR?" H 10150 3450 50  0001 C CNN
F 1 "+5V" H 10165 3773 50  0000 C CNN
F 2 "" H 10150 3600 50  0001 C CNN
F 3 "" H 10150 3600 50  0001 C CNN
	1    10150 3600
	1    0    0    -1  
$EndComp
Text Label 11550 3900 0    50   ~ 0
VOUT2
Wire Wire Line
	10900 4450 9800 4450
Wire Wire Line
	10900 3900 11550 3900
Connection ~ 10900 3900
Wire Wire Line
	10900 4050 10900 3900
Wire Wire Line
	10550 3900 10900 3900
Wire Wire Line
	10900 4350 10900 4450
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 6228242B
P 10900 4800
F 0 "#PWR?" H 10900 4550 50  0001 C CNN
F 1 "GND" H 10905 4627 50  0000 C CNN
F 2 "" H 10900 4800 50  0001 C CNN
F 3 "" H 10900 4800 50  0001 C CNN
	1    10900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4000 9800 4450
Wire Wire Line
	10900 4450 10900 4500
Connection ~ 10900 4450
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 62282434
P 10150 4200
F 0 "#PWR?" H 10150 3950 50  0001 C CNN
F 1 "GND" H 10155 4027 50  0000 C CNN
F 2 "" H 10150 4200 50  0001 C CNN
F 3 "" H 10150 4200 50  0001 C CNN
	1    10150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4000 9950 4000
$Comp
L formula:R_10K R13
U 1 1 6228243E
P 10900 4650
F 0 "R13" H 10970 4696 50  0000 L CNN
F 1 "R_10K" H 10970 4605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10830 4650 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10980 4650 50  0001 C CNN
F 4 "DK" H 10900 4650 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10900 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 11380 5050 60  0001 C CNN "PurchasingLink"
	1    10900 4650
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R12
U 1 1 62282447
P 10900 4200
F 0 "R12" H 10970 4246 50  0000 L CNN
F 1 "R_10K" H 10970 4155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10830 4200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10980 4200 50  0001 C CNN
F 4 "DK" H 10900 4200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10900 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 11380 4600 60  0001 C CNN "PurchasingLink"
	1    10900 4200
	1    0    0    -1  
$EndComp
Text Label 11600 5450 0    50   ~ 0
VOUT4
Wire Wire Line
	10950 6000 9850 6000
Wire Wire Line
	10950 5450 11600 5450
Connection ~ 10950 5450
Wire Wire Line
	10950 5600 10950 5450
Wire Wire Line
	10950 5900 10950 6000
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 6228245C
P 10950 6350
F 0 "#PWR?" H 10950 6100 50  0001 C CNN
F 1 "GND" H 10955 6177 50  0000 C CNN
F 2 "" H 10950 6350 50  0001 C CNN
F 3 "" H 10950 6350 50  0001 C CNN
	1    10950 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5550 9850 6000
Wire Wire Line
	10950 6000 10950 6050
Connection ~ 10950 6000
$Comp
L formula:R_10K R15
U 1 1 62282468
P 10950 6200
F 0 "R15" H 11020 6246 50  0000 L CNN
F 1 "R_10K" H 11020 6155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10880 6200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11030 6200 50  0001 C CNN
F 4 "DK" H 10950 6200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10950 6200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 11430 6600 60  0001 C CNN "PurchasingLink"
	1    10950 6200
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R14
U 1 1 62282471
P 10950 5750
F 0 "R14" H 11020 5796 50  0000 L CNN
F 1 "R_10K" H 11020 5705 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 10880 5750 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 11030 5750 50  0001 C CNN
F 4 "DK" H 10950 5750 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10950 5750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 11430 6150 60  0001 C CNN "PurchasingLink"
	1    10950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5550 9950 5550
Wire Wire Line
	10550 5450 10950 5450
$Comp
L throttle-rescue:+5V-power #PWR?
U 1 1 62282479
P 10150 5150
F 0 "#PWR?" H 10150 5000 50  0001 C CNN
F 1 "+5V" H 10165 5323 50  0000 C CNN
F 2 "" H 10150 5150 50  0001 C CNN
F 3 "" H 10150 5150 50  0001 C CNN
	1    10150 5150
	1    0    0    -1  
$EndComp
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 6228247F
P 10150 5750
F 0 "#PWR?" H 10150 5500 50  0001 C CNN
F 1 "GND" H 10155 5577 50  0000 C CNN
F 2 "" H 10150 5750 50  0001 C CNN
F 3 "" H 10150 5750 50  0001 C CNN
	1    10150 5750
	1    0    0    -1  
$EndComp
Text Label 9350 5350 2    50   ~ 0
VIN4
$Comp
L formula:R_100K R11
U 1 1 62282492
P 9450 5500
F 0 "R11" H 9380 5454 50  0000 R CNN
F 1 "R_100K" H 9380 5545 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 9380 5500 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9530 5500 50  0001 C CNN
F 4 "DK" H 9450 5500 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9450 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9930 5900 60  0001 C CNN "PurchasingLink"
	1    9450 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 3800 9450 3800
Connection ~ 9450 3800
Wire Wire Line
	9450 3800 9950 3800
$Comp
L formula:R_100K R10
U 1 1 6228249E
P 9450 3950
F 0 "R10" H 9380 3904 50  0000 R CNN
F 1 "R_100K" H 9380 3995 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 9380 3950 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 9530 3950 50  0001 C CNN
F 4 "DK" H 9450 3950 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 9450 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9930 4350 60  0001 C CNN "PurchasingLink"
	1    9450 3950
	-1   0    0    1   
$EndComp
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 622824A4
P 9450 4100
F 0 "#PWR?" H 9450 3850 50  0001 C CNN
F 1 "GND" H 9455 3927 50  0000 C CNN
F 2 "" H 9450 4100 50  0001 C CNN
F 3 "" H 9450 4100 50  0001 C CNN
	1    9450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 5350 9450 5350
Connection ~ 9450 5350
Wire Wire Line
	9450 5350 9950 5350
$Comp
L throttle-rescue:GND-power #PWR?
U 1 1 622824AD
P 9450 5650
F 0 "#PWR?" H 9450 5400 50  0001 C CNN
F 1 "GND" H 9455 5477 50  0000 C CNN
F 2 "" H 9450 5650 50  0001 C CNN
F 3 "" H 9450 5650 50  0001 C CNN
	1    9450 5650
	1    0    0    -1  
$EndComp
Wire Notes Line
	12050 2950 12050 6700
Wire Notes Line
	12050 6700 6100 6700
Wire Notes Line
	6100 6700 6100 2900
Wire Notes Line
	6100 2900 12050 2900
$Comp
L formula:MM_F_RA_04 J3
U 1 1 6229CEB2
P 1650 6950
F 0 "J3" H 1708 7397 60  0000 C CNN
F 1 "MM_F_RA_04" H 1708 7291 60  0000 C CNN
F 2 "footprints:micromatch_female_ra_4" H 1450 8050 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338070%7FG1%7Fpdf%7FEnglish%7FENG_CD_338070_G1.pdf%7F338070-4" H 1550 8150 60  0001 C CNN
F 4 "TE" H 1750 8350 60  0001 C CNN "MFN"
F 5 "338070-4" H 1850 8450 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-338070-4.html" H 1650 8250 60  0001 C CNN "PurchasingLink"
	1    1650 6950
	1    0    0    -1  
$EndComp
Text Label 1900 6750 0    50   ~ 0
GND
Text Label 1900 6850 0    50   ~ 0
5V
Text Label 1900 6950 0    50   ~ 0
CAN_+
Text Label 1900 7050 0    50   ~ 0
CAN_-
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
Text Label 2750 6050 0    50   ~ 0
VIN1
Text Label 2750 6150 0    50   ~ 0
5V
Text Label 2750 6250 0    50   ~ 0
GND
Text Label 2750 6550 0    50   ~ 0
GND
Text Label 2750 6850 0    50   ~ 0
GND
Text Label 2750 6450 0    50   ~ 0
5V
Text Label 2750 6750 0    50   ~ 0
5V
Text Label 2750 7050 0    50   ~ 0
5V
Text Label 2750 6350 0    50   ~ 0
VIN2
Text Label 2750 6650 0    50   ~ 0
VIN3
Text Label 2750 6950 0    50   ~ 0
VIN4
Text Notes 1800 5550 0    89   ~ 0
Connectors
NoConn ~ 3650 1000
NoConn ~ 3650 1100
NoConn ~ 3650 1300
NoConn ~ 3650 1400
NoConn ~ 3650 1900
NoConn ~ 3650 2000
NoConn ~ 3650 2600
NoConn ~ 3650 2800
NoConn ~ 3650 2900
NoConn ~ 3650 3300
NoConn ~ 3650 3400
NoConn ~ 3650 3500
Wire Notes Line
	1300 5350 1300 7200
Wire Notes Line
	1300 7200 3100 7200
Wire Notes Line
	3100 7200 3100 5350
Wire Notes Line
	3100 5350 1300 5350
$Comp
L formula:MCP6001 U3
U 1 1 620D9172
P 7300 3900
F 0 "U3" H 7644 3946 50  0000 L CNN
F 1 "MCP6001" H 7644 3855 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7200 4000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7300 4100 50  0001 C CNN
F 4 "DK" H 7400 4200 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 7500 4300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 7600 4400 60  0001 C CNN "PurchasingLink"
	1    7300 3900
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U4
U 1 1 620E07FC
P 7300 5450
F 0 "U4" H 7644 5496 50  0000 L CNN
F 1 "MCP6001" H 7644 5405 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 7200 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7300 5650 50  0001 C CNN
F 4 "DK" H 7400 5750 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 7500 5850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 7600 5950 60  0001 C CNN "PurchasingLink"
	1    7300 5450
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U5
U 1 1 620E0E33
P 10250 3900
F 0 "U5" H 10594 3946 50  0000 L CNN
F 1 "MCP6001" H 10594 3855 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 10150 4000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 10250 4100 50  0001 C CNN
F 4 "DK" H 10350 4200 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 10450 4300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 10550 4400 60  0001 C CNN "PurchasingLink"
	1    10250 3900
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001 U6
U 1 1 620E1616
P 10250 5450
F 0 "U6" H 10594 5496 50  0000 L CNN
F 1 "MCP6001" H 10594 5405 50  0000 L CNN
F 2 "footprints:SOT-23-5_OEM" H 10150 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 10250 5650 50  0001 C CNN
F 4 "DK" H 10350 5750 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/OTCT-ND" H 10450 5850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-OT/MCP6001T-I-OTCT-ND/697158" H 10550 5950 60  0001 C CNN "PurchasingLink"
	1    10250 5450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
