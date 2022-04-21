EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "AIR Mount +"
Date "2022-04-21"
Rev ""
Comp "Olin Electric Motorsports"
Comment1 "Elvis Wolcott"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Formula:SS110LW D1
U 1 1 5DAE7FAE
P 1900 2300
F 0 "D1" H 1900 2516 50  0000 C CNN
F 1 "SS110LW" H 1900 2425 50  0000 C CNN
F 2 "footprints:D_SOD-123W_OEM" H 1800 2300 50  0001 C CNN
F 3 "http://www.taiwansemi.com/products/datasheet/SS14LW%20SERIES_A1511.pdf" H 1900 2400 50  0001 C CNN
F 4 "DK" H 2100 2600 60  0001 C CNN "MFN"
F 5 "SS110LWRVGCT-ND" H 2000 2500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/taiwan-semiconductor-corporation/SS110LW-RVG/SS110LWRVGCT-ND/7359346" H 2200 2700 60  0001 C CNN "PurchasingLink"
	1    1900 2300
	1    0    0    -1  
$EndComp
Text Label 1175 4325 2    50   ~ 0
HV_TS+
$Comp
L Formula:UF_4_VT J1
U 1 1 5DB02E97
P 3650 1625
F 0 "J1" H 3758 2062 60  0000 C CNN
F 1 "UF_4_VT" H 3758 1956 60  0000 C CNN
F 2 "footprints:Ultrafit_4" H 3550 1875 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1008.pdf" H 3650 1975 60  0001 C CNN
F 4 "DK" H 3650 1625 60  0001 C CNN "MFN"
F 5 "WM11574-ND" H 3650 1625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=WM11574-ND" H 4150 2475 60  0001 C CNN "PurchasingLink"
	1    3650 1625
	1    0    0    -1  
$EndComp
$Comp
L Formula:redcude_7461166 J4
U 1 1 5E2F97D2
P 2700 3400
F 0 "J4" H 2758 3625 50  0000 C CNN
F 1 "redcude_7461166" H 2758 3534 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 2700 3200 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 2700 3300 50  0001 C CNN
	1    2700 3400
	1    0    0    -1  
$EndComp
Text Label 2850 3400 0    50   ~ 0
HV_TS+
$Comp
L Formula:redcude_7461166 J5
U 1 1 5E2FA0CC
P 3400 3400
F 0 "J5" H 3458 3625 50  0000 C CNN
F 1 "redcude_7461166" H 3458 3534 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 3400 3200 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 3400 3300 50  0001 C CNN
	1    3400 3400
	1    0    0    -1  
$EndComp
$Comp
L Formula:F_1A_600V F1
U 1 1 5E58C68C
P 1475 4325
F 0 "F1" H 1475 4550 50  0000 C CNN
F 1 "F_1A_600V" H 1475 4459 50  0000 C CNN
F 2 "footprints:Fuse_1A_600V" H 1475 4025 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Bel%20Fuse%20PDFs/0ADAC_0ADAP_Series.pdf" H 1425 4325 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ADAP1000-RE/507-2220-ND/8028479" H 1675 4675 50  0001 C CNN "PurchasingLink"
	1    1475 4325
	1    0    0    -1  
$EndComp
Text Label 1600 1500 2    50   ~ 0
HV_TS+
Text Label 2200 1800 0    50   ~ 0
GND
Text Label 1600 2300 2    50   ~ 0
FINAL_SHUTDOWN
Text Label 4000 1525 0    50   ~ 0
AIR+_AUX-
Text Label 4000 1425 0    50   ~ 0
AIR+_AUX+
Text Label 1625 3475 0    50   ~ 0
HV_TSMP+
Text Label 4000 1625 0    50   ~ 0
FINAL_SHUTDOWN
Text Label 4600 3725 0    50   ~ 0
HV_TS+
Text Label 4600 3625 0    50   ~ 0
HV_TSMP+
Text Label 4600 3425 0    50   ~ 0
TSAL+
$Comp
L Formula:MicroFit_RA_4 J3
U 1 1 5DF102AC
P 4400 3575
F 0 "J3" H 4458 3950 50  0000 C CNN
F 1 "MicroFit_RA_4" H 4458 3859 50  0000 C CNN
F 2 "footprints:MicroFit_RA_4" H 4400 3275 50  0001 C CNN
F 3 "" H 4400 3575 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 4400 3575 50  0001 C CNN "Purchasing Link"
	1    4400 3575
	1    0    0    -1  
$EndComp
Text Label 4600 3525 0    50   ~ 0
HV_TS_Fused+
NoConn ~ 5525 1925
Text Label 5525 1525 0    50   ~ 0
FINAL_SHUTDOWN
Text Label 5525 1425 0    50   ~ 0
GND
Text Label 5525 1725 0    50   ~ 0
AIR+_AUX-
Text Label 5525 1625 0    50   ~ 0
AIR+_AUX+
Text Label 1950 4325 0    50   ~ 0
HV_TS_Fused+
Text Notes 1200 1025 0    50   ~ 0
Discharge Relay. Opens with shutdown
Text Notes 1350 3925 0    50   ~ 0
TS+ Fusing
Text Notes 925  3100 0    50   ~ 0
TSMP Body Protection Resistor
Text Notes 3650 1025 0    50   ~ 0
To AIR\n
Text Notes 5100 1025 0    50   ~ 0
To AIR Control\n
Text Notes 4300 3075 0    50   ~ 0
Fuse Connector
Text Notes 2775 3100 0    50   ~ 0
RedCube Connectors
Wire Notes Line
	825  2475 825  925 
Wire Notes Line
	4900 2075 4900 925 
$Comp
L Formula:MicroFit_RA_06 J2
U 1 1 5DB019DF
P 5275 1675
F 0 "J2" H 5333 2172 60  0000 C CNN
F 1 "MicroFit_RA_06" H 5333 2066 60  0000 C CNN
F 2 "footprints:MicroFit_RA_06" H 5175 1925 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430450601_sd.pdf" H 5275 2025 60  0001 C CNN
F 4 "Molex" H 5375 3075 60  0001 C CNN "MFN"
F 5 "WM4037-ND" H 5475 3175 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex/0430450601/WM4037-ND/2421555" H 5275 2975 60  0001 C CNN "PurchasingLink"
	1    5275 1675
	1    0    0    -1  
$EndComp
Wire Notes Line
	3350 1875 3350 900 
Wire Notes Line
	4100 3850 4100 2950
Wire Notes Line
	850  2950 2175 2950
Wire Notes Line
	2175 2950 2175 3625
Wire Notes Line
	2175 3625 850  3625
Wire Notes Line
	850  3625 850  2950
Text Label 1325 3475 2    50   ~ 0
HV_TS+
Wire Notes Line
	2350 2950 3925 2950
Wire Notes Line
	3925 2950 3925 3625
Wire Notes Line
	3925 3625 2350 3625
Wire Notes Line
	2350 3625 2350 2950
$Comp
L formula:3350-4275-126(NC) K1
U 1 1 6258A753
P 1900 1600
F 0 "K1" V 2367 1600 50  0000 C CNN
F 1 "3350-4275-126(NC)" V 2276 1600 50  0000 C CNN
F 2 "footprints:Relay_Comus_3350" H 2350 1550 50  0001 L CNN
F 3 "https://www.comus-intl.com/wp-content/uploads/2017/01/High-Voltage-Reed-Relays.pdf" H 2350 1250 50  0001 L CNN
F 4 "DK" H 2750 2150 60  0001 C CNN "MFN"
F 5 "3350-4275-126" H 2650 2050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/comus-international/3350-4275-126/7515922" H 2850 2250 60  0001 C CNN "PurchasingLink"
	1    1900 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 2300 1600 2300
Wire Wire Line
	2050 2300 2200 2300
Wire Wire Line
	2200 2300 2200 1800
$Comp
L formula:R_15K_HV R2
U 1 1 625A23A2
P 1475 3475
F 0 "R2" V 1268 3475 50  0000 C CNN
F 1 "R_15K_HV" V 1359 3475 50  0000 C CNN
F 2 "footprints:R_TSMP_SMD_5329" H 1405 3475 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773242&DocType=DS&DocLang=English" H 1555 3475 50  0001 C CNN
F 4 "DK" H 1475 3475 60  0001 C CNN "MFN"
F 5 "SMF515KJT" H 1475 3475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/SMF515KJT/2367113" H 1955 3875 60  0001 C CNN "PurchasingLink"
	1    1475 3475
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 62595E8A
P 2200 1400
F 0 "H1" H 2300 1403 50  0000 L CNN
F 1 "MountingHole_Pad" H 2300 1358 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 2200 1400 50  0001 C CNN
F 3 "~" H 2200 1400 50  0001 C CNN
	1    2200 1400
	1    0    0    -1  
$EndComp
Text Notes 2350 1325 0    50   ~ 0
HV wire to resistor\nconnect to \nHVD->MPC busbar
Text Label 4000 1725 0    50   ~ 0
GND
NoConn ~ 5525 1825
Text Label 1950 4125 0    50   ~ 0
TSAL+
Wire Wire Line
	1900 4125 1900 4325
Wire Wire Line
	1900 4325 1775 4325
Wire Wire Line
	1900 4125 1950 4125
Wire Wire Line
	1900 4325 1950 4325
Connection ~ 1900 4325
Wire Notes Line
	3150 2475 3150 900 
Wire Notes Line
	825  900  3150 900 
Wire Notes Line
	825  2475 3150 2475
Wire Notes Line
	850  4425 2550 4425
Wire Notes Line
	2550 4425 2550 3775
Wire Notes Line
	2550 3775 850  3775
Wire Notes Line
	850  3775 850  4425
Text Notes 2600 3575 0    50   ~ 0
Supporting connector 7461129 
Wire Notes Line
	5350 2950 5350 3850
Wire Notes Line
	4100 2950 5350 2950
Wire Notes Line
	4100 3850 5350 3850
Wire Notes Line
	4700 900  4700 1875
Wire Notes Line
	3350 900  4700 900 
Wire Notes Line
	3350 1875 4700 1875
Wire Notes Line
	6250 900  6250 2075
Wire Notes Line
	4925 900  6250 900 
Wire Notes Line
	4900 2075 6250 2075
Wire Notes Line
	750  2675 6325 2675
Wire Notes Line
	6325 2675 6325 825 
Wire Notes Line
	6325 825  750  825 
Wire Notes Line
	750  825  750  2675
Wire Notes Line
	750  4525 5450 4525
Wire Notes Line
	5450 4525 5450 2825
Wire Notes Line
	5450 2825 750  2825
Wire Notes Line
	750  2825 750  4525
Text Notes 5125 4425 0    113  ~ 23
TS
Text Notes 5925 2575 0    113  ~ 23
GLV
Wire Notes Line
	850  1625 3125 1625
Wire Notes Line
	3125 925  850  925 
Wire Notes Line
	850  925  850  1625
Wire Notes Line
	3125 925  3125 1625
Text Notes 925  1175 0    113  ~ 23
TS
Text Notes 3350 2075 0    50   ~ 0
AIR+ opens with the shutdown circuit
Text Notes 6575 1575 0    50   ~ 0
EV.7.5.5:\nWhere both Tractive System and GLV are included inside an enclosure, they must meet one of:\n- Be separated by insulating barriers (in addition to the insulation on the wire) made of moisture\nresistant, UL recognized or equivalent insulating materials rated for 150° C or higher \n(such as Nomex based electrical insulation)\n- Maintain 30mm spacing through air, or over a surface
Text Notes 6575 2025 0    50   ~ 0
EV.7.5.7:\nIf Tractive System and GLV are on the same circuit board: \n- They must be on separate, clearly defined and clearly marked areas of the board\n- Spaces between areas must be at least 12.7 mm (9.5 mm cut in board, 4mm under conformal coating)
Text Notes 6575 975  0    113  ~ 23
SPACING RULES:
NoConn ~ 3550 3400
Text Notes 850  2150 0    50   ~ 0
drop Vmax 16V \nto 15V (coil max)\nRcoil = 175
$Comp
L formula:R_12 R?
U 1 1 6262A6E0
P 1600 1950
F 0 "R?" H 1450 2200 50  0000 L CNN
F 1 "R_12" H 1350 2100 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 1530 1950 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200-1&DocType=DS&DocLang=English" V 1680 1950 50  0001 C CNN
F 4 "TE" V 1780 2050 60  0001 C CNN "MFN"
F 5 "CPF-A-0805B12RE" V 1880 2150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CPF-A-0805B12RE/5583863" V 1880 2150 60  0001 C CNN "PurchasingLink"
	1    1600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2100 1600 2300
$EndSCHEMATC
