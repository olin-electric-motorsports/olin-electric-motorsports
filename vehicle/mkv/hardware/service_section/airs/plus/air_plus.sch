EESchema Schematic File Version 4
EELAYER 30 0
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
L Formula:SS110LW D1
U 1 1 5DAE7FAE
P 1900 2325
F 0 "D1" H 1900 2541 50  0000 C CNN
F 1 "SS110LW" H 1900 2450 50  0000 C CNN
F 2 "footprints:D_SOD-123W_OEM" H 1800 2325 50  0001 C CNN
F 3 "http://www.taiwansemi.com/products/datasheet/SS14LW%20SERIES_A1511.pdf" H 1900 2425 50  0001 C CNN
F 4 "DK" H 2100 2625 60  0001 C CNN "MFN"
F 5 "SS110LWRVGCT-ND" H 2000 2525 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/taiwan-semiconductor-corporation/SS110LW-RVG/SS110LWRVGCT-ND/7359346" H 2200 2725 60  0001 C CNN "PurchasingLink"
	1    1900 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2325 2050 2325
Wire Wire Line
	1750 2325 1600 2325
Text Label 1075 3100 2    50   ~ 0
TS-
$Comp
L Formula:UF_4_VT J1
U 1 1 5DB02E97
P 3300 1625
F 0 "J1" H 3408 2062 60  0000 C CNN
F 1 "UF_4_VT" H 3408 1956 60  0000 C CNN
F 2 "footprints:Ultrafit_4" H 3200 1875 60  0001 C CNN
F 3 "http://www.literature.molex.com/SQLImages/kelmscott/Molex/PDF_Images/987651-1008.pdf" H 3300 1975 60  0001 C CNN
F 4 "DK" H 3300 1625 60  0001 C CNN "MFN"
F 5 "WM11574-ND" H 3300 1625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=WM11574-ND" H 3800 2475 60  0001 C CNN "PurchasingLink"
	1    3300 1625
	1    0    0    -1  
$EndComp
Text Label 3650 1725 0    50   ~ 0
Coil-
$Comp
L Formula:redcude_7461166 J4
U 1 1 5E2F97D2
P 4450 2700
F 0 "J4" H 4508 2925 50  0000 C CNN
F 1 "redcude_7461166" H 4508 2834 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 4450 2500 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 4450 2600 50  0001 C CNN
	1    4450 2700
	1    0    0    -1  
$EndComp
Text Label 4600 2700 0    50   ~ 0
TS-
$Comp
L Formula:redcude_7461166 J5
U 1 1 5E2FA0CC
P 5175 2700
F 0 "J5" H 5233 2925 50  0000 C CNN
F 1 "redcude_7461166" H 5233 2834 50  0000 C CNN
F 2 "footprints:redcube_7461166" H 5175 2500 50  0001 C CNN
F 3 "we-online.de/katalog/datasheet/7461166.pdf" H 5175 2600 50  0001 C CNN
	1    5175 2700
	1    0    0    -1  
$EndComp
Text Label 5325 2700 0    50   ~ 0
BAT-
Wire Wire Line
	1600 1825 1600 2325
$Comp
L Formula:F_1A_600V F1
U 1 1 5E58C68C
P 1375 3100
F 0 "F1" H 1375 3325 50  0000 C CNN
F 1 "F_1A_600V" H 1375 3234 50  0000 C CNN
F 2 "footprints:Fuse_1A_600V" H 1375 2800 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Bel%20Fuse%20PDFs/0ADAC_0ADAP_Series.pdf" H 1325 3100 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ADAP1000-RE/507-2220-ND/8028479" H 1575 3450 50  0001 C CNN "PurchasingLink"
	1    1375 3100
	1    0    0    -1  
$EndComp
$Comp
L Formula:R_3K_HS R1
U 1 1 5E59D5EA
P 1450 1525
F 0 "R1" V 1675 1525 50  0000 C CNN
F 1 "R_3K_HS" V 1584 1525 50  0000 C CNN
F 2 "footprints:R_3k_HS_TO247" H 1380 1525 50  0001 C CNN
F 3 "http://dpk3n3gg92jwt.cloudfront.net/domains/ohmite/pdf/acl_ap101.pdf" H 1530 1525 50  0001 C CNN
F 4 "DK" H 1450 1525 60  0001 C CNN "MFN"
F 5 "AP1013KJ-ND" H 1450 1525 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/ohmite/AP101-3K-J/AP101-3K-J-ND/5878525" H 1930 1925 60  0001 C CNN "PurchasingLink"
F 7 "345-1223-ND" V 2030 2025 60  0001 C CNN "MPN2"
F 8 "https://www.digikey.com/product-detail/en/wakefield-vette/657-15ABPEN/345-1223-ND/3945700" V 2130 2125 60  0001 C CNN "PurchasingLink2"
	1    1450 1525
	0    -1   -1   0   
$EndComp
Text Label 1300 1525 2    50   ~ 0
BAT-
Text Label 2200 1525 0    50   ~ 0
TS-
Wire Wire Line
	2200 1825 2200 2325
Text Label 2200 1825 0    50   ~ 0
GND
Text Label 1600 1825 2    50   ~ 0
Coil+
Text Label 3650 1525 0    50   ~ 0
AUX-
Text Label 3650 1425 0    50   ~ 0
AUX+
Text Label 3050 3450 0    50   ~ 0
TSMP-
Text Label 3650 1625 0    50   ~ 0
Coil+
Text Label 3500 2725 0    50   ~ 0
TS-
Text Label 3500 2625 0    50   ~ 0
TSMP-
Text Label 3500 2425 0    50   ~ 0
TSAL-
$Comp
L Formula:MicroFit_RA_4 J3
U 1 1 5DF102AC
P 3300 2575
F 0 "J3" H 3358 2950 50  0000 C CNN
F 1 "MicroFit_RA_4" H 3358 2859 50  0000 C CNN
F 2 "footprints:MicroFit_RA_4" H 3300 2275 50  0001 C CNN
F 3 "" H 3300 2575 100 0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/molex/0430450400/WM1814-ND/252527" H 3300 2575 50  0001 C CNN "Purchasing Link"
	1    3300 2575
	1    0    0    -1  
$EndComp
Text Label 3500 2525 0    50   ~ 0
TS_Fused-
NoConn ~ 4675 1925
Text Label 4675 1525 0    50   ~ 0
Coil+
Text Label 4675 1425 0    50   ~ 0
GND
Text Label 4675 1825 0    50   ~ 0
Coil-
Text Label 4675 1725 0    50   ~ 0
AUX-
Text Label 4675 1625 0    50   ~ 0
AUX+
Text Label 1675 3100 0    50   ~ 0
TS_Fused-
Text Notes 2000 625  0    50   ~ 0
NEW AIR PLUS\n
$Comp
L Formula:DBR71210(NC) K1
U 1 1 5E5D8E84
P 1900 1625
F 0 "K1" V 2367 1625 50  0000 C CNN
F 1 "DBR71210(NC)" V 2276 1625 50  0000 C CNN
F 2 "footprints:D-Series_Cynergy_Relay" H 2350 1575 50  0001 L CNN
F 3 "https://www.cynergy3.com/sites/default/files/D%20series%202016_5.pdf" H 2350 1275 50  0001 L CNN
F 4 "DK" H 2750 2175 60  0001 C CNN "MFN"
F 5 "725-1049-ND" H 2650 2075 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/cynergy-3/DBR71210/725-1049-ND/752025" H 2850 2275 60  0001 C CNN "PurchasingLink"
	1    1900 1625
	0    -1   -1   0   
$EndComp
Text Notes 925  1025 0    50   ~ 0
Discharge Relay. High Side Driven by AIR Control
Text Notes 1250 2700 0    50   ~ 0
TS- Fusing
Text Notes 2350 3075 0    50   ~ 0
TSMP Body Protection Resistor
Text Notes 3300 1025 0    50   ~ 0
To Relay\n
Text Notes 4250 1025 0    50   ~ 0
To AIR Control\n
Text Notes 3200 2075 0    50   ~ 0
Fuse Connector
Text Notes 4500 2325 0    50   ~ 0
RedCube Connectors
Wire Notes Line
	825  900  2900 900 
Wire Notes Line
	2900 900  2900 2475
Wire Notes Line
	2900 2475 825  2475
Wire Notes Line
	825  2475 825  925 
Wire Notes Line
	4075 900  5000 900 
Wire Notes Line
	5000 900  5000 2075
Wire Notes Line
	5000 2075 4050 2075
Wire Notes Line
	4050 2075 4050 925 
$Comp
L Formula:MicroFit_RA_06 J2
U 1 1 5DB019DF
P 4425 1675
F 0 "J2" H 4483 2172 60  0000 C CNN
F 1 "MicroFit_RA_06" H 4483 2066 60  0000 C CNN
F 2 "footprints:MicroFit_RA_06" H 4325 1925 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430450601_sd.pdf" H 4425 2025 60  0001 C CNN
F 4 "Molex" H 4525 3075 60  0001 C CNN "MFN"
F 5 "WM4037-ND" H 4625 3175 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex/0430450601/WM4037-ND/2421555" H 4425 2975 60  0001 C CNN "PurchasingLink"
	1    4425 1675
	1    0    0    -1  
$EndComp
Wire Notes Line
	3000 900  3950 900 
Wire Notes Line
	3950 900  3950 1875
Wire Notes Line
	3950 1875 3000 1875
Wire Notes Line
	3000 1875 3000 900 
Wire Notes Line
	3000 1950 3975 1950
Wire Notes Line
	3975 1950 3975 2850
Wire Notes Line
	3975 2850 3000 2850
Wire Notes Line
	3000 2850 3000 1950
Wire Notes Line
	825  2575 2150 2575
Wire Notes Line
	2150 2575 2150 3300
Wire Notes Line
	2150 3300 825  3300
Wire Notes Line
	825  3300 825  2575
Wire Notes Line
	2275 2925 3600 2925
Wire Notes Line
	3600 2925 3600 3600
Wire Notes Line
	3600 3600 2275 3600
Wire Notes Line
	2275 3600 2275 2925
$Comp
L Formula:R_10K_HV R2
U 1 1 5E57A605
P 2900 3450
F 0 "R2" V 2693 3450 50  0000 C CNN
F 1 "R_10K_HV" V 2784 3450 50  0000 C CNN
F 2 "footprints:R_TSMP_SMD_5329" H 2830 3450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/28731/pacserie.pdf" H 2980 3450 50  0001 C CNN
F 4 "DK" H 2900 3450 60  0001 C CNN "MFN"
F 5 "PPC5D10.0KCT-ND " H 2900 3450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PPC5D10.0KCT-ND" H 3380 3850 60  0001 C CNN "PurchasingLink"
	1    2900 3450
	0    1    1    0   
$EndComp
Text Label 2750 3450 2    50   ~ 0
TS-
Wire Notes Line
	4075 2175 5650 2175
Wire Notes Line
	5650 2175 5650 2850
Wire Notes Line
	5650 2850 4075 2850
Wire Notes Line
	4075 2850 4075 2175
$EndSCHEMATC
