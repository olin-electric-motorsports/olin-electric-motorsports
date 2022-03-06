EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Go Kart BMS Core"
Date "2022-02-23"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Elvis Wolcott"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BEE119A
P 3150 9000
F 0 "#PWR?" H 3150 8750 50  0001 C CNN
F 1 "GND" H 3155 8827 50  0000 C CNN
F 2 "" H 3150 9000 50  0001 C CNN
F 3 "" H 3150 9000 50  0001 C CNN
	1    3150 9000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE1A40
P 2400 9000
F 0 "#PWR?" H 2400 8750 50  0001 C CNN
F 1 "GND" H 2405 8827 50  0000 C CNN
F 2 "" H 2400 9000 50  0001 C CNN
F 3 "" H 2400 9000 50  0001 C CNN
	1    2400 9000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEE3CCE
P 12700 8650
F 0 "#PWR?" H 12700 8400 50  0001 C CNN
F 1 "GND" H 12705 8477 50  0000 C CNN
F 2 "" H 12700 8650 50  0001 C CNN
F 3 "" H 12700 8650 50  0001 C CNN
	1    12700 8650
	1    0    0    -1  
$EndComp
$Comp
L formula:F_500mA_16V F101
U 1 1 5C0BFA29
P 1350 8700
F 0 "F101" V 1430 8700 50  0000 C CNN
F 1 "F_500mA_16V" V 1250 8720 50  0000 C CNN
F 2 "footprints:Fuse_1210" V 1280 8700 50  0001 C CNN
F 3 "https://belfuse.com/resources/CircuitProtection/datasheets/0ZCH%20Nov2016.pdf" V 1430 8700 50  0001 C CNN
F 4 "DK" H 1350 8700 60  0001 C CNN "MFN"
F 5 "507-1786-1-ND" H 1350 8700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCH0050FF2G/507-1786-1-ND/4156209" V 1830 9100 60  0001 C CNN "PurchasingLink"
	1    1350 8700
	0    1    1    0   
$EndComp
$Comp
L formula:R_0_2512 R104
U 1 1 5C0C29A9
P 4850 8500
F 0 "R104" V 4650 8500 50  0000 C CNN
F 1 "R_0_2512" V 4750 8550 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 4780 8500 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 4930 8500 50  0001 C CNN
F 4 "DK" H 4850 8500 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 4850 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 5330 8900 60  0001 C CNN "PurchasingLink"
	1    4850 8500
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5C0C344A
P 4600 9550
F 0 "D103" V 4800 9530 50  0000 R CNN
F 1 "LED_0805" V 4710 9530 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 4500 9550 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4600 9650 50  0001 C CNN
F 4 "DK" H 4600 9550 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4600 9550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5000 10050 60  0001 C CNN "PurchasingLink"
	1    4600 9550
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R105
U 1 1 5C0C44F9
P 4600 8950
F 0 "R105" H 4670 8996 50  0000 L CNN
F 1 "R_200" H 4670 8905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4530 8950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4680 8950 50  0001 C CNN
F 4 "DK" H 4600 8950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4600 8950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5080 9350 60  0001 C CNN "PurchasingLink"
	1    4600 8950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0C5382
P 4600 9900
F 0 "#PWR?" H 4600 9650 50  0001 C CNN
F 1 "GND" H 4605 9727 50  0000 C CNN
F 2 "" H 4600 9900 50  0001 C CNN
F 3 "" H 4600 9900 50  0001 C CNN
	1    4600 9900
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5C623D49
P 1600 9000
F 0 "D101" H 1590 9190 50  0000 C CNN
F 1 "D_Zener_18V" H 1580 9100 50  0000 C CNN
F 2 "footprints:DO-214AA" H 1500 9000 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 1600 9100 50  0001 C CNN
F 4 "DK" H 1800 9300 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 1700 9200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 2000 9500 60  0001 C CNN "PurchasingLink"
	1    1600 9000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C62BB38
P 1600 9250
F 0 "#PWR?" H 1600 9000 50  0001 C CNN
F 1 "GND" H 1605 9077 50  0000 C CNN
F 2 "" H 1600 9250 50  0001 C CNN
F 3 "" H 1600 9250 50  0001 C CNN
	1    1600 9250
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5C754D7D
P 2000 9300
F 0 "D102" V 2038 9183 50  0000 R CNN
F 1 "LED_0805" V 1947 9183 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1900 9300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2000 9400 50  0001 C CNN
F 4 "DK" H 2000 9300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2000 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2400 9800 60  0001 C CNN "PurchasingLink"
	1    2000 9300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C754D8E
P 2000 9550
F 0 "#PWR?" H 2000 9300 50  0001 C CNN
F 1 "GND" H 2005 9377 50  0000 C CNN
F 2 "" H 2000 9550 50  0001 C CNN
F 3 "" H 2000 9550 50  0001 C CNN
	1    2000 9550
	1    0    0    -1  
$EndComp
Text Notes 2250 8600 0    50   ~ 0
Input Capacitor\n\n
Text Notes 1900 9600 1    50   ~ 0
12V Indicator
Text Notes 1500 9250 1    50   ~ 0
Protection\n
Text Notes 2950 8300 0    89   ~ 0
5V LDO
Text Notes 3750 8550 0    50   ~ 0
Output Capacitor\n
Text Notes 4950 8550 0    50   ~ 0
VCC Jumper\n
Text Notes 4450 9800 1    50   ~ 0
5V Indicator
Text Label 4200 2550 0    50   ~ 0
CAN_TX
Text Label 4200 2650 0    50   ~ 0
CAN_RX
Text Label 4200 3450 0    50   ~ 0
MISO
Text Label 4200 3550 0    50   ~ 0
MOSI
Text Label 4200 3650 0    50   ~ 0
SCK
Text Label 4850 4150 0    50   ~ 0
RESET
$Comp
L formula:R_100 R1
U 1 1 5D58E16F
P 1700 1600
F 0 "R1" V 1600 1550 50  0000 L CNN
F 1 "R_100" V 1790 1480 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 900 1750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1400 2100 50  0001 C CNN
F 4 "DK" H 1700 1600 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1050 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2180 2000 60  0001 C CNN "PurchasingLink"
	1    1700 1600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C3
U 1 1 5D58E505
P 1700 1900
F 0 "C3" V 1750 1750 50  0000 L CNN
F 1 "C_100pF" V 1550 1720 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1738 1750 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1725 2000 50  0001 C CNN
F 4 "DK" H 1700 1900 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1700 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 2125 2400 60  0001 C CNN "PurchasingLink"
	1    1700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D58E5E0
P 1350 1750
F 0 "#PWR?" H 1350 1500 50  0001 C CNN
F 1 "GND" H 1355 1577 50  0000 C CNN
F 2 "" H 1350 1750 50  0001 C CNN
F 3 "" H 1350 1750 50  0001 C CNN
	1    1350 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D591138
P 1700 2050
F 0 "#PWR?" H 1700 1800 50  0001 C CNN
F 1 "GND" H 1705 1877 50  0000 C CNN
F 2 "" H 1700 2050 50  0001 C CNN
F 3 "" H 1700 2050 50  0001 C CNN
	1    1700 2050
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y1
U 1 1 5D5EB332
P 4650 4550
F 0 "Y1" H 4360 4620 50  0000 L CNN
F 1 "Crystal_SMD" H 3970 4550 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4600 4625 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4700 4725 50  0001 C CNN
F 4 "DK" H 4650 4550 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4650 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 5100 5125 60  0001 C CNN "PurchasingLink"
	1    4650 4550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C4
U 1 1 5D5EB5B2
P 4450 4800
F 0 "C4" H 4340 4880 50  0000 L CNN
F 1 "C_30pF" H 4180 4720 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4488 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4475 4900 50  0001 C CNN
F 4 "DK" H 4450 4800 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4450 4800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4875 5300 60  0001 C CNN "PurchasingLink"
	1    4450 4800
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C5
U 1 1 5D5EB694
P 4850 4800
F 0 "C5" H 4870 4880 50  0000 L CNN
F 1 "C_30pF" H 4880 4700 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4888 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4875 4900 50  0001 C CNN
F 4 "DK" H 4850 4800 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4850 4800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 5275 5300 60  0001 C CNN "PurchasingLink"
	1    4850 4800
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R3
U 1 1 5D5EB7F3
P 4700 3950
F 0 "R3" V 4620 3950 50  0000 C CNN
F 1 "R_10K" V 4750 4200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4630 3950 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4780 3950 50  0001 C CNN
F 4 "DK" H 4700 3950 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4700 3950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5180 4350 60  0001 C CNN "PurchasingLink"
	1    4700 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2681
P 4450 4950
F 0 "#PWR?" H 4450 4700 50  0001 C CNN
F 1 "GND" H 4455 4777 50  0000 C CNN
F 2 "" H 4450 4950 50  0001 C CNN
F 3 "" H 4450 4950 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F26EE
P 4850 4950
F 0 "#PWR?" H 4850 4700 50  0001 C CNN
F 1 "GND" H 4855 4777 50  0000 C CNN
F 2 "" H 4850 4950 50  0001 C CNN
F 3 "" H 4850 4950 50  0001 C CNN
	1    4850 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F2774
P 4650 4700
F 0 "#PWR?" H 4650 4450 50  0001 C CNN
F 1 "GND" H 4655 4527 50  0000 C CNN
F 2 "" H 4650 4700 50  0001 C CNN
F 3 "" H 4650 4700 50  0001 C CNN
	1    4650 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F27E1
P 5000 4400
F 0 "#PWR?" H 5000 4150 50  0001 C CNN
F 1 "GND" H 5005 4227 50  0000 C CNN
F 2 "" H 5000 4400 50  0001 C CNN
F 3 "" H 5000 4400 50  0001 C CNN
	1    5000 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5F86E8
P 1850 4500
F 0 "#PWR?" H 1850 4250 50  0001 C CNN
F 1 "GND" H 1855 4327 50  0000 C CNN
F 2 "" H 1850 4500 50  0001 C CNN
F 3 "" H 1850 4500 50  0001 C CNN
	1    1850 4500
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP2561-E_SN U1
U 1 1 5D5FAEDE
P 7350 9400
F 0 "U1" H 7710 9750 50  0000 C CNN
F 1 "MCP2561-E_SN" H 7700 9040 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 7350 8900 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 6950 9750 50  0001 C CNN
F 4 "DK" H 7350 9400 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 7350 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 7350 10150 60  0001 C CNN "PurchasingLink"
	1    7350 9400
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C1
U 1 1 5D5FB603
P 7200 8800
F 0 "C1" V 7150 8910 50  0000 C CNN
F 1 "C_0.1uF" V 7160 8610 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 7238 8650 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7225 8900 50  0001 C CNN
F 4 "DK" H 7200 8800 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7200 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7625 9300 60  0001 C CNN "PurchasingLink"
	1    7200 8800
	0    1    1    0   
$EndComp
NoConn ~ 7850 9400
$Comp
L power:GND #PWR?
U 1 1 5D60300D
P 7050 8950
F 0 "#PWR?" H 7050 8700 50  0001 C CNN
F 1 "GND" H 6950 8950 50  0000 C CNN
F 2 "" H 7050 8950 50  0001 C CNN
F 3 "" H 7050 8950 50  0001 C CNN
	1    7050 8950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6030BB
P 7350 9800
F 0 "#PWR?" H 7350 9550 50  0001 C CNN
F 1 "GND" H 7355 9627 50  0000 C CNN
F 2 "" H 7350 9800 50  0001 C CNN
F 3 "" H 7350 9800 50  0001 C CNN
	1    7350 9800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D607469
P 6850 9600
F 0 "#PWR?" H 6850 9350 50  0001 C CNN
F 1 "GND" H 6855 9427 50  0000 C CNN
F 2 "" H 6850 9600 50  0001 C CNN
F 3 "" H 6850 9600 50  0001 C CNN
	1    6850 9600
	1    0    0    -1  
$EndComp
Text Label 6850 9200 2    50   ~ 0
CAN_TX
Text Label 6850 9300 2    50   ~ 0
CAN_RX
Text Label 8300 9250 0    50   ~ 0
CAN_+
Text Label 8300 9550 0    50   ~ 0
CAN_-
Text Notes 6900 8350 0    89   ~ 0
CAN TRANSCEIVER\n
Text Notes 2800 1250 0    89   ~ 0
ATMEGA 16M1\n
Text Notes 4100 5350 0    89   ~ 0
16 MHz CRYSTAL\n
Text Notes 11850 8200 0    89   ~ 0
POWER FLAGS\n
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D6150F1
P 11800 8650
F 0 "#FLG?" H 11800 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 11800 8824 50  0000 C CNN
F 2 "" H 11800 8650 50  0001 C CNN
F 3 "~" H 11800 8650 50  0001 C CNN
	1    11800 8650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615167
P 12250 8650
F 0 "#FLG?" H 12250 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 12250 8824 50  0000 C CNN
F 2 "" H 12250 8650 50  0001 C CNN
F 3 "~" H 12250 8650 50  0001 C CNN
	1    12250 8650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D615217
P 12700 8500
F 0 "#FLG?" H 12700 8575 50  0001 C CNN
F 1 "PWR_FLAG" H 12700 8674 50  0000 C CNN
F 2 "" H 12700 8500 50  0001 C CNN
F 3 "~" H 12700 8500 50  0001 C CNN
	1    12700 8500
	1    0    0    -1  
$EndComp
$Comp
L formula:CONN_02X03 J1
U 1 1 5D628C9D
P 4600 6800
F 0 "J1" H 4600 7010 50  0000 C CNN
F 1 "CONN_02X03" H 4490 6600 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 4600 5600 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 4600 5600 50  0001 C CNN
F 4 "DK" H 4600 6800 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 4600 6800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 5000 7400 60  0001 C CNN "PurchasingLink"
	1    4600 6800
	1    0    0    -1  
$EndComp
Text Label 4350 6700 2    50   ~ 0
MISO
Text Label 4350 6800 2    50   ~ 0
SCK
Text Label 4350 6900 2    50   ~ 0
RESET
Text Label 4850 6800 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 5D62962D
P 4850 6900
F 0 "#PWR?" H 4850 6650 50  0001 C CNN
F 1 "GND" H 4855 6727 50  0000 C CNN
F 2 "" H 4850 6900 50  0001 C CNN
F 3 "" H 4850 6900 50  0001 C CNN
	1    4850 6900
	1    0    0    -1  
$EndComp
Text Notes 3650 6200 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Wire Wire Line
	2000 1750 1700 1750
Connection ~ 1700 1750
$Comp
L formula:C_0.1uF C2
U 1 1 5D58E34B
P 1350 1600
F 0 "C2" V 1400 1460 50  0000 L CNN
F 1 "C_0.1uF" V 1210 1440 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1388 1450 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1375 1700 50  0001 C CNN
F 4 "DK" H 1350 1600 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1350 1600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1775 2100 60  0001 C CNN "PurchasingLink"
	1    1350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1300 1350 1450
Wire Wire Line
	1350 1450 1700 1450
Connection ~ 1350 1450
Connection ~ 1700 1450
Wire Wire Line
	1700 1450 2000 1450
Wire Wire Line
	1850 4500 1850 4350
Wire Wire Line
	1850 3950 2000 3950
Wire Wire Line
	2000 4350 1850 4350
Connection ~ 1850 4350
Wire Wire Line
	1850 4350 1850 3950
NoConn ~ 2000 2150
Wire Wire Line
	4450 4650 4450 4550
Wire Wire Line
	4450 4550 4550 4550
Wire Wire Line
	4750 4550 4850 4550
Wire Wire Line
	4850 4550 4850 4650
Wire Wire Line
	4650 4400 5000 4400
Wire Wire Line
	4850 4550 4850 4250
Wire Wire Line
	4850 4250 4200 4250
Connection ~ 4850 4550
Wire Wire Line
	4450 4550 4450 4350
Wire Wire Line
	4450 4350 4200 4350
Connection ~ 4450 4550
Wire Wire Line
	4200 4150 4550 4150
Wire Wire Line
	4550 4150 4550 3950
Connection ~ 4550 4150
Wire Wire Line
	4550 4150 4850 4150
Wire Wire Line
	4850 3950 5000 3950
Wire Wire Line
	5000 3950 5000 3800
Wire Wire Line
	7050 8800 7050 8950
Wire Wire Line
	7350 9000 7350 8800
Connection ~ 7350 8800
Wire Wire Line
	7350 8800 7350 8650
Wire Wire Line
	7850 9300 7950 9300
Wire Wire Line
	7950 9300 7950 9250
Wire Wire Line
	7950 9500 7950 9550
Wire Wire Line
	12250 8650 12250 8500
Wire Wire Line
	12700 8500 12700 8650
Wire Wire Line
	4600 8800 4600 8700
Wire Wire Line
	4600 9700 4600 9900
Wire Wire Line
	4600 9100 4600 9400
Wire Wire Line
	1600 9150 1600 9250
Wire Wire Line
	2000 9450 2000 9550
Wire Wire Line
	7850 9500 7950 9500
$Comp
L formula:R_1K R101
U 1 1 5DE6EFCB
P 2000 8900
F 0 "R101" H 2070 8946 50  0000 L CNN
F 1 "R_1K" H 2070 8855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1930 8900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2080 8900 50  0001 C CNN
F 4 "DK" H 2000 8900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2000 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2480 9300 60  0001 C CNN "PurchasingLink"
	1    2000 8900
	1    0    0    -1  
$EndComp
Connection ~ 2000 8700
$Comp
L power:GND #PWR?
U 1 1 5F87F995
P 3900 9000
F 0 "#PWR?" H 3900 8750 50  0001 C CNN
F 1 "GND" H 3905 8827 50  0000 C CNN
F 2 "" H 3900 9000 50  0001 C CNN
F 3 "" H 3900 9000 50  0001 C CNN
	1    3900 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 8700 1200 8700
Wire Wire Line
	1500 8700 1600 8700
Wire Wire Line
	1600 8850 1600 8700
Connection ~ 1600 8700
Wire Wire Line
	1600 8700 2000 8700
$Comp
L formula:R_120_DNP R2
U 1 1 5FA5AB4A
P 8150 9400
F 0 "R2" H 8220 9446 50  0000 L CNN
F 1 "R_120_DNP" H 8220 9355 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6950 9550 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 6950 9850 50  0001 L CNN
F 4 "DK" H 8150 9400 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 6950 9650 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 6950 9750 60  0001 L CNN "PurchasingLink"
	1    8150 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 9250 8150 9250
Wire Wire Line
	7950 9550 8150 9550
Connection ~ 8150 9250
Wire Wire Line
	8150 9250 8300 9250
Connection ~ 8150 9550
Wire Wire Line
	8150 9550 8300 9550
$Comp
L power:+5V #PWR?
U 1 1 5FD33116
P 4850 8250
F 0 "#PWR?" H 4850 8100 50  0001 C CNN
F 1 "+5V" H 4865 8423 50  0000 C CNN
F 2 "" H 4850 8250 50  0001 C CNN
F 3 "" H 4850 8250 50  0001 C CNN
	1    4850 8250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD33423
P 1350 1300
F 0 "#PWR?" H 1350 1150 50  0001 C CNN
F 1 "+5V" H 1365 1473 50  0000 C CNN
F 2 "" H 1350 1300 50  0001 C CNN
F 3 "" H 1350 1300 50  0001 C CNN
	1    1350 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3B2BE
P 7350 8650
F 0 "#PWR?" H 7350 8500 50  0001 C CNN
F 1 "+5V" H 7365 8823 50  0000 C CNN
F 2 "" H 7350 8650 50  0001 C CNN
F 3 "" H 7350 8650 50  0001 C CNN
	1    7350 8650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3C2F8
P 4850 6700
F 0 "#PWR?" H 4850 6550 50  0001 C CNN
F 1 "+5V" H 4865 6873 50  0000 C CNN
F 2 "" H 4850 6700 50  0001 C CNN
F 3 "" H 4850 6700 50  0001 C CNN
	1    4850 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD3CE98
P 12250 8500
F 0 "#PWR?" H 12250 8350 50  0001 C CNN
F 1 "+5V" H 12265 8673 50  0000 C CNN
F 2 "" H 12250 8500 50  0001 C CNN
F 3 "" H 12250 8500 50  0001 C CNN
	1    12250 8500
	1    0    0    -1  
$EndComp
Text Notes 4450 3500 0    50   ~ 0
MOSI, MISO, and SCK must\nstay connected to the _A pins\nfor programming.
$Comp
L power:+5V #PWR?
U 1 1 5FD477AE
P 5000 3800
F 0 "#PWR?" H 5000 3650 50  0001 C CNN
F 1 "+5V" H 5015 3973 50  0000 C CNN
F 2 "" H 5000 3800 50  0001 C CNN
F 3 "" H 5000 3800 50  0001 C CNN
	1    5000 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 8700 2000 8750
Wire Wire Line
	2000 9050 2000 9150
Wire Wire Line
	4850 8700 4850 8650
Wire Wire Line
	4850 8350 4850 8250
Wire Wire Line
	4600 8700 4850 8700
$Comp
L power:+BATT #PWR?
U 1 1 615FBF35
P 1000 8500
F 0 "#PWR?" H 1000 8350 50  0001 C CNN
F 1 "+BATT" H 1015 8673 50  0000 C CNN
F 2 "" H 1000 8500 50  0001 C CNN
F 3 "" H 1000 8500 50  0001 C CNN
	1    1000 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 8500 1000 8700
$Comp
L power:+BATT #PWR?
U 1 1 6160D1CA
P 11800 8500
F 0 "#PWR?" H 11800 8350 50  0001 C CNN
F 1 "+BATT" H 11815 8673 50  0000 C CNN
F 2 "" H 11800 8500 50  0001 C CNN
F 3 "" H 11800 8500 50  0001 C CNN
	1    11800 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 8500 11800 8650
$Comp
L formula:C_1uF C6
U 1 1 62109F2F
P 2400 8900
F 0 "C6" H 2515 8996 50  0000 L CNN
F 1 "C_1uF" H 2515 8905 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 2438 9500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 2425 9750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 2825 9400 60  0001 C CNN "PurchasingLink"
	1    2400 8900
	1    0    0    -1  
$EndComp
$Comp
L formula:AP7370 U3
U 1 1 6210C1D9
P 3150 8700
F 0 "U3" H 3150 8942 50  0000 C CNN
F 1 "AP7370" H 3150 8851 50  0000 C CNN
F 2 "footprints:SOT-23-5" H 3100 8900 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP7370.pdf" H 3250 8450 50  0001 C CNN
F 4 "DK" H 3200 9025 60  0001 C CNN "MFN"
F 5 "AP7370-50W5-7DICT-ND" H 3300 9125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/diodes-incorporated/AP7370-50W5-7/10235827" H 3300 9125 60  0001 C CNN "PurchasingLink"
	1    3150 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 8700 2400 8700
Connection ~ 2400 8700
Wire Wire Line
	2400 8700 2850 8700
$Comp
L formula:C_1uF C7
U 1 1 6211DE01
P 3900 8900
F 0 "C7" H 4015 8996 50  0000 L CNN
F 1 "C_1uF" H 4015 8905 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3938 9500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 3925 9750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 4325 9400 60  0001 C CNN "PurchasingLink"
	1    3900 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 8700 3900 8700
Connection ~ 4600 8700
Connection ~ 3900 8700
Wire Wire Line
	3900 8700 4600 8700
$Comp
L formula:LTC6820HMS U4
U 1 1 62143D30
P 7250 2300
F 0 "U4" H 7250 3165 50  0000 C CNN
F 1 "LTC6820HMS" H 7250 3074 50  0000 C CNN
F 2 "Package_SO:MSOP-16_3x4mm_P0.5mm" V 7650 1950 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/6820fb.pdf" V 7650 1950 50  0001 C CNN
F 4 "DK" H 7250 3073 50  0001 C CNN "MFN"
F 5 "LTC6820HMS#TRPBFCT-ND" H 7250 3074 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/linear-technology-analog-devices/LTC6820HMS-TRPBF/LTC6820HMS-TRPBFCT-ND/8275338" H 7250 3073 50  0001 C CNN "PurchasingLink"
	1    7250 2300
	1    0    0    -1  
$EndComp
Text Label 6750 2000 2    50   ~ 0
MOSI_iso
Text Label 6750 2100 2    50   ~ 0
MISO_iso
Text Label 6750 2200 2    50   ~ 0
SCK_iso
Text Label 6750 2300 2    50   ~ 0
CS_iso
$Comp
L power:GND #PWR?
U 1 1 62179A6E
P 7750 1700
F 0 "#PWR?" H 7750 1450 50  0001 C CNN
F 1 "GND" H 7755 1527 50  0000 C CNN
F 2 "" H 7750 1700 50  0001 C CNN
F 3 "" H 7750 1700 50  0001 C CNN
	1    7750 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2400 7750 2450
$Comp
L formula:R_1K R6
U 1 1 621906BA
P 7750 2900
F 0 "R6" H 7820 2946 50  0000 L CNN
F 1 "R_1K" H 7820 2855 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7680 2900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 7830 2900 50  0001 C CNN
F 4 "DK" H 7750 2900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 7750 2900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8230 3300 60  0001 C CNN "PurchasingLink"
	1    7750 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62191AD5
P 7750 3050
F 0 "#PWR?" H 7750 2800 50  0001 C CNN
F 1 "GND" H 7755 2877 50  0000 C CNN
F 2 "" H 7750 3050 50  0001 C CNN
F 3 "" H 7750 3050 50  0001 C CNN
	1    7750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1800 6750 1700
Wire Wire Line
	6750 2700 6750 2600
Connection ~ 6750 2600
Wire Wire Line
	6750 2600 6750 2500
Wire Wire Line
	6750 2800 6750 3000
$Comp
L power:GND #PWR?
U 1 1 6219EA6C
P 6750 3000
F 0 "#PWR?" H 6750 2750 50  0001 C CNN
F 1 "GND" H 6755 2827 50  0000 C CNN
F 2 "" H 6750 3000 50  0001 C CNN
F 3 "" H 6750 3000 50  0001 C CNN
	1    6750 3000
	1    0    0    -1  
$EndComp
Connection ~ 6750 3000
Wire Wire Line
	10650 1950 10900 1950
Wire Wire Line
	10900 1950 10900 2050
Wire Wire Line
	10900 2200 10900 2350
Wire Wire Line
	10900 2350 10650 2350
NoConn ~ 10650 2150
NoConn ~ 10650 2650
NoConn ~ 10650 2850
NoConn ~ 10650 3050
NoConn ~ 9400 2650
NoConn ~ 9400 2850
NoConn ~ 9400 3050
$Comp
L formula:C_10nF C9
U 1 1 621C389B
P 9200 2750
F 0 "C9" H 8950 2650 50  0000 L CNN
F 1 "C_10nF" H 8800 2750 50  0000 L CNN
F 2 "footprints:C_1206_OEM" H 9000 2750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 9100 2850 50  0001 C CNN
F 4 "Kemet" H 9200 2950 50  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 9300 3050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 9400 3150 50  0001 C CNN "PurchasingLink"
	1    9200 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2150 9200 2150
Wire Wire Line
	9200 2150 9200 2600
$Comp
L formula:C_10nF C8
U 1 1 621F458E
P 8550 2150
F 0 "C8" V 8802 2150 50  0000 C CNN
F 1 "C_10nF" V 8700 2050 50  0000 C CNN
F 2 "footprints:C_1206_OEM" H 8350 2150 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 8450 2250 50  0001 C CNN
F 4 "Kemet" H 8550 2350 50  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 8650 2450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 8750 2550 50  0001 C CNN "PurchasingLink"
	1    8550 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621F64AA
P 8700 2150
F 0 "#PWR?" H 8700 1900 50  0001 C CNN
F 1 "GND" H 8705 1977 50  0000 C CNN
F 2 "" H 8700 2150 50  0001 C CNN
F 3 "" H 8700 2150 50  0001 C CNN
	1    8700 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_60.4 R7
U 1 1 621F7279
P 8400 2000
F 0 "R7" H 8200 2050 50  0000 L CNN
F 1 "R_60.4" H 8050 1950 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8200 1900 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 8300 2000 50  0001 C CNN
F 4 "DK" H 8400 2100 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 8500 2200 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 8600 2300 50  0001 C CNN "PurchasingLink"
	1    8400 2000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_60.4 R8
U 1 1 621F9B96
P 8400 2300
F 0 "R8" H 8200 2350 50  0000 L CNN
F 1 "R_60.4" H 8050 2250 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8200 2200 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 8300 2300 50  0001 C CNN
F 4 "DK" H 8400 2400 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 8500 2500 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 8600 2600 50  0001 C CNN "PurchasingLink"
	1    8400 2300
	1    0    0    -1  
$EndComp
Connection ~ 8400 2150
Wire Wire Line
	7750 2100 8000 2100
Wire Wire Line
	8000 2100 8000 1850
Wire Wire Line
	8000 1850 8400 1850
Wire Wire Line
	7750 2200 8000 2200
Wire Wire Line
	8000 2200 8000 2450
Wire Wire Line
	8000 2450 8400 2450
Wire Wire Line
	8400 2450 8900 2450
Wire Wire Line
	8900 2450 8900 2350
Wire Wire Line
	8900 2350 9400 2350
Connection ~ 8400 2450
Wire Wire Line
	9400 1950 8900 1950
Wire Wire Line
	8900 1950 8900 1850
Wire Wire Line
	8900 1850 8400 1850
Connection ~ 8400 1850
$Comp
L power:GND #PWR?
U 1 1 62203EDA
P 9200 2900
F 0 "#PWR?" H 9200 2650 50  0001 C CNN
F 1 "GND" H 9205 2727 50  0000 C CNN
F 2 "" H 9200 2900 50  0001 C CNN
F 3 "" H 9200 2900 50  0001 C CNN
	1    9200 2900
	1    0    0    -1  
$EndComp
Text Notes 8950 1200 0    89   ~ 0
isoSPI INTERFACE
$Comp
L formula:LED_0805 D1
U 1 1 6221A8F0
P 1250 7000
F 0 "D1" V 1289 6883 50  0000 R CNN
F 1 "LED_0805" V 1198 6883 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1150 7000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1250 7100 50  0001 C CNN
F 4 "DK" H 1250 7000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1250 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 1650 7500 60  0001 C CNN "PurchasingLink"
	1    1250 7000
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R4
U 1 1 6221FD6E
P 1250 6700
F 0 "R4" H 1320 6746 50  0000 L CNN
F 1 "R_200" H 1320 6655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1180 6700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1330 6700 50  0001 C CNN
F 4 "DK" H 1250 6700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 1250 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 1730 7100 60  0001 C CNN "PurchasingLink"
	1    1250 6700
	1    0    0    -1  
$EndComp
Text Label 1250 7150 3    50   ~ 0
DEBUG_1
$Comp
L formula:LED_0805 D2
U 1 1 6218DB25
P 1850 7000
F 0 "D2" V 1889 6883 50  0000 R CNN
F 1 "LED_0805" V 1798 6883 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 1750 7000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 1850 7100 50  0001 C CNN
F 4 "DK" H 1850 7000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 1850 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2250 7500 60  0001 C CNN "PurchasingLink"
	1    1850 7000
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R9
U 1 1 6218DB2E
P 1850 6700
F 0 "R9" H 1920 6746 50  0000 L CNN
F 1 "R_200" H 1920 6655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1780 6700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 1930 6700 50  0001 C CNN
F 4 "DK" H 1850 6700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 1850 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 2330 7100 60  0001 C CNN "PurchasingLink"
	1    1850 6700
	1    0    0    -1  
$EndComp
Text Label 1850 7150 3    50   ~ 0
DEBUG_2
$Comp
L formula:LED_0805 D3
U 1 1 621902CB
P 2450 7000
F 0 "D3" V 2489 6883 50  0000 R CNN
F 1 "LED_0805" V 2398 6883 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2350 7000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2450 7100 50  0001 C CNN
F 4 "DK" H 2450 7000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2450 7000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2850 7500 60  0001 C CNN "PurchasingLink"
	1    2450 7000
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_200 R10
U 1 1 621902D4
P 2450 6700
F 0 "R10" H 2520 6746 50  0000 L CNN
F 1 "R_200" H 2520 6655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2380 6700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 2530 6700 50  0001 C CNN
F 4 "DK" H 2450 6700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 2450 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 2930 7100 60  0001 C CNN "PurchasingLink"
	1    2450 6700
	1    0    0    -1  
$EndComp
Text Label 2450 7150 3    50   ~ 0
DEBUG_3
Text Notes 1450 6200 0    89   ~ 0
DEBUG LEDS
Wire Notes Line
	750  10250 750  7950
Wire Notes Line
	750  7650 750  5900
Wire Notes Line
	750  5900 3150 5900
Wire Notes Line
	3150 5900 3150 7650
Wire Notes Line
	3150 7650 750  7650
Wire Notes Line
	3450 7650 5850 7650
Wire Notes Line
	5850 7650 5850 5900
Wire Notes Line
	5850 5900 3450 5900
Wire Notes Line
	3450 5900 3450 7650
Wire Notes Line
	6150 10250 9000 10250
Wire Notes Line
	9000 10250 9000 7950
Wire Notes Line
	9000 7950 6150 7950
Wire Notes Line
	6150 7950 6150 10250
Text Notes 12050 4350 0    89   ~ 0
MAIN CONNECTORS
Text Notes 9450 8350 0    89   ~ 0
SHUTDOWN CONNECTOR
Wire Notes Line
	5850 5650 5850 850 
Wire Notes Line
	5850 850  750  850 
Wire Notes Line
	750  850  750  5650
Wire Notes Line
	750  5650 5850 5650
Wire Notes Line
	5850 7950 5850 10250
Wire Notes Line
	750  7950 5850 7950
Wire Notes Line
	750  10250 5850 10250
Wire Notes Line
	6150 850  12650 850 
Wire Notes Line
	12650 850  12650 3750
Wire Notes Line
	12650 3750 6150 3750
Wire Notes Line
	6150 850  6150 3750
Text Notes 11100 1850 0    50   ~ 0
isoSPI connector
Text Label 9900 8550 2    50   ~ 0
SHUTDOWN_IN
Text Label 12550 4650 2    50   ~ 0
CAN_+
Text Label 12550 4550 2    50   ~ 0
CAN_-
$Comp
L power:GND #PWR?
U 1 1 623D82D3
P 9900 8700
F 0 "#PWR?" H 9900 8450 50  0001 C CNN
F 1 "GND" H 9905 8527 50  0000 C CNN
F 2 "" H 9900 8700 50  0001 C CNN
F 3 "" H 9900 8700 50  0001 C CNN
	1    9900 8700
	1    0    0    -1  
$EndComp
Text Label 10150 9650 2    50   ~ 0
AUX_-
Text Label 10150 9750 2    50   ~ 0
AUX_+
Text Label 10150 9850 2    50   ~ 0
COIL_-
Text Label 10150 9950 2    50   ~ 0
COIL_+
Text Notes 9750 9500 0    89   ~ 0
AIR CONNECTOR
$Comp
L formula:LED_0805 D4
U 1 1 623E81C1
P 6900 7150
F 0 "D4" V 6939 7228 50  0000 L CNN
F 1 "LED_0805" V 6848 7228 50  0000 L CNN
F 2 "footprints:LED_0805_OEM" H 6800 7150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6900 7250 50  0001 C CNN
F 4 "DK" H 6900 7150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6900 7150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 7300 7650 60  0001 C CNN "PurchasingLink"
	1    6900 7150
	0    1    -1   0   
$EndComp
$Comp
L formula:R_200 R11
U 1 1 623EBD78
P 6900 6850
F 0 "R11" H 6970 6896 50  0000 L CNN
F 1 "R_200" H 6970 6805 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6830 6850 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6980 6850 50  0001 C CNN
F 4 "DK" H 6900 6850 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6900 6850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 7380 7250 60  0001 C CNN "PurchasingLink"
	1    6900 6850
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R12
U 1 1 623ECB8A
P 7400 6850
F 0 "R12" H 7470 6896 50  0000 L CNN
F 1 "R_10K" H 7470 6805 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7330 6850 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 7480 6850 50  0001 C CNN
F 4 "DK" H 7400 6850 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 7400 6850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 7880 7250 60  0001 C CNN "PurchasingLink"
	1    7400 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 6700 6900 6700
Connection ~ 6900 6700
Wire Wire Line
	6900 6700 7400 6700
Wire Wire Line
	6900 7300 7400 7300
Wire Wire Line
	7400 7300 7400 7000
$Comp
L power:GND #PWR?
U 1 1 623F3F0F
P 7400 7300
F 0 "#PWR?" H 7400 7050 50  0001 C CNN
F 1 "GND" H 7405 7127 50  0000 C CNN
F 2 "" H 7400 7300 50  0001 C CNN
F 3 "" H 7400 7300 50  0001 C CNN
	1    7400 7300
	1    0    0    -1  
$EndComp
Connection ~ 7400 7300
Text Label 6650 6700 2    50   ~ 0
AUX_-
Text Label 6650 6550 2    50   ~ 0
AUX_+
Wire Wire Line
	6900 6550 6650 6550
$Comp
L power:+5V #PWR?
U 1 1 62409AA0
P 6900 6550
F 0 "#PWR?" H 6900 6400 50  0001 C CNN
F 1 "+5V" H 6915 6723 50  0000 C CNN
F 2 "" H 6900 6550 50  0001 C CNN
F 3 "" H 6900 6550 50  0001 C CNN
	1    6900 6550
	1    0    0    -1  
$EndComp
Text Label 7750 6700 0    50   ~ 0
AIR_WELD
Wire Wire Line
	7750 6700 7400 6700
Connection ~ 7400 6700
Text Notes 7250 6500 0    50   ~ 0
HIGH when closed\nLOW when open
Text Notes 6500 6200 0    89   ~ 0
AIR WELD DETECTION
$Comp
L formula:LED_0805 D5
U 1 1 6242CB7F
P 9300 7250
F 0 "D5" V 9339 7328 50  0000 L CNN
F 1 "LED_0805" V 9248 7328 50  0000 L CNN
F 2 "footprints:LED_0805_OEM" H 9200 7250 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 9300 7350 50  0001 C CNN
F 4 "DK" H 9300 7250 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 9300 7250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9700 7750 60  0001 C CNN "PurchasingLink"
	1    9300 7250
	0    1    -1   0   
$EndComp
$Comp
L formula:R_200 R13
U 1 1 6242D0FA
P 9300 6950
F 0 "R13" H 9370 6996 50  0000 L CNN
F 1 "R_200" H 9370 6905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9230 6950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9380 6950 50  0001 C CNN
F 4 "DK" H 9300 6950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9300 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 9780 7350 60  0001 C CNN "PurchasingLink"
	1    9300 6950
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R14
U 1 1 6242D107
P 9800 6950
F 0 "R14" H 9870 6996 50  0000 L CNN
F 1 "R_10K" H 9870 6905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9730 6950 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 9880 6950 50  0001 C CNN
F 4 "DK" H 9800 6950 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 9800 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10280 7350 60  0001 C CNN "PurchasingLink"
	1    9800 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 6800 9300 6800
Connection ~ 9300 6800
Wire Wire Line
	9300 6800 9800 6800
Wire Wire Line
	9300 7400 9800 7400
Wire Wire Line
	9800 7400 9800 7100
$Comp
L power:GND #PWR?
U 1 1 6242D116
P 10450 7400
F 0 "#PWR?" H 10450 7150 50  0001 C CNN
F 1 "GND" H 10455 7227 50  0000 C CNN
F 2 "" H 10450 7400 50  0001 C CNN
F 3 "" H 10450 7400 50  0001 C CNN
	1    10450 7400
	1    0    0    -1  
$EndComp
Connection ~ 9800 7400
Text Label 9050 6800 2    50   ~ 0
AIR_LSD
Wire Wire Line
	10150 6800 9800 6800
Connection ~ 9800 6800
Text Notes 9000 6200 0    89   ~ 0
AIR LOW SIDE DRIVER
$Comp
L formula:SSM3K333R Q1
U 1 1 6243E292
P 10350 6800
F 0 "Q1" H 10556 6846 50  0000 L CNN
F 1 "SSM3K333R" H 10556 6755 50  0000 L CNN
F 2 "footprints:SOT-23F" H 10550 6725 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 10550 6875 50  0001 L CNN
F 4 "DK" H 10850 7175 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 10750 7075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 10650 6975 60  0001 C CNN "PurchasingLink"
	1    10350 6800
	1    0    0    -1  
$EndComp
Text Label 10450 6600 0    50   ~ 0
COIL_-
Wire Wire Line
	10450 7000 10450 7400
Wire Wire Line
	10450 7400 9800 7400
Connection ~ 10450 7400
Text Label 10450 6400 0    50   ~ 0
COIL_+
Wire Wire Line
	10450 6400 10200 6400
Text Label 10200 6400 2    50   ~ 0
SHUTDOWN_IN
$Comp
L power:GND #PWR?
U 1 1 624C703A
P 12550 4850
F 0 "#PWR?" H 12550 4600 50  0001 C CNN
F 1 "GND" H 12555 4677 50  0000 C CNN
F 2 "" H 12550 4850 50  0001 C CNN
F 3 "" H 12550 4850 50  0001 C CNN
	1    12550 4850
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 624C96C2
P 12150 4750
F 0 "#PWR?" H 12150 4600 50  0001 C CNN
F 1 "+BATT" H 12165 4923 50  0000 C CNN
F 2 "" H 12150 4750 50  0001 C CNN
F 3 "" H 12150 4750 50  0001 C CNN
	1    12150 4750
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 625271E3
P 7450 5250
F 0 "#PWR?" H 7450 5000 50  0001 C CNN
F 1 "GND" H 7455 5077 50  0000 C CNN
F 2 "" H 7450 5250 50  0001 C CNN
F 3 "" H 7450 5250 50  0001 C CNN
	1    7450 5250
	1    0    0    -1  
$EndComp
Text Label 8850 4850 0    50   ~ 0
FAN_PWM
Text Notes 6450 4400 0    89   ~ 0
FAN PWM BUFFER
Wire Notes Line
	6150 5900 8300 5900
Wire Notes Line
	8300 5900 8300 7650
Wire Notes Line
	8300 7650 6150 7650
Wire Notes Line
	6150 5900 6150 7650
Wire Notes Line
	6150 5650 6150 4000
Wire Notes Line
	8600 7650 11200 7650
Wire Notes Line
	11200 7650 11200 5900
Wire Notes Line
	11200 5900 8600 5900
Wire Notes Line
	8600 5900 8600 7650
Wire Notes Line
	9300 9000 11250 9000
Wire Notes Line
	11250 9000 11250 7950
Wire Notes Line
	11250 7950 9300 7950
Wire Notes Line
	9300 7950 9300 9000
Wire Notes Line
	9300 9250 11250 9250
Wire Notes Line
	11250 9250 11250 10250
Wire Notes Line
	11250 10250 9300 10250
Wire Notes Line
	9300 10250 9300 9250
Wire Notes Line
	11800 4000 11800 5650
Wire Notes Line
	11500 7950 13100 7950
Wire Notes Line
	13100 7950 13100 9000
Wire Notes Line
	13100 9000 11500 9000
Wire Notes Line
	11500 7950 11500 9000
Text Label 4200 1450 0    50   ~ 0
MISO_iso
Text Label 4200 1550 0    50   ~ 0
MOSI_iso
Text Label 4200 1650 0    50   ~ 0
CS_iso
Text Label 4200 1750 0    50   ~ 0
SCK_iso
Text Label 4200 2450 0    50   ~ 0
FAN_PWM_RAW
$Comp
L power:+5V #PWR?
U 1 1 62193125
P 6750 1700
F 0 "#PWR?" H 6750 1550 50  0001 C CNN
F 1 "+5V" H 6765 1873 50  0000 C CNN
F 2 "" H 6750 1700 50  0001 C CNN
F 3 "" H 6750 1700 50  0001 C CNN
	1    6750 1700
	1    0    0    -1  
$EndComp
Connection ~ 6750 1700
Wire Notes Line
	13550 5650 13550 4000
Wire Notes Line
	11800 4000 13550 4000
Wire Notes Line
	11800 5650 13550 5650
Text Label 4200 3050 0    50   ~ 0
AIR_WELD
Text Label 4200 1950 0    50   ~ 0
DEBUG_1
Text Label 4200 2050 0    50   ~ 0
DEBUG_2
Text Label 4200 2150 0    50   ~ 0
DEBUG_3
NoConn ~ 4200 2350
NoConn ~ 4200 2750
NoConn ~ 4200 2850
NoConn ~ 4200 3350
NoConn ~ 4200 3750
NoConn ~ 4200 3850
NoConn ~ 4200 3950
Text Label 4200 2950 0    50   ~ 0
SHUTDOWN_SENSE
$Comp
L formula:LED_0805 D6
U 1 1 6224BCF2
P 12400 7250
F 0 "D6" V 12439 7328 50  0000 L CNN
F 1 "LED_0805" V 12348 7328 50  0000 L CNN
F 2 "footprints:LED_0805_OEM" H 12300 7250 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 12400 7350 50  0001 C CNN
F 4 "DK" H 12400 7250 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 12400 7250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 12800 7750 60  0001 C CNN "PurchasingLink"
	1    12400 7250
	0    1    -1   0   
$EndComp
$Comp
L formula:R_200 R15
U 1 1 6224BF93
P 12400 6950
F 0 "R15" H 12470 6996 50  0000 L CNN
F 1 "R_200" H 12470 6905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 12330 6950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 12480 6950 50  0001 C CNN
F 4 "DK" H 12400 6950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 12400 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 12880 7350 60  0001 C CNN "PurchasingLink"
	1    12400 6950
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R16
U 1 1 6224BFA0
P 12900 6950
F 0 "R16" H 12970 6996 50  0000 L CNN
F 1 "R_10K" H 12970 6905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 12830 6950 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 12980 6950 50  0001 C CNN
F 4 "DK" H 12900 6950 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 12900 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 13380 7350 60  0001 C CNN "PurchasingLink"
	1    12900 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 6800 12400 6800
Connection ~ 12400 6800
Wire Wire Line
	12400 6800 12900 6800
Wire Wire Line
	12400 7400 12900 7400
Wire Wire Line
	12900 7400 12900 7100
$Comp
L power:GND #PWR?
U 1 1 6224BFAF
P 13550 7400
F 0 "#PWR?" H 13550 7150 50  0001 C CNN
F 1 "GND" H 13555 7227 50  0000 C CNN
F 2 "" H 13550 7400 50  0001 C CNN
F 3 "" H 13550 7400 50  0001 C CNN
	1    13550 7400
	1    0    0    -1  
$EndComp
Connection ~ 12900 7400
Text Label 12150 6800 2    50   ~ 0
SHUTDOWN_IN
Wire Wire Line
	13250 6800 12900 6800
Connection ~ 12900 6800
Text Notes 12200 6200 0    89   ~ 0
SHUTDOWN SENSE
$Comp
L formula:SSM3K333R Q2
U 1 1 6224BFC1
P 13450 6800
F 0 "Q2" H 13656 6846 50  0000 L CNN
F 1 "SSM3K333R" H 13656 6755 50  0000 L CNN
F 2 "footprints:SOT-23F" H 13650 6725 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 13650 6875 50  0001 L CNN
F 4 "DK" H 13950 7175 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 13850 7075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 13750 6975 60  0001 C CNN "PurchasingLink"
	1    13450 6800
	1    0    0    -1  
$EndComp
Text Label 13750 6600 0    50   ~ 0
SHUTDOWN_SENSE
Wire Wire Line
	13550 7000 13550 7400
Wire Wire Line
	13550 7400 12900 7400
Connection ~ 13550 7400
Wire Notes Line
	11500 5900 11500 7650
Wire Notes Line
	14500 7650 14500 5900
Wire Notes Line
	11500 7650 14500 7650
Wire Notes Line
	11500 5900 14500 5900
$Comp
L formula:R_10K R17
U 1 1 6227DFF7
P 13550 6400
F 0 "R17" H 13481 6354 50  0000 R CNN
F 1 "R_10K" H 13481 6445 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 13480 6400 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 13630 6400 50  0001 C CNN
F 4 "DK" H 13550 6400 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 13550 6400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 14030 6800 60  0001 C CNN "PurchasingLink"
	1    13550 6400
	1    0    0    1   
$EndComp
Wire Wire Line
	13550 6550 13550 6600
Wire Wire Line
	13750 6600 13550 6600
Connection ~ 13550 6600
$Comp
L power:+5V #PWR?
U 1 1 62287AAF
P 13550 6250
F 0 "#PWR?" H 13550 6100 50  0001 C CNN
F 1 "+5V" H 13650 6300 50  0000 C CNN
F 2 "" H 13550 6250 50  0001 C CNN
F 3 "" H 13550 6250 50  0001 C CNN
	1    13550 6250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62280162
P 6750 2500
F 0 "#PWR?" H 6750 2350 50  0001 C CNN
F 1 "+5V" H 6600 2600 50  0000 C CNN
F 2 "" H 6750 2500 50  0001 C CNN
F 3 "" H 6750 2500 50  0001 C CNN
	1    6750 2500
	1    0    0    -1  
$EndComp
Connection ~ 6750 2500
$Comp
L power:+5V #PWR?
U 1 1 6237E847
P 1250 6550
F 0 "#PWR?" H 1250 6400 50  0001 C CNN
F 1 "+5V" H 1265 6723 50  0000 C CNN
F 2 "" H 1250 6550 50  0001 C CNN
F 3 "" H 1250 6550 50  0001 C CNN
	1    1250 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6237EEDA
P 1850 6550
F 0 "#PWR?" H 1850 6400 50  0001 C CNN
F 1 "+5V" H 1865 6723 50  0000 C CNN
F 2 "" H 1850 6550 50  0001 C CNN
F 3 "" H 1850 6550 50  0001 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6237F587
P 2450 6550
F 0 "#PWR?" H 2450 6400 50  0001 C CNN
F 1 "+5V" H 2465 6723 50  0000 C CNN
F 2 "" H 2450 6550 50  0001 C CNN
F 3 "" H 2450 6550 50  0001 C CNN
	1    2450 6550
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R18
U 1 1 62224EF3
P 7750 2600
F 0 "R18" H 7820 2646 50  0000 L CNN
F 1 "R_1K" H 7820 2555 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7680 2600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 7830 2600 50  0001 C CNN
F 4 "DK" H 7750 2600 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 7750 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8230 3000 60  0001 C CNN "PurchasingLink"
	1    7750 2600
	1    0    0    -1  
$EndComp
Connection ~ 7750 2750
$Comp
L formula:C_1uF C10
U 1 1 62227D52
P 6450 1700
F 0 "C10" V 6198 1750 50  0000 C CNN
F 1 "C_1uF" V 6289 1750 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 6488 2300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_Y5V_6.3V-to-50V_9.pdf" H 6475 2550 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/yageo/CC0805ZKY5V9BB105/311-1909-1-ND/5195811#images" H 6875 2200 60  0001 C CNN "PurchasingLink"
	1    6450 1700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6222922E
P 6350 1700
F 0 "#PWR?" H 6350 1450 50  0001 C CNN
F 1 "GND" H 6355 1527 50  0000 C CNN
F 2 "" H 6350 1700 50  0001 C CNN
F 3 "" H 6350 1700 50  0001 C CNN
	1    6350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1700 6750 1700
$Comp
L formula:SSM3K333R Q5
U 1 1 622704D8
P 8450 5050
F 0 "Q5" H 8656 5096 50  0000 L CNN
F 1 "SSM3K333R" H 8656 5005 50  0000 L CNN
F 2 "footprints:SOT-23F" H 8650 4975 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 8650 5125 50  0001 L CNN
F 4 "DK" H 8950 5425 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 8850 5325 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 8750 5225 60  0001 C CNN "PurchasingLink"
	1    8450 5050
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R5
U 1 1 6227208D
P 7000 5200
F 0 "R5" H 7070 5246 50  0000 L CNN
F 1 "R_10K" H 7070 5155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6930 5200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 7080 5200 50  0001 C CNN
F 4 "DK" H 7000 5200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 7000 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 7480 5600 60  0001 C CNN "PurchasingLink"
	1    7000 5200
	1    0    0    -1  
$EndComp
$Comp
L formula:MicroFit_RA_4 J3
U 1 1 62293D67
P 10350 9800
F 0 "J3" H 10222 9851 50  0000 R CNN
F 1 "MicroFit_RA_4" H 10222 9760 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 10350 9500 50  0001 C CNN
F 3 "" H 10350 9800 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 10350 9800 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 10350 9800 50  0001 C CNN "PurchasingLink"
	1    10350 9800
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 62307367
P 10100 4750
F 0 "#PWR?" H 10100 4600 50  0001 C CNN
F 1 "+BATT" H 10115 4923 50  0000 C CNN
F 2 "" H 10100 4750 50  0001 C CNN
F 3 "" H 10100 4750 50  0001 C CNN
	1    10100 4750
	-1   0    0    -1  
$EndComp
Wire Notes Line
	9750 4000 9750 5650
Wire Notes Line
	11500 5650 11500 4000
Wire Notes Line
	9750 4000 11500 4000
Wire Notes Line
	9750 5650 11500 5650
Wire Wire Line
	10100 4750 10500 4750
Text Notes 10050 4350 0    89   ~ 0
FAN CONNECTOR
$Comp
L formula:MicroFit_RA_4 J5
U 1 1 62353CFE
P 10700 4800
F 0 "J5" H 10572 4759 50  0000 R CNN
F 1 "MicroFit_RA_4" H 10572 4850 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 10700 4500 50  0001 C CNN
F 3 "" H 10700 4800 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 10700 4800 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 10700 4800 50  0001 C CNN "PurchasingLink"
	1    10700 4800
	-1   0    0    1   
$EndComp
$Comp
L formula:MicroFit_RA_4 J6
U 1 1 6235834A
P 12750 4700
F 0 "J6" H 12622 4659 50  0000 R CNN
F 1 "MicroFit_RA_4" H 12622 4750 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 12750 4400 50  0001 C CNN
F 3 "" H 12750 4700 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 12750 4700 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 12750 4700 50  0001 C CNN "PurchasingLink"
	1    12750 4700
	-1   0    0    1   
$EndComp
Text Label 12550 5250 2    50   ~ 0
CAN_+
Text Label 12550 5150 2    50   ~ 0
CAN_-
$Comp
L power:+BATT #PWR?
U 1 1 6235B51A
P 12150 5350
F 0 "#PWR?" H 12150 5200 50  0001 C CNN
F 1 "+BATT" H 12165 5523 50  0000 C CNN
F 2 "" H 12150 5350 50  0001 C CNN
F 3 "" H 12150 5350 50  0001 C CNN
	1    12150 5350
	-1   0    0    -1  
$EndComp
$Comp
L formula:MicroFit_RA_4 J7
U 1 1 6235B52A
P 12750 5300
F 0 "J7" H 12622 5259 50  0000 R CNN
F 1 "MicroFit_RA_4" H 12622 5350 50  0000 R CNN
F 2 "footprints:MicroFit_RA_4" H 12750 5000 50  0001 C CNN
F 3 "" H 12750 5300 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 12750 5300 50  0001 C CNN "Purchasing Link"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 12750 5300 50  0001 C CNN "PurchasingLink"
	1    12750 5300
	-1   0    0    1   
$EndComp
Text Label 10500 4850 2    50   ~ 0
FAN_PWM
$Comp
L power:GND #PWR?
U 1 1 62378F07
P 10500 4950
F 0 "#PWR?" H 10500 4700 50  0001 C CNN
F 1 "GND" H 10505 4777 50  0000 C CNN
F 2 "" H 10500 4950 50  0001 C CNN
F 3 "" H 10500 4950 50  0001 C CNN
	1    10500 4950
	1    0    0    -1  
$EndComp
NoConn ~ 10500 4650
$Comp
L formula:R_1K R19
U 1 1 623B678E
P 7850 4700
F 0 "R19" H 7920 4746 50  0000 L CNN
F 1 "R_1K" H 7920 4655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7780 4700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 7930 4700 50  0001 C CNN
F 4 "DK" H 7850 4700 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 7850 4700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8330 5100 60  0001 C CNN "PurchasingLink"
	1    7850 4700
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q3
U 1 1 623C315F
P 7350 5050
F 0 "Q3" H 7556 5096 50  0000 L CNN
F 1 "SSM3K333R" H 7556 5005 50  0000 L CNN
F 2 "footprints:SOT-23F" H 7550 4975 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 7550 5125 50  0001 L CNN
F 4 "DK" H 7850 5425 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 7750 5325 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 7650 5225 60  0001 C CNN "PurchasingLink"
	1    7350 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 5050 7150 5050
Wire Wire Line
	7450 4850 7850 4850
Wire Wire Line
	8250 4850 8250 4650
Wire Wire Line
	8250 4850 8250 5050
Connection ~ 8250 4850
Connection ~ 7850 4850
Wire Wire Line
	7850 4850 8250 4850
$Comp
L power:GND #PWR?
U 1 1 623DD55F
P 8550 5250
F 0 "#PWR?" H 8550 5000 50  0001 C CNN
F 1 "GND" H 8555 5077 50  0000 C CNN
F 2 "" H 8550 5250 50  0001 C CNN
F 3 "" H 8550 5250 50  0001 C CNN
	1    8550 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 623DEA7C
P 8550 4450
F 0 "#PWR?" H 8550 4300 50  0001 C CNN
F 1 "+BATT" H 8565 4623 50  0000 C CNN
F 2 "" H 8550 4450 50  0001 C CNN
F 3 "" H 8550 4450 50  0001 C CNN
	1    8550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 623DF9EF
P 7850 4550
F 0 "#PWR?" H 7850 4400 50  0001 C CNN
F 1 "+BATT" H 7865 4723 50  0000 C CNN
F 2 "" H 7850 4550 50  0001 C CNN
F 3 "" H 7850 4550 50  0001 C CNN
	1    7850 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 623E68BD
P 7000 5350
F 0 "#PWR?" H 7000 5100 50  0001 C CNN
F 1 "GND" H 7005 5177 50  0000 C CNN
F 2 "" H 7000 5350 50  0001 C CNN
F 3 "" H 7000 5350 50  0001 C CNN
	1    7000 5350
	1    0    0    -1  
$EndComp
Text Label 7000 5050 2    50   ~ 0
FAN_PWM_RAW
Wire Wire Line
	8850 4850 8550 4850
$Comp
L formula:SSM3J334R Q4
U 1 1 62246BAF
P 8450 4650
F 0 "Q4" H 8656 4696 50  0000 L CNN
F 1 "SSM3J334R" H 8656 4605 50  0000 L CNN
F 2 "footprints:SOT-23F" H 8650 4575 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=5579&prodName=SSM3J334R" H 8650 4725 50  0001 L CNN
F 4 "DK" H 8950 5025 60  0001 C CNN "MFN"
F 5 "SSM3J334R,LF" H 8950 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/toshiba-semiconductor-and-storage/SSM3J334R-LF/3863578" H 9700 4475 60  0001 C CNN "PurchasingLink"
	1    8450 4650
	1    0    0    -1  
$EndComp
Connection ~ 8550 4850
Wire Notes Line
	9450 5650 9450 4000
Wire Notes Line
	6150 4000 9450 4000
Wire Notes Line
	6150 5650 9450 5650
$Comp
L formula:T_LAN_SM91501ALE T1
U 1 1 62345752
P 10900 2900
F 0 "T1" H 11775 4097 60  0000 C CNN
F 1 "T_LAN_SM91501ALE" H 11775 3991 60  0000 C CNN
F 2 "footprints:T_LAN_SM91501ALE" H 11300 3850 60  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/54/sm91501al-1488891.pdf" H 10900 2900 60  0001 C CNN
F 4 "DK" H 11250 3400 60  0001 C CNN "MFN"
F 5 "SM91501ALE" H 11150 3300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.si/product-detail/en/bourns-inc/SM91501ALE/SM91501ALETR-ND/9650127" H 11050 3200 60  0001 C CNN "PurchasingLink"
	1    10900 2900
	-1   0    0    -1  
$EndComp
$Comp
L formula:ATMEGA16M1 U2
U 1 1 5D58A7A6
P 3100 3150
F 0 "U2" H 3100 1775 50  0000 C CNN
F 1 "ATMEGA16M1" H 3100 1684 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 3100 3150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 2150 4980 50  0001 C CNN
F 4 "DK" H 3100 3150 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 3100 3150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2550 5380 60  0001 C CNN "PurchasingLink"
	1    3100 3150
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_TH_02 J2
U 1 1 623F0779
P 11350 2100
F 0 "J2" H 11628 2128 60  0000 L CNN
F 1 "NanoFit_RA_TH_02" H 11628 2022 60  0000 L CNN
F 2 "footprints:NanoFit_Molex_1x02x2.50mm_Angled_OEM" H 11350 1500 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/1053131102_sd.pdf" H 11350 1650 60  0001 C CNN
F 4 "DK" H 11350 2650 50  0001 C CNN "MFN"
F 5 "WM14972-ND" H 11350 2550 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/connectors-interconnects/rectangular-connectors-headers-male-pins/314?k=nanofit+2&k=&pkeyword=nanofit+2&pv88=2&pv69=367&sf=0&FV=ffe0013a&quantity=&ColumnSort=0&page=1&pageSize=25" H 11350 1300 50  0001 C CNN "PurchasingLink"
	1    11350 2100
	1    0    0    -1  
$EndComp
$Comp
L formula:NanoFit_RA_TH_02 J4
U 1 1 62483266
P 10350 8600
F 0 "J4" H 10628 8628 60  0000 L CNN
F 1 "NanoFit_RA_TH_02" H 10050 8300 60  0000 L CNN
F 2 "footprints:NanoFit_Molex_1x02x2.50mm_Angled_OEM" H 10350 8000 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/1053131102_sd.pdf" H 10350 8150 60  0001 C CNN
F 4 "DK" H 10350 9150 50  0001 C CNN "MFN"
F 5 "WM14972-ND" H 10350 9050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/connectors-interconnects/rectangular-connectors-headers-male-pins/314?k=nanofit+2&k=&pkeyword=nanofit+2&pv88=2&pv69=367&sf=0&FV=ffe0013a&quantity=&ColumnSort=0&page=1&pageSize=25" H 10350 7800 50  0001 C CNN "PurchasingLink"
	1    10350 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 4750 12150 4750
$Comp
L power:GND #PWR?
U 1 1 6235B510
P 12550 5450
F 0 "#PWR?" H 12550 5200 50  0001 C CNN
F 1 "GND" H 12555 5277 50  0000 C CNN
F 2 "" H 12550 5450 50  0001 C CNN
F 3 "" H 12550 5450 50  0001 C CNN
	1    12550 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	12150 5350 12550 5350
NoConn ~ 4200 3250
Text Label 4200 1850 0    50   ~ 0
AIR_LSD
$EndSCHEMATC
