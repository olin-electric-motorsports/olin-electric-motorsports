EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Firmware Tester Board"
Date "2022-02-10"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Luke Raus"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4000 2550 0    50   ~ 0
CAN_TX
Text Label 4000 2650 0    50   ~ 0
CAN_RX
Text Label 4000 3450 0    50   ~ 0
MISO
Text Label 4800 4150 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1500 1600
F 0 "R1" V 1400 1550 50  0000 L CNN
F 1 "R_100" V 1590 1480 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 700 1750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1200 2100 50  0001 C CNN
F 4 "DK" H 1500 1600 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 850 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1980 2000 60  0001 C CNN "PurchasingLink"
	1    1500 1600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C2
U 1 1 5D58E505
P 1500 1900
F 0 "C2" V 1550 1750 50  0000 L CNN
F 1 "C_100pF" V 1350 1720 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1538 1750 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1525 2000 50  0001 C CNN
F 4 "DK" H 1500 1900 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1500 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1925 2400 60  0001 C CNN "PurchasingLink"
	1    1500 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 1150 1750
F 0 "#PWR?" H 1150 1500 50  0001 C CNN
F 1 "GND" H 1155 1577 50  0000 C CNN
F 2 "" H 1150 1750 50  0001 C CNN
F 3 "" H 1150 1750 50  0001 C CNN
	1    1150 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1500 2050
F 0 "#PWR?" H 1500 1800 50  0001 C CNN
F 1 "GND" H 1505 1877 50  0000 C CNN
F 2 "" H 1500 2050 50  0001 C CNN
F 3 "" H 1500 2050 50  0001 C CNN
	1    1500 2050
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4450 4550
F 0 "Y1" H 4160 4620 50  0000 L CNN
F 1 "Crystal_SMD" H 3770 4550 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4400 4625 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4500 4725 50  0001 C CNN
F 4 "DK" H 4450 4550 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4450 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4900 5125 60  0001 C CNN "PurchasingLink"
	1    4450 4550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C3
U 1 1 5D5EB5B2
P 4250 4800
F 0 "C3" H 4140 4880 50  0000 L CNN
F 1 "C_30pF" H 3980 4720 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4288 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4275 4900 50  0001 C CNN
F 4 "DK" H 4250 4800 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4250 4800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4675 5300 60  0001 C CNN "PurchasingLink"
	1    4250 4800
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB694
P 4650 4800
F 0 "C4" H 4670 4880 50  0000 L CNN
F 1 "C_30pF" H 4680 4700 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4688 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4675 4900 50  0001 C CNN
F 4 "DK" H 4650 4800 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4650 4800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 5075 5300 60  0001 C CNN "PurchasingLink"
	1    4650 4800
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R2
U 1 1 5D5EB7F3
P 4800 3950
F 0 "R2" V 4720 3950 50  0000 C CNN
F 1 "R_10K" V 4850 4200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4730 3950 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4880 3950 50  0001 C CNN
F 4 "DK" H 4800 3950 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4800 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5280 4350 60  0001 C CNN "PurchasingLink"
	1    4800 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 4250 4950
F 0 "#PWR?" H 4250 4700 50  0001 C CNN
F 1 "GND" H 4255 4777 50  0000 C CNN
F 2 "" H 4250 4950 50  0001 C CNN
F 3 "" H 4250 4950 50  0001 C CNN
	1    4250 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4650 4950
F 0 "#PWR?" H 4650 4700 50  0001 C CNN
F 1 "GND" H 4655 4777 50  0000 C CNN
F 2 "" H 4650 4950 50  0001 C CNN
F 3 "" H 4650 4950 50  0001 C CNN
	1    4650 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4450 4700
F 0 "#PWR?" H 4450 4450 50  0001 C CNN
F 1 "GND" H 4455 4527 50  0000 C CNN
F 2 "" H 4450 4700 50  0001 C CNN
F 3 "" H 4450 4700 50  0001 C CNN
	1    4450 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4800 4400
F 0 "#PWR?" H 4800 4150 50  0001 C CNN
F 1 "GND" H 4805 4227 50  0000 C CNN
F 2 "" H 4800 4400 50  0001 C CNN
F 3 "" H 4800 4400 50  0001 C CNN
	1    4800 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1650 4500
F 0 "#PWR?" H 1650 4250 50  0001 C CNN
F 1 "GND" H 1655 4327 50  0000 C CNN
F 2 "" H 1650 4500 50  0001 C CNN
F 3 "" H 1650 4500 50  0001 C CNN
	1    1650 4500
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U3
U 1 1 5D5FAEDE
P 6800 9250
F 0 "U3" H 7160 9600 50  0000 C CNN
F 1 "MCP2561-E_SN" H 7150 8890 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 6800 8750 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 6400 9600 50  0001 C CNN
F 4 "DK" H 6800 9250 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 6800 9250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 6800 10000 60  0001 C CNN "PurchasingLink"
	1    6800 9250
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C7
U 1 1 5D5FB603
P 6650 8650
F 0 "C7" V 6600 8760 50  0000 C CNN
F 1 "C_0.1uF" V 6610 8460 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 6688 8500 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6675 8750 50  0001 C CNN
F 4 "DK" H 6650 8650 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6650 8650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7075 9150 60  0001 C CNN "PurchasingLink"
	1    6650 8650
	0    1    1    0   
$EndComp
NoConn ~ 7300 9250
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 6500 8800
F 0 "#PWR?" H 6500 8550 50  0001 C CNN
F 1 "GND" H 6400 8800 50  0000 C CNN
F 2 "" H 6500 8800 50  0001 C CNN
F 3 "" H 6500 8800 50  0001 C CNN
	1    6500 8800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 6800 9650
F 0 "#PWR?" H 6800 9400 50  0001 C CNN
F 1 "GND" H 6805 9477 50  0000 C CNN
F 2 "" H 6800 9650 50  0001 C CNN
F 3 "" H 6800 9650 50  0001 C CNN
	1    6800 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 6300 9450
F 0 "#PWR?" H 6300 9200 50  0001 C CNN
F 1 "GND" H 6305 9277 50  0000 C CNN
F 2 "" H 6300 9450 50  0001 C CNN
F 3 "" H 6300 9450 50  0001 C CNN
	1    6300 9450
	1    0    0    -1  
$EndComp
Text Label 6300 9050 2    50   ~ 0
CAN_TX
Text Label 6300 9150 2    50   ~ 0
CAN_RX
Text Label 7800 8600 0    50   ~ 0
CAN_+
Text Label 7800 9400 0    50   ~ 0
CAN_-
Text Notes 6600 8000 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2500 1050 0    89   ~ 0
ATMEGA 64M1\n
Text Notes 3900 5350 0    89   ~ 0
16 MHz CRYSTAL\n
$Comp
L formula:CONN_02X03 J13
U 1 1 5D628C9D
P 13850 5400
F 0 "J13" H 13850 5610 50  0000 C CNN
F 1 "CONN_02X03" H 13740 5200 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 13850 4200 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 13850 4200 50  0001 C CNN
F 4 "DK" H 13850 5400 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 13850 5400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 14250 6000 60  0001 C CNN "PurchasingLink"
	1    13850 5400
	1    0    0    -1  
$EndComp
Text Label 13600 5300 2    50   ~ 0
MISO
Text Label 13600 5400 2    50   ~ 0
SCK
Text Label 13600 5500 2    50   ~ 0
RESET
Text Label 14100 5400 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 14100 5500
F 0 "#PWR?" H 14100 5250 50  0001 C CNN
F 1 "GND" H 14105 5327 50  0000 C CNN
F 2 "" H 14100 5500 50  0001 C CNN
F 3 "" H 14100 5500 50  0001 C CNN
	1    14100 5500
	1    0    0    -1  
$EndComp
Text Notes 12850 4800 0    89   ~ 0
64M1 PROGRAMMING HEADER\n
Wire Wire Line
	1800 1750 1500 1750
Connection ~ 1500 1750
$Comp
L formula:C_0.1uF C1
U 1 1 5D58E34B
P 1150 1600
F 0 "C1" V 1200 1460 50  0000 L CNN
F 1 "C_0.1uF" V 1010 1440 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1188 1450 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1175 1700 50  0001 C CNN
F 4 "DK" H 1150 1600 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1150 1600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1575 2100 60  0001 C CNN "PurchasingLink"
	1    1150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1300 1150 1450
Wire Wire Line
	1150 1450 1500 1450
Connection ~ 1150 1450
Connection ~ 1500 1450
Wire Wire Line
	1500 1450 1800 1450
Wire Wire Line
	1650 4500 1650 4350
Wire Wire Line
	1650 3950 1800 3950
Wire Wire Line
	1800 4350 1650 4350
Connection ~ 1650 4350
Wire Wire Line
	1650 4350 1650 3950
NoConn ~ 1800 2150
Wire Wire Line
	4250 4650 4250 4550
Wire Wire Line
	4250 4550 4350 4550
Wire Wire Line
	4550 4550 4650 4550
Wire Wire Line
	4650 4550 4650 4650
Wire Wire Line
	4450 4400 4800 4400
Wire Wire Line
	4650 4550 4650 4250
Wire Wire Line
	4650 4250 4000 4250
Connection ~ 4650 4550
Wire Wire Line
	4250 4550 4250 4350
Wire Wire Line
	4250 4350 4000 4350
Connection ~ 4250 4550
Wire Wire Line
	4500 4150 4500 3950
Connection ~ 4500 4150
Wire Wire Line
	4500 4150 4800 4150
Wire Wire Line
	4950 3950 5100 3950
Wire Wire Line
	5100 3950 5100 3800
Wire Wire Line
	6500 8650 6500 8800
Wire Wire Line
	6800 8850 6800 8650
Connection ~ 6800 8650
Wire Wire Line
	6800 8650 6800 8500
Wire Wire Line
	7300 9150 7400 9150
Wire Wire Line
	7400 9350 7400 9400
Wire Wire Line
	7300 9350 7400 9350
$Comp
L formula:R_120_DNP R6
U 1 1 5FA5AB4A
P 7650 9150
F 0 "R6" H 7720 9196 50  0000 L CNN
F 1 "R_120" H 7720 9105 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6450 9300 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 6450 9600 50  0001 L CNN
F 4 "DK" H 7650 9150 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 6450 9400 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 6450 9500 60  0001 L CNN "PurchasingLink"
	1    7650 9150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 1150 1300
F 0 "#PWR?" H 1150 1150 50  0001 C CNN
F 1 "+5V" H 1165 1473 50  0000 C CNN
F 2 "" H 1150 1300 50  0001 C CNN
F 3 "" H 1150 1300 50  0001 C CNN
	1    1150 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3B2BE
P 6800 8500
F 0 "#PWR?" H 6800 8350 50  0001 C CNN
F 1 "+5V" H 6815 8673 50  0000 C CNN
F 2 "" H 6800 8500 50  0001 C CNN
F 3 "" H 6800 8500 50  0001 C CNN
	1    6800 8500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 14100 5300
F 0 "#PWR?" H 14100 5150 50  0001 C CNN
F 1 "+5V" H 14115 5473 50  0000 C CNN
F 2 "" H 14100 5300 50  0001 C CNN
F 3 "" H 14100 5300 50  0001 C CNN
	1    14100 5300
	1    0    0    -1  
$EndComp
Text Notes 4500 3550 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 5100 3800
F 0 "#PWR?" H 5100 3650 50  0001 C CNN
F 1 "+5V" H 5115 3973 50  0000 C CNN
F 2 "" H 5100 3800 50  0001 C CNN
F 3 "" H 5100 3800 50  0001 C CNN
	1    5100 3800
	1    0    0    -1  
$EndComp
Text Label 4000 1450 0    50   ~ 0
PB0
Text Label 4000 1550 0    50   ~ 0
PB1
Text Label 4000 1650 0    50   ~ 0
PB2_ADC5
Text Label 4000 1750 0    50   ~ 0
PB3
Text Label 4000 1850 0    50   ~ 0
PB4
Text Label 4000 1950 0    50   ~ 0
PB5_ADC6
Text Label 4000 2050 0    50   ~ 0
PB6_ADC7
Text Label 4000 2150 0    50   ~ 0
PB7_ADC4
Text Label 4000 2350 0    50   ~ 0
PC0
Text Label 4000 2450 0    50   ~ 0
PC1
Text Label 4000 2750 0    50   ~ 0
PC4_ADC8
Text Label 4000 2850 0    50   ~ 0
PC5_ADC9
Text Label 4000 2950 0    50   ~ 0
PC6_ADC10
Text Label 4000 3050 0    50   ~ 0
PC7
Text Label 4000 3250 0    50   ~ 0
PD0
Text Label 4000 3350 0    50   ~ 0
PD1
Text Label 4000 3750 0    50   ~ 0
PD5_ADC2
Text Label 4000 3850 0    50   ~ 0
PD6_ADC3
Text Label 4000 3950 0    50   ~ 0
PD7
Wire Wire Line
	4000 4150 4500 4150
Text Label 4000 3650 0    50   ~ 0
SCK
Text Label 4000 3550 0    50   ~ 0
MOSI
Text Notes 6450 1150 0    89   ~ 0
GPIO/ADC BREAKOUT JUMPERS
Text Label 7300 2150 2    50   ~ 0
PD6_ADC3
Text Label 7300 1650 2    50   ~ 0
PD5_ADC2
Text Label 7300 2250 2    50   ~ 0
ADC3
$Comp
L formula:CONN_01X03 J2
U 1 1 621B46D6
P 7550 2150
F 0 "J2" H 7578 2191 50  0000 L CNN
F 1 "CONN_01X03" H 7578 2100 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 950 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 950 50  0001 C CNN
F 4 "Mouser" H 7550 2150 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 2150 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 2750 60  0001 C CNN "PurchasingLink"
	1    7550 2150
	1    0    0    -1  
$EndComp
Text Label 7300 5750 2    50   ~ 0
ADC10
Text Label 7300 5650 2    50   ~ 0
PC6_ADC10
Text Label 7300 5150 2    50   ~ 0
PC5_ADC9
Text Label 7300 4650 2    50   ~ 0
PC4_ADC8
Text Label 7300 2650 2    50   ~ 0
PB7_ADC4
Text Label 7300 4150 2    50   ~ 0
PB6_ADC7
Text Label 7300 3650 2    50   ~ 0
PB5_ADC6
Text Label 7300 3150 2    50   ~ 0
PB2_ADC5
Text Notes 11150 1150 0    89   ~ 0
I/O PASSTHROUGH CONNECTOR
Text Notes 9750 4800 0    89   ~ 0
CAN/GND SCREW TERMINAL
Wire Wire Line
	10100 5450 10250 5450
$Comp
L power:GND #PWR?
U 1 1 62150659
P 10100 5450
F 0 "#PWR?" H 10100 5200 50  0001 C CNN
F 1 "GND" H 10105 5277 50  0000 C CNN
F 2 "" H 10100 5450 50  0001 C CNN
F 3 "" H 10100 5450 50  0001 C CNN
	1    10100 5450
	1    0    0    -1  
$EndComp
Text Label 10250 5350 2    50   ~ 0
CAN_-
Text Label 10250 5250 2    50   ~ 0
CAN_+
$Comp
L Connector:Screw_Terminal_01x03 J11
U 1 1 621288BD
P 10450 5350
F 0 "J11" H 10530 5392 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 10530 5301 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-3_1x03_P5.00mm_Horizontal" H 10450 5350 50  0001 C CNN
F 3 "~" H 10450 5350 50  0001 C CNN
	1    10450 5350
	1    0    0    -1  
$EndComp
Text Label 7300 1750 2    50   ~ 0
ADC2
$Comp
L formula:CONN_01X03 J1
U 1 1 6207E8DA
P 7550 1650
F 0 "J1" H 7578 1691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 1600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 450 50  0001 C CNN
F 4 "Mouser" H 7550 1650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 1650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 2250 60  0001 C CNN "PurchasingLink"
	1    7550 1650
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_01X03 J9
U 1 1 6207C7B6
P 7550 5650
F 0 "J9" H 7578 5691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 5600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 4450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 4450 50  0001 C CNN
F 4 "Mouser" H 7550 5650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 5650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 6250 60  0001 C CNN "PurchasingLink"
	1    7550 5650
	1    0    0    -1  
$EndComp
Text Label 7300 5250 2    50   ~ 0
ADC9
$Comp
L formula:CONN_01X03 J8
U 1 1 6207B142
P 7550 5150
F 0 "J8" H 7578 5191 50  0000 L CNN
F 1 "CONN_01X03" H 7578 5100 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 3950 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 3950 50  0001 C CNN
F 4 "Mouser" H 7550 5150 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 5150 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 5750 60  0001 C CNN "PurchasingLink"
	1    7550 5150
	1    0    0    -1  
$EndComp
Text Label 7300 4750 2    50   ~ 0
ADC8
$Comp
L formula:CONN_01X03 J7
U 1 1 6207A336
P 7550 4650
F 0 "J7" H 7578 4691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 4600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 3450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 3450 50  0001 C CNN
F 4 "Mouser" H 7550 4650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 4650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 5250 60  0001 C CNN "PurchasingLink"
	1    7550 4650
	1    0    0    -1  
$EndComp
Text Label 7300 2750 2    50   ~ 0
ADC4
$Comp
L formula:CONN_01X03 J3
U 1 1 6207813A
P 7550 2650
F 0 "J3" H 7578 2691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 2600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 1450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 1450 50  0001 C CNN
F 4 "Mouser" H 7550 2650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 2650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 3250 60  0001 C CNN "PurchasingLink"
	1    7550 2650
	1    0    0    -1  
$EndComp
Text Label 7300 4250 2    50   ~ 0
ADC7
$Comp
L formula:CONN_01X03 J6
U 1 1 62077318
P 7550 4150
F 0 "J6" H 7578 4191 50  0000 L CNN
F 1 "CONN_01X03" H 7578 4100 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 2950 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 2950 50  0001 C CNN
F 4 "Mouser" H 7550 4150 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 4150 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 4750 60  0001 C CNN "PurchasingLink"
	1    7550 4150
	1    0    0    -1  
$EndComp
Text Label 7300 3750 2    50   ~ 0
ADC6
$Comp
L formula:CONN_01X03 J5
U 1 1 62076566
P 7550 3650
F 0 "J5" H 7578 3691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 3600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 2450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 2450 50  0001 C CNN
F 4 "Mouser" H 7550 3650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 3650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 4250 60  0001 C CNN "PurchasingLink"
	1    7550 3650
	1    0    0    -1  
$EndComp
Text Label 7300 3250 2    50   ~ 0
ADC5
Text Label 7300 3050 2    50   ~ 0
PB2
$Comp
L formula:CONN_01X03 J4
U 1 1 6203A778
P 7550 3150
F 0 "J4" H 7578 3191 50  0000 L CNN
F 1 "CONN_01X03" H 7578 3100 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 1950 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 1950 50  0001 C CNN
F 4 "Mouser" H 7550 3150 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 3150 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 3750 60  0001 C CNN "PurchasingLink"
	1    7550 3150
	1    0    0    -1  
$EndComp
Text Label 7300 3550 2    50   ~ 0
PB5
Text Label 7300 4050 2    50   ~ 0
PB6
Text Label 7300 2550 2    50   ~ 0
PB7
Text Label 7300 4550 2    50   ~ 0
PC4
Text Label 7300 5050 2    50   ~ 0
PC5
Text Label 7300 5550 2    50   ~ 0
PC6
Text Label 7300 1550 2    50   ~ 0
PD5
Text Notes 1400 6050 0    89   ~ 0
RESET BUTTON
Wire Wire Line
	4500 3950 4650 3950
Text Notes 2550 8000 0    89   ~ 0
5V LDO
Text Label 7300 2050 2    50   ~ 0
PD6
$Comp
L formula:SW_Push_SPST_NO SW1
U 1 1 621995EC
P 1950 6650
F 0 "SW1" H 1950 6935 50  0000 C CNN
F 1 "SW_Push_SPST_NO" H 1950 6844 50  0000 C CNN
F 2 "footprints:SW_B3U-1000P_4.2x1.7mm" H 1950 6700 50  0001 C CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 1950 6700 50  0001 C CNN
F 4 "DK" H 2250 7000 50  0001 C CNN "MFN"
F 5 "SW1020CT-ND" H 2150 6900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357A" H 2350 7100 50  0001 C CNN "PurchasingLink"
	1    1950 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6219B75A
P 2350 6650
F 0 "#PWR?" H 2350 6400 50  0001 C CNN
F 1 "GND" H 2355 6477 50  0000 C CNN
F 2 "" H 2350 6650 50  0001 C CNN
F 3 "" H 2350 6650 50  0001 C CNN
	1    2350 6650
	1    0    0    -1  
$EndComp
Text Label 1550 6650 2    50   ~ 0
RESET
$Comp
L power:GND #PWR?
U 1 1 6221CDE3
P 14250 1750
F 0 "#PWR?" H 14250 1500 50  0001 C CNN
F 1 "GND" H 14255 1577 50  0000 C CNN
F 2 "" H 14250 1750 50  0001 C CNN
F 3 "" H 14250 1750 50  0001 C CNN
	1    14250 1750
	1    0    0    -1  
$EndComp
Text Label 14050 1850 2    50   ~ 0
PB0
Wire Wire Line
	10400 1850 11400 1850
Text Label 10400 1850 0    50   ~ 0
PB1
Wire Wire Line
	13000 1850 14050 1850
Text Label 14050 2050 2    50   ~ 0
PB4
Wire Wire Line
	13000 2050 14050 2050
Text Label 14050 2150 2    50   ~ 0
PB6
Wire Wire Line
	12700 2150 13250 2150
Wire Wire Line
	10400 1950 10850 1950
Text Label 10400 1950 0    50   ~ 0
PB3
Wire Wire Line
	10400 2050 11400 2050
Text Label 10400 2050 0    50   ~ 0
PB5
Wire Wire Line
	10400 2150 10850 2150
Text Label 10400 2150 0    50   ~ 0
PB7
Text Label 14050 2250 2    50   ~ 0
PC0
Wire Wire Line
	13000 2250 14050 2250
Text Label 14050 2350 2    50   ~ 0
PC4
Wire Wire Line
	12700 2350 13250 2350
Text Label 14050 2450 2    50   ~ 0
PC6
Wire Wire Line
	13000 2450 14050 2450
Wire Wire Line
	10400 2250 11400 2250
Text Label 10400 2250 0    50   ~ 0
PC1
Wire Wire Line
	10400 2350 10850 2350
Text Label 10400 2350 0    50   ~ 0
PC5
Wire Wire Line
	10400 2450 11400 2450
Text Label 10400 2450 0    50   ~ 0
PC7
$Comp
L power:GND #PWR?
U 1 1 62256C5C
P 14350 2950
F 0 "#PWR?" H 14350 2700 50  0001 C CNN
F 1 "GND" H 14355 2777 50  0000 C CNN
F 2 "" H 14350 2950 50  0001 C CNN
F 3 "" H 14350 2950 50  0001 C CNN
	1    14350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6221C86B
P 10150 1750
F 0 "#PWR?" H 10150 1500 50  0001 C CNN
F 1 "GND" H 10155 1577 50  0000 C CNN
F 2 "" H 10150 1750 50  0001 C CNN
F 3 "" H 10150 1750 50  0001 C CNN
	1    10150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2950 11700 2950
Text Label 14050 2550 2    50   ~ 0
PD0
Wire Wire Line
	12700 2550 13250 2550
Wire Wire Line
	13000 2650 14050 2650
Wire Wire Line
	12700 2750 13250 2750
Wire Wire Line
	10400 2550 10850 2550
Text Label 10400 2550 0    50   ~ 0
PD1
Wire Wire Line
	10400 2650 11400 2650
Text Label 14050 2650 2    50   ~ 0
PD5
Text Label 14050 2750 2    50   ~ 0
PD7
Text Label 10400 2650 0    50   ~ 0
PD6
Wire Wire Line
	1550 6650 1750 6650
Wire Wire Line
	2150 6650 2350 6650
Text Label 14050 3050 2    50   ~ 0
ADC2
Wire Wire Line
	10400 3050 11700 3050
Text Label 10400 3050 0    50   ~ 0
ADC3
Text Label 14050 3150 2    50   ~ 0
ADC4
Text Label 14050 3250 2    50   ~ 0
ADC6
Text Label 14050 3350 2    50   ~ 0
ADC8
Wire Wire Line
	10400 3150 11700 3150
Text Label 10400 3150 0    50   ~ 0
ADC5
Text Label 10400 3250 0    50   ~ 0
ADC7
Text Label 7300 6900 2    50   ~ 0
ADC10
Text Label 7300 6800 2    50   ~ 0
ADC9_ADC10
$Comp
L formula:CONN_01X03 J10
U 1 1 62348E99
P 7550 6800
F 0 "J10" H 7578 6841 50  0000 L CNN
F 1 "CONN_01X03" H 7578 6750 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 5600 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 5600 50  0001 C CNN
F 4 "Mouser" H 7550 6800 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 6800 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 7400 60  0001 C CNN "PurchasingLink"
	1    7550 6800
	1    0    0    -1  
$EndComp
Text Label 7300 6700 2    50   ~ 0
ADC9
Text Label 10400 3350 0    50   ~ 0
ADC9_ADC10
Wire Wire Line
	10400 3250 11700 3250
$Comp
L power:GND #PWR?
U 1 1 62389EBD
P 14350 3750
F 0 "#PWR?" H 14350 3500 50  0001 C CNN
F 1 "GND" H 14355 3577 50  0000 C CNN
F 2 "" H 14350 3750 50  0001 C CNN
F 3 "" H 14350 3750 50  0001 C CNN
	1    14350 3750
	1    0    0    -1  
$EndComp
Text Notes 6650 6450 0    89   ~ 0
ADC MULTIPLEX JUMPER
NoConn ~ 11700 2750
NoConn ~ 12700 2850
NoConn ~ 12700 3650
NoConn ~ 12700 3550
NoConn ~ 11700 3450
NoConn ~ 11700 3550
NoConn ~ 11700 3650
$Comp
L formula:SSM3K333R Q1
U 1 1 62220448
P 4350 6500
F 0 "Q1" H 4556 6546 50  0000 L CNN
F 1 "SSM3K333R" H 4556 6455 50  0000 L CNN
F 2 "footprints:SOT-23F" H 4550 6425 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 4550 6575 50  0001 L CNN
F 4 "DK" H 4850 6875 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 4750 6775 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 4650 6675 60  0001 C CNN "PurchasingLink"
	1    4350 6500
	1    0    0    -1  
$EndComp
Text Label 4550 6250 0    50   ~ 0
RESET
Wire Wire Line
	4450 6250 4450 6300
Wire Wire Line
	4450 6250 4550 6250
Text Label 10400 2850 0    50   ~ 0
DIG-RESET
$Comp
L power:GND #PWR?
U 1 1 62250D02
P 10100 2950
F 0 "#PWR?" H 10100 2700 50  0001 C CNN
F 1 "GND" H 10105 2777 50  0000 C CNN
F 2 "" H 10100 2950 50  0001 C CNN
F 3 "" H 10100 2950 50  0001 C CNN
	1    10100 2950
	1    0    0    -1  
$EndComp
Text Label 3900 6500 2    50   ~ 0
DIG-RESET
Text Notes 3250 6050 0    89   ~ 0
DIGITAL RESET: LOW SIDE DRIVE
$Comp
L firmware_tester_board-rescue:AP7370-formula U2
U 1 1 6229592D
P 2700 8700
F 0 "U2" H 2700 8942 50  0000 C CNN
F 1 "AP7370" H 2700 8851 50  0000 C CNN
F 2 "footprints:SOT-23-5" H 2650 8900 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP7370.pdf" H 2800 8450 50  0001 C CNN
F 4 "DK" H 2750 9025 60  0001 C CNN "MFN"
F 5 "AP7370-50W5-7DICT-ND" H 2850 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/diodes-incorporated/AP7370-50W5-7/10235827" H 2850 9125 60  0001 C CNN "PurchasingLink"
	1    2700 8700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6229807F
P 4250 8200
F 0 "#PWR?" H 4250 8050 50  0001 C CNN
F 1 "+5V" H 4265 8373 50  0000 C CNN
F 2 "" H 4250 8200 50  0001 C CNN
F 3 "" H 4250 8200 50  0001 C CNN
	1    4250 8200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622A0762
P 2700 9000
F 0 "#PWR?" H 2700 8750 50  0001 C CNN
F 1 "GND" H 2705 8827 50  0000 C CNN
F 2 "" H 2700 9000 50  0001 C CNN
F 3 "" H 2700 9000 50  0001 C CNN
	1    2700 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 3750 11700 3750
$Comp
L formula:LED_0805 D1
U 1 1 622C4B86
P 1550 9300
F 0 "D1" V 1589 9183 50  0000 R CNN
F 1 "LED_0805" V 1498 9183 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1450 9300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1550 9400 50  0001 C CNN
F 4 "DK" H 1550 9300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1550 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 1950 9800 60  0001 C CNN "PurchasingLink"
	1    1550 9300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622C58E9
P 1550 9550
F 0 "#PWR?" H 1550 9300 50  0001 C CNN
F 1 "GND" H 1555 9377 50  0000 C CNN
F 2 "" H 1550 9550 50  0001 C CNN
F 3 "" H 1550 9550 50  0001 C CNN
	1    1550 9550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R3
U 1 1 622C62D1
P 1550 8900
F 0 "R3" H 1620 8946 50  0000 L CNN
F 1 "R_1K" H 1620 8855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1480 8900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1630 8900 50  0001 C CNN
F 4 "DK" H 1550 8900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1550 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2030 9300 60  0001 C CNN "PurchasingLink"
	1    1550 8900
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C5
U 1 1 622C7031
P 2050 8900
F 0 "C5" H 2165 8996 50  0000 L CNN
F 1 "C_1uF" H 2165 8905 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2088 9500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 2075 9750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 2475 9400 60  0001 C CNN "PurchasingLink"
	1    2050 8900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622D49C5
P 2050 9000
F 0 "#PWR?" H 2050 8750 50  0001 C CNN
F 1 "GND" H 2055 8827 50  0000 C CNN
F 2 "" H 2050 9000 50  0001 C CNN
F 3 "" H 2050 9000 50  0001 C CNN
	1    2050 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_1uF C6
U 1 1 622D53AD
P 3300 8900
F 0 "C6" H 3415 8996 50  0000 L CNN
F 1 "C_1uF" H 3415 8905 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3338 9500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 3325 9750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 3725 9400 60  0001 C CNN "PurchasingLink"
	1    3300 8900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622DC960
P 3300 9000
F 0 "#PWR?" H 3300 8750 50  0001 C CNN
F 1 "GND" H 3305 8827 50  0000 C CNN
F 2 "" H 3300 9000 50  0001 C CNN
F 3 "" H 3300 9000 50  0001 C CNN
	1    3300 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R4
U 1 1 622E2637
P 3800 8900
F 0 "R4" H 3870 8946 50  0000 L CNN
F 1 "R_200" H 3870 8855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3730 8900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 3880 8900 50  0001 C CNN
F 4 "DK" H 3800 8900 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 3800 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4280 9300 60  0001 C CNN "PurchasingLink"
	1    3800 8900
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D2
U 1 1 622E2B4E
P 3800 9300
F 0 "D2" V 3839 9183 50  0000 R CNN
F 1 "LED_0805" V 3748 9183 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 3700 9300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 3800 9400 50  0001 C CNN
F 4 "DK" H 3800 9300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 3800 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4200 9800 60  0001 C CNN "PurchasingLink"
	1    3800 9300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622E3188
P 3800 9550
F 0 "#PWR?" H 3800 9300 50  0001 C CNN
F 1 "GND" H 3805 9377 50  0000 C CNN
F 2 "" H 3800 9550 50  0001 C CNN
F 3 "" H 3800 9550 50  0001 C CNN
	1    3800 9550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_0_2512 R5
U 1 1 622E781C
P 4250 8500
F 0 "R5" V 4050 8400 50  0000 L CNN
F 1 "R_0_2512" V 4150 8400 50  0000 L CNN
F 2 "footprints:R_2512_OEM" H 4180 8500 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 4330 8500 50  0001 C CNN
F 4 "DK" H 4250 8500 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 4250 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 4730 8900 60  0001 C CNN "PurchasingLink"
	1    4250 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 8700 2050 8700
Wire Wire Line
	1250 8700 1250 8450
Connection ~ 2050 8700
Wire Wire Line
	1550 9050 1550 9150
Wire Wire Line
	1550 9450 1550 9550
Wire Wire Line
	3000 8700 3300 8700
Connection ~ 3300 8700
Wire Wire Line
	3800 9450 3800 9550
Wire Wire Line
	7400 8600 7650 8600
Wire Wire Line
	7400 9400 7650 9400
Wire Wire Line
	7650 9300 7650 9400
Connection ~ 7650 9400
Wire Wire Line
	7650 9400 7800 9400
$Comp
L formula:CONN_01x02 J14
U 1 1 6236304D
P 7850 8800
F 0 "J14" H 7930 8792 50  0000 L CNN
F 1 "CONN_01x02" H 7930 8701 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 7750 8800 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/6130xx11121.pdf" H 7850 8900 50  0001 C CNN
F 4 "DK" H 7950 9000 50  0001 C CNN "MFN"
F 5 "732-5315-ND" H 8050 9100 50  0001 C CNN "MPN"
	1    7850 8800
	1    0    0    -1  
$EndComp
Connection ~ 7650 8600
Wire Wire Line
	7650 8600 7800 8600
Wire Wire Line
	7650 8900 7650 9000
Wire Wire Line
	7400 9150 7400 8600
Wire Wire Line
	7650 8800 7650 8600
Text Notes 1450 9550 1    50   ~ 0
12V indicator
Text Notes 3700 9550 1    50   ~ 0
5V indicator
Text Notes 4350 8550 0    50   ~ 0
VCC jumper
Wire Wire Line
	4250 8200 4250 8350
Wire Wire Line
	3800 9050 3800 9150
Wire Wire Line
	3800 8750 3800 8700
Connection ~ 3800 8700
Wire Wire Line
	3800 8700 4250 8700
Wire Wire Line
	3300 8700 3800 8700
Wire Wire Line
	4250 8700 4250 8650
Wire Wire Line
	1250 8700 1550 8700
Wire Wire Line
	1550 8750 1550 8700
Connection ~ 1550 8700
Wire Wire Line
	1550 8700 2050 8700
Wire Notes Line
	1000 7750 4900 7750
Wire Notes Line
	4900 7750 4900 9950
Wire Notes Line
	4900 9950 1000 9950
Wire Notes Line
	1000 9950 1000 7750
$Comp
L power:GND #PWR?
U 1 1 6222FFC8
P 4450 6900
F 0 "#PWR?" H 4450 6650 50  0001 C CNN
F 1 "GND" H 4455 6727 50  0000 C CNN
F 2 "" H 4450 6900 50  0001 C CNN
F 3 "" H 4450 6900 50  0001 C CNN
	1    4450 6900
	1    0    0    -1  
$EndComp
Wire Notes Line
	1000 5750 5600 5750
Wire Notes Line
	5600 5750 5600 7200
Wire Notes Line
	5600 7200 1000 7200
Wire Notes Line
	1000 7200 1000 5750
Wire Notes Line
	6250 900  6250 7200
Wire Notes Line
	6250 7200 8700 7200
Wire Notes Line
	8700 7200 8700 900 
Wire Notes Line
	8700 900  6250 900 
Wire Notes Line
	6250 6100 8700 6100
$Comp
L power:+12V #PWR?
U 1 1 62595F0C
P 10100 3750
F 0 "#PWR?" H 10100 3600 50  0001 C CNN
F 1 "+12V" H 10115 3923 50  0000 C CNN
F 2 "" H 10100 3750 50  0001 C CNN
F 3 "" H 10100 3750 50  0001 C CNN
	1    10100 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 625971B7
P 1250 8450
F 0 "#PWR?" H 1250 8300 50  0001 C CNN
F 1 "+12V" H 1265 8623 50  0000 C CNN
F 2 "" H 1250 8450 50  0001 C CNN
F 3 "" H 1250 8450 50  0001 C CNN
	1    1250 8450
	1    0    0    -1  
$EndComp
$Comp
L formula:ATMEGA64M1 U0
U 1 1 623EB33A
P 2900 3150
F 0 "U0" H 2900 5117 50  0000 C CNN
F 1 "ATMEGA64M1" H 2900 5026 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2900 3150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1950 4980 50  0001 C CNN
F 4 "DK" H 2900 3150 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2900 3150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA64M1-AU/ATMEGA64M1-AU-ND/2271208" H 2350 5380 60  0001 C CNN "PurchasingLink"
	1    2900 3150
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP1
U 1 1 6249C10A
P 9800 8250
F 0 "TP1" H 9850 8500 50  0000 R CNN
F 1 "Test_Point_SMD" H 10100 8600 50  0000 R CNN
F 2 "footprints:Test_Point_SMD" H 9800 8100 50  0001 C CNN
F 3 "" H 9800 8250 50  0001 C CNN
	1    9800 8250
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 6249E4C9
P 9800 8200
F 0 "#PWR?" H 9800 8050 50  0001 C CNN
F 1 "+12V" H 9815 8373 50  0000 C CNN
F 2 "" H 9800 8200 50  0001 C CNN
F 3 "" H 9800 8200 50  0001 C CNN
	1    9800 8200
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP2
U 1 1 624A64B2
P 10550 8250
F 0 "TP2" H 10600 8500 50  0000 R CNN
F 1 "Test_Point_SMD" H 10850 8600 50  0000 R CNN
F 2 "footprints:Test_Point_SMD" H 10550 8100 50  0001 C CNN
F 3 "" H 10550 8250 50  0001 C CNN
	1    10550 8250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624AC6DA
P 10550 8200
F 0 "#PWR?" H 10550 8050 50  0001 C CNN
F 1 "+5V" H 10565 8373 50  0000 C CNN
F 2 "" H 10550 8200 50  0001 C CNN
F 3 "" H 10550 8200 50  0001 C CNN
	1    10550 8200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 624AD126
P 11250 8200
F 0 "#PWR?" H 11250 7950 50  0001 C CNN
F 1 "GND" H 11255 8027 50  0000 C CNN
F 2 "" H 11250 8200 50  0001 C CNN
F 3 "" H 11250 8200 50  0001 C CNN
	1    11250 8200
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 624A9483
P 11250 8150
F 0 "TP3" H 11300 7800 50  0000 R CNN
F 1 "Test_Point_SMD" H 11550 7700 50  0000 R CNN
F 2 "footprints:Test_Point_SMD" H 11250 8000 50  0001 C CNN
F 3 "" H 11250 8150 50  0001 C CNN
	1    11250 8150
	1    0    0    -1  
$EndComp
Text Notes 10150 7800 0    89   ~ 0
TEST POINTS
$Comp
L power:+5V #PWR?
U 1 1 624C6880
P 14350 3450
F 0 "#PWR?" H 14350 3300 50  0001 C CNN
F 1 "+5V" H 14365 3623 50  0000 C CNN
F 2 "" H 14350 3450 50  0001 C CNN
F 3 "" H 14350 3450 50  0001 C CNN
	1    14350 3450
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R7
U 1 1 624CE964
P 4150 6700
F 0 "R7" H 4300 6650 50  0000 C CNN
F 1 "R_10K" H 4350 6750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4080 6700 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4230 6700 50  0001 C CNN
F 4 "DK" H 4150 6700 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4150 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4630 7100 60  0001 C CNN "PurchasingLink"
	1    4150 6700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 6700 4450 6850
Wire Wire Line
	4450 6900 4450 6850
Connection ~ 4450 6850
Wire Wire Line
	4150 6850 4450 6850
Wire Wire Line
	3900 6500 4150 6500
Wire Wire Line
	4150 6550 4150 6500
Connection ~ 4150 6500
Text Label 14050 3850 2    50   ~ 0
CAN_+
Text Label 10400 3850 0    50   ~ 0
CAN_-
Wire Wire Line
	10400 3850 11700 3850
$Comp
L formula:R_100 R9
U 1 1 625CEE4D
P 13400 1950
F 0 "R9" V 13400 1950 50  0000 C CNN
F 1 "R_100" V 13450 2200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12600 2100 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 13100 2450 50  0001 C CNN
F 4 "DK" H 13400 1950 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12750 2200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13880 2350 60  0001 C CNN "PurchasingLink"
	1    13400 1950
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R10
U 1 1 625CF1FA
P 12850 2050
F 0 "R10" V 12850 2050 50  0000 C CNN
F 1 "R_100" V 12900 2300 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12050 2200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12550 2550 50  0001 C CNN
F 4 "DK" H 12850 2050 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12200 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13330 2450 60  0001 C CNN "PurchasingLink"
	1    12850 2050
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R11
U 1 1 625CF56F
P 13400 2150
F 0 "R11" V 13400 2150 50  0000 C CNN
F 1 "R_100" V 13450 2400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12600 2300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 13100 2650 50  0001 C CNN
F 4 "DK" H 13400 2150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12750 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13880 2550 60  0001 C CNN "PurchasingLink"
	1    13400 2150
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R12
U 1 1 625D063E
P 12850 2250
F 0 "R12" V 12850 2250 50  0000 C CNN
F 1 "R_100" V 12900 2500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12050 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12550 2750 50  0001 C CNN
F 4 "DK" H 12850 2250 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12200 2500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13330 2650 60  0001 C CNN "PurchasingLink"
	1    12850 2250
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R13
U 1 1 625D0963
P 13400 2350
F 0 "R13" V 13400 2350 50  0000 C CNN
F 1 "R_100" V 13450 2600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12600 2500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 13100 2850 50  0001 C CNN
F 4 "DK" H 13400 2350 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12750 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13880 2750 60  0001 C CNN "PurchasingLink"
	1    13400 2350
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R14
U 1 1 625D0BA4
P 12850 2450
F 0 "R14" V 12850 2450 50  0000 C CNN
F 1 "R_100" V 12900 2700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12050 2600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12550 2950 50  0001 C CNN
F 4 "DK" H 12850 2450 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12200 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13330 2850 60  0001 C CNN "PurchasingLink"
	1    12850 2450
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R15
U 1 1 625D0E39
P 13400 2550
F 0 "R15" V 13400 2550 50  0000 C CNN
F 1 "R_100" V 13450 2800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12600 2700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 13100 3050 50  0001 C CNN
F 4 "DK" H 13400 2550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12750 2800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13880 2950 60  0001 C CNN "PurchasingLink"
	1    13400 2550
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R16
U 1 1 625D1206
P 12850 2650
F 0 "R16" V 12850 2650 50  0000 C CNN
F 1 "R_100" V 12900 2900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12050 2800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12550 3150 50  0001 C CNN
F 4 "DK" H 12850 2650 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12200 2900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13330 3050 60  0001 C CNN "PurchasingLink"
	1    12850 2650
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R17
U 1 1 625D1BB3
P 13400 2750
F 0 "R17" V 13400 2750 50  0000 C CNN
F 1 "R_100" V 13450 3000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12600 2900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 13100 3250 50  0001 C CNN
F 4 "DK" H 13400 2750 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12750 3000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13880 3150 60  0001 C CNN "PurchasingLink"
	1    13400 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	12700 1750 14250 1750
$Comp
L formula:R_100 R18
U 1 1 6261B534
P 11550 1850
F 0 "R18" V 11550 1850 50  0000 C CNN
F 1 "R_100" V 11600 1600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10750 2000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 11250 2350 50  0001 C CNN
F 4 "DK" H 11550 1850 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10900 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 12030 2250 60  0001 C CNN "PurchasingLink"
	1    11550 1850
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R19
U 1 1 6261B53D
P 11000 1950
F 0 "R19" V 11000 1950 50  0000 C CNN
F 1 "R_100" V 11050 1700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10200 2100 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 10700 2450 50  0001 C CNN
F 4 "DK" H 11000 1950 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10350 2200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 11480 2350 60  0001 C CNN "PurchasingLink"
	1    11000 1950
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R20
U 1 1 6261B546
P 11550 2050
F 0 "R20" V 11550 2050 50  0000 C CNN
F 1 "R_100" V 11600 1800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10750 2200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 11250 2550 50  0001 C CNN
F 4 "DK" H 11550 2050 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10900 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 12030 2450 60  0001 C CNN "PurchasingLink"
	1    11550 2050
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R21
U 1 1 6261B54F
P 11000 2150
F 0 "R21" V 11000 2150 50  0000 C CNN
F 1 "R_100" V 11050 1900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10200 2300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 10700 2650 50  0001 C CNN
F 4 "DK" H 11000 2150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10350 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 11480 2550 60  0001 C CNN "PurchasingLink"
	1    11000 2150
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R22
U 1 1 6261B558
P 11550 2250
F 0 "R22" V 11550 2250 50  0000 C CNN
F 1 "R_100" V 11600 2000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10750 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 11250 2750 50  0001 C CNN
F 4 "DK" H 11550 2250 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10900 2500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 12030 2650 60  0001 C CNN "PurchasingLink"
	1    11550 2250
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R23
U 1 1 6261B561
P 11000 2350
F 0 "R23" V 11000 2350 50  0000 C CNN
F 1 "R_100" V 11050 2100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10200 2500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 10700 2850 50  0001 C CNN
F 4 "DK" H 11000 2350 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10350 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 11480 2750 60  0001 C CNN "PurchasingLink"
	1    11000 2350
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R24
U 1 1 6261B56A
P 11550 2450
F 0 "R24" V 11550 2450 50  0000 C CNN
F 1 "R_100" V 11600 2200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10750 2600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 11250 2950 50  0001 C CNN
F 4 "DK" H 11550 2450 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10900 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 12030 2850 60  0001 C CNN "PurchasingLink"
	1    11550 2450
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R25
U 1 1 6261B573
P 11000 2550
F 0 "R25" V 11000 2550 50  0000 C CNN
F 1 "R_100" V 11050 2300 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10200 2700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 10700 3050 50  0001 C CNN
F 4 "DK" H 11000 2550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10350 2800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 11480 2950 60  0001 C CNN "PurchasingLink"
	1    11000 2550
	0    1    1    0   
$EndComp
$Comp
L formula:R_100 R26
U 1 1 6261B57C
P 11550 2650
F 0 "R26" V 11550 2650 50  0000 C CNN
F 1 "R_100" V 11600 2400 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10750 2800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 11250 3150 50  0001 C CNN
F 4 "DK" H 11550 2650 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 10900 2900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 12030 3050 60  0001 C CNN "PurchasingLink"
	1    11550 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	10150 1750 11700 1750
Text Notes 14500 3500 0    50   ~ 0
Pin 35 used by HITL to\ncheck that board is\nreceiving 5V
Wire Wire Line
	12700 3850 14050 3850
Wire Wire Line
	12700 3750 14350 3750
Wire Wire Line
	12700 3450 14350 3450
Wire Wire Line
	12700 3350 14050 3350
Wire Wire Line
	12700 3250 14050 3250
Wire Wire Line
	12700 3150 14050 3150
Wire Wire Line
	12700 3050 14050 3050
Wire Wire Line
	12700 2950 14350 2950
$Comp
L formula:SSW-122-01-G-D J12
U 1 1 621B9736
P 12200 2850
F 0 "J12" H 12200 4217 50  0000 C CNN
F 1 "SSW-122-01-G-D" H 12200 4126 50  0000 C CNN
F 2 "footprints:SAMTEC_SSW-122-01-G-D" H 13200 2650 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/prints/ssw-d.pdf" H 13450 2950 50  0001 L BNN
F 4 "Würth Elektronik" H 13500 2950 50  0001 C CNN "MFN"
F 5 "61304421121" H 13300 2900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/61304421121/4846887" H 13300 2900 50  0001 C CNN "PurchasingLink"
	1    12200 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2850 11700 2850
Wire Wire Line
	10400 3350 11700 3350
Text Label 14050 1950 2    50   ~ 0
PB2
Wire Wire Line
	13550 1950 14050 1950
Wire Wire Line
	13250 1950 12700 1950
Wire Wire Line
	13550 2750 14050 2750
Wire Wire Line
	13550 2550 14050 2550
Wire Wire Line
	13550 2350 14050 2350
Wire Wire Line
	13550 2150 14050 2150
$Comp
L formula:R_100 R8
U 1 1 625CEAD0
P 12850 1850
F 0 "R8" V 12850 1850 50  0000 C CNN
F 1 "R_100" V 12900 2100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12050 2000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 12550 2350 50  0001 C CNN
F 4 "DK" H 12850 1850 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 12200 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 13330 2250 60  0001 C CNN "PurchasingLink"
	1    12850 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	11150 1950 11700 1950
Wire Wire Line
	11150 2150 11700 2150
Wire Wire Line
	11150 2350 11700 2350
Wire Wire Line
	11150 2550 11700 2550
$Comp
L power:+12V #PWR?
U 1 1 62591F95
P 10100 9500
F 0 "#PWR?" H 10100 9350 50  0001 C CNN
F 1 "+12V" H 10115 9673 50  0000 C CNN
F 2 "" H 10100 9500 50  0001 C CNN
F 3 "" H 10100 9500 50  0001 C CNN
	1    10100 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 9500 10100 9650
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 10550 9500
F 0 "#PWR?" H 10550 9350 50  0001 C CNN
F 1 "+5V" H 10565 9673 50  0000 C CNN
F 2 "" H 10550 9500 50  0001 C CNN
F 3 "" H 10550 9500 50  0001 C CNN
	1    10550 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 9500 11000 9650
Wire Wire Line
	10550 9650 10550 9500
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 11000 9500
F 0 "#FLG?" H 11000 9575 50  0001 C CNN
F 1 "PWR_FLAG" H 11000 9674 50  0000 C CNN
F 2 "" H 11000 9500 50  0001 C CNN
F 3 "~" H 11000 9500 50  0001 C CNN
	1    11000 9500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 10550 9650
F 0 "#FLG?" H 10550 9725 50  0001 C CNN
F 1 "PWR_FLAG" H 10550 9824 50  0000 C CNN
F 2 "" H 10550 9650 50  0001 C CNN
F 3 "~" H 10550 9650 50  0001 C CNN
	1    10550 9650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 10100 9650
F 0 "#FLG?" H 10100 9725 50  0001 C CNN
F 1 "PWR_FLAG" H 10100 9824 50  0000 C CNN
F 2 "" H 10100 9650 50  0001 C CNN
F 3 "~" H 10100 9650 50  0001 C CNN
	1    10100 9650
	-1   0    0    1   
$EndComp
Text Notes 10150 9200 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 11000 9650
F 0 "#PWR?" H 11000 9400 50  0001 C CNN
F 1 "GND" H 11005 9477 50  0000 C CNN
F 2 "" H 11000 9650 50  0001 C CNN
F 3 "" H 11000 9650 50  0001 C CNN
	1    11000 9650
	1    0    0    -1  
$EndComp
Wire Notes Line
	5600 7750 8700 7750
Wire Notes Line
	8700 7750 8700 9950
Wire Notes Line
	8700 9950 5600 9950
Wire Notes Line
	5600 9950 5600 7750
Wire Notes Line
	9150 900  15500 900 
Wire Notes Line
	15500 900  15500 6100
Wire Notes Line
	15500 6100 9150 6100
Wire Notes Line
	9150 6100 9150 900 
Wire Notes Line
	9150 4350 15500 4350
Wire Notes Line
	12200 4350 12200 6100
Text Notes 9350 2900 0    50   ~ 0
Pin 24 used by HITL\nto reset MCU
$EndSCHEMATC
