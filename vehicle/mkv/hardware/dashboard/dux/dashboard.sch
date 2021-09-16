EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Driver UX - MKV"
Date "2019-10-31"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Emily Wan"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:PWR_FLAG #FLG?
U 1 1 59E0A773
P 8650 6650
F 0 "#FLG?" H 8650 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 8650 6800 50  0000 C CNN
F 2 "" H 8650 6650 50  0001 C CNN
F 3 "" H 8650 6650 50  0001 C CNN
	1    8650 6650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 59E0A7A5
P 9050 6650
F 0 "#FLG?" H 9050 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 9050 6800 50  0000 C CNN
F 2 "" H 9050 6650 50  0001 C CNN
F 3 "" H 9050 6650 50  0001 C CNN
	1    9050 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E0A859
P 9050 6650
F 0 "#PWR?" H 9050 6400 50  0001 C CNN
F 1 "GND" H 9050 6500 50  0000 C CNN
F 2 "" H 9050 6650 50  0001 C CNN
F 3 "" H 9050 6650 50  0001 C CNN
	1    9050 6650
	1    0    0    -1  
$EndComp
Text Notes 13800 8600 0    50   ~ 0
MicroMatch Headers for interfacing with other \nparts of the car/interface boards\n
Wire Notes Line
	14650 2000 14650 3100
Text Notes 5350 1150 0    50   ~ 0
ATmega16 - for LEDs on \nDash + Start Button + RTD Buzzer
Text Label 8350 6650 1    50   ~ 0
STR_POT_RETURN
$Comp
L power:GND #PWR?
U 1 1 5C0303B6
P 8350 6650
F 0 "#PWR?" H 8350 6400 50  0001 C CNN
F 1 "GND" H 8350 6500 50  0000 C CNN
F 2 "" H 8350 6650 50  0001 C CNN
F 3 "" H 8350 6650 50  0001 C CNN
	1    8350 6650
	1    0    0    -1  
$EndComp
Text Notes 7900 6000 0    118  ~ 0
Flags\n
Text Label 13950 6650 0    50   ~ 0
BRAKE_LED
Text Label 13950 6550 0    50   ~ 0
HV_LED
Text Label 13950 6450 0    50   ~ 0
LV_LED
$Comp
L power:GND #PWR?
U 1 1 5BED0561
P 15400 6450
F 0 "#PWR?" H 15400 6200 50  0001 C CNN
F 1 "GND" V 15400 6350 50  0000 R CNN
F 2 "" H 15400 6450 50  0001 C CNN
F 3 "" H 15400 6450 50  0001 C CNN
	1    15400 6450
	0    -1   -1   0   
$EndComp
Text Label 15200 7650 0    50   ~ 0
IMD_LED
Text Label 15200 7550 0    50   ~ 0
BMS_LED
Text Label 15200 7350 0    50   ~ 0
START_BTN
Text Label 15200 7450 0    50   ~ 0
START_LED
Text Label 15200 8050 0    50   ~ 0
RJLED2
Text Label 15200 7950 0    50   ~ 0
RJLED1
Text Label 15200 7050 0    50   ~ 0
PM_RESET
Text Label 15200 6950 0    50   ~ 0
PM_SCK
Text Label 15200 6750 0    50   ~ 0
PM_MISO
Text Label 15200 6850 0    50   ~ 0
PM_MOSI
Text Label 15200 7250 0    50   ~ 0
CANL
Text Label 15200 7150 0    50   ~ 0
CANH
Text Label 15200 8350 0    50   ~ 0
STR_POT_RETURN
Text Label 15200 8250 0    50   ~ 0
STR_POT_SENSE
Text Label 15200 8150 0    50   ~ 0
STR_POT_POWER
$Comp
L dashboard_MKV_ewan-rescue:MM_F_VT_20-formula-dashboard_MKV_ewan-rescue J2
U 1 1 5BEC18DC
P 15050 7550
F 0 "J2" H 15006 8897 60  0000 C CNN
F 1 "MM_F_VT_20" H 15006 8791 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_20" H 14850 8650 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F2-338068-0" H 14950 8750 60  0001 C CNN
F 4 "TE" H 15150 8950 60  0001 C CNN "MFN"
F 5 "2-338068-0" H 15250 9050 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-2-338068-0.html" H 15050 8850 60  0001 C CNN "PurchasingLink"
	1    15050 7550
	1    0    0    -1  
$EndComp
Text Label 5800 1900 0    50   ~ 0
START_LED
Text Label 5800 1800 0    50   ~ 0
IMD_LED
$Comp
L power:GND #PWR?
U 1 1 59E07C08
P 1500 1800
F 0 "#PWR?" H 1500 1550 50  0001 C CNN
F 1 "GND" H 1500 1650 50  0000 C CNN
F 2 "" H 1500 1800 50  0001 C CNN
F 3 "" H 1500 1800 50  0001 C CNN
	1    1500 1800
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_0.1uF-formula-dashboard_MKV_ewan-rescue C1
U 1 1 59E06957
P 1500 1650
F 0 "C1" V 1550 1500 50  0000 L CNN
F 1 "C_0.1uF" V 1350 1500 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1538 1500 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 1525 1750 50  0001 C CNN
F 4 "478-3352-1-ND" H 1500 1650 60  0001 C CNN "MPN"
F 5 "DK" H 1500 1650 60  0001 C CNN "MFN"
F 6 "Value" H 1500 1650 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 1925 2150 60  0001 C CNN "PurchasingLink"
	1    1500 1650
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R41
U 1 1 5DCE715F
P 4350 3900
F 0 "R41" V 4350 4000 50  0000 R CNN
F 1 "R_200" V 4300 3800 39  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4280 3900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4430 3900 50  0001 C CNN
F 4 "DK" H 4350 3900 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4350 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4830 4300 60  0001 C CNN "PurchasingLink"
	1    4350 3900
	0    1    1    0   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R42
U 1 1 5DCE7168
P 4350 4000
F 0 "R42" V 4350 4100 50  0000 R CNN
F 1 "R_200" V 4300 3900 39  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4280 4000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4430 4000 50  0001 C CNN
F 4 "DK" H 4350 4000 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4350 4000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4830 4400 60  0001 C CNN "PurchasingLink"
	1    4350 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 2500 4850 2500
Wire Wire Line
	4800 2400 4850 2400
Wire Wire Line
	4550 3300 4600 3300
Wire Wire Line
	5350 2900 5350 3200
Wire Wire Line
	4550 4450 4550 4500
Wire Wire Line
	4400 4300 4400 4600
Wire Wire Line
	4350 4600 4400 4600
Wire Wire Line
	4100 4600 4150 4600
$Comp
L dashboard_MKV_ewan-rescue:Crystal_SMD-formula-dashboard_MKV_ewan-rescue Y2
U 1 1 59E10C38
P 4250 4600
F 0 "Y2" H 3450 4600 50  0000 L CNN
F 1 "Crystal_SMD" H 4500 4800 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 4200 4675 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 4300 4775 50  0001 C CNN
F 4 "DK" H 4250 4600 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 4250 4600 60  0001 C CNN "MPN"
F 6 "Value" H 4250 4600 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 4700 5175 60  0001 C CNN "PurchasingLink"
	1    4250 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E0B2A3
P 4550 4500
F 0 "#PWR?" H 4550 4250 50  0001 C CNN
F 1 "GND" H 4650 4400 50  0000 C CNN
F 2 "" H 4550 4500 50  0001 C CNN
F 3 "" H 4550 4500 50  0001 C CNN
	1    4550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E0B1CD
P 4400 4900
F 0 "#PWR?" H 4400 4650 50  0001 C CNN
F 1 "GND" H 4400 4750 50  0000 C CNN
F 2 "" H 4400 4900 50  0001 C CNN
F 3 "" H 4400 4900 50  0001 C CNN
	1    4400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E0B187
P 4100 4900
F 0 "#PWR?" H 4100 4650 50  0001 C CNN
F 1 "GND" H 4100 4750 50  0000 C CNN
F 2 "" H 4100 4900 50  0001 C CNN
F 3 "" H 4100 4900 50  0001 C CNN
	1    4100 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E0A262
P 4250 4750
F 0 "#PWR?" H 4250 4500 50  0001 C CNN
F 1 "GND" H 4250 4600 50  0000 C CNN
F 2 "" H 4250 4750 50  0001 C CNN
F 3 "" H 4250 4750 50  0001 C CNN
	1    4250 4750
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_30pF-formula-dashboard_MKV_ewan-rescue C13
U 1 1 59E06F43
P 4100 4750
F 0 "C13" H 3800 4750 50  0000 L CNN
F 1 "C_30pF" H 3750 4650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4138 4600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4125 4850 50  0001 C CNN
F 4 "1276-1130-1-ND" H 4100 4750 60  0001 C CNN "MPN"
F 5 "DK" H 4100 4750 60  0001 C CNN "MFN"
F 6 "Value" H 4100 4750 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4525 5250 60  0001 C CNN "PurchasingLink"
	1    4100 4750
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_30pF-formula-dashboard_MKV_ewan-rescue C14
U 1 1 59E06ED0
P 4400 4750
F 0 "C14" H 4500 4750 50  0000 L CNN
F 1 "C_30pF" H 4500 4650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4438 4600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 4425 4850 50  0001 C CNN
F 4 "1276-1130-1-ND" H 4400 4750 60  0001 C CNN "MPN"
F 5 "DK" H 4400 4750 60  0001 C CNN "MFN"
F 6 "Value" H 4400 4750 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 4825 5250 60  0001 C CNN "PurchasingLink"
	1    4400 4750
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R40
U 1 1 5E27450B
P 4850 1700
F 0 "R40" V 4850 1800 50  0000 R CNN
F 1 "R_200" V 4750 1800 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4780 1700 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4930 1700 50  0001 C CNN
F 4 "DK" H 4850 1700 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4850 1700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5330 2100 60  0001 C CNN "PurchasingLink"
	1    4850 1700
	0    1    1    0   
$EndComp
Text Label 5000 1700 0    50   ~ 0
BRAKE_LED
$Comp
L dashboard_MKV_ewan-rescue:R_10K-formula-dashboard_MKV_ewan-rescue R21
U 1 1 59E087A5
P 5000 4000
F 0 "R21" V 5000 4000 50  0000 C CNN
F 1 "R_10k" V 5100 4000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 4930 4000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5080 4000 50  0001 C CNN
F 4 "CRS0805-FX-1002ELFCT-ND" H 5000 4000 60  0001 C CNN "MPN"
F 5 "DK" H 5000 4000 60  0001 C CNN "MFN"
F 6 "Value" H 5000 4000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5480 4400 60  0001 C CNN "PurchasingLink"
	1    5000 4000
	1    0    0    -1  
$EndComp
Text Label 4100 2700 0    60   ~ 0
RXCAN
Text Label 4100 3500 0    50   ~ 0
PM_MISO
Text Label 4100 3600 0    50   ~ 0
PM_MOSI
Text Label 4100 3700 0    50   ~ 0
PM_SCK
Text Label 5100 4200 0    50   ~ 0
PM_RESET
Wire Wire Line
	4250 4450 4550 4450
Text Label 4100 2600 0    60   ~ 0
TXCAN
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R10
U 1 1 5BE99834
P 5550 1800
F 0 "R10" V 5550 1900 50  0000 R CNN
F 1 "R_200" V 5450 1900 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5480 1800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5630 1800 50  0001 C CNN
F 4 "DK" H 5550 1800 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5550 1800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6030 2200 60  0001 C CNN "PurchasingLink"
	1    5550 1800
	0    1    1    0   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R19
U 1 1 5BE99967
P 4400 3300
F 0 "R19" V 4400 3200 50  0000 L CNN
F 1 "R_200" V 4450 3400 39  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4330 3300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4480 3300 50  0001 C CNN
F 4 "DK" H 4400 3300 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4400 3300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4880 3700 60  0001 C CNN "PurchasingLink"
	1    4400 3300
	0    -1   -1   0   
$EndComp
Text Label 4600 3300 0    50   ~ 0
BMS_LED
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R15
U 1 1 5BEA4F92
P 5500 2450
F 0 "R15" V 5500 2500 50  0000 R CNN
F 1 "R_200" V 5600 2600 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5430 2450 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5580 2450 50  0001 C CNN
F 4 "DK" H 5500 2450 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5500 2450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5980 2850 60  0001 C CNN "PurchasingLink"
	1    5500 2450
	0    -1   -1   0   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R16
U 1 1 5BEA528C
P 4400 3100
F 0 "R16" V 4400 3150 50  0000 R CNN
F 1 "R_200" V 4450 3400 39  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4330 3100 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4480 3100 50  0001 C CNN
F 4 "DK" H 4400 3100 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4400 3100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 4880 3500 60  0001 C CNN "PurchasingLink"
	1    4400 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5BEBBD7F
P 4700 3100
F 0 "D8" H 4750 3000 50  0000 R CNN
F 1 "LED" H 4600 3150 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 4700 3100 50  0001 C CNN
F 3 "" H 4700 3100 50  0001 C CNN
	1    4700 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5BEBC0D5
P 5800 2450
F 0 "D6" H 5900 2550 50  0000 R CNN
F 1 "LED" H 5750 2550 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5800 2450 50  0001 C CNN
F 3 "" H 5800 2450 50  0001 C CNN
	1    5800 2450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEC21D4
P 4950 3100
F 0 "#PWR?" H 4950 2850 50  0001 C CNN
F 1 "GND" V 4950 2900 50  0000 C CNN
F 2 "" H 4950 3100 50  0001 C CNN
F 3 "" H 4950 3100 50  0001 C CNN
	1    4950 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEC2271
P 6050 2450
F 0 "#PWR?" H 6050 2200 50  0001 C CNN
F 1 "GND" H 6055 2277 50  0000 C CNN
F 2 "" H 6050 2450 50  0001 C CNN
F 3 "" H 6050 2450 50  0001 C CNN
	1    6050 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 3100 4950 3100
Wire Wire Line
	5950 2450 6050 2450
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R13
U 1 1 5BEF1EC6
P 5550 1900
F 0 "R13" V 5550 2000 50  0000 R CNN
F 1 "R_200" V 5650 2000 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5480 1900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5630 1900 50  0001 C CNN
F 4 "DK" H 5550 1900 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5550 1900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6030 2300 60  0001 C CNN "PurchasingLink"
	1    5550 1900
	0    1    1    0   
$EndComp
Text Notes 6350 2650 1    50   ~ 0
Debugging LEDs\n
Text Notes 5100 1500 0    50   ~ 0
LEDs for Start Button, IMD \nIndicator and BMS Indicator
Wire Wire Line
	5700 1900 5800 1900
Wire Wire Line
	5700 1800 5800 1800
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R14
U 1 1 5BF53791
P 5500 2200
F 0 "R14" V 5500 2250 50  0000 R CNN
F 1 "R_200" V 5600 2350 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 5430 2200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 5580 2200 50  0001 C CNN
F 4 "DK" H 5500 2200 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 5500 2200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5980 2600 60  0001 C CNN "PurchasingLink"
	1    5500 2200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 5BF53798
P 5800 2200
F 0 "D5" H 5900 2300 50  0000 R CNN
F 1 "LED" H 5750 2300 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5800 2200 50  0001 C CNN
F 3 "" H 5800 2200 50  0001 C CNN
	1    5800 2200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF5379F
P 6050 2200
F 0 "#PWR?" H 6050 1950 50  0001 C CNN
F 1 "GND" H 6055 2027 50  0000 C CNN
F 2 "" H 6050 2200 50  0001 C CNN
F 3 "" H 6050 2200 50  0001 C CNN
	1    6050 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2200 6050 2200
Text Label 4100 3000 0    50   ~ 0
START_BTN
$Comp
L dashboard_MKV_ewan-rescue:SSM3K333R-formula-dashboard_MKV_ewan-rescue Q1
U 1 1 5C5AAEC7
P 5800 3200
F 0 "Q1" H 6006 3246 50  0000 L CNN
F 1 "SSM3K333R" H 5950 3400 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6000 3125 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6000 3275 50  0001 L CNN
F 4 "DK" H 6300 3575 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6200 3475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6100 3375 60  0001 C CNN "PurchasingLink"
	1    5800 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5C5AB31F
P 5350 3500
F 0 "R23" V 5350 3450 50  0000 L CNN
F 1 "R_200" V 5450 3400 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 5280 3500 50  0001 C CNN
F 3 "~" H 5350 3500 50  0001 C CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 5C5AB415
P 5600 3500
F 0 "R24" V 5600 3450 50  0000 L CNN
F 1 "R_100k" V 5700 3400 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 5530 3500 50  0001 C CNN
F 3 "~" H 5600 3500 50  0001 C CNN
	1    5600 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D9
U 1 1 5C5AB54B
P 5550 3950
F 0 "D9" H 5550 3850 50  0000 C CNN
F 1 "LED" H 5550 4100 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 5550 3950 50  0001 C CNN
F 3 "~" H 5550 3950 50  0001 C CNN
	1    5550 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 3350 5350 3200
Wire Wire Line
	5350 3200 5600 3200
Wire Wire Line
	5600 3350 5600 3200
Connection ~ 5350 3200
Wire Wire Line
	5350 3950 5400 3950
Wire Wire Line
	5350 3650 5350 3950
Wire Wire Line
	5700 3950 5900 3950
Wire Wire Line
	5600 3650 5900 3650
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R6
U 1 1 5C0118E1
P 4650 2500
F 0 "R6" V 4650 2550 50  0000 R CNN
F 1 "R_200" V 4750 2600 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4580 2500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4730 2500 50  0001 C CNN
F 4 "DK" H 4650 2500 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4650 2500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5130 2900 60  0001 C CNN "PurchasingLink"
	1    4650 2500
	0    1    1    0   
$EndComp
Text Label 4850 2400 0    50   ~ 0
RJLED1
Text Label 4850 2500 0    50   ~ 0
RJLED2
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R1
U 1 1 5C0118D7
P 4650 2400
F 0 "R1" V 4650 2450 50  0000 R CNN
F 1 "R_200" V 4550 2500 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 4580 2400 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 4730 2400 50  0001 C CNN
F 4 "DK" H 4650 2400 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 4650 2400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 5130 2800 60  0001 C CNN "PurchasingLink"
	1    4650 2400
	0    1    1    0   
$EndComp
Text Label 4600 4000 0    50   ~ 0
HV_LED
Text Label 4600 3900 0    50   ~ 0
LV_LED
Text Label 4100 3800 0    50   ~ 0
STR_POT_SENSE
$Comp
L power:GND #PWR?
U 1 1 5C5C5A01
P 5900 4050
F 0 "#PWR?" H 5900 3800 50  0001 C CNN
F 1 "GND" H 5905 3877 50  0000 C CNN
F 2 "" H 5900 4050 50  0001 C CNN
F 3 "" H 5900 4050 50  0001 C CNN
	1    5900 4050
	1    0    0    -1  
$EndComp
Text Label 5900 2700 2    50   ~ 0
RTD_LSD
Wire Wire Line
	5900 3950 5900 3650
Wire Wire Line
	5900 3650 5900 3400
Connection ~ 5900 3650
Wire Wire Line
	5900 3950 5900 4050
Connection ~ 5900 3950
$Comp
L power:GND #PWR?
U 1 1 59E07BC2
P 1700 2100
F 0 "#PWR?" H 1700 1850 50  0001 C CNN
F 1 "GND" H 1700 1950 50  0000 C CNN
F 2 "" H 1700 2100 50  0001 C CNN
F 3 "" H 1700 2100 50  0001 C CNN
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E07AB4
P 1900 4400
F 0 "#PWR?" H 1900 4150 50  0001 C CNN
F 1 "GND" H 1900 4250 50  0000 C CNN
F 2 "" H 1900 4400 50  0001 C CNN
F 3 "" H 1900 4400 50  0001 C CNN
	1    1900 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3300 4100 3300
Wire Wire Line
	4100 1900 5400 1900
Wire Wire Line
	4100 1800 5400 1800
NoConn ~ 1900 2200
NoConn ~ 1900 4000
Wire Wire Line
	4100 1700 4700 1700
Wire Wire Line
	4100 4400 4100 4600
Wire Wire Line
	4100 4300 4400 4300
$Comp
L dashboard_MKV_ewan-rescue:C_100pF-formula-dashboard_MKV_ewan-rescue C2
U 1 1 59E06E67
P 1700 1950
F 0 "C2" H 1725 2050 50  0000 L CNN
F 1 "C_100pF" H 1700 1850 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 1738 1800 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885012007057.pdf" H 1725 2050 50  0001 C CNN
F 4 "732-7852-1-ND" H 1700 1950 60  0001 C CNN "MPN"
F 5 "DK" H 1700 1950 60  0001 C CNN "MFN"
F 6 "Value" H 1700 1950 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/885012007057/732-7852-1-ND/5454479" H 2125 2450 60  0001 C CNN "PurchasingLink"
	1    1700 1950
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_100-formula-dashboard_MKV_ewan-rescue R7
U 1 1 59E06840
P 1700 1650
F 0 "R7" V 1700 1650 50  0000 C CNN
F 1 "R_100" V 1800 1650 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 1630 1650 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 1780 1650 50  0001 C CNN
F 4 "DK" H 1700 1650 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 1700 1650 60  0001 C CNN "MPN"
F 6 "Value" H 1700 1650 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 2180 2050 60  0001 C CNN "PurchasingLink"
	1    1700 1650
	1    0    0    -1  
$EndComp
Wire Notes Line
	1250 1200 1250 5200
Text Label 13950 6750 0    50   ~ 0
SPEED_LED_BAR
$Comp
L dashboard_MKV_ewan-rescue:MM_F_VT_10-formula-dashboard_MKV_ewan-rescue J1
U 1 1 5C05249B
P 13800 7550
F 0 "J1" H 13756 8897 60  0000 C CNN
F 1 "MM_F_VT_10" H 13756 8791 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_10" H 13600 8650 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-338068-0" H 13700 8750 60  0001 C CNN
F 4 "TE" H 13900 8950 60  0001 C CNN "MFN"
F 5 "1-338068-0" H 14000 9050 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-338068-0.html" H 13800 8850 60  0001 C CNN "PurchasingLink"
	1    13800 7550
	1    0    0    -1  
$EndComp
Text Label 13950 6850 0    50   ~ 0
SOC_LED_BAR
Text Notes 6100 4300 1    50   ~ 0
low side drive for buzzer
NoConn ~ 4100 3400
Text Notes 8000 2450 0    118  ~ 0
CAN Transceiver
Wire Notes Line
	10000 2500 8000 2500
Wire Notes Line
	10000 2500 10000 4000
$Comp
L dashboard_MKV_ewan-rescue:C_0.1uF-formula-dashboard_MKV_ewan-rescue C15
U 1 1 59E068FA
P 9000 2900
F 0 "C15" V 8950 2700 50  0000 L CNN
F 1 "C_0.1uF" V 9050 2550 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 9038 2750 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 9025 3000 50  0001 C CNN
F 4 "478-3352-1-ND" H 9000 2900 60  0001 C CNN "MPN"
F 5 "DK" H 9000 2900 60  0001 C CNN "MFN"
F 6 "Value" H 9000 2900 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9425 3400 60  0001 C CNN "PurchasingLink"
	1    9000 2900
	0    -1   -1   0   
$EndComp
Wire Notes Line
	8000 2500 8000 4000
Text Notes 9650 3350 0    50   ~ 10
DNP
Wire Notes Line
	8000 4000 10000 4000
Wire Wire Line
	9350 3500 9350 3450
Wire Wire Line
	9350 3200 9350 3250
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R22
U 1 1 5B922239
P 9550 3350
F 0 "R22" V 9630 3350 50  0000 C CNN
F 1 "R_120" V 9450 3350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9480 3350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9630 3350 50  0001 C CNN
F 4 "DK" H 9550 3350 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9550 3350 60  0001 C CNN "MPN"
F 6 "Value" H 9550 3350 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 10030 3750 60  0001 C CNN "PurchasingLink"
	1    9550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2900 9350 2900
Wire Wire Line
	8850 2900 8850 2950
Text Label 8350 3250 2    60   ~ 0
RXCAN
Text Label 8350 3150 2    60   ~ 0
TXCAN
Text Label 9675 3200 0    60   ~ 0
CANH
Text Label 9675 3500 0    60   ~ 0
CANL
$Comp
L dashboard_MKV_ewan-rescue:MCP2561-E_SN-formula-dashboard_MKV_ewan-rescue U4
U 1 1 59E1176B
P 8850 3350
F 0 "U4" H 8450 3700 50  0000 L CNN
F 1 "CAN_Transceiver" H 8900 3000 50  0000 L CNN
F 2 "footprints:SOIC-8_3.9x4.9mm_Pitch1.27mm_OEM" H 8850 2850 50  0001 C CIN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en561044" H 8450 3700 50  0001 C CNN
F 4 "DK" H 8850 3350 60  0001 C CNN "MFN"
F 5 "MCP2561-E/SN-ND" H 8850 3350 60  0001 C CNN "MPN"
F 6 "Value" H 8850 3350 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/products/en?keywords=mcp2561-e%2Fsn" H 8850 4100 60  0001 C CNN "PurchasingLink"
	1    8850 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E08458
P 9350 2900
F 0 "#PWR?" H 9350 2650 50  0001 C CNN
F 1 "GND" H 9350 2750 50  0000 C CNN
F 2 "" H 9350 2900 50  0001 C CNN
F 3 "" H 9350 2900 50  0001 C CNN
	1    9350 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 59E082CD
P 8850 3750
F 0 "#PWR?" H 8850 3500 50  0001 C CNN
F 1 "GND" H 8850 3600 50  0000 C CNN
F 2 "" H 8850 3750 50  0001 C CNN
F 3 "" H 8850 3750 50  0001 C CNN
	1    8850 3750
	1    0    0    -1  
$EndComp
NoConn ~ 9350 3350
$Comp
L power:GND #PWR?
U 1 1 59E080E5
P 8350 3550
F 0 "#PWR?" H 8350 3300 50  0001 C CNN
F 1 "GND" H 8350 3400 50  0000 C CNN
F 2 "" H 8350 3550 50  0001 C CNN
F 3 "" H 8350 3550 50  0001 C CNN
	1    8350 3550
	1    0    0    -1  
$EndComp
Wire Notes Line
	13400 8650 15850 8650
Wire Wire Line
	1500 1500 1700 1500
Wire Wire Line
	9350 3500 9550 3500
Wire Wire Line
	9350 3200 9550 3200
Wire Wire Line
	14950 2500 15100 2500
Wire Wire Line
	15350 2500 15400 2500
Wire Notes Line
	15900 2000 14650 2000
Wire Notes Line
	15900 3100 15900 2000
Wire Notes Line
	14650 3100 15900 3100
Text Label 14950 2500 1    50   ~ 0
XTAL1
Text Label 15850 2500 1    50   ~ 0
XTAL2
Wire Wire Line
	15250 2650 15250 2700
$Comp
L dashboard_MKV_ewan-rescue:Crystal_SMD-formula-dashboard_MKV_ewan-rescue Y1
U 1 1 5BF71DBD
P 15250 2500
F 0 "Y1" H 15450 2900 50  0000 L CNN
F 1 "Crystal_SMD" H 15200 2800 50  0000 L CNN
F 2 "footprints:Crystal_SMD_FA238" H 15200 2575 50  0001 C CNN
F 3 "http://www.txccorp.com/download/products/quartz_crystals/2015TXC_7M_17.pdf" H 15300 2675 50  0001 C CNN
F 4 "DK" H 15250 2500 60  0001 C CNN "MFN"
F 5 "887-1125-1-ND" H 15250 2500 60  0001 C CNN "MPN"
F 6 "Value" H 15250 2500 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/txc-corporation/7M-16.000MAAJ-T/887-1125-1-ND/2119014" H 15700 3075 60  0001 C CNN "PurchasingLink"
	1    15250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	15250 2350 15600 2350
$Comp
L power:GND #PWR?
U 1 1 5BF4078F
P 15600 2350
F 0 "#PWR?" H 15600 2100 50  0001 C CNN
F 1 "GND" H 15650 2400 50  0000 C CNN
F 2 "" H 15600 2350 50  0001 C CNN
F 3 "" H 15600 2350 50  0001 C CNN
	1    15600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF406EC
P 15400 2800
F 0 "#PWR?" H 15400 2550 50  0001 C CNN
F 1 "GND" H 15405 2627 50  0000 C CNN
F 2 "" H 15400 2800 50  0001 C CNN
F 3 "" H 15400 2800 50  0001 C CNN
	1    15400 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF40649
P 15100 2800
F 0 "#PWR?" H 15100 2550 50  0001 C CNN
F 1 "GND" H 15105 2627 50  0000 C CNN
F 2 "" H 15100 2800 50  0001 C CNN
F 3 "" H 15100 2800 50  0001 C CNN
	1    15100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF405A6
P 15250 2700
F 0 "#PWR?" H 15250 2450 50  0001 C CNN
F 1 "GND" H 15255 2527 50  0000 C CNN
F 2 "" H 15250 2700 50  0001 C CNN
F 3 "" H 15250 2700 50  0001 C CNN
	1    15250 2700
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_30pF-formula-dashboard_MKV_ewan-rescue C9
U 1 1 5BDDD4F0
P 15100 2650
F 0 "C9" H 14850 2700 50  0000 L CNN
F 1 "C_30pF" H 14700 2600 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 15138 2500 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 15125 2750 50  0001 C CNN
F 4 "DK" H 15100 2650 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 15100 2650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 15525 3150 60  0001 C CNN "PurchasingLink"
	1    15100 2650
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_30pF-formula-dashboard_MKV_ewan-rescue C10
U 1 1 5BDDD4E6
P 15400 2650
F 0 "C10" H 15515 2696 50  0000 L CNN
F 1 "C_30pF" H 15515 2605 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 15438 2500 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL_Series_MLCC_ds.pdf" H 15425 2750 50  0001 C CNN
F 4 "DK" H 15400 2650 60  0001 C CNN "MFN"
F 5 "1276-1130-1-ND" H 15400 2650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics-america-inc/CL21C300JBANNNC/1276-1130-1-ND/3889216" H 15825 3150 60  0001 C CNN "PurchasingLink"
	1    15400 2650
	1    0    0    -1  
$EndComp
Connection ~ 15100 2500
Wire Wire Line
	15100 2500 15150 2500
Connection ~ 15400 2500
Wire Wire Line
	15400 2500 15850 2500
$Comp
L power:GND #PWR?
U 1 1 5DF0E4E6
P 14050 7400
F 0 "#PWR?" H 14050 7150 50  0001 C CNN
F 1 "GND" V 14055 7272 50  0000 R CNN
F 2 "" H 14050 7400 50  0001 C CNN
F 3 "" H 14050 7400 50  0001 C CNN
	1    14050 7400
	1    0    0    -1  
$EndComp
Text Label 15200 7850 0    50   ~ 0
RTD_LSD
$Comp
L power:GND #PWR?
U 1 1 5DFE881C
P 15300 7750
F 0 "#PWR?" H 15300 7500 50  0001 C CNN
F 1 "GND" V 15350 7600 50  0000 R CNN
F 2 "" H 15300 7750 50  0001 C CNN
F 3 "" H 15300 7750 50  0001 C CNN
	1    15300 7750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15200 7750 15300 7750
Connection ~ 1700 1500
Wire Wire Line
	1700 1500 1900 1500
Wire Wire Line
	1900 1800 1700 1800
Connection ~ 1700 1800
Connection ~ 9550 3200
Wire Wire Line
	9550 3200 9675 3200
Connection ~ 9550 3500
Wire Wire Line
	9550 3500 9675 3500
Text Label 8100 6650 1    50   ~ 0
STR_POT_POWER
NoConn ~ 5350 -150
NoConn ~ -850 1750
Wire Wire Line
	5300 2000 5300 2200
Wire Wire Line
	5300 2200 5350 2200
Wire Wire Line
	4100 2000 5300 2000
Wire Wire Line
	4100 2100 5250 2100
Wire Wire Line
	5250 2100 5250 2450
Wire Wire Line
	5250 2450 5350 2450
Wire Wire Line
	4100 3100 4250 3100
Wire Wire Line
	4100 2400 4500 2400
Wire Wire Line
	4100 2500 4500 2500
Text Label 4100 1500 0    50   ~ 0
SM_MISO
Text Label 4100 1600 0    50   ~ 0
SM_MOSI
Connection ~ 5600 3200
Wire Wire Line
	4100 2900 5350 2900
Text Label 4100 2200 0    50   ~ 0
SM_SCK
Text Label 4100 2800 0    50   ~ 0
CS
$Comp
L dashboard_MKV_ewan-rescue:ATMEGA16M1-formula-dashboard_MKV_ewan-rescue U1
U 1 1 5BFF5D2D
P 3000 3200
F 0 "U1" H 2200 5050 50  0000 C CNN
F 1 "ATMEGA16M1" H 3050 5100 50  0000 C CNN
F 2 "footprints:TQFP-32_7x7mm_Pitch0.8mm" H 3000 3200 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8209-8-bit%20AVR%20ATmega16M1-32M1-64M1_Datasheet.pdf" H 2050 5030 50  0001 C CNN
F 4 "DK" H 3000 3200 60  0001 C CNN "MFN"
F 5 "ATMEGA16M1-AU-ND" H 3000 3200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/atmel/ATMEGA16M1-AU/ATMEGA16M1-AU-ND/2271208" H 2450 5430 60  0001 C CNN "PurchasingLink"
	1    3000 3200
	1    0    0    -1  
$EndComp
Wire Notes Line
	1250 1200 6450 1200
Wire Wire Line
	15200 6550 15400 6550
$Comp
L formula:R_100 R2
U 1 1 5E6676E4
P 5900 2850
F 0 "R2" V 5900 2800 50  0000 L CNN
F 1 "R_100" H 5970 2805 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5100 3000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5600 3350 50  0001 C CNN
F 4 "DK" H 5900 2850 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 5250 3100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 6380 3250 60  0001 C CNN "PurchasingLink"
	1    5900 2850
	1    0    0    -1  
$EndComp
Wire Notes Line
	7900 6050 9300 6050
Wire Notes Line
	7900 6950 9300 6950
Wire Notes Line
	9300 6050 9300 6950
Wire Notes Line
	7900 6050 7900 6950
$Comp
L formula:TP TP1
U 1 1 5EADB477
P 2850 6250
F 0 "TP1" H 2928 6188 50  0000 L CNN
F 1 "TP_12V" H 2928 6097 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 2750 6150 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 2850 6250 50  0001 C CNN
F 4 "DK" H 2950 6350 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 3050 6450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 3150 6550 50  0001 C CNN "PurchasingLink"
	1    2850 6250
	1    0    0    -1  
$EndComp
$Comp
L formula:TP TP3
U 1 1 5EB249E3
P 3350 6250
F 0 "TP3" H 3428 6188 50  0000 L CNN
F 1 "TP_5V" H 3428 6097 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 3250 6150 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 3350 6250 50  0001 C CNN
F 4 "DK" H 3450 6350 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 3550 6450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 3650 6550 50  0001 C CNN "PurchasingLink"
	1    3350 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB55769
P 3800 6450
F 0 "#PWR?" H 3800 6200 50  0001 C CNN
F 1 "GND" H 3800 6300 50  0000 C CNN
F 2 "" H 3800 6450 50  0001 C CNN
F 3 "" H 3800 6450 50  0001 C CNN
	1    3800 6450
	1    0    0    -1  
$EndComp
$Comp
L formula:TP TP5
U 1 1 5EB2AE4F
P 3800 6250
F 0 "TP5" H 3878 6188 50  0000 L CNN
F 1 "TP_GND" H 3878 6097 50  0000 L CNN
F 2 "footprints:tp_1.6mm" H 3700 6150 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=1314" H 3800 6250 50  0001 C CNN
F 4 "DK" H 3900 6350 50  0001 C CNN "MFN"
F 5 "36-5006-ND" H 4000 6450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/keystone-electronics/5006/36-5006-ND/255330" H 4100 6550 50  0001 C CNN "PurchasingLink"
	1    3800 6250
	1    0    0    -1  
$EndComp
Wire Notes Line
	2500 7150 4300 7150
Wire Notes Line
	4300 7150 4300 5750
Wire Notes Line
	4300 5750 2500 5750
Wire Notes Line
	2500 5750 2500 7150
Text Notes 2500 5700 0    118  ~ 0
Test Points\n
Connection ~ 4100 4600
Connection ~ 4400 4600
Text Notes 1250 1100 0    118  ~ 0
ATmega16M1
Text Notes 14650 1950 0    118  ~ 0
328P Crystal
Wire Notes Line
	1250 5200 6450 5200
Wire Notes Line
	6450 1200 6450 5200
Text Notes 11450 1150 0    118  ~ 0
ATmega328p
Connection ~ 13800 3200
NoConn ~ 13650 2700
NoConn ~ 13650 2600
$Comp
L dashboard_MKV_ewan-rescue:ATmega328-AU-formula-dashboard_MKV_ewan-rescue U3
U 1 1 5C61F91D
P 13050 2900
F 0 "U3" H 12850 4467 50  0000 C CNN
F 1 "ATmega328P-AU" H 12850 4376 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 12850 4450 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8025-8-bit-AVR-Microcontroller-ATmega48P-88P-168P_Datasheet.pdf" H 13050 2900 50  0001 C CNN
	1    13050 2900
	1    0    0    -1  
$EndComp
Text Label 13650 1900 0    50   ~ 0
CS
NoConn ~ 13650 1800
Wire Wire Line
	13650 3600 14350 3600
Wire Wire Line
	13650 3500 14350 3500
Wire Notes Line
	15950 1250 15950 4650
Wire Notes Line
	11450 4650 15950 4650
Wire Notes Line
	13400 6000 15850 6000
Wire Notes Line
	13400 8650 13400 6000
NoConn ~ 13650 3100
NoConn ~ 13650 3000
Wire Wire Line
	11900 1700 11900 2000
NoConn ~ 13650 4000
NoConn ~ 13650 3900
Wire Wire Line
	11900 3800 11900 4250
Wire Notes Line
	11450 1250 15950 1250
Wire Notes Line
	11450 1250 11450 4650
Wire Wire Line
	13800 3200 13800 3450
Wire Wire Line
	13650 4100 13650 4250
Text Label 14000 4250 0    50   ~ 0
SOC_LED_BAR
Wire Wire Line
	13950 4250 14000 4250
$Comp
L dashboard_MKV_ewan-rescue:R_475-formula-dashboard_MKV_ewan-rescue R44
U 1 1 5E3B3986
P 13800 4250
F 0 "R44" V 13800 4250 50  0000 C CNN
F 1 "R_475" V 13684 4250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 13730 4250 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 13880 4250 50  0001 C CNN
F 4 "DK" H 13800 4250 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 13800 4250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 14280 4650 60  0001 C CNN "PurchasingLink"
	1    13800 4250
	0    1    1    0   
$EndComp
Text Label 14050 1700 0    50   ~ 0
SPEED_LED_BAR
Wire Wire Line
	13650 1700 13700 1700
Wire Wire Line
	14000 1700 14050 1700
$Comp
L dashboard_MKV_ewan-rescue:R_475-formula-dashboard_MKV_ewan-rescue R43
U 1 1 5E381979
P 13850 1700
F 0 "R43" V 13850 1700 50  0000 C CNN
F 1 "R_475" V 13734 1700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 13780 1700 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 13930 1700 50  0001 C CNN
F 4 "DK" H 13850 1700 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 13850 1700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 14330 2100 60  0001 C CNN "PurchasingLink"
	1    13850 1700
	0    1    1    0   
$EndComp
Text Notes 13450 5950 0    118  ~ 0
MicroMatch Headers\n
NoConn ~ 13650 2900
NoConn ~ 13650 2800
Connection ~ 11900 1700
Wire Wire Line
	11900 1700 12050 1700
Wire Wire Line
	11900 2850 11900 3800
Wire Wire Line
	11900 1600 11900 1700
NoConn ~ 13650 3800
NoConn ~ 13650 3700
Text Notes 14350 1200 0    50   ~ 0
ATmega328 - for interfacing with \nLED bars using I2C bus (see SDA & SCL)\n
Wire Notes Line
	15850 8650 15850 6000
Wire Wire Line
	13650 3200 13800 3200
NoConn ~ 12050 2750
NoConn ~ 12050 2650
NoConn ~ 12050 2450
Connection ~ 11900 2000
Wire Wire Line
	11900 2000 11900 2550
Text Notes 14200 1400 0    50   ~ 0
Debugging LEDs\n
Text Label 13800 3450 0    50   ~ 0
SM_RESET
$Comp
L dashboard_MKV_ewan-rescue:R_10K-formula-dashboard_MKV_ewan-rescue R20
U 1 1 5BFC5708
P 14000 3200
F 0 "R20" V 14000 3300 50  0000 R CNN
F 1 "R_10K" V 14100 3350 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 13930 3200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 14080 3200 50  0001 C CNN
F 4 "DK" H 14000 3200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 14000 3200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 14480 3600 60  0001 C CNN "PurchasingLink"
	1    14000 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	15150 3500 15150 3600
$Comp
L power:GND #PWR?
U 1 1 5BFA0309
P 15150 3750
F 0 "#PWR?" H 15150 3500 50  0001 C CNN
F 1 "GND" H 15155 3577 50  0000 C CNN
F 2 "" H 15150 3750 50  0001 C CNN
F 3 "" H 15150 3750 50  0001 C CNN
	1    15150 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5BF94B83
P 14850 3500
F 0 "D3" H 15000 3450 50  0000 R CNN
F 1 "LED" H 14700 3450 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 14850 3500 50  0001 C CNN
F 3 "" H 14850 3500 50  0001 C CNN
	1    14850 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5BF94A13
P 14850 3600
F 0 "D4" H 15000 3650 50  0000 R CNN
F 1 "LED" H 14700 3650 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 14850 3600 50  0001 C CNN
F 3 "" H 14850 3600 50  0001 C CNN
	1    14850 3600
	-1   0    0    1   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R11
U 1 1 5BF923AE
P 14500 3600
F 0 "R11" V 14500 3650 50  0000 R CNN
F 1 "R_200" V 14600 3700 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 14430 3600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 14580 3600 50  0001 C CNN
F 4 "DK" H 14500 3600 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 14500 3600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 14980 4000 60  0001 C CNN "PurchasingLink"
	1    14500 3600
	0    1    1    0   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R8
U 1 1 5BF921E2
P 14500 3500
F 0 "R8" V 14500 3550 50  0000 R CNN
F 1 "R_200" V 14400 3600 50  0000 R CNN
F 2 "footprints:R_0805_OEM" H 14430 3500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 14580 3500 50  0001 C CNN
F 4 "DK" H 14500 3500 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 14500 3500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 14980 3900 60  0001 C CNN "PurchasingLink"
	1    14500 3500
	0    1    1    0   
$EndComp
Text Label 13650 2200 0    50   ~ 0
SM_SCK
Text Label 13650 2100 0    50   ~ 0
SM_MISO
Text Label 13650 2000 0    50   ~ 0
SM_MOSI
$Comp
L dashboard_MKV_ewan-rescue:C_0.1uF-formula-dashboard_MKV_ewan-rescue C4
U 1 1 5BDFD964
P 11900 2700
F 0 "C4" H 11650 2750 50  0000 L CNN
F 1 "C_0.1uF" H 11500 2650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 11938 2550 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 11925 2800 50  0001 C CNN
F 4 "DK" H 11900 2700 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 11900 2700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 12325 3200 60  0001 C CNN "PurchasingLink"
	1    11900 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12050 2000 11900 2000
Connection ~ 11900 3800
Wire Wire Line
	12050 3800 11900 3800
$Comp
L power:GND #PWR?
U 1 1 5BDECEA4
P 11900 4250
F 0 "#PWR?" H 11900 4000 50  0001 C CNN
F 1 "GND" H 11905 4077 50  0000 C CNN
F 2 "" H 11900 4250 50  0001 C CNN
F 3 "" H 11900 4250 50  0001 C CNN
	1    11900 4250
	1    0    0    -1  
$EndComp
Text Label 13650 2400 0    50   ~ 0
XTAL2
Text Label 13650 2300 0    50   ~ 0
XTAL1
NoConn ~ 13650 3400
Text Notes 10400 6650 0    50   ~ 0
Headers to interface w/ the ATmega16
$Comp
L power:GND #PWR?
U 1 1 59E0C704
P 11450 7100
F 0 "#PWR?" H 11450 6850 50  0001 C CNN
F 1 "GND" H 11450 6950 50  0000 C CNN
F 2 "" H 11450 7100 50  0001 C CNN
F 3 "" H 11450 7100 50  0001 C CNN
	1    11450 7100
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:CONN_02X03-formula-dashboard_MKV_ewan-rescue J5
U 1 1 59E10F9E
P 11150 7000
F 0 "J5" H 11150 7200 50  0000 C CNN
F 1 "CONN_02X03" H 11000 6800 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 11150 5800 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 11150 5800 50  0001 C CNN
F 4 "DK" H 11150 7000 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 11150 7000 60  0001 C CNN "MPN"
F 6 "Value" H 11150 7000 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 11550 7600 60  0001 C CNN "PurchasingLink"
	1    11150 7000
	1    0    0    -1  
$EndComp
Text Label 10900 6900 2    60   ~ 0
PM_MISO
Text Label 10900 7000 2    60   ~ 0
PM_SCK
Text Label 10900 7100 2    60   ~ 0
PM_RESET
Text Label 11400 7000 0    60   ~ 0
PM_MOSI
Wire Wire Line
	11400 7100 11450 7100
$Comp
L power:GND #PWR?
U 1 1 5BE85854
P 11450 6300
F 0 "#PWR?" H 11450 6050 50  0001 C CNN
F 1 "GND" H 11450 6150 50  0000 C CNN
F 2 "" H 11450 6300 50  0001 C CNN
F 3 "" H 11450 6300 50  0001 C CNN
	1    11450 6300
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:CONN_02X03-formula-dashboard_MKV_ewan-rescue J4
U 1 1 5BE8585E
P 11150 6200
F 0 "J4" H 11150 6400 50  0000 C CNN
F 1 "CONN_02X03" H 11000 6000 50  0000 C CNN
F 2 "footprints:Pin_Header_Straight_2x03" H 11150 5000 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/67996.pdf" H 11150 5000 50  0001 C CNN
F 4 "DK" H 11150 6200 60  0001 C CNN "MFN"
F 5 "609-3234-ND" H 11150 6200 60  0001 C CNN "MPN"
F 6 "Value" H 11150 6200 60  0001 C CNN "Package"
F 7 "https://www.digikey.com/product-detail/en/amphenol-fci/67997-206HLF/609-3234-ND/1878491" H 11550 6800 60  0001 C CNN "PurchasingLink"
	1    11150 6200
	1    0    0    -1  
$EndComp
Text Label 10850 6100 2    60   ~ 0
SM_MISO
Text Label 10850 6200 2    60   ~ 0
SM_SCK
Text Label 10850 6300 2    60   ~ 0
SM_RESET
Text Label 11450 6200 0    60   ~ 0
SM_MOSI
Wire Wire Line
	11400 6300 11450 6300
Text Notes 10300 5600 0    118  ~ 0
Programming
Text Notes 10350 5850 0    50   ~ 0
Headers to interface w/ the ATmega328
Wire Notes Line
	11950 7400 11950 5650
Wire Notes Line
	11950 5650 10300 5650
Wire Notes Line
	11950 7400 10300 7400
Wire Notes Line
	10300 7400 10300 5650
Wire Notes Line
	10600 7900 2350 7900
Wire Notes Line
	10600 10200 10600 7900
Wire Notes Line
	2350 10200 10600 10200
Wire Notes Line
	2350 7900 2350 10200
Text Notes 7300 9850 0    49   ~ 0
Feedback Divider\n
$Comp
L formula:C_0.1uF C104
U 1 1 5EB553E7
P 6150 8500
F 0 "C104" V 5900 8450 50  0000 L CNN
F 1 "C_0.1uF" V 6000 8350 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6188 8350 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6175 8600 50  0001 C CNN
F 4 "DK" H 6150 8500 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6150 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6575 9000 60  0001 C CNN "PurchasingLink"
	1    6150 8500
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 8500 7000 8500
Wire Wire Line
	7200 8500 7600 8500
$Comp
L formula:L_4.7uH L101
U 1 1 5EB3DA80
P 7100 8500
F 0 "L101" V 7285 8500 50  0000 C CNN
F 1 "L_4.7uH" V 7194 8500 50  0000 C CNN
F 2 "footprints:IHLP2020BZER4R7M11-L_4.7_3.2A" H 7030 8440 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/documents/wdcatalog/withdrawn_inductor_commercial_power_vlp8040_en.pdf" H 7130 8540 50  0001 C CNN
F 4 "DK" H 7100 8500 60  0001 C CNN "MFN"
F 5 "445-6583-1-ND" H 7100 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/VLP8040T-4R7M/445-6583-1-ND/2465893" H 7530 8940 60  0001 C CNN "PurchasingLink"
	1    7100 8500
	0    -1   -1   0   
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_10uF_25V-formula COUT101
U 1 1 5EB39B3D
P 7600 8750
F 0 "COUT101" H 7400 9100 50  0000 L CNN
F 1 "C_10uF" H 7650 8650 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7550 8550 50  0001 C CNN
F 3 "" H 7600 8750 50  0001 C CNN
	1    7600 8750
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_33uF-formula-dashboard_MKV_ewan-rescue COUT103
U 1 1 5EB38ADE
P 8550 8750
F 0 "COUT103" H 8350 9100 50  0000 L CNN
F 1 "C_33uF" H 8600 8650 50  0000 L CNN
F 2 "footprints:C_1812_4532Metric" H 8600 8350 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 8550 9400 50  0001 C CNN
F 4 "C4532X7R1C336M250KC" H 8600 8250 60  0001 C CNN "MFN"
F 5 "445-3924-1-ND" H 8550 9100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C4532X7R1C336M250KC/445-3924-1-ND/1923431" H 8800 9250 60  0001 C CNN "PurchasingLink"
	1    8550 8750
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_22uF-formula-dashboard_MKV_ewan-rescue COUT102
U 1 1 5EB382D9
P 8050 8750
F 0 "COUT102" H 8250 8400 50  0000 R CNN
F 1 "C_22uF" H 8000 8850 50  0000 R CNN
F 2 "footprints:C_1206_OEM" H 8088 8600 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf" H 8075 8850 50  0001 C CNN
F 4 "DK" H 8050 8750 60  0001 C CNN "MFN"
F 5 "445-11693-1-ND" H 8050 8750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/tdk-corporation/C3216JB1C226M160AB/445-11693-1-ND/3953359" H 8475 9250 60  0001 C CNN "PurchasingLink"
	1    8050 8750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9400 8500 9400 8800
$Comp
L dashboard_MKV_ewan-rescue:R_200-formula-dashboard_MKV_ewan-rescue R106
U 1 1 5EB35EA2
P 9400 8950
F 0 "R106" H 9470 8996 50  0000 L CNN
F 1 "R_200" H 9470 8905 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 9330 8950 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 9480 8950 50  0001 C CNN
F 4 "DK" H 9400 8950 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 9400 8950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 9880 9350 60  0001 C CNN "PurchasingLink"
	1    9400 8950
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:R_0_2512-formula-dashboard_MKV_ewan-rescue R105
U 1 1 5EB359A1
P 9750 8500
F 0 "R105" V 9650 8500 50  0000 C CNN
F 1 "R_0_2512" V 9850 8500 50  0000 C CNN
F 2 "footprints:R_2512_OEM" H 9680 8500 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 9830 8500 50  0001 C CNN
F 4 "DK" H 9750 8500 60  0001 C CNN "MFN"
F 5 "A121322CT-ND" H 9750 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=A121322CT-ND" H 10230 8900 60  0001 C CNN "PurchasingLink"
	1    9750 8500
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D103
U 1 1 5EB350F8
P 9400 9300
F 0 "D103" V 9439 9183 50  0000 R CNN
F 1 "LED_0805" V 9348 9183 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 9300 9300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 9400 9400 50  0001 C CNN
F 4 "DK" H 9400 9300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 9400 9300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 9800 9800 60  0001 C CNN "PurchasingLink"
	1    9400 9300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_22K R104
U 1 1 5EB34993
P 7800 9500
F 0 "R104" V 7900 9500 50  0000 C CNN
F 1 "R_22K" V 8000 9500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 7730 9500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 7880 9500 50  0001 C CNN
F 4 "DK" H 7800 9500 60  0001 C CNN "MFN"
F 5 "RMCF0805JT22K0CT-ND" H 7800 9500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT22K0CT-ND" H 8280 9900 60  0001 C CNN "PurchasingLink"
	1    7800 9500
	0    1    1    0   
$EndComp
$Comp
L formula:R_51.1K R103
U 1 1 5EB3397C
P 7450 9500
F 0 "R103" V 7550 9500 50  0000 C CNN
F 1 "R_51.1K" V 7650 9500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 6350 9800 50  0001 L CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 6350 9900 50  0001 L CNN
F 4 "DK" H 7450 9500 60  0001 C CNN "MFN"
F 5 "P51.1KCCT-ND" H 6350 9700 60  0001 L CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF5112V/P51.1KCCT-ND/119466" H 6350 10000 60  0001 L CNN "PurchasingLink"
	1    7450 9500
	0    1    1    0   
$EndComp
$Comp
L formula:R_10K R102
U 1 1 5EB328C8
P 6500 9700
F 0 "R102" H 6570 9746 50  0000 L CNN
F 1 "R_10K" H 6570 9655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6430 9700 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6580 9700 50  0001 C CNN
F 4 "DK" H 6500 9700 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6500 9700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6980 10100 60  0001 C CNN "PurchasingLink"
	1    6500 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 9500 7300 9500
Wire Wire Line
	7950 9500 9100 9500
$Comp
L dashboard_MKV_ewan-rescue:F_2.6A_16V-formula F101
U 1 1 5EB26091
P 2850 8550
F 0 "F101" H 2850 8775 50  0000 C CNN
F 1 "F_2.6A_16V" H 2850 8684 50  0000 C CNN
F 2 "footprints:Fuse_1812_4532Metric" H 2750 8350 50  0001 C CNN
F 3 "" V 2850 8550 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0260BF2B/507-1780-6-ND/4156287" H 2850 8683 50  0001 C CNN "Digikey"
	1    2850 8550
	1    0    0    -1  
$EndComp
$Comp
L formula:D_Zener_18V D101
U 1 1 5EB24AA3
P 2600 9150
F 0 "D101" V 2554 9229 50  0000 L CNN
F 1 "D_Zener_18V" H 2700 9200 50  0000 L CNN
F 2 "footprints:DO-214AA" H 2500 9150 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/SMBJ5338B-SMBJ5388B(SMB).pdf" H 2600 9250 50  0001 C CNN
F 4 "DK" H 2800 9450 60  0001 C CNN "MFN"
F 5 "SMBJ5355B-TPMSCT-ND" H 2700 9350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=SMBJ5355B-TPMSCT-ND" H 3000 9650 60  0001 C CNN "PurchasingLink"
	1    2600 9150
	0    1    1    0   
$EndComp
$Comp
L formula:LED_0805 D102
U 1 1 5EB22F44
P 3150 9150
F 0 "D102" V 3250 9050 50  0000 R CNN
F 1 "LED_0805" H 3150 9000 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 3050 9150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 3150 9250 50  0001 C CNN
F 4 "DK" H 3150 9150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 3150 9150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 3550 9650 60  0001 C CNN "PurchasingLink"
	1    3150 9150
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_1K R101
U 1 1 5EB21E84
P 3150 8800
F 0 "R101" H 3220 8846 50  0000 L CNN
F 1 "R_1K" H 3220 8755 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3080 8800 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3230 8800 50  0001 C CNN
F 4 "DK" H 3150 8800 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 3150 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 3630 9200 60  0001 C CNN "PurchasingLink"
	1    3150 8800
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C101
U 1 1 5EB208E9
P 3650 8800
F 0 "C101" H 3600 9150 50  0000 L CNN
F 1 "C_0.1uF" V 3700 8400 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3688 8650 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3675 8900 50  0001 C CNN
F 4 "DK" H 3650 8800 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 3650 8800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 4075 9300 60  0001 C CNN "PurchasingLink"
	1    3650 8800
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_10uF_25V-formula C102
U 1 1 5EB1EA0B
P 4050 8800
F 0 "C102" H 4000 9150 50  0000 L CNN
F 1 "C_10uF_25V" V 4100 8250 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4000 8600 50  0001 C CNN
F 3 "" H 4050 8800 50  0001 C CNN
	1    4050 8800
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:C_10uF_25V-formula C103
U 1 1 5EB1DDC0
P 4450 8800
F 0 "C103" H 4400 9150 50  0000 L CNN
F 1 "C_10uF_25V" V 4500 8250 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 4400 8600 50  0001 C CNN
F 3 "" H 4450 8800 50  0001 C CNN
	1    4450 8800
	1    0    0    -1  
$EndComp
$Comp
L dashboard_MKV_ewan-rescue:TPS563231-formula U101
U 1 1 5EAF6AC8
P 5350 9000
F 0 "U101" H 5325 9765 50  0000 C CNN
F 1 "TPS563231" H 5325 9674 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-563" H 5350 9150 50  0001 C CNN
F 3 "" H 5350 9150 50  0001 C CNN
	1    5350 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 8550 3150 8550
Connection ~ 3050 8550
Wire Wire Line
	3050 8800 3050 8550
Wire Wire Line
	2600 8800 3050 8800
Wire Wire Line
	2600 9000 2600 8800
Wire Wire Line
	9400 9450 9400 9850
Wire Wire Line
	2600 9300 2600 9750
Wire Wire Line
	2600 8250 2600 8550
Wire Wire Line
	9400 9100 9400 9150
$Comp
L power:GND #PWR?
U 1 1 5EAEA272
P 9400 9850
F 0 "#PWR?" H 9400 9600 50  0001 C CNN
F 1 "GND" H 9405 9677 50  0000 C CNN
F 2 "" H 9400 9850 50  0001 C CNN
F 3 "" H 9400 9850 50  0001 C CNN
	1    9400 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 8500 10000 8350
Wire Wire Line
	9900 8500 10000 8500
Connection ~ 9100 8500
Wire Wire Line
	9100 8500 9400 8500
Wire Wire Line
	6500 9500 6500 9550
Connection ~ 6500 9500
Wire Wire Line
	6500 8800 6500 9500
$Comp
L power:GND #PWR?
U 1 1 5EAEA24A
P 7600 9150
F 0 "#PWR?" H 7600 8900 50  0001 C CNN
F 1 "GND" H 7605 8977 50  0000 C CNN
F 2 "" H 7600 9150 50  0001 C CNN
F 3 "" H 7600 9150 50  0001 C CNN
	1    7600 9150
	1    0    0    -1  
$EndComp
Connection ~ 7600 9050
Wire Wire Line
	7600 9050 7600 9150
Wire Wire Line
	9100 8500 9100 9500
Connection ~ 8550 8500
Wire Wire Line
	8550 8500 9100 8500
Wire Wire Line
	6500 9850 6500 9900
$Comp
L power:GND #PWR?
U 1 1 5EAEA23E
P 6500 9900
F 0 "#PWR?" H 6500 9650 50  0001 C CNN
F 1 "GND" H 6505 9727 50  0000 C CNN
F 2 "" H 6500 9900 50  0001 C CNN
F 3 "" H 6500 9900 50  0001 C CNN
	1    6500 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 9500 7650 9500
Wire Wire Line
	8550 8600 8550 8500
Wire Wire Line
	8050 8500 8550 8500
Connection ~ 8050 8500
Wire Wire Line
	8050 8600 8050 8500
Wire Wire Line
	7600 8500 8050 8500
Connection ~ 7600 8500
Wire Wire Line
	7600 8600 7600 8500
Connection ~ 8050 9050
Wire Wire Line
	8550 9050 8550 8900
Wire Wire Line
	8050 9050 8550 9050
Wire Wire Line
	8050 9050 8050 8900
Wire Wire Line
	7600 9050 8050 9050
Wire Wire Line
	7600 8900 7600 9050
Wire Wire Line
	5700 8800 6500 8800
Connection ~ 6600 8500
Wire Wire Line
	5700 8650 6600 8650
Wire Wire Line
	6600 8500 6600 8650
Wire Wire Line
	6300 8500 6600 8500
Wire Wire Line
	6000 8500 5700 8500
$Comp
L power:GND #PWR?
U 1 1 5EAEA1F7
P 5950 9100
F 0 "#PWR?" H 5950 8850 50  0001 C CNN
F 1 "GND" H 5955 8927 50  0000 C CNN
F 2 "" H 5950 9100 50  0001 C CNN
F 3 "" H 5950 9100 50  0001 C CNN
	1    5950 9100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 8950 5950 9100
Wire Wire Line
	5700 8950 5950 8950
Connection ~ 3150 8550
Wire Wire Line
	3000 8550 3050 8550
Connection ~ 4750 8550
Connection ~ 4450 8550
Wire Wire Line
	4450 8550 4750 8550
Wire Wire Line
	3650 9150 3650 9350
Connection ~ 3650 9150
Wire Wire Line
	3650 9150 4050 9150
Connection ~ 4050 9150
Wire Wire Line
	4050 9150 4450 9150
Connection ~ 4050 8550
Wire Wire Line
	4050 8550 4450 8550
Connection ~ 3650 8550
Wire Wire Line
	3650 8550 4050 8550
Wire Wire Line
	3650 8950 3650 9150
Wire Wire Line
	4450 8650 4450 8550
Wire Wire Line
	4050 8550 4050 8650
Wire Wire Line
	4050 8950 4050 9150
Wire Wire Line
	4450 8950 4450 9150
Wire Wire Line
	4750 8550 4950 8550
Wire Wire Line
	4750 8800 4750 8550
Wire Wire Line
	4950 8800 4750 8800
Wire Wire Line
	2600 8550 2700 8550
$Comp
L power:GND #PWR?
U 1 1 5EAEA1C5
P 2600 9750
F 0 "#PWR?" H 2600 9500 50  0001 C CNN
F 1 "GND" H 2605 9577 50  0000 C CNN
F 2 "" H 2600 9750 50  0001 C CNN
F 3 "" H 2600 9750 50  0001 C CNN
	1    2600 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 8950 3150 9000
Wire Wire Line
	3150 9300 3150 9350
$Comp
L power:GND #PWR?
U 1 1 5EAEA1B4
P 3150 9350
F 0 "#PWR?" H 3150 9100 50  0001 C CNN
F 1 "GND" H 3155 9177 50  0000 C CNN
F 2 "" H 3150 9350 50  0001 C CNN
F 3 "" H 3150 9350 50  0001 C CNN
	1    3150 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 8550 3150 8650
$Comp
L power:GND #PWR?
U 1 1 5EAEA1A4
P 3650 9350
F 0 "#PWR?" H 3650 9100 50  0001 C CNN
F 1 "GND" H 3655 9177 50  0000 C CNN
F 2 "" H 3650 9350 50  0001 C CNN
F 3 "" H 3650 9350 50  0001 C CNN
	1    3650 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 8550 3150 8550
Wire Wire Line
	3650 8550 3650 8650
Text Notes 3400 9650 2    50   ~ 0
12V Indicator\n
Text Notes 3750 8300 0    50   ~ 0
Input Capacitors\n
Text Notes 2350 7850 0    118  ~ 0
BUCK CONVERTER
Text Notes 5800 8200 0    50   ~ 0
Bootstrap Capacitor\n
Text Notes 7750 8250 0    49   ~ 0
Output Capacitors\n
Text Notes 6950 8650 0    49   ~ 0
Inductor\n
Text Notes 10150 8200 0    49   ~ 0
5V\n
Text Notes 9350 8250 0    49   ~ 0
VCC Jumper\n
Text Notes 9450 9750 0    49   ~ 0
5V Indicator/\nTest Load
Text Notes 2550 9300 3    50   ~ 0
Protection\n
$Comp
L power:+5V #PWR?
U 1 1 613ECC60
P 11450 6100
F 0 "#PWR?" H 11450 5950 50  0001 C CNN
F 1 "+5V" H 11465 6273 50  0000 C CNN
F 2 "" H 11450 6100 50  0001 C CNN
F 3 "" H 11450 6100 50  0001 C CNN
	1    11450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 6100 11400 6100
Wire Wire Line
	11450 6200 11400 6200
Wire Wire Line
	10900 6100 10850 6100
Wire Wire Line
	10900 6200 10850 6200
Wire Wire Line
	10900 6300 10850 6300
$Comp
L power:+5V #PWR?
U 1 1 61458A83
P 11450 6900
F 0 "#PWR?" H 11450 6750 50  0001 C CNN
F 1 "+5V" H 11465 7073 50  0000 C CNN
F 2 "" H 11450 6900 50  0001 C CNN
F 3 "" H 11450 6900 50  0001 C CNN
	1    11450 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 6900 11400 6900
Wire Wire Line
	14050 7400 14050 7350
Wire Wire Line
	14050 7350 13950 7350
Wire Wire Line
	13950 7050 14050 7050
Wire Wire Line
	14050 7050 14050 7150
Connection ~ 14050 7350
Wire Wire Line
	13950 7150 14050 7150
Connection ~ 14050 7150
Wire Wire Line
	14050 7150 14050 7250
Wire Wire Line
	13950 7250 14050 7250
Connection ~ 14050 7250
Wire Wire Line
	14050 7250 14050 7350
$Comp
L power:+5V #PWR?
U 1 1 6149A821
P 14200 6950
F 0 "#PWR?" H 14200 6800 50  0001 C CNN
F 1 "+5V" V 14215 7078 50  0000 L CNN
F 2 "" H 14200 6950 50  0001 C CNN
F 3 "" H 14200 6950 50  0001 C CNN
	1    14200 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	13950 6950 14200 6950
$Comp
L power:+12V #PWR?
U 1 1 614E1AF2
P 15400 6550
F 0 "#PWR?" H 15400 6400 50  0001 C CNN
F 1 "+12V" V 15400 6650 50  0000 L CNN
F 2 "" H 15400 6550 50  0001 C CNN
F 3 "" H 15400 6550 50  0001 C CNN
	1    15400 6550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614F3527
P 15400 6650
F 0 "#PWR?" H 15400 6500 50  0001 C CNN
F 1 "+5V" V 15400 6850 50  0000 C CNN
F 2 "" H 15400 6650 50  0001 C CNN
F 3 "" H 15400 6650 50  0001 C CNN
	1    15400 6650
	0    1    1    0   
$EndComp
Wire Wire Line
	15400 6650 15200 6650
Wire Wire Line
	15400 6450 15200 6450
Wire Wire Line
	4100 3900 4200 3900
Wire Wire Line
	4500 3900 4600 3900
Wire Wire Line
	4100 4000 4200 4000
Wire Wire Line
	4500 4000 4600 4000
Wire Wire Line
	5000 4150 5000 4200
Connection ~ 5000 4200
Wire Wire Line
	5000 4200 5100 4200
Wire Wire Line
	4100 4200 5000 4200
Wire Wire Line
	5000 3850 5000 3800
$Comp
L power:+5V #PWR?
U 1 1 61606FED
P 5000 3800
F 0 "#PWR?" H 5000 3650 50  0001 C CNN
F 1 "+5V" H 5015 3973 50  0000 C CNN
F 2 "" H 5000 3800 50  0001 C CNN
F 3 "" H 5000 3800 50  0001 C CNN
	1    5000 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61619026
P 1500 1400
F 0 "#PWR?" H 1500 1250 50  0001 C CNN
F 1 "+5V" H 1515 1573 50  0000 C CNN
F 2 "" H 1500 1400 50  0001 C CNN
F 3 "" H 1500 1400 50  0001 C CNN
	1    1500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1400 1500 1500
Connection ~ 1500 1500
Wire Wire Line
	15150 3500 15000 3500
Wire Wire Line
	14700 3600 14650 3600
Wire Wire Line
	14700 3500 14650 3500
Wire Wire Line
	15000 3600 15150 3600
Connection ~ 15150 3600
Wire Wire Line
	15150 3600 15150 3750
Wire Wire Line
	13850 3200 13800 3200
Wire Wire Line
	14150 3200 14200 3200
Wire Wire Line
	14200 3200 14200 3150
$Comp
L power:+5V #PWR?
U 1 1 616976F5
P 14200 3150
F 0 "#PWR?" H 14200 3000 50  0001 C CNN
F 1 "+5V" H 14215 3323 50  0000 C CNN
F 2 "" H 14200 3150 50  0001 C CNN
F 3 "" H 14200 3150 50  0001 C CNN
	1    14200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616A0310
P 11900 1600
F 0 "#PWR?" H 11900 1450 50  0001 C CNN
F 1 "+5V" H 11915 1773 50  0000 C CNN
F 2 "" H 11900 1600 50  0001 C CNN
F 3 "" H 11900 1600 50  0001 C CNN
	1    11900 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616D8FA6
P 8850 2800
F 0 "#PWR?" H 8850 2650 50  0001 C CNN
F 1 "+5V" H 8865 2973 50  0000 C CNN
F 2 "" H 8850 2800 50  0001 C CNN
F 3 "" H 8850 2800 50  0001 C CNN
	1    8850 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2800 8850 2900
Connection ~ 8850 2900
$Comp
L power:+5V #PWR?
U 1 1 616EBDC1
P 8100 6650
F 0 "#PWR?" H 8100 6500 50  0001 C CNN
F 1 "+5V" H 8115 6823 50  0000 C CNN
F 2 "" H 8100 6650 50  0001 C CNN
F 3 "" H 8100 6650 50  0001 C CNN
	1    8100 6650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616F4EE5
P 8650 6650
F 0 "#PWR?" H 8650 6500 50  0001 C CNN
F 1 "+5V" H 8665 6823 50  0000 C CNN
F 2 "" H 8650 6650 50  0001 C CNN
F 3 "" H 8650 6650 50  0001 C CNN
	1    8650 6650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 617110CF
P 3350 6450
F 0 "#PWR?" H 3350 6300 50  0001 C CNN
F 1 "+5V" H 3365 6623 50  0000 C CNN
F 2 "" H 3350 6450 50  0001 C CNN
F 3 "" H 3350 6450 50  0001 C CNN
	1    3350 6450
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 61719E09
P 2850 6450
F 0 "#PWR?" H 2850 6300 50  0001 C CNN
F 1 "+12V" H 2750 6600 50  0000 L CNN
F 2 "" H 2850 6450 50  0001 C CNN
F 3 "" H 2850 6450 50  0001 C CNN
	1    2850 6450
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 6171A988
P 2600 8250
F 0 "#PWR?" H 2600 8100 50  0001 C CNN
F 1 "+12V" H 2500 8400 50  0000 L CNN
F 2 "" H 2600 8250 50  0001 C CNN
F 3 "" H 2600 8250 50  0001 C CNN
	1    2600 8250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6171BAB4
P 10000 8350
F 0 "#PWR?" H 10000 8200 50  0001 C CNN
F 1 "+5V" H 10015 8523 50  0000 C CNN
F 2 "" H 10000 8350 50  0001 C CNN
F 3 "" H 10000 8350 50  0001 C CNN
	1    10000 8350
	1    0    0    -1  
$EndComp
Text Notes 2500 8000 0    50   ~ 0
Battery voltage can be anywhere between 12.8V and 16.8V
Connection ~ 9400 8500
Wire Wire Line
	9400 8500 9600 8500
$EndSCHEMATC
