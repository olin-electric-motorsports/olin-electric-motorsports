EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Discharge Resistor Mount"
Date "2022-04-16"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Elvis Wolcott"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 625BAF56
P 14550 8900
F 0 "H1" V 14600 9100 50  0000 C CNN
F 1 "MountingHole_Pad" V 14500 9400 50  0000 C CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 14550 8900 50  0001 C CNN
F 3 "~" H 14550 8900 50  0001 C CNN
	1    14550 8900
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 625BB197
P 15050 8900
F 0 "H2" V 15004 9050 50  0000 L CNN
F 1 "MountingHole_Pad" V 15095 9050 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 15050 8900 50  0001 C CNN
F 3 "~" H 15050 8900 50  0001 C CNN
	1    15050 8900
	0    1    1    0   
$EndComp
$Comp
L formula:R_3K_HS R?
U 1 1 625B3D84
P 14800 8900
F 0 "R?" V 14593 8900 50  0000 C CNN
F 1 "R_3K_HS" V 14684 8900 50  0000 C CNN
F 2 "footprints:R_3k_HS_TO247" H 14730 8900 50  0001 C CNN
F 3 "http://dpk3n3gg92jwt.cloudfront.net/domains/ohmite/pdf/acl_ap101.pdf" H 14880 8900 50  0001 C CNN
F 4 "DK" H 14800 8900 60  0001 C CNN "MFN"
F 5 "AP1013KJ-ND" H 14800 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/ohmite/AP101-3K-J/AP101-3K-J-ND/5878525" H 15280 9300 60  0001 C CNN "PurchasingLink"
F 7 "345-1223-ND" V 15380 9400 60  0001 C CNN "MPN2"
F 8 "https://www.digikey.com/product-detail/en/wakefield-vette/657-15ABPEN/345-1223-ND/3945700" V 15480 9500 60  0001 C CNN "PurchasingLink2"
	1    14800 8900
	0    1    1    0   
$EndComp
$EndSCHEMATC
