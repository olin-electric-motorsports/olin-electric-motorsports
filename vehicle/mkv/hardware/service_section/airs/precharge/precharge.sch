EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Precharge Resistor Mount"
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
P 15500 8900
F 0 "H2" V 15454 9050 50  0000 L CNN
F 1 "MountingHole_Pad" V 15545 9050 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 15500 8900 50  0001 C CNN
F 3 "~" H 15500 8900 50  0001 C CNN
	1    15500 8900
	0    1    1    0   
$EndComp
$Comp
L formula:R_560_HS R1
U 1 1 625BB85D
P 14800 8900
F 0 "R1" V 14593 8900 50  0000 C CNN
F 1 "R_560_HS" V 14684 8900 50  0000 C CNN
F 2 "footprints:R_3k_HS_TO247" H 14730 8900 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/acl_ap101.pdf?r=false" H 14880 8900 50  0001 C CNN
F 4 "DK" H 14800 8900 60  0001 C CNN "MFN"
F 5 "AP101 560R J" H 14800 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/ohmite/AP101-560R-J/5878514" H 15280 9300 60  0001 C CNN "PurchasingLink"
	1    14800 8900
	0    1    1    0   
$EndComp
$Comp
L formula:R_560_HS R2
U 1 1 625BC51E
P 15250 8900
F 0 "R2" V 15475 8900 50  0000 C CNN
F 1 "R_560_HS" V 15384 8900 50  0000 C CNN
F 2 "footprints:R_3k_HS_TO247" H 15180 8900 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/acl_ap101.pdf?r=false" H 15330 8900 50  0001 C CNN
F 4 "DK" H 15250 8900 60  0001 C CNN "MFN"
F 5 "AP101 560R J" H 15250 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/ohmite/AP101-560R-J/5878514" H 15730 9300 60  0001 C CNN "PurchasingLink"
	1    15250 8900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14950 8900 15100 8900
$EndSCHEMATC
