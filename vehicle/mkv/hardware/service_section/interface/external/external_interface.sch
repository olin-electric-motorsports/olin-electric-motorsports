EESchema Schematic File Version 4
LIBS:external_interface-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:Ampseal_35_VT J1
U 1 1 5DE9B0DD
P 3400 4850
F 0 "J1" H 3358 6797 60  0000 C CNN
F 1 "Ampseal_35_VT" H 3358 6691 60  0000 C CNN
F 2 "footprints:Ampseal_35" H 3200 6200 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F776231%7FA13%7Fpdf%7FEnglish%7FENG_CD_776231_A13.pdf%7F1-776231-1" H 3200 6200 60  0001 C CNN
F 4 "TE" H 3350 6850 60  0001 C CNN "MFN"
F 5 "1-776231-1" H 3250 6750 60  0001 C CNN "MPN"
F 6 "http://www.te.com/usa-en/product-1-776231-1.html" H 3450 6950 60  0001 C CNN "PurchasingLink"
	1    3400 4850
	1    0    0    -1  
$EndComp
Text Label 3600 4250 0    50   ~ 0
GND
Text Label 3600 4150 0    50   ~ 0
12V
Text Label 3600 3350 0    50   ~ 0
CAN_P
Text Label 3600 3450 0    50   ~ 0
CAN_N
Text Label 3600 3550 0    50   ~ 0
CAN-GND
Text Label 3600 4850 0    50   ~ 0
IMD->TSMS
Text Label 3600 4950 0    50   ~ 0
TSMS->FinalShutdown
Text Label 3600 3250 0    50   ~ 0
CoolingBat1-
Text Label 3600 3850 0    50   ~ 0
GND
Text Label 3600 5250 0    50   ~ 0
12V
Text Label 3600 5350 0    50   ~ 0
GND
Text Label 3600 4350 0    50   ~ 0
CAN_P
Text Label 3600 4450 0    50   ~ 0
CAN_N
Text Label 3600 4550 0    50   ~ 0
TSAL-Green-Pos
Text Label 3600 4650 0    50   ~ 0
TSAL-Green-Neg
Text Label 3600 4750 0    50   ~ 0
GND
Text Label 3600 3950 0    50   ~ 0
GND
Text Label 3600 6250 0    50   ~ 0
CAN_EMETER_P
Text Label 3600 3650 0    50   ~ 0
CAN_P
Text Label 3600 3750 0    50   ~ 0
CAN_N
Text Label 3600 5850 0    50   ~ 0
ChargeEnable1
Text Label 3600 5950 0    50   ~ 0
ChargeEnable2
Text Label 3600 5150 0    50   ~ 0
12V
Text Label 3600 5050 0    50   ~ 0
GND
Text Label 3600 5650 0    50   ~ 0
TSAL-Red-Pos
Text Label 3600 5750 0    50   ~ 0
TSAL-Red-Neg
Text Label 3600 6050 0    50   ~ 0
BSDP-Current-Sense
Text Label 3600 6150 0    50   ~ 0
HVD->HVD-Connector
$Comp
L formula:SS-126-G-2 J2
U 1 1 5DEA511A
P 8900 1850
F 0 "J2" H 8858 3197 60  0000 C CNN
F 1 "SS-126-G-2" H 8858 3091 60  0000 C CNN
F 2 "footprints:26pos_screwsocket_.1in" H 8700 2950 60  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/ss.pdf" H 8800 3050 60  0001 C CNN
F 4 "SAMTEC" H 9000 3250 60  0001 C CNN "MFN"
F 5 "SS-126-G-2" H 9100 3350 60  0001 C CNN "MPN"
F 6 "https://www.samtec.com/products/ss-126-g-2" H 8900 3150 60  0001 C CNN "PurchasingLink"
	1    8900 1850
	1    0    0    -1  
$EndComp
$Comp
L formula:BBS-126-G-A J3
U 1 1 5DEA59DD
P 8900 4800
F 0 "J3" H 8858 6147 60  0000 C CNN
F 1 "BBS-126-G-A" H 8858 6041 60  0000 C CNN
F 2 "footprints:26pos_screwsocket_.1in" H 8700 5900 60  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/bbs.pdf" H 8800 6000 60  0001 C CNN
F 4 "SAMTEC" H 9000 6200 60  0001 C CNN "MFN"
F 5 "BBS-126-G-A" H 9100 6300 60  0001 C CNN "MPN"
F 6 "https://www.samtec.com/products/bbs-126-g-a" H 8900 6100 60  0001 C CNN "PurchasingLink"
	1    8900 4800
	1    0    0    -1  
$EndComp
$Comp
L formula:RJ45_VT U1
U 1 1 5DEACC93
P 6950 5450
F 0 "U1" H 7000 6350 60  0000 C CNN
F 1 "RJ45_VT" H 7100 6250 60  0000 C CNN
F 2 "footprints:RJ45-Vertical" H 6850 4760 60  0001 C CNN
F 3 "https://www.amphenolcanada.com/ProductSearch/drawings/AC/MRJ548XX1.pdf" H 6950 4860 60  0001 C CNN
F 4 "DK" H 7135 6101 60  0000 C CNN "MFN"
F 5 "MRJ-5481-01-ND" H 7150 5060 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=MRJ-5481-01" H 7350 5260 60  0001 C CNN "PurchasingLink"
	1    6950 5450
	1    0    0    -1  
$EndComp
Text Label 6300 3000 2    50   ~ 0
CAN_N
$Comp
L formula:RJ45_VT U2
U 1 1 5DEC1056
P 6950 3650
F 0 "U2" H 6950 4693 60  0000 C CNN
F 1 "RJ45_VT" H 6950 4587 60  0000 C CNN
F 2 "footprints:RJ45-Vertical" H 6700 2600 60  0001 C CNN
F 3 "https://www.amphenolcanada.com/ProductSearch/drawings/AC/MRJ548XX1.pdf" H 6850 2060 60  0001 C CNN
F 4 "DK" H 6950 4481 60  0000 C CNN "MFN"
F 5 "MRJ-5481-01-ND" H 7050 2260 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=MRJ-5481-01" H 7250 2460 60  0001 C CNN "PurchasingLink"
	1    6950 3650
	1    0    0    -1  
$EndComp
Text Label 6300 3100 2    50   ~ 0
CAN_P
Text Label 6300 4800 2    50   ~ 0
CAN_N
Text Label 6300 4900 2    50   ~ 0
CAN_P
Text Label 6300 3200 2    50   ~ 0
RESET_AIRC
Text Label 6300 3300 2    50   ~ 0
SCK_AIRC
Text Label 6600 3850 3    50   ~ 0
GND
Text Label 6900 3850 3    50   ~ 0
GND
Text Label 7200 3850 3    50   ~ 0
GND
Text Label 7300 3850 3    50   ~ 0
GND
Text Label 6700 3850 3    50   ~ 0
LED_O_AIRC
Text Label 7000 3850 3    50   ~ 0
LED_G_AIRC
Text Label 7600 3000 0    50   ~ 0
MISO_AIRC
Text Label 7600 3100 0    50   ~ 0
MOSI_AIRC
Text Label 7600 3200 0    50   ~ 0
5V_AIRC
Text Label 7600 3300 0    50   ~ 0
GND
Text Label 6300 5000 2    50   ~ 0
RESET_BMS
Text Label 6300 5100 2    50   ~ 0
SCK_BMS
Text Label 6600 5650 3    50   ~ 0
GND
Text Label 6900 5650 3    50   ~ 0
GND
Text Label 7200 5650 3    50   ~ 0
GND
Text Label 7300 5650 3    50   ~ 0
GND
Text Label 6700 5650 3    50   ~ 0
LED_O_BMS
Text Label 7000 5650 3    50   ~ 0
LED_G_BMS
Text Label 7600 4800 0    50   ~ 0
MISO_BMS
Text Label 7600 4900 0    50   ~ 0
MOSI_BMS
Text Label 7600 5000 0    50   ~ 0
5V_BMS
Text Label 7600 5100 0    50   ~ 0
GND
Text Label 9050 2550 0    50   ~ 0
GND
Text Label 9050 2650 0    50   ~ 0
12V
Text Label 9050 750  0    50   ~ 0
CAN_P
Text Label 9050 850  0    50   ~ 0
CAN_N
Text Label 9050 1850 0    50   ~ 0
BSDP-Current-Sense
Text Label 9050 1450 0    50   ~ 0
FAN-PWM
Text Label 9050 1350 0    50   ~ 0
ChargeEnable1
Text Label 9050 1650 0    50   ~ 0
ChargeEnable2
Text Label 9050 1050 0    50   ~ 0
TSAL-Green-Pos
Text Label 9050 1250 0    50   ~ 0
TSAL-Green-Neg
Text Label 9050 950  0    50   ~ 0
TSAL-Red-Pos
Text Label 9050 1150 0    50   ~ 0
TSAL-Red-Neg
Text Label 9050 2050 0    50   ~ 0
GND
Text Label 9050 1950 0    50   ~ 0
HVD->HVD-Connector
Text Label 9050 1550 0    50   ~ 0
IMD->TSMS
Text Label 9050 1750 0    50   ~ 0
TSMS->FinalShutdown
Text Label 9050 2150 0    50   ~ 0
GND
Text Label 9050 2450 0    50   ~ 0
GND
Text Label 9050 4900 0    50   ~ 0
5V_BMS
Text Label 9050 5000 0    50   ~ 0
MISO_BMS
Text Label 9050 5100 0    50   ~ 0
MOSI_BMS
Text Label 9050 5200 0    50   ~ 0
SCK_BMS
Text Label 9050 5300 0    50   ~ 0
RESET_BMS
Text Label 9050 5400 0    50   ~ 0
LED_O_BMS
Text Label 9050 5500 0    50   ~ 0
LED_G_BMS
Text Label 9050 5600 0    50   ~ 0
5V_AIRC
Text Label 9050 5700 0    50   ~ 0
MISO_AIRC
Text Label 9050 5800 0    50   ~ 0
MOSI_AIRC
Text Label 9050 5900 0    50   ~ 0
SCK_AIRC
Text Label 9050 6000 0    50   ~ 0
RESET_AIRC
Text Label 9050 6100 0    50   ~ 0
LED_O_AIRC
Text Label 9050 6200 0    50   ~ 0
LED_G_AIRC
Text Label 9050 2750 0    50   ~ 0
12V
Text Label 3600 4050 0    50   ~ 0
12V
Text Label 5050 3750 2    50   ~ 0
GND
Text Label 5600 3750 0    50   ~ 0
CAN-GND
Text Notes 3000 2750 0    118  ~ 0
Ampseal
Text Notes 9800 3400 0    118  ~ 0
To Internal
Text Notes 3000 1100 0    157  ~ 0
Accumulator Interface -- External
Text Label 3600 3150 0    50   ~ 0
CoolingBat2-
Text Label 3600 6350 0    50   ~ 0
CAN_EMETER_N
Text Label 3600 5450 0    50   ~ 0
CoolingBat1+
Text Label 3600 5550 0    50   ~ 0
CoolingBat2+
Text Label 3600 6550 0    50   ~ 0
BSDP-Current-Trigger-
Text Label 3600 6450 0    50   ~ 0
BSDP-Current-Trigger+
Text Label 9050 2850 0    50   ~ 0
GND
Text Label 9050 3800 0    50   ~ 0
CoolingBat1+
Text Label 9050 3700 0    50   ~ 0
CoolingBat1-
Text Label 9050 2250 0    50   ~ 0
CAN_EMETER_P
Text Label 9050 2350 0    50   ~ 0
CAN_EMETER_N
Text Label 9050 4000 0    50   ~ 0
CoolingBat1+
Text Label 9050 3900 0    50   ~ 0
CoolingBat1-
Text Label 9050 4200 0    50   ~ 0
CoolingBat1+
Text Label 9050 4100 0    50   ~ 0
CoolingBat1-
Text Label 9050 4400 0    50   ~ 0
CoolingBat2+
Text Label 9050 4300 0    50   ~ 0
CoolingBat2-
Text Label 9050 4600 0    50   ~ 0
CoolingBat2+
Text Label 9050 4500 0    50   ~ 0
CoolingBat2-
Text Label 9050 4800 0    50   ~ 0
CoolingBat2+
Text Label 9050 4700 0    50   ~ 0
CoolingBat2-
Wire Wire Line
	5050 3750 5350 3750
Text Notes 1050 3850 0    79   ~ 0
CoolingBat# is to funnel current.\nEach ampsel pin can take 17A\nCooling bat will 'see' 24A\nso we give each a pin and \nload each at 12A
$Comp
L formula:UF_2_RA J4
U 1 1 62418DF7
P 5000 7250
F 0 "J4" H 5058 7547 60  0000 C CNN
F 1 "UF_2_RA" H 5058 7441 60  0000 C CNN
F 2 "footprints:Ultrafit_2_RA" H 4900 7300 60  0001 C CNN
F 3 "" H 5000 7400 60  0001 C CNN
F 4 "DK" H 5200 7600 60  0001 C CNN "MFN"
F 5 "WM11825-ND" H 5300 7700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex-llc/1723101302/WM11825-ND/5360290" H 5100 7500 60  0001 C CNN "PurchasingLink"
	1    5000 7250
	1    0    0    -1  
$EndComp
Text Label 5250 7300 0    50   ~ 0
BSDP-Current-Trigger+
Text Label 5250 7200 0    50   ~ 0
BSDP-Current-Trigger-
NoConn ~ 9050 2950
NoConn ~ 9050 3050
NoConn ~ 9050 3150
NoConn ~ 9050 3250
Wire Wire Line
	6350 7200 5250 7200
$Comp
L power:GND #PWR?
U 1 1 62412286
P 5350 3750
F 0 "#PWR?" H 5350 3500 50  0001 C CNN
F 1 "GND" H 5355 3577 50  0000 C CNN
F 2 "" H 5350 3750 50  0001 C CNN
F 3 "" H 5350 3750 50  0001 C CNN
	1    5350 3750
	1    0    0    -1  
$EndComp
Connection ~ 5350 3750
Wire Wire Line
	5350 3750 5600 3750
$Comp
L power:GND #PWR?
U 1 1 62412BC2
P 6350 7200
F 0 "#PWR?" H 6350 6950 50  0001 C CNN
F 1 "GND" H 6355 7027 50  0000 C CNN
F 2 "" H 6350 7200 50  0001 C CNN
F 3 "" H 6350 7200 50  0001 C CNN
	1    6350 7200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
