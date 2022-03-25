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
$Comp
L power:GND #PWR034
U 1 1 5BEE3CCE
P 15450 8600
F 0 "#PWR034" H 15450 8350 50  0001 C CNN
F 1 "GND" H 15455 8427 50  0000 C CNN
F 2 "" H 15450 8600 50  0001 C CNN
F 3 "" H 15450 8600 50  0001 C CNN
	1    15450 8600
	1    0    0    -1  
$EndComp
$Comp
L formula:ATMEGA16M1 U1
U 1 1 5D58A7A6
P 2550 2700
F 0 "U1" H 3450 4560 50  0000 C CNN
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
Text Label 4450 3700 0    50   ~ 0
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
L formula:C_100pF C2
U 1 1 5D58E505
P 1150 1450
F 0 "C2" V 1200 1300 50  0000 L CNN
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
L power:GND #PWR02
U 1 1 5D58E5E0
P 800 1300
F 0 "#PWR02" H 800 1050 50  0001 C CNN
F 1 "GND" H 805 1127 50  0000 C CNN
F 2 "" H 800 1300 50  0001 C CNN
F 3 "" H 800 1300 50  0001 C CNN
	1    800  1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D591138
P 1150 1600
F 0 "#PWR03" H 1150 1350 50  0001 C CNN
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
L formula:C_30pF C3
U 1 1 5D5EB5B2
P 3900 4350
F 0 "C3" H 3790 4430 50  0000 L CNN
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
L formula:C_30pF C4
U 1 1 5D5EB694
P 4300 4350
F 0 "C4" H 4320 4430 50  0000 L CNN
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
L formula:R_10K R2
U 1 1 5D5EB7F3
P 4450 3500
F 0 "R2" V 4370 3500 50  0000 C CNN
F 1 "R_10K" V 4500 3750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4380 3500 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4530 3500 50  0001 C CNN
F 4 "DK" H 4450 3500 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4450 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4930 3900 60  0001 C CNN "PurchasingLink"
	1    4450 3500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5D5F2681
P 3900 4500
F 0 "#PWR07" H 3900 4250 50  0001 C CNN
F 1 "GND" H 3905 4327 50  0000 C CNN
F 2 "" H 3900 4500 50  0001 C CNN
F 3 "" H 3900 4500 50  0001 C CNN
	1    3900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D5F26EE
P 4300 4500
F 0 "#PWR09" H 4300 4250 50  0001 C CNN
F 1 "GND" H 4305 4327 50  0000 C CNN
F 2 "" H 4300 4500 50  0001 C CNN
F 3 "" H 4300 4500 50  0001 C CNN
	1    4300 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5D5F2774
P 4100 4250
F 0 "#PWR08" H 4100 4000 50  0001 C CNN
F 1 "GND" H 4105 4077 50  0000 C CNN
F 2 "" H 4100 4250 50  0001 C CNN
F 3 "" H 4100 4250 50  0001 C CNN
	1    4100 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D5F27E1
P 4450 3950
F 0 "#PWR010" H 4450 3700 50  0001 C CNN
F 1 "GND" H 4455 3777 50  0000 C CNN
F 2 "" H 4450 3950 50  0001 C CNN
F 3 "" H 4450 3950 50  0001 C CNN
	1    4450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5D5F86E8
P 1300 4050
F 0 "#PWR04" H 1300 3800 50  0001 C CNN
F 1 "GND" H 1305 3877 50  0000 C CNN
F 2 "" H 1300 4050 50  0001 C CNN
F 3 "" H 1300 4050 50  0001 C CNN
	1    1300 4050
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U3
U 1 1 5D5FAEDE
P 7300 9000
F 0 "U3" H 7660 9350 50  0000 C CNN
F 1 "MCP2561-E_SN" H 7650 8640 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 7300 8500 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 6900 9350 50  0001 C CNN
F 4 "DK" H 7300 9000 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 7300 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 7300 9750 60  0001 C CNN "PurchasingLink"
	1    7300 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C7
U 1 1 5D5FB603
P 7150 8400
F 0 "C7" V 7100 8510 50  0000 C CNN
F 1 "C_0.1uF" V 7110 8210 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 7188 8250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7175 8500 50  0001 C CNN
F 4 "DK" H 7150 8400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7150 8400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7575 8900 60  0001 C CNN "PurchasingLink"
	1    7150 8400
	0    1    1    0   
$EndComp
NoConn ~ 7800 9000
$Comp
L power:GND #PWR027
U 1 1 5D60300D
P 7000 8550
F 0 "#PWR027" H 7000 8300 50  0001 C CNN
F 1 "GND" H 6900 8550 50  0000 C CNN
F 2 "" H 7000 8550 50  0001 C CNN
F 3 "" H 7000 8550 50  0001 C CNN
	1    7000 8550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5D6030BB
P 7300 9400
F 0 "#PWR029" H 7300 9150 50  0001 C CNN
F 1 "GND" H 7305 9227 50  0000 C CNN
F 2 "" H 7300 9400 50  0001 C CNN
F 3 "" H 7300 9400 50  0001 C CNN
	1    7300 9400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5D607469
P 6800 9200
F 0 "#PWR026" H 6800 8950 50  0001 C CNN
F 1 "GND" H 6805 9027 50  0000 C CNN
F 2 "" H 6800 9200 50  0001 C CNN
F 3 "" H 6800 9200 50  0001 C CNN
	1    6800 9200
	1    0    0    -1  
$EndComp
Text Label 6800 8800 2    50   ~ 0
CAN_TX
Text Label 6800 8900 2    50   ~ 0
CAN_RX
Text Label 8300 8350 0    50   ~ 0
CAN_+
Text Label 8300 9150 0    50   ~ 0
CAN_-
Text Notes 6700 8000 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2250 800  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3550 4900 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 14600 8150 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D6150F1
P 14550 8600
F 0 "#FLG01" H 14550 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 14550 8774 50  0000 C CNN
F 2 "" H 14550 8600 50  0001 C CNN
F 3 "~" H 14550 8600 50  0001 C CNN
	1    14550 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5D615167
P 15000 8600
F 0 "#FLG02" H 15000 8675 50  0001 C CNN
F 1 "PWR_FLAG" H 15000 8774 50  0000 C CNN
F 2 "" H 15000 8600 50  0001 C CNN
F 3 "~" H 15000 8600 50  0001 C CNN
	1    15000 8600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5D615217
P 15450 8450
F 0 "#FLG03" H 15450 8525 50  0001 C CNN
F 1 "PWR_FLAG" H 15450 8624 50  0000 C CNN
F 2 "" H 15450 8450 50  0001 C CNN
F 3 "~" H 15450 8450 50  0001 C CNN
	1    15450 8450
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_02X03 J13
U 1 1 5D628C9D
P 10750 8900
F 0 "J13" H 10750 9110 50  0000 C CNN
F 1 "CONN_02X03" H 10640 8700 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 10750 7700 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 10750 7700 50  0001 C CNN
F 4 "DK" H 10750 8900 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 10750 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 11150 9500 60  0001 C CNN "PurchasingLink"
	1    10750 8900
	1    0    0    -1  
$EndComp
Text Label 10500 8800 2    50   ~ 0
MISO
Text Label 10500 8900 2    50   ~ 0
SCK
Text Label 10500 9000 2    50   ~ 0
RESET
Text Label 11000 8900 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR032
U 1 1 5D62962D
P 11000 9000
F 0 "#PWR032" H 11000 8750 50  0001 C CNN
F 1 "GND" H 11005 8827 50  0000 C CNN
F 2 "" H 11000 9000 50  0001 C CNN
F 3 "" H 11000 9000 50  0001 C CNN
	1    11000 9000
	1    0    0    -1  
$EndComp
Text Notes 9750 8550 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Wire Wire Line
	1450 1300 1150 1300
Connection ~ 1150 1300
$Comp
L formula:C_0.1uF C1
U 1 1 5D58E34B
P 800 1150
F 0 "C1" V 850 1010 50  0000 L CNN
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
	4150 3700 4150 3500
Connection ~ 4150 3700
Wire Wire Line
	4150 3700 4450 3700
Wire Wire Line
	4600 3500 4750 3500
Wire Wire Line
	4750 3500 4750 3350
Wire Wire Line
	7000 8400 7000 8550
Wire Wire Line
	7300 8600 7300 8400
Connection ~ 7300 8400
Wire Wire Line
	7300 8400 7300 8250
Wire Wire Line
	7800 8900 7900 8900
Wire Wire Line
	7900 9100 7900 9150
Wire Wire Line
	15000 8600 15000 8450
Wire Wire Line
	15450 8450 15450 8600
Wire Wire Line
	7800 9100 7900 9100
$Comp
L formula:R_120_DNP R6
U 1 1 5FA5AB4A
P 8150 8900
F 0 "R6" H 8220 8946 50  0000 L CNN
F 1 "R_120" H 8220 8855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6950 9050 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 6950 9350 50  0001 L CNN
F 4 "DK" H 8150 8900 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 6950 9150 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 6950 9250 60  0001 L CNN "PurchasingLink"
	1    8150 8900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5FD33423
P 800 850
F 0 "#PWR01" H 800 700 50  0001 C CNN
F 1 "+5V" H 815 1023 50  0000 C CNN
F 2 "" H 800 850 50  0001 C CNN
F 3 "" H 800 850 50  0001 C CNN
	1    800  850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5FD3B2BE
P 7300 8250
F 0 "#PWR028" H 7300 8100 50  0001 C CNN
F 1 "+5V" H 7315 8423 50  0000 C CNN
F 2 "" H 7300 8250 50  0001 C CNN
F 3 "" H 7300 8250 50  0001 C CNN
	1    7300 8250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 5FD3C2F8
P 11000 8800
F 0 "#PWR031" H 11000 8650 50  0001 C CNN
F 1 "+5V" H 11015 8973 50  0000 C CNN
F 2 "" H 11000 8800 50  0001 C CNN
F 3 "" H 11000 8800 50  0001 C CNN
	1    11000 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 5FD3CE98
P 15000 8450
F 0 "#PWR033" H 15000 8300 50  0001 C CNN
F 1 "+5V" H 15015 8623 50  0000 C CNN
F 2 "" H 15000 8450 50  0001 C CNN
F 3 "" H 15000 8450 50  0001 C CNN
	1    15000 8450
	1    0    0    -1  
$EndComp
Text Notes 4100 2950 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L power:+5V #PWR011
U 1 1 5FD477AE
P 4750 3350
F 0 "#PWR011" H 4750 3200 50  0001 C CNN
F 1 "+5V" H 4765 3523 50  0000 C CNN
F 2 "" H 4750 3350 50  0001 C CNN
F 3 "" H 4750 3350 50  0001 C CNN
	1    4750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 8450 14550 8600
Text Label 3650 1000 0    50   ~ 0
PB0
Text Label 3650 1100 0    50   ~ 0
PB1
Text Label 3650 1200 0    50   ~ 0
PB2_ADC5
Text Label 3650 1300 0    50   ~ 0
PB3
Text Label 3650 1400 0    50   ~ 0
PB4
Text Label 3650 1500 0    50   ~ 0
PB5_ADC6
Text Label 3650 1600 0    50   ~ 0
PB6_ADC7
Text Label 3650 1700 0    50   ~ 0
PB7_ADC4
Text Label 3650 1900 0    50   ~ 0
PC0
Text Label 3650 2000 0    50   ~ 0
PC1
Text Label 3650 2300 0    50   ~ 0
PC4_ADC8
Text Label 3650 2400 0    50   ~ 0
PC5_ADC9
Text Label 3650 2500 0    50   ~ 0
PC6_ADC10
Text Label 3650 2600 0    50   ~ 0
PC7
Text Label 3650 2800 0    50   ~ 0
PD0
Text Label 3650 2900 0    50   ~ 0
PD1
Text Label 3650 3300 0    50   ~ 0
PD5_ADC2
Text Label 3650 3400 0    50   ~ 0
PD6_ADC3
Text Label 3650 3500 0    50   ~ 0
PD7
Wire Wire Line
	3650 3700 4150 3700
Text Label 3650 3200 0    50   ~ 0
SCK
Text Label 3650 3100 0    50   ~ 0
MOSI
Text Notes 6800 1150 0    89   ~ 0
GPIO/ADC JUMPERS
Text Label 7300 1950 2    50   ~ 0
PD6_ADC3
Text Label 7300 1500 2    50   ~ 0
PD5_ADC2
Text Label 7300 2050 2    50   ~ 0
ADC3
$Comp
L formula:CONN_01X03 J2
U 1 1 621B46D6
P 7550 1950
F 0 "J2" H 7578 1991 50  0000 L CNN
F 1 "CONN_01X03" H 7578 1900 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 750 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 750 50  0001 C CNN
F 4 "Mouser" H 7550 1950 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 1950 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 2550 60  0001 C CNN "PurchasingLink"
	1    7550 1950
	1    0    0    -1  
$EndComp
Text Label 7300 5200 2    50   ~ 0
ADC10
Text Label 7300 5100 2    50   ~ 0
PC6_ADC10
Text Label 7300 4650 2    50   ~ 0
PC5_ADC9
Text Label 7300 4200 2    50   ~ 0
PC4_ADC8
Text Label 7300 2400 2    50   ~ 0
PB7_ADC4
Text Label 7300 3750 2    50   ~ 0
PB6_ADC7
Text Label 7300 3300 2    50   ~ 0
PB5_ADC6
Text Label 7300 2850 2    50   ~ 0
PB2_ADC5
Text Notes 9550 1200 0    89   ~ 0
I/O PASSTHROUGH CONNECTOR
Text Notes 9700 4800 0    89   ~ 0
CAN/GND SCREW TERMINAL
Wire Wire Line
	10050 5250 10200 5250
$Comp
L power:GND #PWR022
U 1 1 62150659
P 10050 5250
F 0 "#PWR022" H 10050 5000 50  0001 C CNN
F 1 "GND" H 10055 5077 50  0000 C CNN
F 2 "" H 10050 5250 50  0001 C CNN
F 3 "" H 10050 5250 50  0001 C CNN
	1    10050 5250
	1    0    0    -1  
$EndComp
Text Label 10200 5150 2    50   ~ 0
CAN_-
Text Label 10200 5050 2    50   ~ 0
CAN_+
$Comp
L Connector:Screw_Terminal_01x03 J11
U 1 1 621288BD
P 10400 5150
F 0 "J11" H 10480 5192 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 10480 5101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-3_1x03_P5.00mm_Horizontal" H 10400 5150 50  0001 C CNN
F 3 "~" H 10400 5150 50  0001 C CNN
	1    10400 5150
	1    0    0    -1  
$EndComp
Text Label 7300 1600 2    50   ~ 0
ADC2
$Comp
L formula:CONN_01X03 J1
U 1 1 6207E8DA
P 7550 1500
F 0 "J1" H 7578 1541 50  0000 L CNN
F 1 "CONN_01X03" H 7578 1450 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 300 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 300 50  0001 C CNN
F 4 "Mouser" H 7550 1500 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 1500 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 2100 60  0001 C CNN "PurchasingLink"
	1    7550 1500
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_01X03 J9
U 1 1 6207C7B6
P 7550 5100
F 0 "J9" H 7578 5141 50  0000 L CNN
F 1 "CONN_01X03" H 7578 5050 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 3900 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 3900 50  0001 C CNN
F 4 "Mouser" H 7550 5100 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 5100 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 5700 60  0001 C CNN "PurchasingLink"
	1    7550 5100
	1    0    0    -1  
$EndComp
Text Label 7300 4750 2    50   ~ 0
ADC9
$Comp
L formula:CONN_01X03 J8
U 1 1 6207B142
P 7550 4650
F 0 "J8" H 7578 4691 50  0000 L CNN
F 1 "CONN_01X03" H 7578 4600 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 3450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 3450 50  0001 C CNN
F 4 "Mouser" H 7550 4650 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 4650 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 5250 60  0001 C CNN "PurchasingLink"
	1    7550 4650
	1    0    0    -1  
$EndComp
Text Label 7300 4300 2    50   ~ 0
ADC8
$Comp
L formula:CONN_01X03 J7
U 1 1 6207A336
P 7550 4200
F 0 "J7" H 7578 4241 50  0000 L CNN
F 1 "CONN_01X03" H 7578 4150 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 3000 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 3000 50  0001 C CNN
F 4 "Mouser" H 7550 4200 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 4200 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 4800 60  0001 C CNN "PurchasingLink"
	1    7550 4200
	1    0    0    -1  
$EndComp
Text Label 7300 2500 2    50   ~ 0
ADC4
$Comp
L formula:CONN_01X03 J3
U 1 1 6207813A
P 7550 2400
F 0 "J3" H 7578 2441 50  0000 L CNN
F 1 "CONN_01X03" H 7578 2350 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 1200 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 1200 50  0001 C CNN
F 4 "Mouser" H 7550 2400 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 2400 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 3000 60  0001 C CNN "PurchasingLink"
	1    7550 2400
	1    0    0    -1  
$EndComp
Text Label 7300 3850 2    50   ~ 0
ADC7
$Comp
L formula:CONN_01X03 J6
U 1 1 62077318
P 7550 3750
F 0 "J6" H 7578 3791 50  0000 L CNN
F 1 "CONN_01X03" H 7578 3700 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 2550 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 2550 50  0001 C CNN
F 4 "Mouser" H 7550 3750 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 3750 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 4350 60  0001 C CNN "PurchasingLink"
	1    7550 3750
	1    0    0    -1  
$EndComp
Text Label 7300 3400 2    50   ~ 0
ADC6
$Comp
L formula:CONN_01X03 J5
U 1 1 62076566
P 7550 3300
F 0 "J5" H 7578 3341 50  0000 L CNN
F 1 "CONN_01X03" H 7578 3250 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 2100 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 2100 50  0001 C CNN
F 4 "Mouser" H 7550 3300 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 3300 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 3900 60  0001 C CNN "PurchasingLink"
	1    7550 3300
	1    0    0    -1  
$EndComp
Text Label 7300 2950 2    50   ~ 0
ADC5
Text Label 7300 2750 2    50   ~ 0
PB2
$Comp
L formula:CONN_01X03 J4
U 1 1 6203A778
P 7550 2850
F 0 "J4" H 7578 2891 50  0000 L CNN
F 1 "CONN_01X03" H 7578 2800 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 1650 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 1650 50  0001 C CNN
F 4 "Mouser" H 7550 2850 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 2850 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 3450 60  0001 C CNN "PurchasingLink"
	1    7550 2850
	1    0    0    -1  
$EndComp
Text Label 7300 3200 2    50   ~ 0
PB5
Text Label 7300 3650 2    50   ~ 0
PB6
Text Label 7300 2300 2    50   ~ 0
PB7
Text Label 7300 4100 2    50   ~ 0
PC4
Text Label 7300 4550 2    50   ~ 0
PC5
Text Label 7300 5000 2    50   ~ 0
PC6
Text Label 7300 1400 2    50   ~ 0
PD5
Text Notes 1400 6050 0    89   ~ 0
RESET BUTTON
Wire Wire Line
	4150 3500 4300 3500
Text Notes 2500 8250 0    89   ~ 0
5V LDO
Text Label 7300 1850 2    50   ~ 0
PD6
$Comp
L formula:SW_Push_SPST_NO SW1
U 1 1 621995EC
P 1900 6600
F 0 "SW1" H 1900 6885 50  0000 C CNN
F 1 "SW_Push_SPST_NO" H 1900 6794 50  0000 C CNN
F 2 "footprints:SW_B3U-1000P_4.2x1.7mm" H 1900 6650 50  0001 C CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 1900 6650 50  0001 C CNN
F 4 "DK" H 2200 6950 50  0001 C CNN "MFN"
F 5 "SW1020CT-ND" H 2100 6850 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357A" H 2300 7050 50  0001 C CNN "PurchasingLink"
	1    1900 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6219B75A
P 2300 6600
F 0 "#PWR06" H 2300 6350 50  0001 C CNN
F 1 "GND" H 2305 6427 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Text Label 1500 6600 2    50   ~ 0
RESET
$Comp
L power:GND #PWR023
U 1 1 6221CDE3
P 11700 1650
F 0 "#PWR023" H 11700 1400 50  0001 C CNN
F 1 "GND" H 11705 1477 50  0000 C CNN
F 2 "" H 11700 1650 50  0001 C CNN
F 3 "" H 11700 1650 50  0001 C CNN
	1    11700 1650
	1    0    0    -1  
$EndComp
Text Label 11400 1750 2    50   ~ 0
PB0
Wire Wire Line
	9800 1750 10100 1750
Text Label 9800 1750 0    50   ~ 0
PB1
Wire Wire Line
	11100 1750 11400 1750
Text Label 11400 1850 2    50   ~ 0
PB2
Wire Wire Line
	11100 1850 11400 1850
Text Label 11400 1950 2    50   ~ 0
PB4
Wire Wire Line
	11100 1950 11400 1950
Text Label 11400 2050 2    50   ~ 0
PB6
Wire Wire Line
	11100 2050 11400 2050
Wire Wire Line
	9800 1850 10100 1850
Text Label 9800 1850 0    50   ~ 0
PB3
Wire Wire Line
	9800 1950 10100 1950
Text Label 9800 1950 0    50   ~ 0
PB5
Wire Wire Line
	9800 2050 10100 2050
Text Label 9800 2050 0    50   ~ 0
PB7
Text Label 11400 2150 2    50   ~ 0
PC0
Wire Wire Line
	11100 2150 11400 2150
Text Label 11400 2250 2    50   ~ 0
PC4
Wire Wire Line
	11100 2250 11400 2250
Text Label 11400 2350 2    50   ~ 0
PC6
Wire Wire Line
	11100 2350 11400 2350
Wire Wire Line
	9800 2150 10100 2150
Text Label 9800 2150 0    50   ~ 0
PC1
Wire Wire Line
	9800 2250 10100 2250
Text Label 9800 2250 0    50   ~ 0
PC5
Wire Wire Line
	9800 2350 10100 2350
Text Label 9800 2350 0    50   ~ 0
PC7
Wire Wire Line
	11100 1650 11700 1650
$Comp
L power:GND #PWR024
U 1 1 62256C5C
P 11700 2850
F 0 "#PWR024" H 11700 2600 50  0001 C CNN
F 1 "GND" H 11705 2677 50  0000 C CNN
F 2 "" H 11700 2850 50  0001 C CNN
F 3 "" H 11700 2850 50  0001 C CNN
	1    11700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1650 10100 1650
$Comp
L power:GND #PWR019
U 1 1 6221C86B
P 9500 1650
F 0 "#PWR019" H 9500 1400 50  0001 C CNN
F 1 "GND" H 9505 1477 50  0000 C CNN
F 2 "" H 9500 1650 50  0001 C CNN
F 3 "" H 9500 1650 50  0001 C CNN
	1    9500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2850 10100 2850
Text Label 11400 2450 2    50   ~ 0
PD0
Wire Wire Line
	11100 2450 11400 2450
Wire Wire Line
	11100 2550 11400 2550
Wire Wire Line
	11100 2650 11400 2650
Wire Wire Line
	11700 2850 11100 2850
Wire Wire Line
	9800 2450 10100 2450
Text Label 9800 2450 0    50   ~ 0
PD1
Wire Wire Line
	9800 2550 10100 2550
Text Label 11400 2550 2    50   ~ 0
PD5
Text Label 11400 2650 2    50   ~ 0
PD7
Text Label 9800 2550 0    50   ~ 0
PD6
Wire Wire Line
	1500 6600 1700 6600
Wire Wire Line
	2100 6600 2300 6600
Text Label 11400 2950 2    50   ~ 0
ADC2
Wire Wire Line
	11100 2950 11400 2950
Wire Wire Line
	9800 2950 10100 2950
Text Label 9800 2950 0    50   ~ 0
ADC3
Text Label 11400 3050 2    50   ~ 0
ADC4
Wire Wire Line
	11100 3050 11400 3050
Text Label 11400 3150 2    50   ~ 0
ADC6
Wire Wire Line
	11100 3150 11400 3150
Text Label 11400 3250 2    50   ~ 0
ADC8
Wire Wire Line
	11100 3250 11400 3250
Wire Wire Line
	9800 3050 10100 3050
Text Label 9800 3050 0    50   ~ 0
ADC5
Text Label 9800 3150 0    50   ~ 0
ADC7
Text Label 7300 6350 2    50   ~ 0
ADC10
Text Label 7300 6250 2    50   ~ 0
ADC9_ADC10
$Comp
L formula:CONN_01X03 J10
U 1 1 62348E99
P 7550 6250
F 0 "J10" H 7578 6291 50  0000 L CNN
F 1 "CONN_01X03" H 7578 6200 50  0000 L CNN
F 2 "footprints:PinHeader_1x03_P2.54mm_Vertical" H 7550 5050 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7550 5050 50  0001 C CNN
F 4 "Mouser" H 7550 6250 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7550 6250 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 7950 6850 60  0001 C CNN "PurchasingLink"
	1    7550 6250
	1    0    0    -1  
$EndComp
Text Label 7300 6150 2    50   ~ 0
ADC9
Text Label 9550 3250 0    50   ~ 0
ADC9_ADC10
Wire Wire Line
	9800 3150 10100 3150
Wire Wire Line
	9550 3250 10100 3250
$Comp
L power:GND #PWR025
U 1 1 62389EBD
P 11700 3650
F 0 "#PWR025" H 11700 3400 50  0001 C CNN
F 1 "GND" H 11705 3477 50  0000 C CNN
F 2 "" H 11700 3650 50  0001 C CNN
F 3 "" H 11700 3650 50  0001 C CNN
	1    11700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 3650 11100 3650
Text Notes 6650 5950 0    89   ~ 0
ADC MULTIPLEX JUMPER
NoConn ~ 10100 2650
NoConn ~ 11100 2750
NoConn ~ 11100 3750
NoConn ~ 11100 3550
NoConn ~ 11100 3450
NoConn ~ 11100 3350
NoConn ~ 10100 3350
NoConn ~ 10100 3450
NoConn ~ 10100 3550
NoConn ~ 10100 3750
$Comp
L formula:SSM3K333R Q1
U 1 1 62220448
P 4400 6600
F 0 "Q1" H 4606 6646 50  0000 L CNN
F 1 "SSM3K333R" H 4606 6555 50  0000 L CNN
F 2 "footprints:SOT-23F" H 4600 6525 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 4600 6675 50  0001 L CNN
F 4 "DK" H 4900 6975 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 4800 6875 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 4700 6775 60  0001 C CNN "PurchasingLink"
	1    4400 6600
	1    0    0    -1  
$EndComp
Text Label 4600 6350 0    50   ~ 0
RESET
Wire Wire Line
	4500 6350 4500 6400
Wire Wire Line
	4500 6350 4600 6350
Text Label 9550 2750 0    50   ~ 0
DIG-RESET
$Comp
L power:GND #PWR020
U 1 1 62250D02
P 9500 2850
F 0 "#PWR020" H 9500 2600 50  0001 C CNN
F 1 "GND" H 9505 2677 50  0000 C CNN
F 2 "" H 9500 2850 50  0001 C CNN
F 3 "" H 9500 2850 50  0001 C CNN
	1    9500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2750 10100 2750
Text Label 4200 6600 2    50   ~ 0
DIG-RESET
Text Notes 3250 6050 0    89   ~ 0
DIGITAL RESET: LOW SIDE DRIVE
$Comp
L formula:AP7370 U2
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
L power:+5V #PWR018
U 1 1 6229807F
P 4250 8200
F 0 "#PWR018" H 4250 8050 50  0001 C CNN
F 1 "+5V" H 4265 8373 50  0000 C CNN
F 2 "" H 4250 8200 50  0001 C CNN
F 3 "" H 4250 8200 50  0001 C CNN
	1    4250 8200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 622A0762
P 2700 9000
F 0 "#PWR015" H 2700 8750 50  0001 C CNN
F 1 "GND" H 2705 8827 50  0000 C CNN
F 2 "" H 2700 9000 50  0001 C CNN
F 3 "" H 2700 9000 50  0001 C CNN
	1    2700 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:SSW-122-01-G-D J12
U 1 1 621B9736
P 10600 2750
F 0 "J12" H 10600 4117 50  0000 C CNN
F 1 "732-5311-ND" H 10600 4026 50  0000 C CNN
F 2 "footprints:SAMTEC_SSW-122-01-G-D" H 11600 2550 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/prints/ssw-d.pdf" H 11850 2850 50  0001 L BNN
F 4 "Würth Elektronik" H 11900 2850 50  0001 C CNN "MFN"
F 5 "61304421121" H 11700 2800 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/61304421121/4846887" H 11700 2800 50  0001 C CNN "PurchasingLink"
	1    10600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3650 10100 3650
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
L power:GND #PWR013
U 1 1 622C58E9
P 1550 9550
F 0 "#PWR013" H 1550 9300 50  0001 C CNN
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
L power:GND #PWR014
U 1 1 622D49C5
P 2050 9000
F 0 "#PWR014" H 2050 8750 50  0001 C CNN
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
L power:GND #PWR016
U 1 1 622DC960
P 3300 9000
F 0 "#PWR016" H 3300 8750 50  0001 C CNN
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
L power:GND #PWR017
U 1 1 622E3188
P 3800 9550
F 0 "#PWR017" H 3800 9300 50  0001 C CNN
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
	7900 8350 8150 8350
Wire Wire Line
	7900 9150 8150 9150
Wire Wire Line
	8150 9050 8150 9150
Connection ~ 8150 9150
Wire Wire Line
	8150 9150 8300 9150
$Comp
L formula:CONN_01x02 J14
U 1 1 6236304D
P 8350 8550
F 0 "J14" H 8430 8542 50  0000 L CNN
F 1 "CONN_01x02" H 8430 8451 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 8250 8550 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/6130xx11121.pdf" H 8350 8650 50  0001 C CNN
F 4 "DK" H 8450 8750 50  0001 C CNN "MFN"
F 5 "732-5315-ND" H 8550 8850 50  0001 C CNN "MPN"
	1    8350 8550
	1    0    0    -1  
$EndComp
Connection ~ 8150 8350
Wire Wire Line
	8150 8350 8300 8350
Wire Wire Line
	8150 8650 8150 8750
Wire Wire Line
	7900 8900 7900 8350
Wire Wire Line
	8150 8550 8150 8350
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
L power:GND #PWR05
U 1 1 6222FFC8
P 4500 6800
F 0 "#PWR05" H 4500 6550 50  0001 C CNN
F 1 "GND" H 4505 6627 50  0000 C CNN
F 2 "" H 4500 6800 50  0001 C CNN
F 3 "" H 4500 6800 50  0001 C CNN
	1    4500 6800
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
	6450 900  6450 6650
Wire Notes Line
	6450 6650 8450 6650
Wire Notes Line
	8450 6650 8450 900 
Wire Notes Line
	8450 900  6450 900 
Wire Notes Line
	6450 5550 8450 5550
$Comp
L power:+12V #PWR0101
U 1 1 62591F95
P 14550 8450
F 0 "#PWR0101" H 14550 8300 50  0001 C CNN
F 1 "+12V" H 14565 8623 50  0000 C CNN
F 2 "" H 14550 8450 50  0001 C CNN
F 3 "" H 14550 8450 50  0001 C CNN
	1    14550 8450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 62595F0C
P 9500 3650
F 0 "#PWR0102" H 9500 3500 50  0001 C CNN
F 1 "+12V" H 9515 3823 50  0000 C CNN
F 2 "" H 9500 3650 50  0001 C CNN
F 3 "" H 9500 3650 50  0001 C CNN
	1    9500 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 625971B7
P 1250 8450
F 0 "#PWR0103" H 1250 8300 50  0001 C CNN
F 1 "+12V" H 1265 8623 50  0000 C CNN
F 2 "" H 1250 8450 50  0001 C CNN
F 3 "" H 1250 8450 50  0001 C CNN
	1    1250 8450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
