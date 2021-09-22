EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 19 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5350 3050 0    89   ~ 0
TEMPERATURE SENSOR\n
$Comp
L sensing_controller-rescue:MLX90621ESF-BAB-000-TU-formula U1901
U 1 1 61C8EA56
P 5900 4050
F 0 "U1901" H 6050 3650 50  0000 L CNN
F 1 "MLX90621ESF-BAB-000-TU" H 5350 3750 50  0000 L CNN
F 2 "footprints:MLX90621ESF-BAB-000-TU" H 5900 3650 50  0001 C CNN
F 3 "https://www.melexis.com/-/media/files/documents/datasheets/mlx90621-datasheet-melexis.pdf" H 5700 4350 50  0001 C CNN
F 4 "MLX90621ESF-BAB-000-TU-ND " H 5900 4050 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/melexis-technologies-nv/MLX90621ESF-BAB-000-TU/MLX90621ESF-BAB-000-TU-ND/4968086?utm_adgroup=Sensors%20&%20Transducers" H 5900 4050 50  0001 C CNN "PurchaseLink"
F 6 "DK" H 5900 4050 50  0001 C CNN "MF"
	1    5900 4050
	1    0    0    -1  
$EndComp
Text GLabel 5000 3950 0    50   Input ~ 0
SM_SCL
Text GLabel 5000 4050 0    50   Input ~ 0
SM_SDA
$Comp
L sensing_controller-rescue:R_4.7K-formula R1901
U 1 1 61C90517
P 5150 3650
F 0 "R1901" H 5220 3696 50  0000 L CNN
F 1 "R_4.7K" H 5220 3605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 5080 3650 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/PYu-RC_Group_51_RoHS_L_8.pdf" V 5230 3650 50  0001 C CNN
F 4 "DK" V 5330 3750 60  0001 C CNN "MFN"
F 5 "311-4.7KARCT-ND" V 5430 3850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/RC0805JR-074K7L/311-4.7KARCT-ND/731274" V 5530 3950 60  0001 C CNN "PurchasingLink"
	1    5150 3650
	-1   0    0    1   
$EndComp
$Comp
L sensing_controller-rescue:R_4.7K-formula R1902
U 1 1 61C90EE4
P 5250 3650
F 0 "R1902" H 5320 3696 50  0000 L CNN
F 1 "R_4.7K" H 5320 3605 50  0000 L CNN
F 2 "footprints:R_0805_OEM" V 5180 3650 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/PYu-RC_Group_51_RoHS_L_8.pdf" V 5330 3650 50  0001 C CNN
F 4 "DK" V 5430 3750 60  0001 C CNN "MFN"
F 5 "311-4.7KARCT-ND" V 5530 3850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/yageo/RC0805JR-074K7L/311-4.7KARCT-ND/731274" V 5630 3950 60  0001 C CNN "PurchasingLink"
	1    5250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3950 5150 3950
Wire Wire Line
	5000 4050 5250 4050
Wire Wire Line
	5150 3800 5150 3950
Connection ~ 5150 3950
Wire Wire Line
	5150 3950 5500 3950
Wire Wire Line
	5250 3800 5250 4050
Connection ~ 5250 4050
Wire Wire Line
	5250 4050 5500 4050
Wire Wire Line
	5250 3500 5250 3300
Wire Wire Line
	5250 3300 5150 3300
Wire Wire Line
	5150 3500 5150 3300
Connection ~ 5150 3300
Wire Wire Line
	5150 3300 4800 3300
Text GLabel 4800 3300 0    50   Input ~ 0
3.3V
$Comp
L power:GND #PWR?
U 1 1 61C92C0F
P 5900 4450
F 0 "#PWR?" H 5900 4200 50  0001 C CNN
F 1 "GND" H 5905 4277 50  0000 C CNN
F 2 "" H 5900 4450 50  0001 C CNN
F 3 "" H 5900 4450 50  0001 C CNN
	1    5900 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4450 5900 4400
$Comp
L sensing_controller-rescue:C_0.1uF-formula C1901
U 1 1 61C937A0
P 6500 4100
F 0 "C1901" H 6690 4080 50  0000 L CNN
F 1 "C_0.1uF" H 6640 4200 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6538 3950 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6525 4200 50  0001 C CNN
F 4 "DK" H 6500 4100 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6500 4100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6925 4600 60  0001 C CNN "PurchasingLink"
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3950 6500 3650
Wire Wire Line
	6500 3650 5900 3650
Wire Wire Line
	5900 3650 5900 3750
Wire Wire Line
	5900 3650 5900 3300
Wire Wire Line
	5900 3300 5250 3300
Connection ~ 5900 3650
Connection ~ 5250 3300
Wire Wire Line
	6500 4250 6500 4400
Wire Wire Line
	6500 4400 5900 4400
Connection ~ 5900 4400
Wire Wire Line
	5900 4400 5900 4350
Text Notes 5850 3150 0    50   ~ 0
Board Mount
$EndSCHEMATC
