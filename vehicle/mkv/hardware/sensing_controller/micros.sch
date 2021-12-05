EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4700 3850 0    50   ~ 0
PM_RESET
$Comp
L formula:R_100 R?
U 1 1 60A4C1FF
P 1100 1300
AR Path="/60A3DB07/60A4C1FF" Ref="R?"  Part="1" 
AR Path="/60A3D93E/60A4C1FF" Ref="R304"  Part="1" 
F 0 "R304" V 1000 1250 50  0000 L CNN
F 1 "R_100" V 1190 1180 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 300 1450 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 800 1800 50  0001 C CNN
F 4 "DK" H 1100 1300 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 450 1550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 1580 1700 60  0001 C CNN "PurchasingLink"
	1    1100 1300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_100pF C?
U 1 1 60A4C208
P 1100 1600
AR Path="/60A3DB07/60A4C208" Ref="C?"  Part="1" 
AR Path="/60A3D93E/60A4C208" Ref="C302"  Part="1" 
F 0 "C302" V 1240 1540 50  0000 L CNN
F 1 "C_100pF" V 950 1420 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1138 1450 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1125 1700 50  0001 C CNN
F 4 "DK" H 1100 1600 60  0001 C CNN "MFN"
F 5 "732-7852-1-ND" H 1100 1600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 1525 2100 60  0001 C CNN "PurchasingLink"
	1    1100 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C20E
P 750 1450
F 0 "#PWR?" H 750 1200 50  0001 C CNN
F 1 "GND" H 755 1277 50  0000 C CNN
F 2 "" H 750 1450 50  0001 C CNN
F 3 "" H 750 1450 50  0001 C CNN
	1    750  1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C214
P 1100 1750
F 0 "#PWR?" H 1100 1500 50  0001 C CNN
F 1 "GND" H 1105 1577 50  0000 C CNN
F 2 "" H 1100 1750 50  0001 C CNN
F 3 "" H 1100 1750 50  0001 C CNN
	1    1100 1750
	1    0    0    -1  
$EndComp
$Comp
L formula:Crystal_SMD Y?
U 1 1 60A4C21D
P 4500 4250
AR Path="/60A3DB07/60A4C21D" Ref="Y?"  Part="1" 
AR Path="/60A3D93E/60A4C21D" Ref="Y302"  Part="1" 
F 0 "Y302" H 3922 4312 50  0000 L CNN
F 1 "Crystal_SMD" H 3732 4228 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4450 4325 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4550 4425 50  0001 C CNN
F 4 "DK" H 4500 4250 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4500 4250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4950 4825 60  0001 C CNN "PurchasingLink"
	1    4500 4250
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C?
U 1 1 60A4C226
P 4300 4500
AR Path="/60A3DB07/60A4C226" Ref="C?"  Part="1" 
AR Path="/60A3D93E/60A4C226" Ref="C306"  Part="1" 
F 0 "C306" H 3928 4522 50  0000 L CNN
F 1 "C_30pF" H 3874 4434 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4338 4350 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4325 4600 50  0001 C CNN
F 4 "DK" H 4300 4500 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4300 4500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4725 5000 60  0001 C CNN "PurchasingLink"
	1    4300 4500
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C?
U 1 1 60A4C22F
P 4700 4500
AR Path="/60A3DB07/60A4C22F" Ref="C?"  Part="1" 
AR Path="/60A3D93E/60A4C22F" Ref="C307"  Part="1" 
F 0 "C307" H 5016 4532 50  0000 L CNN
F 1 "C_30pF" H 4966 4420 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4738 4350 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4725 4600 50  0001 C CNN
F 4 "DK" H 4700 4500 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 4700 4500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 5125 5000 60  0001 C CNN "PurchasingLink"
	1    4700 4500
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R?
U 1 1 60A4C238
P 4650 3600
AR Path="/60A3DB07/60A4C238" Ref="R?"  Part="1" 
AR Path="/60A3D93E/60A4C238" Ref="R307"  Part="1" 
F 0 "R307" V 4550 3600 50  0000 C CNN
F 1 "R_10K" V 4750 3600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4580 3600 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4730 3600 50  0001 C CNN
F 4 "DK" H 4650 3600 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4650 3600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5130 4000 60  0001 C CNN "PurchasingLink"
	1    4650 3600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C23E
P 4300 4650
F 0 "#PWR?" H 4300 4400 50  0001 C CNN
F 1 "GND" H 4305 4477 50  0000 C CNN
F 2 "" H 4300 4650 50  0001 C CNN
F 3 "" H 4300 4650 50  0001 C CNN
	1    4300 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C244
P 4700 4650
F 0 "#PWR?" H 4700 4400 50  0001 C CNN
F 1 "GND" H 4705 4477 50  0000 C CNN
F 2 "" H 4700 4650 50  0001 C CNN
F 3 "" H 4700 4650 50  0001 C CNN
	1    4700 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C24A
P 4500 4400
F 0 "#PWR?" H 4500 4150 50  0001 C CNN
F 1 "GND" H 4505 4227 50  0000 C CNN
F 2 "" H 4500 4400 50  0001 C CNN
F 3 "" H 4500 4400 50  0001 C CNN
	1    4500 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C250
P 4850 4100
F 0 "#PWR?" H 4850 3850 50  0001 C CNN
F 1 "GND" H 4855 3927 50  0000 C CNN
F 2 "" H 4850 4100 50  0001 C CNN
F 3 "" H 4850 4100 50  0001 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A4C25C
P 1250 4200
F 0 "#PWR?" H 1250 3950 50  0001 C CNN
F 1 "GND" H 1255 4027 50  0000 C CNN
F 2 "" H 1250 4200 50  0001 C CNN
F 3 "" H 1250 4200 50  0001 C CNN
	1    1250 4200
	1    0    0    -1  
$EndComp
Text Notes 3950 5050 0    89   ~ 0
16 MHz CRYSTAL\n
$Comp
L formula:C_0.1uF C?
U 1 1 60A4C26D
P 750 1300
AR Path="/60A3DB07/60A4C26D" Ref="C?"  Part="1" 
AR Path="/60A3D93E/60A4C26D" Ref="C301"  Part="1" 
F 0 "C301" V 898 1234 50  0000 L CNN
F 1 "C_0.1uF" V 610 1140 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 788 1150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 775 1400 50  0001 C CNN
F 4 "DK" H 750 1300 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 750 1300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1175 1800 60  0001 C CNN "PurchasingLink"
	1    750  1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  1000 750  1150
Wire Wire Line
	1250 4200 1250 4050
Connection ~ 1250 4050
Wire Wire Line
	1250 4050 1250 3650
NoConn ~ 1400 1850
Wire Wire Line
	4300 4350 4300 4250
Wire Wire Line
	4300 4250 4400 4250
Wire Wire Line
	4600 4250 4700 4250
Wire Wire Line
	4700 4250 4700 4350
Wire Wire Line
	4500 4100 4850 4100
Wire Wire Line
	4700 4250 4700 3950
Connection ~ 4700 4250
Wire Wire Line
	4300 4250 4300 4050
Connection ~ 4300 4250
Text Notes 2200 950  0    89   ~ 0
ATMEGA 16M1\n
Text Label 3640 2350 0    50   ~ 0
CAN_RX
Text Label 3640 2250 0    50   ~ 0
CAN_TX
Text Label 3640 2550 0    50   ~ 0
MUX_SELECT_S0
Text Label 3640 2650 0    50   ~ 0
MUX_SELECT_S1
Text Label 3640 2750 0    50   ~ 0
MUX_SELECT_S2
Wire Wire Line
	3600 3950 4700 3950
Wire Wire Line
	3600 4050 4300 4050
$Comp
L formula:R_200 R?
U 1 1 60A4C2B2
P 4100 1050
AR Path="/60A3DB07/60A4C2B2" Ref="R?"  Part="1" 
AR Path="/60A3D93E/60A4C2B2" Ref="R301"  Part="1" 
F 0 "R301" V 4100 1050 50  0000 C CNN
F 1 "R_200" V 4000 1050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4030 1050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4180 1050 50  0001 C CNN
F 4 "DK" H 4100 1050 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4100 1050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4580 1450 60  0001 C CNN "PurchasingLink"
	1    4100 1050
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D?
U 1 1 60A4C2BD
P 4500 1250
AR Path="/60A3DB07/60A4C2BD" Ref="D?"  Part="1" 
AR Path="/60A3D93E/60A4C2BD" Ref="D302"  Part="1" 
F 0 "D302" H 4500 1450 50  0000 C CNN
F 1 "LED_0805" H 4450 1350 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 4400 1250 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4500 1350 50  0001 C CNN
F 4 "DK" H 4500 1250 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4500 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4900 1750 60  0001 C CNN "PurchasingLink"
	1    4500 1250
	-1   0    0    1   
$EndComp
$Comp
L formula:R_200 R?
U 1 1 60A4C2CC
P 4100 1250
AR Path="/60A3DB07/60A4C2CC" Ref="R?"  Part="1" 
AR Path="/60A3D93E/60A4C2CC" Ref="R302"  Part="1" 
F 0 "R302" V 4100 1250 50  0000 C CNN
F 1 "R_200" V 4000 1250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4030 1250 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4180 1250 50  0001 C CNN
F 4 "DK" H 4100 1250 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4100 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4580 1650 60  0001 C CNN "PurchasingLink"
	1    4100 1250
	0    1    1    0   
$EndComp
NoConn ~ 3600 3050
NoConn ~ 3600 3650
NoConn ~ 3600 2150
Wire Wire Line
	750  1150 1100 1150
$Comp
L formula:MCP2561-E_SN U?
U 1 1 60A6F681
P 1450 7050
AR Path="/60A3DB07/60A6F681" Ref="U?"  Part="1" 
AR Path="/60A3D93E/60A6F681" Ref="U304"  Part="1" 
F 0 "U304" H 1810 7400 50  0000 C CNN
F 1 "MCP2561-E_SN" H 1800 6690 50  0000 C CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 1450 6550 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 1050 7400 50  0001 C CNN
F 4 "DK" H 1450 7050 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 1450 7050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 1450 7800 60  0001 C CNN "PurchasingLink"
	1    1450 7050
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C?
U 1 1 60A6F68A
P 1210 6450
AR Path="/60A3DB07/60A6F68A" Ref="C?"  Part="1" 
AR Path="/60A3D93E/60A6F68A" Ref="C310"  Part="1" 
F 0 "C310" V 1068 6258 50  0000 C CNN
F 1 "C_0.1uF" V 1150 6244 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 1248 6300 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1235 6550 50  0001 C CNN
F 4 "DK" H 1210 6450 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 1210 6450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1635 6950 60  0001 C CNN "PurchasingLink"
	1    1210 6450
	0    1    1    0   
$EndComp
NoConn ~ 1950 7050
$Comp
L power:GND #PWR?
U 1 1 60A6F697
P 1060 6600
AR Path="/60A3DB07/60A6F697" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/60A6F697" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1060 6350 50  0001 C CNN
F 1 "GND" H 960 6600 50  0000 C CNN
F 2 "" H 1060 6600 50  0001 C CNN
F 3 "" H 1060 6600 50  0001 C CNN
	1    1060 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A6F69D
P 1450 7450
AR Path="/60A3DB07/60A6F69D" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/60A6F69D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1450 7200 50  0001 C CNN
F 1 "GND" H 1455 7277 50  0000 C CNN
F 2 "" H 1450 7450 50  0001 C CNN
F 3 "" H 1450 7450 50  0001 C CNN
	1    1450 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A6F6A3
P 950 7250
AR Path="/60A3DB07/60A6F6A3" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/60A6F6A3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 7000 50  0001 C CNN
F 1 "GND" H 955 7077 50  0000 C CNN
F 2 "" H 950 7250 50  0001 C CNN
F 3 "" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
Text Label 900  6850 2    50   ~ 0
CAN_TX
Text Label 900  6950 2    50   ~ 0
CAN_RX
Text Notes 800  6150 0    89   ~ 0
CAN TRANSCEIVER\n
$Comp
L formula:CONN_02X03 J?
U 1 1 60A6F6B1
P 4550 7250
AR Path="/60A3DB07/60A6F6B1" Ref="J?"  Part="1" 
AR Path="/60A3D93E/60A6F6B1" Ref="J302"  Part="1" 
F 0 "J302" H 4550 7460 50  0000 C CNN
F 1 "CONN_02X03" H 4440 7050 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 4550 6050 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 4550 6050 50  0001 C CNN
F 4 "DK" H 4550 7250 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 4550 7250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 4950 7850 60  0001 C CNN "PurchasingLink"
	1    4550 7250
	1    0    0    -1  
$EndComp
Text Label 3500 7150 2    50   ~ 0
PM_MISO
Text Label 4240 7250 2    50   ~ 0
PM_SCK
Text Label 4240 7350 2    50   ~ 0
PM_RESET
Text Label 5250 7250 0    50   ~ 0
PM_MOSI
$Comp
L power:GND #PWR?
U 1 1 60A6F6BB
P 4800 7350
AR Path="/60A3DB07/60A6F6BB" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/60A6F6BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 7100 50  0001 C CNN
F 1 "GND" H 4805 7177 50  0000 C CNN
F 2 "" H 4800 7350 50  0001 C CNN
F 3 "" H 4800 7350 50  0001 C CNN
	1    4800 7350
	1    0    0    -1  
$EndComp
Text Notes 3900 6775 0    89   ~ 0
16M1 PROGRAMMING HEADER\n
Wire Wire Line
	1060 6450 1060 6600
Wire Wire Line
	1950 6950 2050 6950
Wire Wire Line
	2050 6950 2050 6900
Wire Wire Line
	2050 7150 2050 7200
Wire Wire Line
	1950 7150 2050 7150
$Comp
L formula:R_120_DNP R?
U 1 1 60A6F6D0
P 2250 7050
AR Path="/60A3DB07/60A6F6D0" Ref="R?"  Part="1" 
AR Path="/60A3D93E/60A6F6D0" Ref="R309"  Part="1" 
F 0 "R309" H 2320 7096 50  0000 L CNN
F 1 "R_120_DNP" H 2320 7005 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1050 7200 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/315/AOA0000C304-1149620.pdf" H 1050 7500 50  0001 L CNN
F 4 "DK" H 2250 7050 60  0001 C CNN "MFN"
F 5 "667-ERJ-6ENF1200V" H 1050 7300 60  0001 L CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Panasonic-Industrial-Devices/ERJ-6ENF1200V?qs=sGAEpiMZZMvdGkrng054t8AJgcdMkx7x%252bFQnctTMUmU%3d" H 1050 7400 60  0001 L CNN "PurchasingLink"
	1    2250 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6900 2250 6900
Wire Wire Line
	2050 7200 2250 7200
Text Label 5500 6300 0    50   ~ 0
SM_MOSI
Text Notes 3600 5550 0    89   ~ 0
328P PROGRAMMING HEADER\n
Connection ~ 2250 6900
Wire Wire Line
	2250 6900 2400 6900
Connection ~ 2250 7200
Wire Wire Line
	2250 7200 2400 7200
Connection ~ 750  1150
Connection ~ 1100 1150
Connection ~ 1100 1450
Text GLabel 3640 1750 2    50   Input ~ 0
LIN_POT_SENSE_FILTERED
$Comp
L power:GND #PWR?
U 1 1 60A4C2A9
P 4850 1300
F 0 "#PWR?" H 4850 1050 50  0001 C CNN
F 1 "GND" H 4855 1127 50  0000 C CNN
F 2 "" H 4850 1300 50  0001 C CNN
F 3 "" H 4850 1300 50  0001 C CNN
	1    4850 1300
	1    0    0    -1  
$EndComp
$Comp
L formula:LED_0805 D?
U 1 1 60A4C2A3
P 4500 1050
AR Path="/60A3DB07/60A4C2A3" Ref="D?"  Part="1" 
AR Path="/60A3D93E/60A4C2A3" Ref="D301"  Part="1" 
F 0 "D301" H 4500 900 50  0000 C CNN
F 1 "LED_0805" H 4500 950 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 4400 1050 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4500 1150 50  0001 C CNN
F 4 "DK" H 4500 1050 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4500 1050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4900 1550 60  0001 C CNN "PurchasingLink"
	1    4500 1050
	-1   0    0    1   
$EndComp
Text GLabel 2400 6900 2    50   Input ~ 0
CAN+
Text GLabel 2400 7200 2    50   Input ~ 0
CAN-
Wire Wire Line
	1360 6450 1450 6450
Connection ~ 1450 6450
Wire Wire Line
	1450 6450 1450 6650
Wire Wire Line
	3950 1250 3600 1250
Text GLabel 750  1000 1    50   Input ~ 0
5V
Text GLabel 4880 7150 2    50   Input ~ 0
5V
Text GLabel 1350 6250 0    50   Input ~ 0
5V
Text GLabel 3640 1350 2    50   Input ~ 0
STRAIN_MUX1_OUT
Text GLabel 3640 1650 2    50   Input ~ 0
STRAIN_MUX2_OUT
Text GLabel 3640 1550 2    50   Input ~ 0
nSTRAIN_MUX1_EN
Text GLabel 3640 2050 2    50   Input ~ 0
nSTRAIN_MUX2_EN
Text GLabel 3640 2950 2    50   Output ~ 0
STRAIN_S0
Text GLabel 3670 2420 2    50   Output ~ 0
STRAIN_S1
Wire Wire Line
	3600 2450 3630 2450
Wire Wire Line
	3630 2450 3630 2420
Wire Wire Line
	1400 4050 1250 4050
Wire Wire Line
	1250 3650 1400 3650
Wire Wire Line
	1400 1450 1100 1450
Wire Wire Line
	1100 1150 1400 1150
$Comp
L formula:ATMEGA16M1 U?
U 1 1 60A4C28E
P 2500 2850
AR Path="/60A3DB07/60A4C28E" Ref="U?"  Part="1" 
AR Path="/60A3D93E/60A4C28E" Ref="U302"  Part="1" 
F 0 "U302" H 3400 4710 50  0000 C CNN
F 1 "ATMEGA16M1" H 1800 4700 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 2500 2850 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 1550 4680 50  0001 C CNN
F 4 "DK" H 2500 2850 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 2500 2850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 1950 5080 60  0001 C CNN "PurchasingLink"
	1    2500 2850
	1    0    0    -1  
$EndComp
Text GLabel 3640 1450 2    50   Output ~ 0
STRAIN_S2
Text GLabel 3640 1850 2    50   Input ~ 0
FRONT_SENSE
Text GLabel 3640 3450 2    50   Input ~ 0
LEFT_SENSE
Text GLabel 3640 3550 2    50   Input ~ 0
HALL_EFFECT_SENSE
Wire Wire Line
	3600 1350 3640 1350
Wire Wire Line
	3600 1450 3640 1450
Wire Wire Line
	3600 1550 3640 1550
Wire Wire Line
	3600 1650 3640 1650
Wire Wire Line
	3600 1750 3640 1750
Wire Wire Line
	3600 1850 3640 1850
Wire Wire Line
	3600 2050 3640 2050
Wire Wire Line
	3600 2250 3640 2250
Wire Wire Line
	3600 2350 3640 2350
Wire Wire Line
	3630 2420 3670 2420
Wire Wire Line
	3600 2550 3640 2550
Wire Wire Line
	3600 2650 3640 2650
Wire Wire Line
	3600 2750 3640 2750
Wire Wire Line
	3600 2950 3640 2950
Wire Wire Line
	3600 3450 3640 3450
Wire Wire Line
	3600 3550 3640 3550
Wire Wire Line
	4240 7250 4300 7250
Wire Wire Line
	4240 7350 4300 7350
Wire Wire Line
	4800 7150 4880 7150
Wire Wire Line
	900  6850 950  6850
Wire Wire Line
	900  6950 950  6950
Wire Wire Line
	4650 3750 4650 3850
Connection ~ 4650 3850
Wire Wire Line
	4650 3850 4700 3850
Wire Wire Line
	3600 3850 4650 3850
Text Label 9100 1450 0    50   ~ 0
SM_CS
Text Label 9100 1550 0    50   ~ 0
SM_MOSI
Text Label 9100 1650 0    50   ~ 0
SM_MISO
Text Label 9100 1750 0    50   ~ 0
SM_SCK
$Comp
L formula:Crystal_SMD Y301
U 1 1 614C5187
P 9800 1950
F 0 "Y301" H 9900 2100 50  0000 L CNN
F 1 "Crystal_SMD" H 9900 2050 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 9750 2025 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 9850 2125 50  0001 C CNN
F 4 "DK" H 9800 1950 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 9800 1950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 10250 2525 60  0001 C CNN "PurchasingLink"
	1    9800 1950
	1    0    0    -1  
$EndComp
$Comp
L formula:ATmega328P-AU U301
U 1 1 614D600E
P 8450 2450
F 0 "U301" H 8250 4017 50  0000 C CNN
F 1 "ATmega328P-AU" H 8250 3926 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 8250 4000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf" H 8450 2450 50  0001 C CNN
F 4 "DK" H -510 -150 50  0001 C CNN "MFN"
F 5 "ATMEGA328P-15AZTR-ND" H -510 -150 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/ATMEGA328P-15AZ/ATMEGA328P-15AZTR-ND/1914586" H -510 -150 50  0001 C CNN "PurchasingLink"
	1    8450 2450
	1    0    0    -1  
$EndComp
Text GLabel 7050 1250 0    50   Input ~ 0
3.3V
Wire Wire Line
	7050 1250 7150 1250
Wire Wire Line
	7350 1250 7350 1350
Wire Wire Line
	7350 1350 7450 1350
Connection ~ 7350 1250
Wire Wire Line
	7350 1250 7450 1250
Wire Wire Line
	7350 1350 7350 1550
Wire Wire Line
	7350 1550 7450 1550
Connection ~ 7350 1350
NoConn ~ 7450 2000
NoConn ~ 7450 2200
NoConn ~ 7450 2300
$Comp
L formula:C_0.1uF C305
U 1 1 61502A58
P 7150 2550
F 0 "C305" H 7250 2600 50  0000 L CNN
F 1 "C_0.1uF" H 7250 2500 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7188 2400 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7175 2650 50  0001 C CNN
F 4 "DK" H 7150 2550 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7150 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7575 3050 60  0001 C CNN "PurchasingLink"
	1    7150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2400 7150 1250
Connection ~ 7150 1250
Wire Wire Line
	7150 1250 7350 1250
Wire Wire Line
	7150 2700 7150 3350
Wire Wire Line
	7150 3350 7450 3350
Wire Wire Line
	7150 3350 7150 3450
Wire Wire Line
	7150 3550 7450 3550
Connection ~ 7150 3350
Wire Wire Line
	7150 3450 7450 3450
Connection ~ 7150 3450
Wire Wire Line
	7150 3450 7150 3550
Wire Wire Line
	7150 3550 7150 3650
Connection ~ 7150 3550
$Comp
L power:GND #PWR?
U 1 1 61527ACB
P 7150 3650
F 0 "#PWR?" H 7150 3400 50  0001 C CNN
F 1 "GND" H 7155 3477 50  0000 C CNN
F 2 "" H 7150 3650 50  0001 C CNN
F 3 "" H 7150 3650 50  0001 C CNN
	1    7150 3650
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R303
U 1 1 615280C3
P 9750 1250
F 0 "R303" V 9750 1250 50  0000 C CNN
F 1 "R_200" V 9634 1250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9680 1250 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9830 1250 50  0001 C CNN
F 4 "DK" H 9750 1250 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9750 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10230 1650 60  0001 C CNN "PurchasingLink"
	1    9750 1250
	0    1    1    0   
$EndComp
$Comp
L formula:R_200 R305
U 1 1 61529560
P 9750 1350
F 0 "R305" V 9750 1350 50  0000 C CNN
F 1 "R_200" V 9850 1350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9680 1350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9830 1350 50  0001 C CNN
F 4 "DK" H 9750 1350 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9750 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10230 1750 60  0001 C CNN "PurchasingLink"
	1    9750 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 1250 9600 1250
Wire Wire Line
	9050 1350 9600 1350
$Comp
L formula:LED_0805 D303
U 1 1 6154A5B9
P 10350 1250
F 0 "D303" H 10350 1050 50  0000 C CNN
F 1 "LED_0805" H 10350 1150 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 10250 1250 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10350 1350 50  0001 C CNN
F 4 "DK" H 10350 1250 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10350 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10750 1750 60  0001 C CNN "PurchasingLink"
	1    10350 1250
	-1   0    0    1   
$EndComp
$Comp
L formula:LED_0805 D304
U 1 1 6154B802
P 10350 1350
F 0 "D304" H 10350 1550 50  0000 C CNN
F 1 "LED_0805" H 10350 1450 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 10250 1350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 10350 1450 50  0001 C CNN
F 4 "DK" H 10350 1350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 10350 1350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 10750 1850 60  0001 C CNN "PurchasingLink"
	1    10350 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 1250 9900 1250
Wire Wire Line
	9900 1350 10200 1350
Wire Wire Line
	10500 1250 10750 1250
Wire Wire Line
	10750 1250 10750 1350
Wire Wire Line
	10500 1350 10750 1350
Connection ~ 10750 1350
Wire Wire Line
	10750 1350 10750 1450
$Comp
L power:GND #PWR?
U 1 1 6156C167
P 10750 1450
F 0 "#PWR?" H 10750 1200 50  0001 C CNN
F 1 "GND" H 10755 1277 50  0000 C CNN
F 2 "" H 10750 1450 50  0001 C CNN
F 3 "" H 10750 1450 50  0001 C CNN
	1    10750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1850 9450 1650
Wire Wire Line
	10050 1650 10050 1950
Wire Wire Line
	9050 1850 9450 1850
Wire Wire Line
	9800 1800 9800 1700
Wire Wire Line
	9550 1700 9550 1750
$Comp
L power:GND #PWR?
U 1 1 615A6816
P 9550 1750
F 0 "#PWR?" H 9550 1500 50  0001 C CNN
F 1 "GND" H 9550 1600 50  0000 C CNN
F 2 "" H 9550 1750 50  0001 C CNN
F 3 "" H 9550 1750 50  0001 C CNN
	1    9550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1950 9550 1950
Wire Wire Line
	9550 1700 9800 1700
$Comp
L power:GND #PWR?
U 1 1 615D3138
P 9800 2450
F 0 "#PWR?" H 9800 2200 50  0001 C CNN
F 1 "GND" H 9805 2277 50  0000 C CNN
F 2 "" H 9800 2450 50  0001 C CNN
F 3 "" H 9800 2450 50  0001 C CNN
	1    9800 2450
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C303
U 1 1 615D34EB
P 9550 2150
F 0 "C303" H 9238 2170 50  0000 L CNN
F 1 "C_30pF" H 9188 2068 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9588 2000 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 9575 2250 50  0001 C CNN
F 4 "DK" H 9550 2150 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 9550 2150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 9975 2650 60  0001 C CNN "PurchasingLink"
	1    9550 2150
	1    0    0    -1  
$EndComp
$Comp
L formula:C_30pF C304
U 1 1 615D3D5A
P 10050 2150
F 0 "C304" H 10220 2150 50  0000 L CNN
F 1 "C_30pF" H 10160 2070 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 10088 2000 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 10075 2250 50  0001 C CNN
F 4 "DK" H 10050 2150 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 10050 2150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 10475 2650 60  0001 C CNN "PurchasingLink"
	1    10050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1950 10050 1950
Wire Wire Line
	9450 1650 10050 1650
Wire Wire Line
	9550 2000 9550 1950
Connection ~ 9550 1950
Wire Wire Line
	9550 1950 9700 1950
Wire Wire Line
	10050 2000 10050 1950
Connection ~ 10050 1950
Wire Wire Line
	9550 2400 9800 2400
Wire Wire Line
	9550 2300 9550 2400
Wire Wire Line
	10050 2300 10050 2400
Wire Wire Line
	9800 2450 9800 2400
Connection ~ 9800 2400
Wire Wire Line
	9800 2400 9850 2400
Wire Wire Line
	9800 2350 9850 2350
Wire Wire Line
	9850 2350 9850 2400
Wire Wire Line
	9800 2100 9800 2350
Connection ~ 9850 2400
Wire Wire Line
	9850 2400 10050 2400
Text Notes 10150 2050 0    59   ~ 0
16 MHz CRYSTAL\n
Text Notes 9600 950  0    59   ~ 0
Debug LEDs (328P)
Text GLabel 9150 2550 2    50   BiDi ~ 0
SM_SDA
Text GLabel 9150 2650 2    50   Output ~ 0
SM_SCL
Wire Wire Line
	9150 2550 9050 2550
Wire Wire Line
	9150 2650 9050 2650
Wire Wire Line
	9100 1450 9050 1450
Wire Wire Line
	9100 1550 9050 1550
Wire Wire Line
	9100 1650 9050 1650
Wire Wire Line
	9100 1750 9050 1750
$Comp
L formula:R_10K R306
U 1 1 6168F25F
P 10100 3100
F 0 "R306" V 10100 3100 50  0000 C CNN
F 1 "R_10K" V 10000 3100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10030 3100 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10180 3100 50  0001 C CNN
F 4 "DK" H 10100 3100 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10100 3100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10580 3500 60  0001 C CNN "PurchasingLink"
	1    10100 3100
	1    0    0    -1  
$EndComp
Text GLabel 10050 2850 0    50   Input ~ 0
3.3V
Wire Wire Line
	9050 2750 9800 2750
Wire Wire Line
	9800 2750 9800 3300
Wire Wire Line
	9800 3300 10100 3300
Wire Wire Line
	10100 3250 10100 3300
Wire Wire Line
	10100 2950 10100 2850
Wire Wire Line
	10100 2850 10050 2850
Text Label 10350 3300 0    50   ~ 0
SM_RESET
Connection ~ 10100 3300
Wire Wire Line
	10100 3300 10350 3300
NoConn ~ 9050 2950
NoConn ~ 9050 3050
NoConn ~ 9050 3150
NoConn ~ 9050 3250
NoConn ~ 9050 3350
NoConn ~ 9050 3450
NoConn ~ 9050 3550
NoConn ~ 9050 3650
Wire Wire Line
	1350 6250 1450 6250
Wire Wire Line
	1450 6250 1450 6450
$Comp
L formula:TXB0104 U?
U 1 1 6176402D
P 8400 4850
AR Path="/60A3DA8B/6176402D" Ref="U?"  Part="1" 
AR Path="/60A3D93E/6176402D" Ref="U303"  Part="1" 
F 0 "U303" H 8450 4925 50  0000 C CNN
F 1 "TXB0104" H 8450 4834 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8300 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 8400 4850 50  0001 C CNN
F 4 "DK" H 8500 4950 50  0001 C CNN "MFN"
F 5 "296-21929-1-ND" H 8600 5050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/texas-instruments/TXB0104PWR/296-21929-1-ND/1629282" H 8700 5150 50  0001 C CNN "PurchasingLink"
	1    8400 4850
	1    0    0    -1  
$EndComp
Text GLabel 7350 4850 0    50   Input ~ 0
5V
$Comp
L formula:C_0.1uF C?
U 1 1 61765116
P 7500 5200
AR Path="/60A3DA8B/61765116" Ref="C?"  Part="1" 
AR Path="/60A3D93E/61765116" Ref="C309"  Part="1" 
F 0 "C309" H 7160 5250 50  0000 L CNN
F 1 "C_0.1uF" H 7090 5158 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7538 5050 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 7525 5300 50  0001 C CNN
F 4 "DK" H 7500 5200 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 7500 5200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 7925 5700 60  0001 C CNN "PurchasingLink"
	1    7500 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4850 7500 4850
Wire Wire Line
	7500 4850 7500 5000
Connection ~ 7500 5000
Wire Wire Line
	7500 5000 7500 5050
$Comp
L power:GND #PWR?
U 1 1 6177A173
P 7500 5750
AR Path="/60A3DA8B/6177A173" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/6177A173" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 5500 50  0001 C CNN
F 1 "GND" H 7505 5577 50  0000 C CNN
F 2 "" H 7500 5750 50  0001 C CNN
F 3 "" H 7500 5750 50  0001 C CNN
	1    7500 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5350 7500 5600
Connection ~ 7500 5600
Wire Wire Line
	7500 5600 7500 5750
Text Label 7950 5100 2    50   ~ 0
PM_SCK
Text Label 7950 5200 2    50   ~ 0
PM_MISO
Text Label 7950 5300 2    50   ~ 0
PM_MOSI
Wire Wire Line
	8000 5300 7950 5300
Wire Wire Line
	7950 5200 8000 5200
Wire Wire Line
	8000 5100 7950 5100
Wire Wire Line
	7500 5000 8000 5000
Wire Wire Line
	7500 5600 8000 5600
Text GLabel 9325 5975 2    50   Input ~ 0
5V
Text Label 8950 5100 0    50   ~ 0
SM_SCK
Text Label 8950 5200 0    50   ~ 0
SM_MISO
Text Label 8950 5300 0    50   ~ 0
SM_MOSI
Text Label 9750 5400 0    50   ~ 0
SM_CS
Wire Wire Line
	8950 5100 8900 5100
Wire Wire Line
	8900 5200 8950 5200
Wire Wire Line
	8950 5300 8900 5300
Text GLabel 9550 4700 2    50   Input ~ 0
3.3V
Wire Wire Line
	9000 4700 9000 5000
Wire Wire Line
	9000 5000 8900 5000
$Comp
L formula:C_0.1uF C?
U 1 1 61815587
P 9400 4950
AR Path="/60A3DA8B/61815587" Ref="C?"  Part="1" 
AR Path="/60A3D93E/61815587" Ref="C308"  Part="1" 
F 0 "C308" H 9060 5000 50  0000 L CNN
F 1 "C_0.1uF" H 8990 4908 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9438 4800 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9425 5050 50  0001 C CNN
F 4 "DK" H 9400 4950 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 9400 4950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9825 5450 60  0001 C CNN "PurchasingLink"
	1    9400 4950
	-1   0    0    1   
$EndComp
Connection ~ 9400 4700
Wire Wire Line
	9400 4700 9000 4700
$Comp
L power:GND #PWR?
U 1 1 61827B16
P 9400 5150
AR Path="/60A3DA8B/61827B16" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/61827B16" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9400 4900 50  0001 C CNN
F 1 "GND" H 9405 4977 50  0000 C CNN
F 2 "" H 9400 5150 50  0001 C CNN
F 3 "" H 9400 5150 50  0001 C CNN
	1    9400 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5100 9400 5150
Wire Wire Line
	9400 4700 9550 4700
Text Notes 7950 4550 0    89   ~ 0
LEVEL SHIFTER
Wire Wire Line
	4250 1250 4350 1250
Wire Wire Line
	3600 1150 3850 1150
Wire Wire Line
	3850 1150 3850 1050
Wire Wire Line
	3950 1050 3850 1050
Wire Wire Line
	4350 1050 4250 1050
Wire Wire Line
	4650 1250 4850 1250
Wire Wire Line
	4850 1250 4850 1300
Wire Wire Line
	4850 1250 4850 1050
Wire Wire Line
	4850 1050 4650 1050
Connection ~ 4850 1250
Wire Wire Line
	4650 3350 4650 3450
Text GLabel 4600 3350 0    50   Input ~ 0
5V
Wire Wire Line
	4600 3350 4650 3350
Wire Wire Line
	3600 3250 3640 3250
Wire Wire Line
	3600 3350 3640 3350
Wire Wire Line
	3600 3150 3640 3150
Text Label 3640 3350 0    50   ~ 0
PM_SCK
Text Label 3640 3250 0    50   ~ 0
PM_MOSI
Text Label 3640 3150 0    50   ~ 0
PM_MISO
$Comp
L formula:Test_Point_SMD TP?
U 1 1 617528FF
P 5350 6150
AR Path="/617528FF" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/617528FF" Ref="TP4"  Part="1" 
F 0 "TP4" H 5428 6238 50  0000 L CNN
F 1 "Test_Point_SMD" H 5428 6147 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5350 6000 50  0001 C CNN
F 3 "" H 5350 6150 50  0001 C CNN
	1    5350 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6200 5350 6300
Wire Wire Line
	5350 6300 5500 6300
Text Label 3880 6200 2    50   ~ 0
SM_MISO
Text Label 4350 6300 2    50   ~ 0
SM_SCK
Text Label 4350 6400 2    50   ~ 0
SM_RESET
Text GLabel 4920 6200 2    50   Input ~ 0
3.3V
Wire Wire Line
	4870 6200 4900 6200
$Comp
L formula:Test_Point_SMD TP?
U 1 1 617BA56F
P 4130 5950
AR Path="/617BA56F" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/617BA56F" Ref="TP2"  Part="1" 
F 0 "TP2" H 4208 6038 50  0000 L CNN
F 1 "Test_Point_SMD" H 4208 5947 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4130 5800 50  0001 C CNN
F 3 "" H 4130 5950 50  0001 C CNN
	1    4130 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3880 6200 4130 6200
Wire Wire Line
	4130 6000 4130 6200
Connection ~ 4130 6200
$Comp
L power:GND #PWR?
U 1 1 617BA578
P 4900 6400
AR Path="/60A3DB76/617BA578" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/617BA578" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 6150 50  0001 C CNN
F 1 "GND" H 4905 6227 50  0000 C CNN
F 2 "" H 4900 6400 50  0001 C CNN
F 3 "" H 4900 6400 50  0001 C CNN
	1    4900 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6400 4400 6400
Wire Wire Line
	4350 6300 4400 6300
Wire Wire Line
	4130 6200 4400 6200
$Comp
L formula:CONN_02X03 J?
U 1 1 617BA584
P 4650 6300
AR Path="/60A3DB76/617BA584" Ref="J?"  Part="1" 
AR Path="/60A3D93E/617BA584" Ref="J1"  Part="1" 
F 0 "J1" H 4650 6510 50  0000 C CNN
F 1 "CONN_02X03" H 4540 6100 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 4650 5100 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 4650 5100 50  0001 C CNN
F 4 "DK" H 4650 6300 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 4650 6300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 5050 6900 60  0001 C CNN "PurchasingLink"
	1    4650 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6300 5350 6300
Connection ~ 5350 6300
Connection ~ 4900 6200
Wire Wire Line
	4900 6200 4920 6200
Wire Wire Line
	4800 7250 5150 7250
$Comp
L formula:Test_Point_SMD TP?
U 1 1 6180CE50
P 5150 7075
AR Path="/6180CE50" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/6180CE50" Ref="TP3"  Part="1" 
F 0 "TP3" H 5228 7163 50  0000 L CNN
F 1 "Test_Point_SMD" H 5228 7072 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5150 6925 50  0001 C CNN
F 3 "" H 5150 7075 50  0001 C CNN
	1    5150 7075
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 7125 5150 7250
Connection ~ 5150 7250
Wire Wire Line
	5150 7250 5250 7250
$Comp
L formula:Test_Point_SMD TP?
U 1 1 6181E1E5
P 3600 6925
AR Path="/6181E1E5" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/6181E1E5" Ref="TP1"  Part="1" 
F 0 "TP1" H 3678 7013 50  0000 L CNN
F 1 "Test_Point_SMD" H 3678 6922 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3600 6775 50  0001 C CNN
F 3 "" H 3600 6925 50  0001 C CNN
	1    3600 6925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 7150 3600 6975
Wire Wire Line
	3600 7150 4300 7150
Wire Wire Line
	3500 7150 3600 7150
Connection ~ 3600 7150
$Comp
L formula:Test_Point_SMD TP?
U 1 1 6184BE1E
P 7825 5525
AR Path="/6184BE1E" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/6184BE1E" Ref="TP5"  Part="1" 
F 0 "TP5" V 7550 5450 50  0000 L CNN
F 1 "Test_Point_SMD" V 7650 5200 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7825 5375 50  0001 C CNN
F 3 "" H 7825 5525 50  0001 C CNN
	1    7825 5525
	0    -1   -1   0   
$EndComp
Text Label 7775 5400 2    50   ~ 0
PM_CS
Wire Wire Line
	7775 5400 7875 5400
Wire Wire Line
	7875 5525 7875 5400
Connection ~ 7875 5400
Wire Wire Line
	7875 5400 8000 5400
$Comp
L formula:Test_Point_SMD TP?
U 1 1 61886314
P 9650 5525
AR Path="/61886314" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/61886314" Ref="TP6"  Part="1" 
F 0 "TP6" H 9225 5600 50  0000 L CNN
F 1 "Test_Point_SMD" H 8950 5500 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9650 5375 50  0001 C CNN
F 3 "" H 9650 5525 50  0001 C CNN
	1    9650 5525
	-1   0    0    1   
$EndComp
Wire Wire Line
	9400 4800 9400 4700
Wire Wire Line
	8900 5400 9650 5400
Wire Wire Line
	9650 5475 9650 5400
Connection ~ 9650 5400
Wire Wire Line
	9650 5400 9750 5400
$Comp
L formula:R_10K R?
U 1 1 617CADB7
P 9125 5600
AR Path="/60A3DA8B/617CADB7" Ref="R?"  Part="1" 
AR Path="/60A3D93E/617CADB7" Ref="R308"  Part="1" 
F 0 "R308" V 9011 5578 50  0000 C CNN
F 1 "R_10K" V 8929 5578 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9055 5600 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 9205 5600 50  0001 C CNN
F 4 "DK" H 9125 5600 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 9125 5600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 9605 6000 60  0001 C CNN "PurchasingLink"
	1    9125 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8975 5600 8900 5600
Wire Wire Line
	9275 5600 9275 5975
Wire Wire Line
	9275 5975 9325 5975
$EndSCHEMATC
