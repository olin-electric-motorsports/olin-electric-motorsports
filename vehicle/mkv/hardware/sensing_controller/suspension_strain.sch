EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 5 20
Title "Suspension Strain"
Date "2021-05-22"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Wesley Soo-Hoo"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:74HC4051 U501
U 1 1 60AA887F
P 14420 3530
AR Path="/60AA887F" Ref="U501"  Part="1" 
AR Path="/60A3D9FD/60AA887F" Ref="U501"  Part="1" 
F 0 "U501" H 14670 3980 50  0000 C CNN
F 1 "74HC4051" H 14120 2980 50  0000 C CNN
F 2 "footprints:CD74HC4050M96" H 14420 3130 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4051.pdf" H 14420 3130 50  0001 C CNN
	1    14420 3530
	-1   0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C501
U 1 1 60AB4383
P 14720 2830
F 0 "C501" V 14468 2830 50  0000 C CNN
F 1 "C_0.1uF" V 14559 2830 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 14758 2680 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14745 2930 50  0001 C CNN
F 4 "DK" H 14720 2830 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 14720 2830 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 15145 3330 60  0001 C CNN "PurchasingLink"
	1    14720 2830
	0    1    1    0   
$EndComp
Wire Wire Line
	14420 2680 14420 2830
Wire Wire Line
	14570 2830 14420 2830
Connection ~ 14420 2830
Wire Wire Line
	14420 2830 14420 3030
$Comp
L power:GND #PWR?
U 1 1 60AB929B
P 15020 2880
F 0 "#PWR?" H 15020 2630 50  0001 C CNN
F 1 "GND" H 15025 2707 50  0000 C CNN
F 2 "" H 15020 2880 50  0001 C CNN
F 3 "" H 15020 2880 50  0001 C CNN
	1    15020 2880
	1    0    0    -1  
$EndComp
Wire Wire Line
	15020 2880 15020 2830
Wire Wire Line
	15020 2830 14870 2830
$Comp
L formula:C_0.1uF C502
U 1 1 60ABCD81
P 14720 5580
F 0 "C502" V 14468 5580 50  0000 C CNN
F 1 "C_0.1uF" V 14559 5580 50  0000 C CNN
F 2 "footprints:C_0805_OEM" H 14758 5430 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 14745 5680 50  0001 C CNN
F 4 "DK" H 14720 5580 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 14720 5580 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 15145 6080 60  0001 C CNN "PurchasingLink"
	1    14720 5580
	0    1    1    0   
$EndComp
Wire Wire Line
	14420 5430 14420 5580
Wire Wire Line
	14570 5580 14420 5580
Connection ~ 14420 5580
$Comp
L power:GND #PWR?
U 1 1 60ABCD8B
P 15020 5630
F 0 "#PWR?" H 15020 5380 50  0001 C CNN
F 1 "GND" H 15025 5457 50  0000 C CNN
F 2 "" H 15020 5630 50  0001 C CNN
F 3 "" H 15020 5630 50  0001 C CNN
	1    15020 5630
	1    0    0    -1  
$EndComp
Wire Wire Line
	15020 5630 15020 5580
Wire Wire Line
	15020 5580 14870 5580
$Comp
L power:GND #PWR?
U 1 1 60AC32BD
P 14320 4230
F 0 "#PWR?" H 14320 3980 50  0001 C CNN
F 1 "GND" H 14325 4057 50  0000 C CNN
F 2 "" H 14320 4230 50  0001 C CNN
F 3 "" H 14320 4230 50  0001 C CNN
	1    14320 4230
	1    0    0    -1  
$EndComp
Wire Wire Line
	14320 4230 14320 4180
Wire Wire Line
	14320 4180 14420 4180
Wire Wire Line
	14420 4180 14420 4130
Connection ~ 14320 4180
Wire Wire Line
	14320 4180 14320 4130
$Comp
L power:GND #PWR?
U 1 1 60AC3CA8
P 14320 6980
F 0 "#PWR?" H 14320 6730 50  0001 C CNN
F 1 "GND" H 14325 6807 50  0000 C CNN
F 2 "" H 14320 6980 50  0001 C CNN
F 3 "" H 14320 6980 50  0001 C CNN
	1    14320 6980
	1    0    0    -1  
$EndComp
Wire Wire Line
	14320 6980 14320 6930
Wire Wire Line
	14320 6930 14420 6930
Wire Wire Line
	14420 6930 14420 6880
Connection ~ 14320 6930
Wire Wire Line
	14320 6930 14320 6880
Text Notes 2500 1700 0    100  ~ 0
Wheatstone Bridges + Amplification
Text Notes 13770 1580 0    100  ~ 0
Mux Stage
$Sheet
S 2750 2700 900  500 
U 60AD06C7
F0 "strain_1a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 2850 50 
F3 "OUT" O R 3650 2950 50 
F4 "STRAIN_-" U L 2750 3050 50 
$EndSheet
$Sheet
S 2750 3500 900  500 
U 60AB905F
F0 "strain_2a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 3650 50 
F3 "OUT" O R 3650 3750 50 
F4 "STRAIN_-" U L 2750 3850 50 
$EndSheet
$Sheet
S 2750 4300 900  500 
U 60AB9387
F0 "strain_3a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 4450 50 
F3 "OUT" O R 3650 4550 50 
F4 "STRAIN_-" U L 2750 4650 50 
$EndSheet
$Sheet
S 2750 5100 900  500 
U 60AB9617
F0 "strain_4a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 5250 50 
F3 "OUT" O R 3650 5350 50 
F4 "STRAIN_-" U L 2750 5450 50 
$EndSheet
$Sheet
S 2750 5900 900  500 
U 60AB9863
F0 "strain_5a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 6050 50 
F3 "OUT" O R 3650 6150 50 
F4 "STRAIN_-" U L 2750 6250 50 
$EndSheet
$Sheet
S 2750 6700 900  500 
U 60AB9A43
F0 "strain_6a" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 2750 6850 50 
F3 "OUT" O R 3650 6950 50 
F4 "STRAIN_-" U L 2750 7050 50 
$EndSheet
$Sheet
S 5400 2700 900  500 
U 60ABA183
F0 "strain_1b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 2850 50 
F3 "OUT" O R 6300 2950 50 
F4 "STRAIN_-" U L 5400 3050 50 
$EndSheet
$Sheet
S 5400 3500 900  500 
U 60ABA307
F0 "strain_2b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 3650 50 
F3 "OUT" O R 6300 3750 50 
F4 "STRAIN_-" U L 5400 3850 50 
$EndSheet
Text Label 3750 2950 0    50   ~ 0
STRAIN_1A_OUT
Text Label 3750 3750 0    50   ~ 0
STRAIN_2A_OUT
Text Label 3750 4550 0    50   ~ 0
STRAIN_3A_OUT
Text Label 3750 5350 0    50   ~ 0
STRAIN_4A_OUT
Text Label 3750 6150 0    50   ~ 0
STRAIN_5A_OUT
Text Label 3750 6950 0    50   ~ 0
STRAIN_6A_OUT
Text Label 6400 2950 0    50   ~ 0
STRAIN_1B_OUT
Text Label 6400 3750 0    50   ~ 0
STRAIN_2B_OUT
Text Label 6400 4550 0    50   ~ 0
STRAIN_3B_OUT
Text Label 6400 6950 0    50   ~ 0
STRAIN_6B_OUT
Text GLabel 2650 2850 0    50   UnSpc ~ 0
STRAIN_1A_+
Text GLabel 2650 3050 0    50   UnSpc ~ 0
STRAIN_1A_-
Text GLabel 2650 3650 0    50   UnSpc ~ 0
STRAIN_2A_+
Text GLabel 2650 3850 0    50   UnSpc ~ 0
STRAIN_2A_-
Text GLabel 2650 4450 0    50   UnSpc ~ 0
STRAIN_3A_+
Text GLabel 2650 4650 0    50   UnSpc ~ 0
STRAIN_3A_-
Text GLabel 2650 5250 0    50   UnSpc ~ 0
STRAIN_4A_+
Text GLabel 2650 5450 0    50   UnSpc ~ 0
STRAIN_4A_-
Text GLabel 2650 6050 0    50   UnSpc ~ 0
STRAIN_5A_+
Text GLabel 2650 6250 0    50   UnSpc ~ 0
STRAIN_5A_-
Text GLabel 2650 6850 0    50   UnSpc ~ 0
STRAIN_6A_+
Text GLabel 2650 7050 0    50   UnSpc ~ 0
STRAIN_6A_-
Text GLabel 5300 2850 0    50   UnSpc ~ 0
STRAIN_1B_+
Text GLabel 5300 3050 0    50   UnSpc ~ 0
STRAIN_1B_-
Text GLabel 5300 3650 0    50   UnSpc ~ 0
STRAIN_2B_+
Text GLabel 5300 3850 0    50   UnSpc ~ 0
STRAIN_2B_-
Text GLabel 5300 4450 0    50   UnSpc ~ 0
STRAIN_3B_+
Text GLabel 5300 4650 0    50   UnSpc ~ 0
STRAIN_3B_-
Text GLabel 5300 5250 0    50   UnSpc ~ 0
STRAIN_4B_+
Text GLabel 5300 5450 0    50   UnSpc ~ 0
STRAIN_4B_-
Text GLabel 5300 6050 0    50   UnSpc ~ 0
STRAIN_5B_+
Text GLabel 5300 6250 0    50   UnSpc ~ 0
STRAIN_5B_-
Text GLabel 5300 6850 0    50   UnSpc ~ 0
STRAIN_6B_+
Text GLabel 5300 7050 0    50   UnSpc ~ 0
STRAIN_6B_-
Text Label 13950 3230 2    50   ~ 0
STRAIN_1A_OUT
Text Label 13950 3330 2    50   ~ 0
STRAIN_2A_OUT
Text Label 13950 3430 2    50   ~ 0
STRAIN_3A_OUT
Text Label 13950 3530 2    50   ~ 0
STRAIN_4A_OUT
Text Label 13950 3630 2    50   ~ 0
STRAIN_5A_OUT
Text Label 13950 3730 2    50   ~ 0
STRAIN_6A_OUT
NoConn ~ 14020 3830
NoConn ~ 14020 3930
NoConn ~ 14020 6580
NoConn ~ 14020 6680
Text Label 13930 5980 2    50   ~ 0
STRAIN_1B_OUT
Text Label 13930 6080 2    50   ~ 0
STRAIN_2B_OUT
Text Label 13930 6180 2    50   ~ 0
STRAIN_3B_OUT
Text Label 13930 6280 2    50   ~ 0
STRAIN_4B_OUT
Text Label 13930 6380 2    50   ~ 0
STRAIN_5B_OUT
Text Label 13930 6480 2    50   ~ 0
STRAIN_6B_OUT
Text GLabel 14810 5980 2    50   Input ~ 0
STRAIN_MUX2_OUT
Text GLabel 14810 6180 2    50   Input ~ 0
STRAIN_S0
Text GLabel 14810 6280 2    50   Input ~ 0
STRAIN_S1
Text GLabel 14810 6380 2    50   Input ~ 0
STRAIN_S2
Text GLabel 14810 6580 2    50   Input ~ 0
nSTRAIN_MUX2_EN
Text GLabel 14780 3230 2    50   Input ~ 0
STRAIN_MUX1_OUT
Text GLabel 14780 3430 2    50   Input ~ 0
STRAIN_S0
Text GLabel 14780 3530 2    50   Input ~ 0
STRAIN_S1
Text GLabel 14780 3630 2    50   Input ~ 0
STRAIN_S2
Text GLabel 14780 3830 2    50   Input ~ 0
nSTRAIN_MUX1_EN
Text GLabel 14370 2680 0    50   Input ~ 0
5V
Text GLabel 14370 5430 0    50   Input ~ 0
5V
Wire Wire Line
	13950 3230 14020 3230
Wire Wire Line
	13950 3330 14020 3330
Wire Wire Line
	13950 3430 14020 3430
Wire Wire Line
	13950 3530 14020 3530
Wire Wire Line
	13950 3630 14020 3630
Wire Wire Line
	13950 3730 14020 3730
Wire Wire Line
	14720 3230 14780 3230
Wire Wire Line
	14720 3430 14780 3430
Wire Wire Line
	14720 3830 14780 3830
Wire Wire Line
	14720 3630 14780 3630
Wire Wire Line
	14720 3530 14780 3530
Wire Wire Line
	13930 5980 14020 5980
Wire Wire Line
	13930 6080 14020 6080
Wire Wire Line
	13930 6180 14020 6180
Wire Wire Line
	13930 6280 14020 6280
Wire Wire Line
	13930 6380 14020 6380
Wire Wire Line
	13930 6480 14020 6480
Wire Wire Line
	14720 5980 14810 5980
Wire Wire Line
	14720 6180 14810 6180
Wire Wire Line
	14720 6280 14810 6280
Wire Wire Line
	14720 6380 14810 6380
Wire Wire Line
	14720 6580 14810 6580
Wire Wire Line
	14370 2680 14420 2680
Wire Wire Line
	14370 5430 14420 5430
Wire Wire Line
	2650 2850 2750 2850
Wire Wire Line
	2750 3050 2650 3050
Wire Wire Line
	2650 3650 2750 3650
Wire Wire Line
	2750 3850 2650 3850
Wire Wire Line
	2650 4450 2750 4450
Wire Wire Line
	2750 4650 2650 4650
Wire Wire Line
	2650 5250 2750 5250
Wire Wire Line
	2750 5450 2650 5450
Wire Wire Line
	2650 6850 2750 6850
Wire Wire Line
	2750 7050 2650 7050
Wire Wire Line
	5300 2850 5400 2850
Wire Wire Line
	5400 3050 5300 3050
Wire Wire Line
	5300 3650 5400 3650
Wire Wire Line
	5400 3850 5300 3850
Wire Wire Line
	5300 4450 5400 4450
Wire Wire Line
	5400 4650 5300 4650
Wire Wire Line
	5300 5250 5400 5250
Wire Wire Line
	5400 5450 5300 5450
Wire Wire Line
	5300 6050 5400 6050
Wire Wire Line
	5400 6250 5300 6250
Wire Wire Line
	5300 6850 5400 6850
Wire Wire Line
	5400 7050 5300 7050
Wire Wire Line
	6400 2950 6300 2950
Wire Wire Line
	6400 3750 6300 3750
Wire Wire Line
	6400 4550 6300 4550
Wire Wire Line
	6400 5350 6300 5350
Wire Wire Line
	6400 6150 6300 6150
Wire Wire Line
	6400 6950 6300 6950
Wire Wire Line
	3750 2950 3650 2950
Wire Wire Line
	3750 3750 3650 3750
Wire Wire Line
	3750 4550 3650 4550
Wire Wire Line
	3750 5350 3650 5350
Wire Wire Line
	3750 6150 3650 6150
Wire Wire Line
	3750 6950 3650 6950
Wire Wire Line
	2650 6050 2750 6050
Wire Wire Line
	2650 6250 2750 6250
Wire Wire Line
	14420 5580 14420 5780
$Comp
L formula:74HC4051 U502
U 1 1 60AC6F2B
P 14420 6280
AR Path="/60AC6F2B" Ref="U502"  Part="1" 
AR Path="/60A3D9FD/60AC6F2B" Ref="U502"  Part="1" 
F 0 "U502" H 14670 6730 50  0000 C CNN
F 1 "74HC4051" H 14120 5730 50  0000 C CNN
F 2 "footprints:CD74HC4050M96" H 14420 5880 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4051.pdf" H 14420 5880 50  0001 C CNN
	1    14420 6280
	-1   0    0    -1  
$EndComp
$Comp
L formula:R_120_05 R1
U 1 1 61875D72
P 8300 2850
AR Path="/61875D72" Ref="R1"  Part="1" 
AR Path="/60A3D9FD/61875D72" Ref="R1"  Part="1" 
F 0 "R1" V 8254 3038 50  0000 L CNN
F 1 "R_120_05" V 8345 3038 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8300 2850 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition01_en.pdf" H 8300 2850 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/RG2012N-121-W-T1/600666" H 8300 2850 50  0001 C CNN "PurchasingLink"
	1    8300 2850
	0    1    1    0   
$EndComp
$Comp
L formula:R_120_05 R2
U 1 1 61877234
P 8300 3350
AR Path="/61877234" Ref="R2"  Part="1" 
AR Path="/60A3D9FD/61877234" Ref="R2"  Part="1" 
F 0 "R2" V 8254 3538 50  0000 L CNN
F 1 "R_120_05" V 8345 3538 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8300 3350 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition01_en.pdf" H 8300 3350 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/susumu/RG2012N-121-W-T1/600666" H 8300 3350 50  0001 C CNN "PurchasingLink"
	1    8300 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 3000 8400 3100
$Comp
L power:+5V #PWR?
U 1 1 6187E9EC
P 8400 2550
AR Path="/60A3D9FD/60AD06C7/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB905F/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9387/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9617/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9863/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9A43/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9C37/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9E33/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9FB3/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA183/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA307/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA487/6187E9EC" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/6187E9EC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8400 2400 50  0001 C CNN
F 1 "+5V" H 8415 2723 50  0000 C CNN
F 2 "" H 8400 2550 50  0001 C CNN
F 3 "" H 8400 2550 50  0001 C CNN
	1    8400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2700 8400 2550
$Comp
L power:GND #PWR?
U 1 1 61884DE4
P 8400 3650
AR Path="/60A3D9FD/60AD06C7/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB905F/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9387/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9617/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9863/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9A43/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9C37/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9E33/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60AB9FB3/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA183/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA307/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/60ABA487/61884DE4" Ref="#PWR?"  Part="1" 
AR Path="/60A3D9FD/61884DE4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8400 3400 50  0001 C CNN
F 1 "GND" H 8405 3477 50  0000 C CNN
F 2 "" H 8400 3650 50  0001 C CNN
F 3 "" H 8400 3650 50  0001 C CNN
	1    8400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3500 8400 3650
Connection ~ 8400 3100
Wire Wire Line
	8400 3100 8400 3200
$Comp
L formula_old:R_10K R53
U 1 1 6199834D
P 9650 3100
F 0 "R53" V 9443 3100 50  0000 C CNN
F 1 "R_10K" V 9534 3100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9580 3100 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 9730 3100 50  0001 C CNN
F 4 "DK" H 9650 3100 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 9650 3100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10130 3500 60  0001 C CNN "PurchasingLink"
	1    9650 3100
	0    1    1    0   
$EndComp
$Comp
L formula:MCP6001T-I-LT U14
U 1 1 61998356
P 10300 3200
F 0 "U14" H 10850 3550 50  0000 L CNN
F 1 "MCP6001T-I-LT" H 10600 3400 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 10200 3300 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 10300 3400 50  0001 C CNN
F 4 "DK" H 10400 3500 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/LTCT-ND" H 10500 3600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-LT/MCP6001T-I-LTCT-ND/669499" H 10600 3700 60  0001 C CNN "PurchasingLink"
	1    10300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3100 10000 3100
Text GLabel 11100 3200 2    50   Input ~ 0
WHEATSTONE_OUT_-
Wire Wire Line
	10600 3200 10700 3200
$Comp
L power:+5V #PWR?
U 1 1 6199835F
P 10200 2800
F 0 "#PWR?" H 10200 2650 50  0001 C CNN
F 1 "+5V" H 10215 2973 50  0000 C CNN
F 2 "" H 10200 2800 50  0001 C CNN
F 3 "" H 10200 2800 50  0001 C CNN
	1    10200 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2900 10200 2800
$Comp
L power:GND #PWR?
U 1 1 61998366
P 10200 3600
F 0 "#PWR?" H 10200 3350 50  0001 C CNN
F 1 "GND" H 10205 3427 50  0000 C CNN
F 2 "" H 10200 3600 50  0001 C CNN
F 3 "" H 10200 3600 50  0001 C CNN
	1    10200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3500 10200 3600
$Comp
L formula_old:R_10K R54
U 1 1 61998370
P 10200 4100
F 0 "R54" V 9993 4100 50  0000 C CNN
F 1 "R_10K" V 10084 4100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10130 4100 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10280 4100 50  0001 C CNN
F 4 "DK" H 10200 4100 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10200 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10680 4500 60  0001 C CNN "PurchasingLink"
	1    10200 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 3300 10000 4100
Wire Wire Line
	10000 4100 10050 4100
Wire Wire Line
	10000 4100 10000 4450
Wire Wire Line
	10000 4450 10050 4450
Connection ~ 10000 4100
Wire Wire Line
	10350 4450 10350 4100
Wire Wire Line
	10350 4100 10700 4100
Wire Wire Line
	10700 4100 10700 3200
Connection ~ 10350 4100
Connection ~ 10700 3200
Wire Wire Line
	10700 3200 11100 3200
Wire Wire Line
	8400 3100 9500 3100
$Comp
L formula_old:R_10K R5
U 1 1 6193070A
P 9600 5700
F 0 "R5" V 9393 5700 50  0000 C CNN
F 1 "R_10K" V 9484 5700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 9530 5700 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 9680 5700 50  0001 C CNN
F 4 "DK" H 9600 5700 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 9600 5700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10080 6100 60  0001 C CNN "PurchasingLink"
	1    9600 5700
	0    1    1    0   
$EndComp
$Comp
L formula:MCP6001T-I-LT U13
U 1 1 61931535
P 10250 5800
F 0 "U13" H 10800 6150 50  0000 L CNN
F 1 "MCP6001T-I-LT" H 10550 6000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 10150 5900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 10250 6000 50  0001 C CNN
F 4 "DK" H 10350 6100 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/LTCT-ND" H 10450 6200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-LT/MCP6001T-I-LTCT-ND/669499" H 10550 6300 60  0001 C CNN "PurchasingLink"
	1    10250 5800
	1    0    0    -1  
$EndComp
Text GLabel 9250 5700 0    50   Input ~ 0
STRAIN_VOLTAGE_REF_2BUFFER
Wire Wire Line
	9250 5700 9450 5700
Wire Wire Line
	9750 5700 9950 5700
Text GLabel 11050 5800 2    50   Input ~ 0
STRAIN_VOLTAGE_REF_2INAMP
Wire Wire Line
	10550 5800 10650 5800
$Comp
L power:+5V #PWR?
U 1 1 6195286F
P 10150 5400
F 0 "#PWR?" H 10150 5250 50  0001 C CNN
F 1 "+5V" H 10165 5573 50  0000 C CNN
F 2 "" H 10150 5400 50  0001 C CNN
F 3 "" H 10150 5400 50  0001 C CNN
	1    10150 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5500 10150 5400
$Comp
L power:GND #PWR?
U 1 1 61956A2C
P 10150 6200
F 0 "#PWR?" H 10150 5950 50  0001 C CNN
F 1 "GND" H 10155 6027 50  0000 C CNN
F 2 "" H 10150 6200 50  0001 C CNN
F 3 "" H 10150 6200 50  0001 C CNN
	1    10150 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 6100 10150 6200
$Comp
L formula_old:R_10K R8
U 1 1 6195A242
P 10150 6700
F 0 "R8" V 9943 6700 50  0000 C CNN
F 1 "R_10K" V 10034 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10080 6700 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 10230 6700 50  0001 C CNN
F 4 "DK" H 10150 6700 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 10150 6700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 10630 7100 60  0001 C CNN "PurchasingLink"
	1    10150 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 5900 9950 6700
Wire Wire Line
	9950 6700 10000 6700
Wire Wire Line
	9950 6700 9950 7050
Wire Wire Line
	9950 7050 10000 7050
Connection ~ 9950 6700
Wire Wire Line
	10300 7050 10300 6700
Wire Wire Line
	10300 6700 10650 6700
Wire Wire Line
	10650 6700 10650 5800
Connection ~ 10300 6700
Connection ~ 10650 5800
Wire Wire Line
	10650 5800 11050 5800
Text Label 6400 6150 0    50   ~ 0
STRAIN_5B_OUT
Text Label 6400 5350 0    50   ~ 0
STRAIN_4B_OUT
$Sheet
S 5400 4300 900  500 
U 60ABA487
F0 "strain_3b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 4450 50 
F3 "OUT" O R 6300 4550 50 
F4 "STRAIN_-" U L 5400 4650 50 
$EndSheet
$Sheet
S 5400 6700 900  500 
U 60AB9FB3
F0 "strain_6b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 6850 50 
F3 "OUT" O R 6300 6950 50 
F4 "STRAIN_-" U L 5400 7050 50 
$EndSheet
$Sheet
S 5400 5900 900  500 
U 60AB9E33
F0 "strain_5b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 6050 50 
F3 "OUT" O R 6300 6150 50 
F4 "STRAIN_-" U L 5400 6250 50 
$EndSheet
$Sheet
S 5400 5100 900  500 
U 60AB9C37
F0 "strain_4b" 50
F1 "suspension_strain_individual.sch" 50
F2 "STRAIN_+" U L 5400 5250 50 
F3 "OUT" O R 6300 5350 50 
F4 "STRAIN_-" U L 5400 5450 50 
$EndSheet
$Comp
L formula:C_10nF C26
U 1 1 619382BD
P 10200 4450
F 0 "C26" V 9948 4450 50  0000 C CNN
F 1 "C_10nF" V 10039 4450 50  0000 C CNN
F 2 "footprints:C_1206_OEM" H 10000 4450 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 10100 4550 50  0001 C CNN
F 4 "Kemet" H 10200 4650 50  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 10300 4750 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 10400 4850 50  0001 C CNN "PurchasingLink"
	1    10200 4450
	0    1    1    0   
$EndComp
$Comp
L formula:C_10nF C25
U 1 1 6194CB9D
P 10150 7050
F 0 "C25" V 9898 7050 50  0000 C CNN
F 1 "C_10nF" V 9989 7050 50  0000 C CNN
F 2 "footprints:C_1206_OEM" H 9950 7050 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 10050 7150 50  0001 C CNN
F 4 "Kemet" H 10150 7250 50  0001 C CNN "MFN"
F 5 "C1206C103KCRACTU" H 10250 7350 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/kemet/C1206C103KCRACTU/721283" H 10350 7450 50  0001 C CNN "PurchasingLink"
	1    10150 7050
	0    1    1    0   
$EndComp
$EndSCHEMATC
