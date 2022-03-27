EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 14173 11000
encoding utf-8
Sheet 1 1
Title "go-kart/motor_ctrl"
Date "2022-02-26"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Adi Ramachandran"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE168D
P 2400 9100
F 0 "#PWR?" H 2400 8850 50  0001 C CNN
F 1 "GND" H 2400 8900 50  0000 C CNN
F 2 "" H 2400 9100 50  0001 C CNN
F 3 "" H 2400 9100 50  0001 C CNN
	1    2400 9100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 2100 9100
F 0 "#PWR?" H 2100 8850 50  0001 C CNN
F 1 "GND" H 2105 8927 50  0000 C CNN
F 2 "" H 2100 9100 50  0001 C CNN
F 3 "" H 2100 9100 50  0001 C CNN
	1    2100 9100
	1    0    0    -1  
$EndComp
$Comp
L formula:C_2.2uF C102
U 1 1 5BEE2647
P 2400 9000
F 0 "C102" H 2450 8850 50  0000 L CNN
F 1 "C_2.2uF" H 2280 9250 50  0000 L CNN
F 2 "footprints:C_0603_1608Metric" H 2438 8850 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/UPY-GPHC_X5R_4V-to-50V_25.pdf" H 2425 9100 50  0001 C CNN
F 4 "DK" H 2400 9000 60  0001 C CNN "MFN"
F 5 "311-1451-1-ND" H 2400 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/CC0603KRX5R6BB225/311-1451-1-ND/2833757" H 2825 9500 60  0001 C CNN "PurchasingLink"
	1    2400 9000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5BEE2923
P 2100 8950
F 0 "C101" H 2150 8800 50  0000 L CNN
F 1 "C_0.1uF" H 1930 9200 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2138 8800 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 2125 9050 50  0001 C CNN
F 4 "DK" H 2100 8950 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 2100 8950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 2525 9450 60  0001 C CNN "PurchasingLink"
	1    2100 8950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 12900 8650
F 0 "#PWR?" H 12900 8400 50  0001 C CNN
F 1 "GND" H 12905 8477 50  0000 C CNN
F 2 "" H 12900 8650 50  0001 C CNN
F 3 "" H 12900 8650 50  0001 C CNN
	1    12900 8650
	1    0    0    -1  
$EndComp
$Comp
L formula:F_500mA_16V F101
U 1 1 5C0BFA29
P 1050 8800
F 0 "F101" V 1130 8800 50  0000 C CNN
F 1 "F_500mA_16V" V 950 8820 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 980 8800 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1130 8800 50  0001 C CNN
F 4 "DK" H 1050 8800 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1050 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1530 9200 60  0001 C CNN "PurchasingLink"
	1    1050 8800
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 3950 9650
F 0 "D103" V 4150 9630 50  0000 R CNN
F 1 "LED_0805" V 4060 9630 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 3850 9650 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 3950 9750 50  0001 C CNN
F 4 "DK" H 3950 9650 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 3950 9650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4350 10150 60  0001 C CNN "PurchasingLink"
	1    3950 9650
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 3950 9050
F 0 "R105" V 3875 8950 50  0000 L CNN
F 1 "R_200" V 4025 8925 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3880 9050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4030 9050 50  0001 C CNN
F 4 "DK" H 3950 9050 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 3950 9050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4430 9450 60  0001 C CNN "PurchasingLink"
	1    3950 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 3950 10000
F 0 "#PWR?" H 3950 9750 50  0001 C CNN
F 1 "GND" H 3955 9827 50  0000 C CNN
F 2 "" H 3950 10000 50  0001 C CNN
F 3 "" H 3950 10000 50  0001 C CNN
	1    3950 10000
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 1300 9100
F 0 "D101" H 1290 9290 50  0000 C CNN
F 1 "D_Zener_18V" H 1280 9200 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1200 9100 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1300 9200 50  0001 C CNN
F 4 "DK" H 1500 9400 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1400 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 1700 9600 60  0001 C CNN "PurchasingLink"
	1    1300 9100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 1300 9350
F 0 "#PWR?" H 1300 9100 50  0001 C CNN
F 1 "GND" H 1305 9177 50  0000 C CNN
F 2 "" H 1300 9350 50  0001 C CNN
F 3 "" H 1300 9350 50  0001 C CNN
	1    1300 9350
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 1700 9400
F 0 "D102" V 1738 9283 50  0000 R CNN
F 1 "LED_0805" V 1647 9283 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1600 9400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1700 9500 50  0001 C CNN
F 4 "DK" H 1700 9400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1700 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2100 9900 60  0001 C CNN "PurchasingLink"
	1    1700 9400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 1700 9650
F 0 "#PWR?" H 1700 9400 50  0001 C CNN
F 1 "GND" H 1705 9477 50  0000 C CNN
F 2 "" H 1700 9650 50  0001 C CNN
F 3 "" H 1700 9650 50  0001 C CNN
	1    1700 9650
	1    0    0    -1  
$EndComp
Text Notes 1950 8700 0    50   ~ 0
Input Capacitors\n\n
Text Notes 1600 9700 1    50   ~ 0
12V Indicator
Text Notes 1200 9350 1    50   ~ 0
Protection\n
Text Notes 550  7925 0    89   ~ 0
LINREG
Text Notes 3225 8575 0    50   ~ 0
Output Capacitors\n
Text Notes 4525 8775 1    50   ~ 0
VCC Jumper\n
Text Notes 3800 9900 1    50   ~ 0
5V Indicator
$Comp
L formula:ATMEGA16M1 U2
U 1 1 5D58A7A6
P 2550 2925
F 0 "U2" H 3450 4785 50  0000 C CNN
F 1 "ATMEGA16M1" H 1850 4775 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2550 2925 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1600 4755 50  0001 C CNN
F 4 "DK" H 2550 2925 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2550 2925 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2000 5155 60  0001 C CNN "PurchasingLink"
	1    2550 2925
	1    0    0    -1  
$EndComp
Text Label 3650 2325 0    50   ~ 0
CAN_TX
Text Label 3650 2425 0    50   ~ 0
CAN_RX
Text Label 3650 3225 0    50   ~ 0
MISO
Text Label 3650 3325 0    50   ~ 0
MOSI
Text Label 3650 3425 0    50   ~ 0
SCK
Text Label 4300 3925 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1150 1375
F 0 "R1" V 1050 1325 50  0000 L CNN
F 1 "R_100" V 1240 1255 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 350 1525 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 850 1875 50  0001 C CNN
F 4 "DK" H 1150 1375 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 500 1625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1630 1775 60  0001 C CNN "PurchasingLink"
	1    1150 1375
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C3
U 1 1 5D58E505
P 1150 1675
F 0 "C3" V 1200 1525 50  0000 L CNN
F 1 "C_100pF" V 1000 1495 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1188 1525 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1175 1775 50  0001 C CNN
F 4 "DK" H 1150 1675 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1150 1675 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1575 2175 60  0001 C CNN "PurchasingLink"
	1    1150 1675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 800 1525
F 0 "#PWR?" H 800 1275 50  0001 C CNN
F 1 "GND" H 805 1352 50  0000 C CNN
F 2 "" H 800 1525 50  0001 C CNN
F 3 "" H 800 1525 50  0001 C CNN
	1    800  1525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1150 1825
F 0 "#PWR?" H 1150 1575 50  0001 C CNN
F 1 "GND" H 1155 1652 50  0000 C CNN
F 2 "" H 1150 1825 50  0001 C CNN
F 3 "" H 1150 1825 50  0001 C CNN
	1    1150 1825
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4100 4325
F 0 "Y1" H 3810 4395 50  0000 L CNN
F 1 "Crystal_SMD" H 3420 4325 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4050 4400 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4150 4500 50  0001 C CNN
F 4 "DK" H 4100 4325 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4100 4325 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4550 4900 60  0001 C CNN "PurchasingLink"
	1    4100 4325
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB5B2
P 3900 4575
F 0 "C4" H 3790 4655 50  0000 L CNN
F 1 "C_30pF" H 3630 4495 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3938 4425 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 3925 4675 50  0001 C CNN
F 4 "DK" H 3900 4575 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 3900 4575 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4325 5075 60  0001 C CNN "PurchasingLink"
	1    3900 4575
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB694
P 4300 4575
F 0 "C5" H 4320 4655 50  0000 L CNN
F 1 "C_30pF" H 4330 4475 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4338 4425 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4325 4675 50  0001 C CNN
F 4 "DK" H 4300 4575 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4300 4575 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4725 5075 60  0001 C CNN "PurchasingLink"
	1    4300 4575
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5D5EB7F3
P 4150 3725
F 0 "R3" V 4070 3725 50  0000 C CNN
F 1 "R_10K" V 4200 3975 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4080 3725 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4230 3725 50  0001 C CNN
F 4 "DK" H 4150 3725 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4150 3725 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4630 4125 60  0001 C CNN "PurchasingLink"
	1    4150 3725
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 3900 4725
F 0 "#PWR?" H 3900 4475 50  0001 C CNN
F 1 "GND" H 3905 4552 50  0000 C CNN
F 2 "" H 3900 4725 50  0001 C CNN
F 3 "" H 3900 4725 50  0001 C CNN
	1    3900 4725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4300 4725
F 0 "#PWR?" H 4300 4475 50  0001 C CNN
F 1 "GND" H 4305 4552 50  0000 C CNN
F 2 "" H 4300 4725 50  0001 C CNN
F 3 "" H 4300 4725 50  0001 C CNN
	1    4300 4725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4100 4475
F 0 "#PWR?" H 4100 4225 50  0001 C CNN
F 1 "GND" H 4105 4302 50  0000 C CNN
F 2 "" H 4100 4475 50  0001 C CNN
F 3 "" H 4100 4475 50  0001 C CNN
	1    4100 4475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 4450 4175
F 0 "#PWR?" H 4450 3925 50  0001 C CNN
F 1 "GND" H 4455 4002 50  0000 C CNN
F 2 "" H 4450 4175 50  0001 C CNN
F 3 "" H 4450 4175 50  0001 C CNN
	1    4450 4175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1300 4275
F 0 "#PWR?" H 1300 4025 50  0001 C CNN
F 1 "GND" H 1305 4102 50  0000 C CNN
F 2 "" H 1300 4275 50  0001 C CNN
F 3 "" H 1300 4275 50  0001 C CNN
	1    1300 4275
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U1
U 1 1 5D5FAEDE
P 12250 2100
F 0 "U1" H 12610 2450 50  0000 C CNN
F 1 "MCP2561-E_SN" H 12600 1740 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 12250 1600 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 11850 2450 50  0001 C CNN
F 4 "DK" H 12250 2100 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 12250 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 12250 2850 60  0001 C CNN "PurchasingLink"
	1    12250 2100
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5D5FB603
P 12100 1500
F 0 "C1" V 12050 1610 50  0000 C CNN
F 1 "C_0.1uF" V 12060 1310 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 12138 1350 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 12125 1600 50  0001 C CNN
F 4 "DK" H 12100 1500 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 12100 1500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 12525 2000 60  0001 C CNN "PurchasingLink"
	1    12100 1500
	0    1    1    0   
$EndComp
NoConn ~ 12750 2100
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 11950 1650
F 0 "#PWR?" H 11950 1400 50  0001 C CNN
F 1 "GND" H 11850 1650 50  0000 C CNN
F 2 "" H 11950 1650 50  0001 C CNN
F 3 "" H 11950 1650 50  0001 C CNN
	1    11950 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 12250 2500
F 0 "#PWR?" H 12250 2250 50  0001 C CNN
F 1 "GND" H 12255 2327 50  0000 C CNN
F 2 "" H 12250 2500 50  0001 C CNN
F 3 "" H 12250 2500 50  0001 C CNN
	1    12250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 11750 2300
F 0 "#PWR?" H 11750 2050 50  0001 C CNN
F 1 "GND" H 11755 2127 50  0000 C CNN
F 2 "" H 11750 2300 50  0001 C CNN
F 3 "" H 11750 2300 50  0001 C CNN
	1    11750 2300
	1    0    0    -1  
$EndComp
Text Label 11750 1900 2    50   ~ 0
CAN_TX
Text Label 11750 2000 2    50   ~ 0
CAN_RX
Text Label 13200 2250 0    50   ~ 0
CAN_-
Text Notes 11400 950  0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 575  700  0    89   ~ 0
ATMEGA 16M1\n
Text Notes 3550 5125 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 11775 8100 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 12000 8650
F 0 "#FLG?" H 12000 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 12000 8824 50  0000 C CNN
F 2 "" H 12000 8650 50  0001 C CNN
F 3 "~" H 12000 8650 50  0001 C CNN
	1    12000 8650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 12450 8650
F 0 "#FLG?" H 12450 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 12450 8824 50  0000 C CNN
F 2 "" H 12450 8650 50  0001 C CNN
F 3 "~" H 12450 8650 50  0001 C CNN
	1    12450 8650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 12900 8500
F 0 "#FLG?" H 12900 8575 50  0001 C CNN
F 1 "PWR_FLAG" H 12900 8674 50  0000 C CNN
F 2 "" H 12900 8500 50  0001 C CNN
F 3 "~" H 12900 8500 50  0001 C CNN
	1    12900 8500
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 12300 3800
F 0 "J1" H 12300 4010 50  0000 C CNN
F 1 "CONN_02X03" H 12190 3600 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 12300 2600 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 12300 2600 50  0001 C CNN
F 4 "DK" H 12300 3800 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 12300 3800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 12700 4400 60  0001 C CNN "PurchasingLink"
	1    12300 3800
	1    0    0    -1  
$EndComp
Text Label 12050 3700 2    50   ~ 0
MISO
Text Label 12050 3800 2    50   ~ 0
SCK
Text Label 12050 3900 2    50   ~ 0
RESET
Text Label 12550 3800 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 12550 3900
F 0 "#PWR?" H 12550 3650 50  0001 C CNN
F 1 "GND" H 12555 3727 50  0000 C CNN
F 2 "" H 12550 3900 50  0001 C CNN
F 3 "" H 12550 3900 50  0001 C CNN
	1    12550 3900
	1    0    0    -1  
$EndComp
Text Notes 11300 3450 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Wire Wire Line
	1450 1525 1150 1525
Connection ~ 1150 1525
$Comp
L formula:C_0.1uF C2
U 1 1 5D58E34B
P 800 1375
F 0 "C2" V 850 1235 50  0000 L CNN
F 1 "C_0.1uF" V 660 1215 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 838 1225 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 825 1475 50  0001 C CNN
F 4 "DK" H 800 1375 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 800 1375 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1225 1875 60  0001 C CNN "PurchasingLink"
	1    800  1375
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  1075 800  1225
Wire Wire Line
	800  1225 1150 1225
Connection ~ 800  1225
Connection ~ 1150 1225
Wire Wire Line
	1150 1225 1450 1225
Wire Wire Line
	1300 4275 1300 4125
Wire Wire Line
	1300 3725 1450 3725
Wire Wire Line
	1450 4125 1300 4125
Connection ~ 1300 4125
Wire Wire Line
	1300 4125 1300 3725
NoConn ~ 1450 1925
Wire Wire Line
	3900 4425 3900 4325
Wire Wire Line
	3900 4325 4000 4325
Wire Wire Line
	4200 4325 4300 4325
Wire Wire Line
	4300 4325 4300 4425
Wire Wire Line
	4100 4175 4450 4175
Wire Wire Line
	4300 4325 4300 4025
Wire Wire Line
	4300 4025 3650 4025
Connection ~ 4300 4325
Wire Wire Line
	3900 4325 3900 4125
Wire Wire Line
	3900 4125 3650 4125
Connection ~ 3900 4325
Wire Wire Line
	3650 3925 4000 3925
Wire Wire Line
	4000 3925 4000 3725
Connection ~ 4000 3925
Wire Wire Line
	4000 3925 4300 3925
Wire Wire Line
	4300 3725 4450 3725
Wire Wire Line
	4450 3725 4450 3575
Wire Wire Line
	11950 1500 11950 1650
Wire Wire Line
	12250 1700 12250 1500
Connection ~ 12250 1500
Wire Wire Line
	12250 1500 12250 1350
Wire Wire Line
	12750 2000 12850 2000
Wire Wire Line
	12850 2000 12850 1950
Wire Wire Line
	12850 2200 12850 2250
Wire Wire Line
	12450 8650 12450 8500
Wire Wire Line
	12900 8500 12900 8650
Wire Wire Line
	3950 8900 3950 8800
Wire Wire Line
	3950 9800 3950 10000
Wire Wire Line
	3950 9200 3950 9500
Wire Wire Line
	1300 9250 1300 9350
Connection ~ 2100 8800
Wire Wire Line
	1700 9550 1700 9650
Wire Wire Line
	12750 2200 12850 2200
$Comp
L formula:R_1K R101
U 1 1 5DE6EFCB
P 1700 9000
F 0 "R101" H 1770 9046 50  0000 L CNN
F 1 "R_1K" H 1770 8955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1630 9000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1780 9000 50  0001 C CNN
F 4 "DK" H 1700 9000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 1700 9000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2180 9400 60  0001 C CNN "PurchasingLink"
	1    1700 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 8800 2100 8800
Connection ~ 1700 8800
Wire Wire Line
	700  8800 900  8800
Wire Wire Line
	1200 8800 1300 8800
Wire Wire Line
	1300 8950 1300 8800
Connection ~ 1300 8800
Wire Wire Line
	1300 8800 1700 8800
$Comp
L formula:R_120_DNP R2
U 1 1 5FA5AB4A
P 13050 2100
F 0 "R2" H 13120 2146 50  0000 L CNN
F 1 "R_120_DNP" H 13120 2055 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11850 2250 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 11850 2550 50  0001 L CNN
F 4 "DK" H 13050 2100 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 11850 2350 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 11850 2450 60  0001 L CNN "PurchasingLink"
	1    13050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 1950 13050 1950
Wire Wire Line
	12850 2250 13050 2250
Connection ~ 13050 1950
Wire Wire Line
	13050 1950 13200 1950
Connection ~ 13050 2250
Wire Wire Line
	13050 2250 13200 2250
Wire Wire Line
	2100 8800 2400 8800
$Comp
L power:+5V #PWR?
U 1 1 5FD33116
P 4200 8350
F 0 "#PWR?" H 4200 8200 50  0001 C CNN
F 1 "+5V" H 4215 8523 50  0000 C CNN
F 2 "" H 4200 8350 50  0001 C CNN
F 3 "" H 4200 8350 50  0001 C CNN
	1    4200 8350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 800 1075
F 0 "#PWR?" H 800 925 50  0001 C CNN
F 1 "+5V" H 815 1248 50  0000 C CNN
F 2 "" H 800 1075 50  0001 C CNN
F 3 "" H 800 1075 50  0001 C CNN
	1    800  1075
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3B2BE
P 12250 1350
F 0 "#PWR?" H 12250 1200 50  0001 C CNN
F 1 "+5V" H 12265 1523 50  0000 C CNN
F 2 "" H 12250 1350 50  0001 C CNN
F 3 "" H 12250 1350 50  0001 C CNN
	1    12250 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 12550 3700
F 0 "#PWR?" H 12550 3550 50  0001 C CNN
F 1 "+5V" H 12565 3873 50  0000 C CNN
F 2 "" H 12550 3700 50  0001 C CNN
F 3 "" H 12550 3700 50  0001 C CNN
	1    12550 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 12450 8500
F 0 "#PWR?" H 12450 8350 50  0001 C CNN
F 1 "+5V" H 12465 8673 50  0000 C CNN
F 2 "" H 12450 8500 50  0001 C CNN
F 3 "" H 12450 8500 50  0001 C CNN
	1    12450 8500
	1    0    0    -1  
$EndComp
Connection ~ 2400 8800
Text Notes 4000 3300 0    50   ~ 0
MOSI, MISO, and SCK \nmust stay connected \nto the _A pins for \nprogramming.
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 4450 3575
F 0 "#PWR?" H 4450 3425 50  0001 C CNN
F 1 "+5V" H 4465 3748 50  0000 C CNN
F 2 "" H 4450 3575 50  0001 C CNN
F 3 "" H 4450 3575 50  0001 C CNN
	1    4450 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 8800 1700 8850
Wire Wire Line
	1700 9150 1700 9250
Wire Wire Line
	4200 8800 4200 8750
Wire Wire Line
	4200 8450 4200 8350
Connection ~ 3950 8800
Wire Wire Line
	3950 8800 4200 8800
$Comp
L power:+BATT #PWR?
U 1 1 615FBF35
P 700 8600
F 0 "#PWR?" H 700 8450 50  0001 C CNN
F 1 "+BATT" H 715 8773 50  0000 C CNN
F 2 "" H 700 8600 50  0001 C CNN
F 3 "" H 700 8600 50  0001 C CNN
	1    700  8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  8600 700  8800
$Comp
L power:+BATT #PWR?
U 1 1 6160D1CA
P 12000 8500
F 0 "#PWR?" H 12000 8350 50  0001 C CNN
F 1 "+BATT" H 12015 8673 50  0000 C CNN
F 2 "" H 12000 8500 50  0001 C CNN
F 3 "" H 12000 8500 50  0001 C CNN
	1    12000 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 8500 12000 8650
$Comp
L formula:AP7370 U3
U 1 1 621AB8BB
P 3050 8800
F 0 "U3" H 3050 9042 50  0000 C CNN
F 1 "AP7370" H 3050 8951 50  0000 C CNN
F 2 "footprints:SOT-23-5" H 3000 9000 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP7370.pdf" H 3150 8550 50  0001 C CNN
F 4 "DK" H 3100 9125 60  0001 C CNN "MFN"
F 5 "AP7370-50W5-7DICT-ND" H 3200 9225 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/diodes-incorporated/AP7370-50W5-7/10235827" H 3200 9225 60  0001 C CNN "PurchasingLink"
	1    3050 8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 8800 2750 8800
$Comp
L formula:C_1uF C6
U 1 1 621B9CB9
P 3475 9000
F 0 "C6" H 3590 9096 50  0000 L CNN
F 1 "C_1uF" H 3590 9005 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3513 9600 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 3500 9850 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 3900 9500 60  0001 C CNN "PurchasingLink"
	1    3475 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 8800 3475 8800
Connection ~ 3475 8800
Wire Wire Line
	3475 8800 3950 8800
$Comp
L power:GND #PWR?
U 1 1 621BB7C1
P 3475 9100
F 0 "#PWR?" H 3475 8850 50  0001 C CNN
F 1 "GND" H 3480 8927 50  0000 C CNN
F 2 "" H 3475 9100 50  0001 C CNN
F 3 "" H 3475 9100 50  0001 C CNN
	1    3475 9100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621BC03E
P 3050 9100
F 0 "#PWR?" H 3050 8850 50  0001 C CNN
F 1 "GND" H 3055 8927 50  0000 C CNN
F 2 "" H 3050 9100 50  0001 C CNN
F 3 "" H 3050 9100 50  0001 C CNN
	1    3050 9100
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q1
U 1 1 621BEACC
P 6025 1975
F 0 "Q1" H 6231 2021 50  0000 L CNN
F 1 "SSM3K333R" H 6231 1930 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6225 1900 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6225 2050 50  0001 L CNN
F 4 "DK" H 6525 2350 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6425 2250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6325 2150 60  0001 C CNN "PurchasingLink"
	1    6025 1975
	1    0    0    -1  
$EndComp
Text Label 5825 1975 2    50   ~ 0
SL_MODE
$Comp
L power:GND #PWR?
U 1 1 621C29E8
P 6125 2225
F 0 "#PWR?" H 6125 1975 50  0001 C CNN
F 1 "GND" H 6130 2052 50  0000 C CNN
F 2 "" H 6125 2225 50  0001 C CNN
F 3 "" H 6125 2225 50  0001 C CNN
	1    6125 2225
	1    0    0    -1  
$EndComp
Text Label 6725 1150 0    50   ~ 0
CONN_SL_1
Text Label 6725 1350 0    50   ~ 0
CONN_SL_2
$Comp
L formula:CPC1004N U5
U 1 1 621D1EB9
P 6425 1250
F 0 "U5" H 6425 1575 50  0000 C CNN
F 1 "CPC1004N" H 6425 1484 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6425 950 50  0001 C CNN
F 3 "https://www.ixysic.com/home/pdfs.nsf/www/CPC1004N.pdf/$file/CPC1004N.pdf" H 6425 1250 50  0001 C CNN
	1    6425 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 1350 6125 1475
$Comp
L formula:R_1K R4
U 1 1 621D61AD
P 6125 1625
F 0 "R4" H 6195 1671 50  0000 L CNN
F 1 "R_1K" H 6195 1580 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6055 1625 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 6205 1625 50  0001 C CNN
F 4 "DK" H 6125 1625 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 6125 1625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6605 2025 60  0001 C CNN "PurchasingLink"
	1    6125 1625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621D7A30
P 6125 1050
F 0 "#PWR?" H 6125 900 50  0001 C CNN
F 1 "+5V" H 6140 1223 50  0000 C CNN
F 2 "" H 6125 1050 50  0001 C CNN
F 3 "" H 6125 1050 50  0001 C CNN
	1    6125 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 1050 6125 1150
$Comp
L formula:SSM3K333R Q2
U 1 1 621E8E8C
P 6025 3650
F 0 "Q2" H 6231 3696 50  0000 L CNN
F 1 "SSM3K333R" H 6231 3605 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6225 3575 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6225 3725 50  0001 L CNN
F 4 "DK" H 6525 4025 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6425 3925 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6325 3825 60  0001 C CNN "PurchasingLink"
	1    6025 3650
	1    0    0    -1  
$EndComp
Text Label 5825 3650 2    50   ~ 0
REVERSE
$Comp
L power:GND #PWR?
U 1 1 621E8E93
P 6125 3900
F 0 "#PWR?" H 6125 3650 50  0001 C CNN
F 1 "GND" H 6130 3727 50  0000 C CNN
F 2 "" H 6125 3900 50  0001 C CNN
F 3 "" H 6125 3900 50  0001 C CNN
	1    6125 3900
	1    0    0    -1  
$EndComp
Text Label 6725 2825 0    50   ~ 0
CONN_REVERSE_BROWN
Text Label 6725 3025 0    50   ~ 0
CONN_REVERSE_BLACK
$Comp
L formula:CPC1004N U6
U 1 1 621E8E9B
P 6425 2925
F 0 "U6" H 6425 3250 50  0000 C CNN
F 1 "CPC1004N" H 6425 3159 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6425 2625 50  0001 C CNN
F 3 "https://www.ixysic.com/home/pdfs.nsf/www/CPC1004N.pdf/$file/CPC1004N.pdf" H 6425 2925 50  0001 C CNN
	1    6425 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3025 6125 3125
$Comp
L formula:R_1K R5
U 1 1 621E8EA5
P 6125 3300
F 0 "R5" H 6195 3346 50  0000 L CNN
F 1 "R_1K" H 6195 3255 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6055 3300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 6205 3300 50  0001 C CNN
F 4 "DK" H 6125 3300 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 6125 3300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6605 3700 60  0001 C CNN "PurchasingLink"
	1    6125 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621E8EAC
P 6125 2725
F 0 "#PWR?" H 6125 2575 50  0001 C CNN
F 1 "+5V" H 6140 2898 50  0000 C CNN
F 2 "" H 6125 2725 50  0001 C CNN
F 3 "" H 6125 2725 50  0001 C CNN
	1    6125 2725
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 2725 6125 2825
$Comp
L formula:SSM3K333R Q3
U 1 1 621F0512
P 8050 1975
F 0 "Q3" H 8256 2021 50  0000 L CNN
F 1 "SSM3K333R" H 8256 1930 50  0000 L CNN
F 2 "footprints:SOT-23F" H 8250 1900 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 8250 2050 50  0001 L CNN
F 4 "DK" H 8550 2350 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 8450 2250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 8350 2150 60  0001 C CNN "PurchasingLink"
	1    8050 1975
	1    0    0    -1  
$EndComp
Text Label 7850 1975 2    50   ~ 0
CRUISE_CONTROL
$Comp
L power:GND #PWR?
U 1 1 621F0519
P 8150 2225
F 0 "#PWR?" H 8150 1975 50  0001 C CNN
F 1 "GND" H 8155 2052 50  0000 C CNN
F 2 "" H 8150 2225 50  0001 C CNN
F 3 "" H 8150 2225 50  0001 C CNN
	1    8150 2225
	1    0    0    -1  
$EndComp
Text Label 8750 1150 0    50   ~ 0
CONN_CC_ORANGE
Text Label 8750 1350 0    50   ~ 0
CONN_CC_BLACK
$Comp
L formula:CPC1004N U9
U 1 1 621F0521
P 8450 1250
F 0 "U9" H 8450 1575 50  0000 C CNN
F 1 "CPC1004N" H 8450 1484 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 8450 950 50  0001 C CNN
F 3 "https://www.ixysic.com/home/pdfs.nsf/www/CPC1004N.pdf/$file/CPC1004N.pdf" H 8450 1250 50  0001 C CNN
	1    8450 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1350 8150 1475
$Comp
L formula:R_1K R6
U 1 1 621F052B
P 8150 1625
F 0 "R6" H 8220 1671 50  0000 L CNN
F 1 "R_1K" H 8220 1580 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8080 1625 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 8230 1625 50  0001 C CNN
F 4 "DK" H 8150 1625 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 8150 1625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8630 2025 60  0001 C CNN "PurchasingLink"
	1    8150 1625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621F0532
P 8150 1050
F 0 "#PWR?" H 8150 900 50  0001 C CNN
F 1 "+5V" H 8165 1223 50  0000 C CNN
F 2 "" H 8150 1050 50  0001 C CNN
F 3 "" H 8150 1050 50  0001 C CNN
	1    8150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1050 8150 1150
$Comp
L formula:AD5220BRZ50 U4
U 1 1 62209F0F
P 6375 4900
F 0 "U4" H 5775 5275 50  0000 C CNN
F 1 "AD5220BRZ50" H 6000 5175 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 6325 4250 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5220.pdf" H 6375 4900 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/analog-devices-inc/AD5220BRZ50/997391" H 6325 4150 50  0001 C CNN "Purchasing Link"
	1    6375 4900
	1    0    0    -1  
$EndComp
Text Label 5975 4800 2    50   ~ 0
POT_CLK
Text Label 5975 4950 2    50   ~ 0
POT_~CS
Text Label 5975 5100 2    50   ~ 0
POT_U~D
$Comp
L power:GND #PWR?
U 1 1 6220DED7
P 6375 5300
F 0 "#PWR?" H 6375 5050 50  0001 C CNN
F 1 "GND" H 6380 5127 50  0000 C CNN
F 2 "" H 6375 5300 50  0001 C CNN
F 3 "" H 6375 5300 50  0001 C CNN
	1    6375 5300
	1    0    0    -1  
$EndComp
Text Label 6725 5100 0    50   ~ 0
CONN_THR_GND
Text Label 6725 4950 0    50   ~ 0
CONN_THR_GREEN
Text Label 6725 4800 0    50   ~ 0
CONN_THR_5V
Text Notes 5900 5600 0    50   ~ 0
Digi Pot for MC Throttle
$Comp
L formula:SN74LVC2G53 U10
U 1 1 6221B3FA
P 8550 3425
F 0 "U10" H 7975 3650 50  0000 C CNN
F 1 "SN74LVC2G53" H 8200 3575 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 8550 3425 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lvc2g53.pdf?HQS=dis-dk-null-digikeymode-dsf-pf-null-wwe&ts=1645907797820&ref_url=https%253A%252F%252Fwww.ti.com%252Fgeneral%252Fdocs%252Fsuppproductinfo.tsp%253FdistId%253D10%2526gotoUrl%253Dhttps%253A%252F%252Fwww.ti.com%252Flit%252Fgpn%252Fsn74lvc2g53" H 8550 3425 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/texas-instruments/SN74LVC2G53DCTR/484835" H 8550 3425 50  0001 C CNN "Purchasing Link"
	1    8550 3425
	1    0    0    -1  
$EndComp
Text Label 8200 3475 2    50   ~ 0
CONN_SPD_BLACK
Text Label 9000 3475 0    50   ~ 0
CONN_SPD_ORANGE
Text Label 9000 3575 0    50   ~ 0
CONN_SPD_BLUE
Text Label 8200 3575 2    50   ~ 0
SPD_INH
Text Label 8200 3675 2    50   ~ 0
SPD_A
Wire Wire Line
	8550 3875 8625 3875
$Comp
L power:GND #PWR?
U 1 1 6222022B
P 8625 3875
F 0 "#PWR?" H 8625 3625 50  0001 C CNN
F 1 "GND" H 8630 3702 50  0000 C CNN
F 2 "" H 8625 3875 50  0001 C CNN
F 3 "" H 8625 3875 50  0001 C CNN
	1    8625 3875
	1    0    0    -1  
$EndComp
Connection ~ 8625 3875
Wire Wire Line
	8625 3875 8700 3875
Text Notes 8725 2650 0    50   ~ 0
SPDT IC for MC Speed Control 
$Comp
L formula:SN74LVC2G53 U11
U 1 1 6222751C
P 8575 4775
F 0 "U11" H 8000 5000 50  0000 C CNN
F 1 "SN74LVC2G53" H 8225 4925 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 8575 4775 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lvc2g53.pdf?HQS=dis-dk-null-digikeymode-dsf-pf-null-wwe&ts=1645907797820&ref_url=https%253A%252F%252Fwww.ti.com%252Fgeneral%252Fdocs%252Fsuppproductinfo.tsp%253FdistId%253D10%2526gotoUrl%253Dhttps%253A%252F%252Fwww.ti.com%252Flit%252Fgpn%252Fsn74lvc2g53" H 8575 4775 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/texas-instruments/SN74LVC2G53DCTR/484835" H 8575 4775 50  0001 C CNN "Purchasing Link"
	1    8575 4775
	1    0    0    -1  
$EndComp
Text Label 8225 4825 2    50   ~ 0
CONN_BRK_BLACK
Text Label 9025 4825 0    50   ~ 0
CONN_BRK_WHITE
Text Label 9025 4925 0    50   ~ 0
CONN_BRK_YELLOW
Text Label 8225 4925 2    50   ~ 0
BRK_INH
Text Label 8225 5025 2    50   ~ 0
BRK_A
Wire Wire Line
	8575 5225 8650 5225
$Comp
L power:GND #PWR?
U 1 1 62227528
P 8650 5225
F 0 "#PWR?" H 8650 4975 50  0001 C CNN
F 1 "GND" H 8655 5052 50  0000 C CNN
F 2 "" H 8650 5225 50  0001 C CNN
F 3 "" H 8650 5225 50  0001 C CNN
	1    8650 5225
	1    0    0    -1  
$EndComp
Connection ~ 8650 5225
Wire Wire Line
	8650 5225 8725 5225
$Comp
L power:+5V #PWR?
U 1 1 62227530
P 8625 4350
F 0 "#PWR?" H 8625 4200 50  0001 C CNN
F 1 "+5V" H 8640 4523 50  0000 C CNN
F 2 "" H 8625 4350 50  0001 C CNN
F 3 "" H 8625 4350 50  0001 C CNN
	1    8625 4350
	1    0    0    -1  
$EndComp
Text Notes 8225 5600 0    50   ~ 0
SPDT IC for MC EBrake
Text Label 3650 2525 0    50   ~ 0
SL_MODE
Text Label 3650 1325 0    50   ~ 0
REVERSE
Text Label 3650 1425 0    50   ~ 0
CRUISE_CONTROL
Text Label 3650 2225 0    50   ~ 0
POT_CLK
Text Label 3650 1625 0    50   ~ 0
POT_~CS
Text Label 3650 1825 0    50   ~ 0
SPD_INH
Text Label 3650 1925 0    50   ~ 0
SPD_A
Text Label 3650 2125 0    50   ~ 0
BRK_INH
Text Notes 6825 7825 0    50   ~ 0
Motor Controller Harnessing
$Comp
L power:+BATT #PWR?
U 1 1 62215A61
P 6500 9450
F 0 "#PWR?" H 6500 9300 50  0001 C CNN
F 1 "+BATT" H 6375 9575 50  0000 C CNN
F 2 "" H 6500 9450 50  0001 C CNN
F 3 "" H 6500 9450 50  0001 C CNN
	1    6500 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9075 6500 9075
Wire Wire Line
	6500 9075 6500 9125
$Comp
L power:GND #PWR?
U 1 1 6221E0FB
P 6500 9125
F 0 "#PWR?" H 6500 8875 50  0001 C CNN
F 1 "GND" H 6375 9050 50  0000 C CNN
F 2 "" H 6500 9125 50  0001 C CNN
F 3 "" H 6500 9125 50  0001 C CNN
	1    6500 9125
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 9450 6850 9450
Text Label 6850 9550 2    50   ~ 0
CAN_+
Text Label 6850 9350 2    50   ~ 0
CAN_-
Text Label 13200 1950 0    50   ~ 0
CAN_+
$Comp
L power:+BATT #PWR?
U 1 1 622246E4
P 6500 10225
F 0 "#PWR?" H 6500 10075 50  0001 C CNN
F 1 "+BATT" H 6350 10300 50  0000 C CNN
F 2 "" H 6500 10225 50  0001 C CNN
F 3 "" H 6500 10225 50  0001 C CNN
	1    6500 10225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622246EC
P 6450 9950
F 0 "#PWR?" H 6450 9700 50  0001 C CNN
F 1 "GND" H 6350 9950 50  0000 C CNN
F 2 "" H 6450 9950 50  0001 C CNN
F 3 "" H 6450 9950 50  0001 C CNN
	1    6450 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 10225 6850 10225
Text Label 6850 10050 2    50   ~ 0
CAN_+
Text Label 6850 9850 2    50   ~ 0
CAN_-
Text Notes 6200 9925 1    50   ~ 0
Vehicle Connectors
Text Label 7825 8400 0    50   ~ 0
CONN_SL_2
Text Label 6850 8400 2    50   ~ 0
CONN_SPD_ORANGE
Text Label 6850 8500 2    50   ~ 0
CONN_SPD_BLUE
Text Label 6850 8300 2    50   ~ 0
CONN_SPD_BLACK
Text Label 6850 8000 2    50   ~ 0
CONN_THR_5V
Text Label 6850 8100 2    50   ~ 0
CONN_THR_GREEN
Text Label 6850 8200 2    50   ~ 0
CONN_THR_GND
Text Label 6850 8600 2    50   ~ 0
CONN_REVERSE_BLACK
Text Label 6850 8700 2    50   ~ 0
CONN_REVERSE_BROWN
Text Label 6850 8900 2    50   ~ 0
CONN_CC_ORANGE
Text Label 6850 8800 2    50   ~ 0
CONN_CC_BLACK
$Comp
L formula:NanoFit_VT_TH_10 U8
U 1 1 62272847
P 7625 8450
F 0 "U8" V 7450 8900 50  0000 C CNN
F 1 "NanoFit_VT_TH_10" V 7450 8300 50  0000 C CNN
F 2 "footprints:NanoFit_VT_10" H 7625 7800 50  0001 C CNN
F 3 "" H 7625 8450 50  0001 C CNN
	1    7625 8450
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_VT_TH_10 U7
U 1 1 62274332
P 7050 8450
F 0 "U7" V 6875 8050 50  0000 R CNN
F 1 "NanoFit_VT_TH_10" V 6875 8950 50  0000 R CNN
F 2 "footprints:NanoFit_VT_10" H 7050 7800 50  0001 C CNN
F 3 "" H 7050 8450 50  0001 C CNN
	1    7050 8450
	-1   0    0    1   
$EndComp
Text Label 7825 8000 0    50   ~ 0
CONN_BRK_WHITE
Text Label 7825 8100 0    50   ~ 0
CONN_BRK_BLACK
Text Label 7825 8200 0    50   ~ 0
CONN_BRK_YELLOW
Wire Notes Line
	550  7975 4925 7975
Wire Notes Line
	4925 7975 4925 10300
Wire Notes Line
	4925 10300 550  10300
Wire Notes Line
	550  10300 550  7975
Wire Notes Line
	8850 7625 8850 10300
Wire Notes Line
	8850 10300 5675 10300
Wire Notes Line
	5675 10300 5675 7625
Wire Notes Line
	8850 7625 5675 7625
Text Notes 5650 7600 0    89   ~ 0
CONNECTORS
Wire Notes Line
	5300 750  9975 750 
Wire Notes Line
	9975 750  9975 5650
Wire Notes Line
	9975 5650 5300 5650
Wire Notes Line
	5300 5650 5300 750 
Wire Notes Line
	11400 1000 11400 2900
Wire Notes Line
	11400 2900 13575 2900
Wire Notes Line
	13575 2900 13575 1000
Wire Notes Line
	13575 1000 11400 1000
NoConn ~ 3650 3025
NoConn ~ 3650 3125
NoConn ~ 3650 3525
NoConn ~ 3650 3625
NoConn ~ 3650 3725
Wire Notes Line
	575  725  4900 725 
Wire Notes Line
	4900 725  4900 5300
Wire Notes Line
	4900 5300 575  5300
Wire Notes Line
	575  5300 575  725 
Text Notes 5300 725  0    89   ~ 0
LOGIC SWITCHES
Wire Notes Line
	11775 8150 13175 8150
Wire Notes Line
	13175 8150 13175 8950
Wire Notes Line
	13175 8950 11775 8950
Wire Notes Line
	11775 8950 11775 8150
NoConn ~ 7825 8500
NoConn ~ 7825 8600
NoConn ~ 7825 8700
NoConn ~ 7825 8800
NoConn ~ 7825 8900
Wire Wire Line
	7875 9450 8000 9450
$Comp
L power:GND #PWR?
U 1 1 622DA0A8
P 8000 9450
F 0 "#PWR?" H 8000 9200 50  0001 C CNN
F 1 "GND" H 8005 9277 50  0000 C CNN
F 2 "" H 8000 9450 50  0001 C CNN
F 3 "" H 8000 9450 50  0001 C CNN
	1    8000 9450
	1    0    0    -1  
$EndComp
Text Label 7900 9350 0    50   ~ 0
HALL_SNS
$Comp
L formula:R_10K R8
U 1 1 622E7D57
P 8350 9200
F 0 "R8" V 8350 9100 50  0000 L CNN
F 1 "R_10K" V 8425 9100 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8280 9200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 8430 9200 50  0001 C CNN
F 4 "DK" H 8350 9200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 8350 9200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 8830 9600 60  0001 C CNN "PurchasingLink"
	1    8350 9200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 9350 7875 9350
$Comp
L power:+5V #PWR?
U 1 1 62300F0F
P 8200 9050
F 0 "#PWR?" H 8200 8900 50  0001 C CNN
F 1 "+5V" H 8215 9223 50  0000 C CNN
F 2 "" H 8200 9050 50  0001 C CNN
F 3 "" H 8200 9050 50  0001 C CNN
	1    8200 9050
	1    0    0    -1  
$EndComp
Text Notes 8650 9375 1    50   ~ 0
DNP 10K\nPullup
Text Notes 7750 9975 0    50   ~ 0
Hall Effect Sense \nConnector
Text Notes 5750 6850 0    50   ~ 0
NOTES: \nAssuming that we'll be tying the Red power switch wire\nstraight to the MC+ Input and switching via the AIR
$Comp
L formula:CONN_01X03 J4
U 1 1 621EF47E
P 7625 9350
F 0 "J4" H 7492 9025 50  0000 C CNN
F 1 "CONN_01X03" H 7492 9116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7625 8150 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/181/M20-999-1218971.pdf" H 7625 8150 50  0001 C CNN
F 4 "Mouser" H 7625 9350 60  0001 C CNN "MFN"
F 5 "855-M20-9990346" H 7625 9350 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Harwin/M20-9990346?qs=sGAEpiMZZMs%252bGHln7q6pmzlZUuX%2f53qj1ROyRKct5o4%3d" H 8025 9950 60  0001 C CNN "PurchasingLink"
	1    7625 9350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7875 9250 8200 9250
Wire Wire Line
	8200 9250 8200 9050
Wire Wire Line
	8200 9050 8350 9050
Connection ~ 8200 9050
Text Label 3650 1225 0    50   ~ 0
HALL_SNS
Wire Wire Line
	6125 2225 6125 2175
Wire Wire Line
	8150 2225 8150 2175
Text Label 3650 2625 0    50   ~ 0
ID_PULLDOWN
$Comp
L formula:R_10K R7
U 1 1 6221A307
P 4300 2575
F 0 "R7" H 4370 2621 50  0000 L CNN
F 1 "R_10K" H 4370 2530 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4230 2575 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4380 2575 50  0001 C CNN
F 4 "DK" H 4300 2575 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4300 2575 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4780 2975 60  0001 C CNN "PurchasingLink"
	1    4300 2575
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2625 4175 2625
Wire Wire Line
	4175 2625 4175 2425
Wire Wire Line
	4175 2425 4300 2425
$Comp
L power:GND #PWR?
U 1 1 6221DB0C
P 4300 2725
F 0 "#PWR?" H 4300 2475 50  0001 C CNN
F 1 "GND" H 4305 2552 50  0000 C CNN
F 2 "" H 4300 2725 50  0001 C CNN
F 3 "" H 4300 2725 50  0001 C CNN
	1    4300 2725
	1    0    0    -1  
$EndComp
Text Notes 4075 2350 0    50   ~ 0
DNP this pulldown \non brd1, to serve as \na board ID indicator
$Comp
L formula:MicroFit_RA_4 J2
U 1 1 62221ED5
P 7050 9400
F 0 "J2" V 6825 9600 50  0000 R CNN
F 1 "MicroFit_RA_4" V 6900 9600 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 7050 9100 50  0001 C CNN
F 3 "" H 7050 9400 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7050 9400 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7050 9400 50  0001 C CNN "PurchasingLink"
	1    7050 9400
	-1   0    0    1   
$EndComp
$Comp
L formula:MicroFit_RA_4 J3
U 1 1 62222D8C
P 7050 10000
F 0 "J3" V 6825 10200 50  0000 R CNN
F 1 "MicroFit_RA_4" V 6900 10200 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 7050 9700 50  0001 C CNN
F 3 "" H 7050 10000 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7050 10000 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 7050 10000 50  0001 C CNN "PurchasingLink"
	1    7050 10000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8625 4350 8625 4575
$Comp
L formula:C_0.1uF C9
U 1 1 62251FF0
P 8850 4400
F 0 "C9" H 8965 4446 50  0000 L CNN
F 1 "C_0.1uF" H 8965 4355 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8888 4250 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8875 4500 50  0001 C CNN
F 4 "DK" H 8850 4400 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8850 4400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9275 4900 60  0001 C CNN "PurchasingLink"
	1    8850 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6225393E
P 8850 4550
F 0 "#PWR?" H 8850 4300 50  0001 C CNN
F 1 "GND" H 8855 4377 50  0000 C CNN
F 2 "" H 8850 4550 50  0001 C CNN
F 3 "" H 8850 4550 50  0001 C CNN
	1    8850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8625 4350 8725 4350
Wire Wire Line
	8725 4350 8725 4250
Wire Wire Line
	8725 4250 8850 4250
Connection ~ 8625 4350
$Comp
L power:+5V #PWR?
U 1 1 6220D485
P 6375 4375
F 0 "#PWR?" H 6375 4225 50  0001 C CNN
F 1 "+5V" H 6390 4548 50  0000 C CNN
F 2 "" H 6375 4375 50  0001 C CNN
F 3 "" H 6375 4375 50  0001 C CNN
	1    6375 4375
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C7
U 1 1 622608BF
P 6600 4425
F 0 "C7" H 6715 4471 50  0000 L CNN
F 1 "C_0.1uF" H 6715 4380 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6638 4275 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6625 4525 50  0001 C CNN
F 4 "DK" H 6600 4425 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6600 4425 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7025 4925 60  0001 C CNN "PurchasingLink"
	1    6600 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 4375 6475 4375
Wire Wire Line
	6475 4375 6475 4275
$Comp
L power:GND #PWR?
U 1 1 6226386C
P 6600 4575
F 0 "#PWR?" H 6600 4325 50  0001 C CNN
F 1 "GND" H 6725 4500 50  0000 C CNN
F 2 "" H 6600 4575 50  0001 C CNN
F 3 "" H 6600 4575 50  0001 C CNN
	1    6600 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 4600 6375 4375
Connection ~ 6375 4375
Wire Wire Line
	6600 4275 6475 4275
Wire Wire Line
	8600 2925 8700 2925
Wire Wire Line
	8700 2925 8700 2825
Wire Wire Line
	8700 2825 8825 2825
Wire Wire Line
	8600 3225 8600 2925
$Comp
L formula:C_0.1uF C8
U 1 1 6226BEED
P 8825 2975
F 0 "C8" H 8940 3021 50  0000 L CNN
F 1 "C_0.1uF" H 8940 2930 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8863 2825 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8850 3075 50  0001 C CNN
F 4 "DK" H 8825 2975 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8825 2975 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9250 3475 60  0001 C CNN "PurchasingLink"
	1    8825 2975
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622732E6
P 8825 3125
F 0 "#PWR?" H 8825 2875 50  0001 C CNN
F 1 "GND" H 8830 2952 50  0000 C CNN
F 2 "" H 8825 3125 50  0001 C CNN
F 3 "" H 8825 3125 50  0001 C CNN
	1    8825 3125
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 622740B5
P 8600 2925
F 0 "#PWR?" H 8600 2775 50  0001 C CNN
F 1 "+5V" H 8615 3098 50  0000 C CNN
F 2 "" H 8600 2925 50  0001 C CNN
F 3 "" H 8600 2925 50  0001 C CNN
	1    8600 2925
	1    0    0    -1  
$EndComp
Connection ~ 8600 2925
Text Label 7825 8300 0    50   ~ 0
CONN_SL_1
$Comp
L formula:R_0 R9
U 1 1 62241F08
P 4200 8600
F 0 "R9" H 4270 8646 50  0000 L CNN
F 1 "R_0" H 4270 8555 50  0000 L CNN
F 2 "footprints:R_0603_1608Metric" H 4130 8600 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 4280 8600 50  0001 C CNN
F 4 "DK" H 4200 8600 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 4200 8600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 4680 9000 60  0001 C CNN "PurchasingLink"
	1    4200 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9075 6850 9250
Wire Wire Line
	6450 9950 6850 9950
Wire Wire Line
	6850 10225 6850 10150
Text Label 3650 1525 0    50   ~ 0
BRK_A
Text Label 3650 1725 0    50   ~ 0
POT_U~D
Text Notes 4000 2050 0    50   ~ 0
POT_CLK is a PWM \npin for the digipot
$Comp
L formula:Test_Point_SMD TP2
U 1 1 6228C164
P 6075 3125
F 0 "TP2" V 6325 3700 50  0000 C CNN
F 1 "Test_Point_SMD" V 6225 3475 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6075 2975 50  0001 C CNN
F 3 "" H 6075 3125 50  0001 C CNN
	1    6075 3125
	0    -1   -1   0   
$EndComp
Connection ~ 6125 3125
Wire Wire Line
	6125 3125 6125 3150
Text Label 3650 2825 0    50   ~ 0
LED_1
Text Label 3650 2725 0    50   ~ 0
LED_0
$Comp
L formula:LED_0805 D1
U 1 1 6229027E
P 11850 4725
F 0 "D1" V 11889 4608 50  0000 R CNN
F 1 "LED_0805" V 11798 4608 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 11750 4725 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 11850 4825 50  0001 C CNN
F 4 "DK" H 11850 4725 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 11850 4725 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12250 5225 60  0001 C CNN "PurchasingLink"
	1    11850 4725
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D2
U 1 1 62290FD9
P 12475 4725
F 0 "D2" V 12514 4608 50  0000 R CNN
F 1 "LED_0805" V 12423 4608 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 12375 4725 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 12475 4825 50  0001 C CNN
F 4 "DK" H 12475 4725 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 12475 4725 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12875 5225 60  0001 C CNN "PurchasingLink"
	1    12475 4725
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_499 R10
U 1 1 62292791
P 11850 5025
F 0 "R10" H 11920 5071 50  0000 L CNN
F 1 "R_499" H 11920 4980 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11780 5025 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11930 5025 50  0001 C CNN
F 4 "DK" H 11850 5025 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 11850 5025 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 12330 5425 60  0001 C CNN "PurchasingLink"
	1    11850 5025
	1    0    0    -1  
$EndComp
$Comp
L formula:R_499 R11
U 1 1 62293791
P 12475 5025
F 0 "R11" H 12545 5071 50  0000 L CNN
F 1 "R_499" H 12545 4980 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 12405 5025 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12555 5025 50  0001 C CNN
F 4 "DK" H 12475 5025 60  0001 C CNN "MFN"
F 5 "P499CCT-ND" H 12475 5025 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF4990V/P499CCT-ND/118870" H 12955 5425 60  0001 C CNN "PurchasingLink"
	1    12475 5025
	1    0    0    -1  
$EndComp
Text Label 11850 4575 0    50   ~ 0
LED_1
Text Label 12475 4575 0    50   ~ 0
LED_0
$Comp
L power:GND #PWR?
U 1 1 62295DC3
P 11850 5175
F 0 "#PWR?" H 11850 4925 50  0001 C CNN
F 1 "GND" H 11855 5002 50  0000 C CNN
F 2 "" H 11850 5175 50  0001 C CNN
F 3 "" H 11850 5175 50  0001 C CNN
	1    11850 5175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62296A38
P 12475 5175
F 0 "#PWR?" H 12475 4925 50  0001 C CNN
F 1 "GND" H 12480 5002 50  0000 C CNN
F 2 "" H 12475 5175 50  0001 C CNN
F 3 "" H 12475 5175 50  0001 C CNN
	1    12475 5175
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP3
U 1 1 6229758B
P 6175 3900
F 0 "TP3" V 6425 4475 50  0000 C CNN
F 1 "Test_Point_SMD" V 6325 4250 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6175 3750 50  0001 C CNN
F 3 "" H 6175 3900 50  0001 C CNN
	1    6175 3900
	0    1    1    0   
$EndComp
Connection ~ 6125 3900
Wire Wire Line
	6125 3850 6125 3900
$Comp
L formula:Test_Point_SMD TP1
U 1 1 6229B64D
P 4200 8850
F 0 "TP1" H 4075 8975 50  0000 C CNN
F 1 "Test_Point_SMD" H 3850 8900 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4200 8700 50  0001 C CNN
F 3 "" H 4200 8850 50  0001 C CNN
	1    4200 8850
	-1   0    0    1   
$EndComp
Text Notes 11800 4400 0    89   ~ 0
DEBUG LEDS
$EndSCHEMATC
