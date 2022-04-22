EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "AIR Mount -"
Date "2022-04-21"
Rev "1.0"
Comp "Olin Electric Motorsports"
Comment1 "Elvis Wolcott"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2750 1350 2    50   ~ 0
HV_BAT-
Text Label 1600 1350 2    50   ~ 0
HV_TS-
Text Label 2200 1650 0    50   ~ 0
PRECHARGE_LSD
Text Label 1600 2350 2    50   ~ 0
FINAL_SHUTDOWN
Wire Wire Line
	1600 2350 1750 2350
Wire Wire Line
	2050 2350 2200 2350
Wire Wire Line
	2200 2350 2200 1650
Text Label 3250 4300 2    50   ~ 0
HV_TS-
Text Label 1200 3300 2    50   ~ 0
HV_TS-
Wire Wire Line
	1800 3300 2000 3300
Wire Wire Line
	2000 3300 2150 3300
Connection ~ 2000 3300
Text Label 2150 3550 0    50   ~ 0
HV_TS_FUSE-
Text Label 2150 3300 0    50   ~ 0
HV_ENERGY_METER
Text Label 2150 3425 0    50   ~ 0
HV_TSAL-
Text Label 2150 3175 0    50   ~ 0
HV_BSPD_CURRENT_SENSOR
Text Label 7600 1200 0    50   ~ 0
PRECHARGE_LSD
Text Label 7600 1300 0    50   ~ 0
FINAL_SHUTDOWN
Text Label 7600 1400 0    50   ~ 0
AIR-_AUX+
Text Label 7600 1500 0    50   ~ 0
AIR-_AUX-
Text Label 7600 1600 0    50   ~ 0
AIR-_LSD
Text Label 3700 1400 0    50   ~ 0
AIR-_AUX-
Text Label 3700 1500 0    50   ~ 0
AIR-_AUX+
Text Label 3700 1200 0    50   ~ 0
AIR-_LSD
Text Label 3700 1300 0    50   ~ 0
FINAL_SHUTDOWN
NoConn ~ 7600 1700
Wire Wire Line
	2150 3550 2000 3550
Wire Wire Line
	2000 3300 2000 3425
Wire Wire Line
	2150 3425 2000 3425
Connection ~ 2000 3425
Wire Wire Line
	2000 3425 2000 3550
Wire Wire Line
	2000 3300 2000 3175
Wire Wire Line
	2000 3175 2150 3175
Text Notes 2825 3950 0    50   ~ 0
TSMP Body Protection Resistor
Text Notes 1750 2925 0    50   ~ 0
TS- Fusing 
Text Notes 975  900  0    50   ~ 0
Precharge Relay. Low Side Driven by AIR Control\n
Text Label 3650 2300 0    50   ~ 0
HV_BAT-
$Comp
L Formula:F_1A_600V F1
U 1 1 5E5873B3
P 1500 3300
F 0 "F1" H 1500 3525 50  0000 C CNN
F 1 "F_1A_600V" H 1500 3434 50  0000 C CNN
F 2 "footprints:Fuse_1A_600V" H 1500 3000 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Bel%20Fuse%20PDFs/0ADAC_0ADAP_Series.pdf" H 1450 3300 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ADAP1000-RE/507-2220-ND/8028479" H 1700 3650 50  0001 C CNN "PurchasingLink"
	1    1500 3300
	1    0    0    -1  
$EndComp
$Comp
L Formula:SS110LW D1
U 1 1 5E5C16F2
P 1900 2350
F 0 "D1" H 1900 2566 50  0000 C CNN
F 1 "SS110LW" H 1900 2475 50  0000 C CNN
F 2 "footprints:D_SOD-123W_OEM" H 1800 2350 50  0001 C CNN
F 3 "http://www.taiwansemi.com/products/datasheet/SS14LW%20SERIES_A1511.pdf" H 1900 2450 50  0001 C CNN
F 4 "DK" H 2100 2650 60  0001 C CNN "MFN"
F 5 "SS110LWRVGCT-ND" H 2000 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/taiwan-semiconductor-corporation/SS110LW-RVG/SS110LWRVGCT-ND/7359346" H 2200 2750 60  0001 C CNN "PurchasingLink"
	1    1900 2350
	1    0    0    -1  
$EndComp
$Comp
L Formula:redcude_7461166 J2
U 1 1 5E5C38E6
P 4300 2300
F 0 "J2" H 4358 2525 50  0000 C CNN
F 1 "redcude_7461166" H 4358 2434 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 4300 2100 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 4300 2200 50  0001 C CNN
	1    4300 2300
	1    0    0    -1  
$EndComp
$Comp
L Formula:redcude_7461166 J3
U 1 1 5E5C3C0C
P 3500 2300
F 0 "J3" H 3558 2525 50  0000 C CNN
F 1 "redcude_7461166" H 3558 2434 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 3500 2100 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 3500 2200 50  0001 C CNN
	1    3500 2300
	1    0    0    -1  
$EndComp
Text Label 4450 2300 0    50   ~ 0
HV_TS-
$Comp
L Formula:MicroFit_VT_6 U1
U 1 1 5E5C8F8F
P 7400 1450
F 0 "U1" H 7458 1925 50  0000 C CNN
F 1 "MicroFit_VT_6" H 7458 1834 50  0000 C CNN
F 2 "footprints:MicroFit_VT_6" H 7400 1050 50  0001 C CNN
F 3 "" H 7400 1450 50  0001 C CNN
F 4 "0430450614" H 7458 1925 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450614/WM1797-ND/252510" H 7458 1834 50  0001 C CNN "PurchasingLink"
	1    7400 1450
	1    0    0    -1  
$EndComp
$Comp
L Formula:HO_60_250-p0100 U3
U 1 1 5E5D0D07
P 6200 1075
F 0 "U3" H 6258 1150 50  0000 C CNN
F 1 "HO_60_250-p0100" H 6258 1059 50  0000 C CNN
F 2 "footprints:HO_60_250-p0100" H 6500 925 50  0001 C CNN
F 3 "" H 6500 925 50  0001 C CNN
	1    6200 1075
	1    0    0    -1  
$EndComp
Text Label 5675 1375 0    50   ~ 0
UC+
Text Label 6450 1225 0    50   ~ 0
UC+
Text Label 6450 1325 0    50   ~ 0
GND
Text Label 5675 1475 0    50   ~ 0
GND
Text Label 5675 1575 0    50   ~ 0
Vout
Text Label 6450 1425 0    50   ~ 0
Vout
Text Label 6450 1525 0    50   ~ 0
Vref
Text Label 5675 1675 0    50   ~ 0
Vref
Text Label 5675 1775 0    50   ~ 0
OCD
Text Label 6450 1625 0    50   ~ 0
OCD
NoConn ~ 5675 1875
NoConn ~ 6450 1725
NoConn ~ 6450 1825
NoConn ~ 6450 1925
NoConn ~ 6450 2025
$Comp
L Formula:MicroFit_VT_6 U2
U 1 1 5E5D0395
P 5475 1625
F 0 "U2" H 5533 2100 50  0000 C CNN
F 1 "MicroFit_VT_6" H 5533 2009 50  0000 C CNN
F 2 "footprints:MicroFit_VT_6" H 5475 1225 50  0001 C CNN
F 3 "" H 5475 1625 50  0001 C CNN
F 4 "0430450614" H 5533 2100 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450614/WM1797-ND/252510" H 5533 2009 50  0001 C CNN "PurchasingLink"
	1    5475 1625
	1    0    0    -1  
$EndComp
Wire Notes Line
	5100 750  6950 750 
Wire Notes Line
	6950 750  6950 2300
Wire Notes Line
	6950 2300 5100 2300
Wire Notes Line
	5100 2300 5100 750 
Text Notes 5300 925  0    50   ~ 0
Mounted Curent Sensor and Connector
Wire Notes Line
	875  2475 875  725 
Wire Notes Line
	875  725  2950 725 
Wire Notes Line
	2950 725  2950 2475
Wire Notes Line
	2950 2475 875  2475
Wire Notes Line
	2750 3825 4100 3825
Wire Notes Line
	4100 3825 4100 4425
Wire Notes Line
	4100 4425 2750 4425
Wire Notes Line
	2750 4425 2750 3825
Text Notes 3575 1950 0    50   ~ 0
Red Cube connectors
$Comp
L Formula:MicroFit_VT_4 J4
U 1 1 5E5C79DB
P 1200 4450
F 0 "J4" H 1258 4825 50  0000 C CNN
F 1 "MicroFit_VT_4" H 1258 4734 50  0000 C CNN
F 2 "footprints:MicroFit_VT_4" H 1200 4150 50  0001 C CNN
F 3 "" H 1200 4400 50  0001 C CNN
F 4 "430450414" H 1258 4825 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450414/WM1796-ND/252509" H 1258 4734 50  0001 C CNN "PurchasingLink"
	1    1200 4450
	1    0    0    -1  
$EndComp
Text Label 1400 4600 0    50   ~ 0
HV_TSMP-
Text Label 1400 4500 0    50   ~ 0
HV_TS_FUSE-
Text Label 1400 4400 0    50   ~ 0
HV_ENERGY_METER
Text Label 1400 4300 0    50   ~ 0
HV_BSPD_CURRENT_SENSOR
Text Notes 3650 850  0    50   ~ 0
To AIR
Text Notes 1375 3950 0    50   ~ 0
Fuse Connector
Wire Notes Line
	3100 725  4425 725 
Wire Notes Line
	3100 725  3100 1675
Wire Notes Line
	3100 1675 4425 1675
Wire Notes Line
	4425 1675 4425 725 
Text Notes 7475 875  0    50   ~ 0
To AIR Control
Wire Notes Line
	8300 750  8300 1825
Wire Notes Line
	8300 1825 7150 1825
Wire Notes Line
	7150 1825 7150 750 
Wire Notes Line
	7150 750  8300 750 
Text Label 3550 4300 0    50   ~ 0
HV_TSMP-
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 625856BE
P 2750 1250
F 0 "H1" H 2800 1200 50  0000 L CNN
F 1 "HOLE" H 2850 1208 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 2750 1250 50  0001 C CNN
F 3 "~" H 2750 1250 50  0001 C CNN
	1    2750 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6258FFD3
P 2200 1250
F 0 "H2" H 2250 1200 50  0000 L CNN
F 1 "HOLE" H 2300 1208 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 2200 1250 50  0001 C CNN
F 3 "~" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
Text Notes 2200 1500 0    50   ~ 0
solder HV wire\nto resistors
$Comp
L formula:5503-12-1(NO) K1
U 1 1 6259F9BF
P 1900 1450
F 0 "K1" V 2367 1450 50  0000 C CNN
F 1 "5503-12-1(NO)" V 2276 1450 50  0000 C CNN
F 2 "footprints:Relay_Coto_5500" H 2350 1400 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/89/5500_series_reed_relay_datasheet-1667093.pdf" H 2350 1100 50  0001 L CNN
F 4 "COTO" H 2750 2000 60  0001 C CNN "MFN"
F 5 "5503-12-1" H 2650 1900 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/Coto-Technology/5503-12-1?qs=PSXJKkD%2FXAS95qerU0wiiQ%3D%3D" H 2850 2100 60  0001 C CNN "PurchasingLink"
	1    1900 1450
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_15K_HV R1
U 1 1 6258EE79
P 3400 4300
F 0 "R1" V 3193 4300 50  0000 C CNN
F 1 "R_15K_HV" V 3284 4300 50  0000 C CNN
F 2 "footprints:R_TSMP_SMD_5329" H 3330 4300 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773242&DocType=DS&DocLang=English" H 3480 4300 50  0001 C CNN
F 4 "DK" H 3400 4300 60  0001 C CNN "MFN"
F 5 "SMF515KJT" H 3400 4300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/SMF515KJT/2367113" H 3880 4700 60  0001 C CNN "PurchasingLink"
	1    3400 4300
	0    1    1    0   
$EndComp
Text Notes 8350 1600 0    50   ~ 0
COIL- is LSD from AIR control
Wire Notes Line
	3100 2500 4900 2500
Wire Notes Line
	4900 2500 4900 1800
Wire Notes Line
	4900 1800 3100 1800
Wire Notes Line
	3100 1800 3100 2500
Wire Notes Line
	2500 4700 850  4700
Wire Notes Line
	850  4700 850  3800
Wire Notes Line
	850  3800 2500 3800
Wire Notes Line
	2500 3800 2500 4700
Wire Notes Line
	850  2800 3300 2800
Wire Notes Line
	3300 2800 3300 3650
Wire Notes Line
	3300 3650 850  3650
Wire Notes Line
	850  3650 850  2800
Wire Notes Line
	750  2700 750  4850
Wire Notes Line
	750  4850 5200 4850
Wire Notes Line
	5200 4850 5200 2700
Wire Notes Line
	5200 2700 750  2700
Text Notes 4850 2950 0    113  ~ 23
TS
Wire Notes Line
	9650 650  9650 2600
Wire Notes Line
	9650 2600 750  2600
Wire Notes Line
	750  2600 750  650 
Wire Notes Line
	750  650  9650 650 
Text Notes 6800 2950 0    113  ~ 23
SPACING RULES:
Text Notes 6800 3500 0    50   ~ 0
EV.7.5.5:\nWhere both Tractive System and GLV are included inside an enclosure, they must meet one of:\n- Be separated by insulating barriers (in addition to the insulation on the wire) made of moisture\nresistant, UL recognized or equivalent insulating materials rated for 150° C or higher \n(such as Nomex based electrical insulation)\n- Maintain 30mm spacing through air, or over a surface
Text Notes 9200 2500 0    113  ~ 23
GLV
Text Notes 6800 3900 0    50   ~ 0
EV.7.5.7:\nIf Tractive System and GLV are on the same circuit board: \n- They must be on separate, clearly defined and clearly marked areas of the board\n- Spaces between areas must be at least 12.7 mm (9.5 mm cut in board, 4mm under conformal coating)
Wire Notes Line
	900  1500 2900 1500
Wire Notes Line
	2900 1500 2900 750 
Wire Notes Line
	2900 750  900  750 
Wire Notes Line
	900  750  900  1500
Text Notes 950  1250 0    113  ~ 23
TS
Text Notes 3450 2450 0    50   ~ 0
Supporting connector 7461129 
Wire Wire Line
	1600 1950 1600 2350
Text Notes 900  2200 0    50   ~ 0
drop Vmax 16V \nto 15V (coil max)\nRcoil = 175
$Comp
L formula:R_12 R2
U 1 1 6262F26D
P 1600 1800
F 0 "R2" H 1450 1850 50  0000 L CNN
F 1 "R_12" H 1350 1750 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 1530 1800 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" V 1680 1800 50  0001 C CNN
F 4 "TE" V 1780 1900 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B12RE" V 1880 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CPF-A-0805B12RE/5583863" V 1880 2000 60  0001 C CNN "PurchasingLink"
	1    1600 1800
	1    0    0    -1  
$EndComp
$Comp
L formula:MicroFit_VT_4 J1
U 1 1 62629110
P 3500 1350
F 0 "J1" H 3558 1725 50  0000 C CNN
F 1 "MicroFit_VT_4" H 3558 1634 50  0000 C CNN
F 2 "footprints:MicroFit_VT_4" H 3500 1050 50  0001 C CNN
F 3 "" H 3500 1300 50  0001 C CNN
F 4 "430450414" H 3558 1633 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/molex/0430450414/WM1796-ND/252509" H 3558 1634 50  0001 C CNN "PurchasingLink"
	1    3500 1350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
