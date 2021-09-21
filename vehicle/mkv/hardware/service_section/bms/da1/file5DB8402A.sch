EESchema Schematic File Version 4
LIBS:BMS_Sensing-cache
LIBS:BMS_peripheral-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8050 8450 8150 8450
Wire Wire Line
	8150 8450 8150 8400
Wire Wire Line
	8050 8650 8500 8650
Wire Wire Line
	8500 8650 8500 8600
Text Label 8250 8400 0    50   ~ 0
SDA
Text Label 8600 8600 0    50   ~ 0
SCL
Wire Wire Line
	8150 7900 8150 8000
Wire Wire Line
	8500 7900 8500 8000
Wire Wire Line
	8150 7900 8300 7900
Text Label 8300 7800 0    50   ~ 0
VREG
Wire Wire Line
	8300 7800 8300 7900
Connection ~ 8300 7900
Wire Wire Line
	8300 7900 8500 7900
Wire Wire Line
	8600 8600 8500 8600
Connection ~ 8500 8600
Wire Wire Line
	8500 8600 8500 8300
Wire Wire Line
	8250 8400 8150 8400
Connection ~ 8150 8400
Wire Wire Line
	8150 8400 8150 8300
$Comp
L power:GND #PWR?
U 1 1 5BCFD2C0
P 8100 8750
F 0 "#PWR?" H 8100 8500 50  0001 C CNN
F 1 "GND" H 8105 8577 50  0000 C CNN
F 2 "" H 8100 8750 50  0001 C CNN
F 3 "" H 8100 8750 50  0001 C CNN
	1    8100 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 8550 8100 8550
Wire Wire Line
	8100 8550 8100 8750
$Comp
L power:GND #PWR?
U 1 1 5BCFD4B3
P 7100 8750
F 0 "#PWR?" H 7100 8500 50  0001 C CNN
F 1 "GND" H 7105 8577 50  0000 C CNN
F 2 "" H 7100 8750 50  0001 C CNN
F 3 "" H 7100 8750 50  0001 C CNN
	1    7100 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 8650 7100 8650
Wire Wire Line
	7100 8650 7100 8750
Wire Wire Line
	6950 8450 7200 8450
Text Label 6950 8450 0    50   ~ 0
VREG
Wire Notes Line
	6800 7550 6800 9200
Wire Notes Line
	6800 9200 8800 9200
Wire Notes Line
	8800 9200 8800 7550
Wire Notes Line
	8800 7550 6800 7550
Text Notes 6850 9150 0    50   ~ 10
I2C Memory
Text Label 13500 4100 0    50   ~ 0
SCL
Text Label 13500 4200 0    50   ~ 0
SDA
Wire Wire Line
	13500 4200 13400 4200
Wire Wire Line
	13400 4100 13500 4100
$Comp
L formula:C_1uF C?
U 1 1 5BCFFF3C
P 13800 4150
F 0 "C?" H 13915 4196 50  0000 L CNN
F 1 "C_1uF" H 13915 4105 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13838 4000 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 13825 4250 50  0001 C CNN
F 4 "DK" H 13800 4150 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 13800 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 14225 4650 60  0001 C CNN "PurchasingLink"
	1    13800 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 4300 13400 4300
Text Label 13800 3900 0    50   ~ 0
VREG
Wire Wire Line
	13800 3900 13800 4000
Wire Wire Line
	13400 4000 13800 4000
Connection ~ 13800 4000
$Comp
L power:GND #PWR?
U 1 1 5BD00B38
P 13800 4800
F 0 "#PWR?" H 13800 4550 50  0001 C CNN
F 1 "GND" H 13805 4627 50  0000 C CNN
F 2 "" H 13800 4800 50  0001 C CNN
F 3 "" H 13800 4800 50  0001 C CNN
	1    13800 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 4300 13800 4400
Connection ~ 13800 4300
Wire Wire Line
	13400 4400 13800 4400
Connection ~ 13800 4400
Wire Wire Line
	13800 4400 13800 4500
Wire Wire Line
	13400 4500 13800 4500
Connection ~ 13800 4500
Wire Wire Line
	13800 4500 13800 4600
Wire Wire Line
	13400 4600 13800 4600
Connection ~ 13800 4600
Wire Wire Line
	13800 4600 13800 4800
Wire Wire Line
	10300 4000 11000 4000
Wire Wire Line
	10300 4100 11200 4100
Wire Wire Line
	13400 4700 14250 4700
Wire Wire Line
	12550 4200 11400 4200
Wire Wire Line
	10300 4300 11600 4300
Wire Wire Line
	10300 4500 12000 4500
Wire Wire Line
	12550 4600 12200 4600
Wire Wire Line
	10300 4700 12400 4700
Text Label 10300 4100 0    50   ~ 0
MODULE10_TEMP1
Text Label 10300 4200 0    50   ~ 0
MODULE9_TEMP2
Text Label 10300 4300 0    50   ~ 0
MODULE9_TEMP1
Text Label 10300 4400 0    50   ~ 0
MODULE8_TEMP2
Text Label 10300 4500 0    50   ~ 0
MODULE8_TEMP1
Text Label 10300 4600 0    50   ~ 0
MODULE7_TEMP2
Text Label 10300 4700 0    50   ~ 0
MODULE7_TEMP1
Wire Wire Line
	11000 3900 11000 4000
Connection ~ 11000 4000
Wire Wire Line
	11000 4000 12550 4000
Wire Wire Line
	11200 3900 11200 4100
Connection ~ 11200 4100
Wire Wire Line
	11200 4100 12550 4100
Wire Wire Line
	11400 3900 11400 4200
Connection ~ 11400 4200
Wire Wire Line
	11400 4200 10300 4200
Wire Wire Line
	11600 3900 11600 4300
Wire Wire Line
	11800 3900 11800 4400
Connection ~ 11800 4400
Wire Wire Line
	11800 4400 10300 4400
Wire Wire Line
	12200 3900 12200 4600
Connection ~ 12200 4600
Wire Wire Line
	12200 4600 10300 4600
Wire Wire Line
	11600 4300 12550 4300
Connection ~ 11600 4300
Wire Wire Line
	11800 4400 12550 4400
Wire Wire Line
	12000 3900 12000 4500
Connection ~ 12000 4500
Wire Wire Line
	12000 4500 12550 4500
Wire Wire Line
	12400 3900 12400 4700
Connection ~ 12400 4700
Wire Wire Line
	12400 4700 12550 4700
Wire Wire Line
	12400 3600 12400 3500
Wire Wire Line
	12400 3500 12200 3500
Wire Wire Line
	11000 3500 11000 3600
Wire Wire Line
	11200 3500 11200 3600
Connection ~ 11200 3500
Wire Wire Line
	11200 3500 11000 3500
Wire Wire Line
	11400 3500 11400 3600
Connection ~ 11400 3500
Wire Wire Line
	11400 3500 11200 3500
Wire Wire Line
	11600 3500 11600 3600
Connection ~ 11600 3500
Wire Wire Line
	11600 3500 11400 3500
Wire Wire Line
	11800 3500 11800 3600
Connection ~ 11800 3500
Wire Wire Line
	11800 3500 11600 3500
Wire Wire Line
	12000 3500 12000 3600
Connection ~ 12000 3500
Wire Wire Line
	12000 3500 11800 3500
Wire Wire Line
	12200 3500 12200 3600
Connection ~ 12200 3500
Wire Wire Line
	12200 3500 12000 3500
Wire Wire Line
	11000 3400 11000 3500
Connection ~ 11000 3500
Text Label 11000 3400 0    50   ~ 0
VREF2
Text Label 13500 5650 0    50   ~ 0
SCL
Text Label 13500 5750 0    50   ~ 0
SDA
Wire Wire Line
	13500 5750 13400 5750
Wire Wire Line
	13400 5650 13500 5650
$Comp
L formula:C_1uF C?
U 1 1 5BD1F887
P 13800 5700
F 0 "C?" H 13915 5746 50  0000 L CNN
F 1 "C_1uF" H 13915 5655 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13838 5550 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 13825 5800 50  0001 C CNN
F 4 "DK" H 13800 5700 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 13800 5700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 14225 6200 60  0001 C CNN "PurchasingLink"
	1    13800 5700
	1    0    0    -1  
$EndComp
Text Label 13800 5450 0    50   ~ 0
VREG
Wire Wire Line
	13800 5450 13800 5550
Wire Wire Line
	13400 5550 13700 5550
Connection ~ 13800 5550
$Comp
L power:GND #PWR?
U 1 1 5BD1F893
P 13800 6350
F 0 "#PWR?" H 13800 6100 50  0001 C CNN
F 1 "GND" H 13805 6177 50  0000 C CNN
F 2 "" H 13800 6350 50  0001 C CNN
F 3 "" H 13800 6350 50  0001 C CNN
	1    13800 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 5850 13800 5950
Wire Wire Line
	13400 5950 13800 5950
Connection ~ 13800 5950
Wire Wire Line
	13800 5950 13800 6050
Wire Wire Line
	13400 6050 13800 6050
Connection ~ 13800 6050
Wire Wire Line
	13800 6050 13800 6150
Wire Wire Line
	13400 6150 13800 6150
Connection ~ 13800 6150
Wire Wire Line
	13800 6150 13800 6350
Wire Wire Line
	10300 5550 11000 5550
Wire Wire Line
	10300 5650 11200 5650
Wire Wire Line
	12550 5750 11400 5750
Wire Wire Line
	10300 5850 11600 5850
Wire Wire Line
	10300 6050 12000 6050
Wire Wire Line
	12550 6150 12200 6150
Wire Wire Line
	10300 6250 12400 6250
Text Label 10300 5650 0    50   ~ 0
MODULE6_TEMP1
Text Label 10300 5750 0    50   ~ 0
MODULE5_TEMP2
Text Label 10300 5850 0    50   ~ 0
MODULE5_TEMP1
Text Label 10300 6050 0    50   ~ 0
MODULE4_TEMP1
Text Label 10300 6150 0    50   ~ 0
MODULE3_TEMP2
Text Label 10300 6250 0    50   ~ 0
MODULE3_TEMP1
Wire Wire Line
	11000 5450 11000 5550
Connection ~ 11000 5550
Wire Wire Line
	11000 5550 12550 5550
Wire Wire Line
	11200 5450 11200 5650
Connection ~ 11200 5650
Wire Wire Line
	11200 5650 12550 5650
Wire Wire Line
	11400 5450 11400 5750
Connection ~ 11400 5750
Wire Wire Line
	11400 5750 10300 5750
Wire Wire Line
	11600 5450 11600 5850
Wire Wire Line
	11800 5450 11800 5950
Connection ~ 11800 5950
Wire Wire Line
	11800 5950 10300 5950
Wire Wire Line
	12200 5450 12200 6150
Connection ~ 12200 6150
Wire Wire Line
	12200 6150 10300 6150
Wire Wire Line
	11600 5850 12550 5850
Connection ~ 11600 5850
Wire Wire Line
	11800 5950 12550 5950
Wire Wire Line
	12000 5450 12000 6050
Connection ~ 12000 6050
Wire Wire Line
	12000 6050 12550 6050
Wire Wire Line
	12400 5450 12400 6250
Connection ~ 12400 6250
Wire Wire Line
	12400 6250 12550 6250
Wire Wire Line
	12400 5150 12400 5050
Wire Wire Line
	12400 5050 12200 5050
Wire Wire Line
	11000 5050 11000 5150
Wire Wire Line
	11200 5050 11200 5150
Connection ~ 11200 5050
Wire Wire Line
	11200 5050 11000 5050
Wire Wire Line
	11400 5050 11400 5150
Connection ~ 11400 5050
Wire Wire Line
	11400 5050 11200 5050
Wire Wire Line
	11600 5050 11600 5150
Connection ~ 11600 5050
Wire Wire Line
	11600 5050 11400 5050
Wire Wire Line
	11800 5050 11800 5150
Connection ~ 11800 5050
Wire Wire Line
	11800 5050 11600 5050
Wire Wire Line
	12000 5050 12000 5150
Connection ~ 12000 5050
Wire Wire Line
	12000 5050 11800 5050
Wire Wire Line
	12200 5050 12200 5150
Connection ~ 12200 5050
Wire Wire Line
	12200 5050 12000 5050
Wire Wire Line
	11000 4950 11000 5050
Connection ~ 11000 5050
Text Label 11000 4950 0    50   ~ 0
VREF2
Text Label 13500 7100 0    50   ~ 0
SCL
Text Label 13500 7200 0    50   ~ 0
SDA
Wire Wire Line
	13500 7200 13400 7200
Wire Wire Line
	13400 7100 13500 7100
$Comp
L formula:C_1uF C?
U 1 1 5BD24C1E
P 13800 7150
F 0 "C?" H 13915 7196 50  0000 L CNN
F 1 "C_1uF" H 13915 7105 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 13838 7000 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 13825 7250 50  0001 C CNN
F 4 "DK" H 13800 7150 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 13800 7150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 14225 7650 60  0001 C CNN "PurchasingLink"
	1    13800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 7300 13400 7300
Text Label 13800 6900 0    50   ~ 0
VREG
Wire Wire Line
	13800 6900 13800 7000
Wire Wire Line
	13400 7000 13700 7000
Connection ~ 13800 7000
$Comp
L power:GND #PWR?
U 1 1 5BD24C2A
P 13800 7800
F 0 "#PWR?" H 13800 7550 50  0001 C CNN
F 1 "GND" H 13805 7627 50  0000 C CNN
F 2 "" H 13800 7800 50  0001 C CNN
F 3 "" H 13800 7800 50  0001 C CNN
	1    13800 7800
	1    0    0    -1  
$EndComp
Connection ~ 13800 7300
Wire Wire Line
	13400 7400 13700 7400
Wire Wire Line
	13400 7600 13800 7600
Connection ~ 13800 7600
Wire Wire Line
	13800 7600 13800 7800
Wire Wire Line
	10300 7000 11000 7000
Wire Wire Line
	10300 7100 11200 7100
Wire Wire Line
	12550 7200 11400 7200
Wire Wire Line
	10300 7300 11600 7300
Wire Wire Line
	10300 7500 12000 7500
Wire Wire Line
	12550 7600 12200 7600
Wire Wire Line
	10300 7700 12400 7700
Text Label 10300 7000 0    50   ~ 0
MODULE2_TEMP2
Text Label 10300 7100 0    50   ~ 0
MODULE2_TEMP1
Text Label 10300 7200 0    50   ~ 0
MODULE1_TEMP2
Text Label 10300 7300 0    50   ~ 0
MODULE1_TEMP1
Wire Wire Line
	11000 6900 11000 7000
Connection ~ 11000 7000
Wire Wire Line
	11000 7000 12550 7000
Wire Wire Line
	11200 6900 11200 7100
Connection ~ 11200 7100
Wire Wire Line
	11200 7100 12550 7100
Wire Wire Line
	11400 6900 11400 7200
Connection ~ 11400 7200
Wire Wire Line
	11400 7200 10300 7200
Wire Wire Line
	11600 6900 11600 7300
Wire Wire Line
	11800 6900 11800 7400
Connection ~ 11800 7400
Wire Wire Line
	11800 7400 10300 7400
Wire Wire Line
	12200 6900 12200 7600
Connection ~ 12200 7600
Wire Wire Line
	12200 7600 10300 7600
Wire Wire Line
	11600 7300 12550 7300
Connection ~ 11600 7300
Wire Wire Line
	11800 7400 12550 7400
Wire Wire Line
	12000 6900 12000 7500
Connection ~ 12000 7500
Wire Wire Line
	12000 7500 12550 7500
Wire Wire Line
	12400 6900 12400 7700
Connection ~ 12400 7700
Wire Wire Line
	12400 7700 12550 7700
Wire Wire Line
	12400 6600 12400 6500
Wire Wire Line
	12400 6500 12200 6500
Wire Wire Line
	11000 6500 11000 6600
Wire Wire Line
	11200 6500 11200 6600
Connection ~ 11200 6500
Wire Wire Line
	11200 6500 11000 6500
Wire Wire Line
	11400 6500 11400 6600
Connection ~ 11400 6500
Wire Wire Line
	11400 6500 11200 6500
Wire Wire Line
	11600 6500 11600 6600
Connection ~ 11600 6500
Wire Wire Line
	11600 6500 11400 6500
Wire Wire Line
	11800 6500 11800 6600
Connection ~ 11800 6500
Wire Wire Line
	11800 6500 11600 6500
Wire Wire Line
	12000 6500 12000 6600
Connection ~ 12000 6500
Wire Wire Line
	12000 6500 11800 6500
Wire Wire Line
	12200 6500 12200 6600
Connection ~ 12200 6500
Wire Wire Line
	12200 6500 12000 6500
Wire Wire Line
	11000 6400 11000 6500
Connection ~ 11000 6500
Text Label 11000 6400 0    50   ~ 0
VREF2
Wire Wire Line
	14250 4700 14250 6250
Wire Wire Line
	13400 7700 14250 7700
Wire Wire Line
	14250 7700 14250 6450
Connection ~ 14250 6250
Wire Wire Line
	14500 6450 14250 6450
Wire Wire Line
	14500 6650 14400 6650
Wire Wire Line
	14400 6650 14400 7150
Wire Wire Line
	14400 7150 15200 7150
Wire Wire Line
	15200 7150 15200 6550
Wire Wire Line
	15200 6550 15100 6550
Text Label 14700 6050 0    50   ~ 0
VREG
Wire Wire Line
	14700 6850 14700 6900
$Comp
L formula:R_100 R?
U 1 1 5BD83964
P 15400 6550
F 0 "R?" V 15193 6550 50  0000 C CNN
F 1 "R_100" V 15284 6550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 15330 6550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 15480 6550 50  0001 C CNN
F 4 "DK" H 15400 6550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 15400 6550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 15880 6950 60  0001 C CNN "PurchasingLink"
	1    15400 6550
	0    1    1    0   
$EndComp
Connection ~ 15200 6550
Wire Wire Line
	15200 6550 15250 6550
Wire Wire Line
	15550 6550 15600 6550
Wire Wire Line
	15600 6550 15600 6600
Wire Wire Line
	15700 6550 15600 6550
Connection ~ 15600 6550
Text Label 15700 6550 0    50   ~ 0
TEMP_SENSE
Wire Notes Line
	16300 3250 10200 3250
Wire Wire Line
	13700 5550 13700 5850
Connection ~ 13700 5550
Wire Wire Line
	13700 5550 13800 5550
Wire Wire Line
	13700 5850 13400 5850
Wire Wire Line
	13700 7400 13700 7000
Connection ~ 13700 7000
Wire Wire Line
	13700 7000 13800 7000
Text Notes 14050 4400 0    50   ~ 0
A0 = 0, A1 = 0  Address 0x90
Text Notes 14050 5900 0    50   ~ 0
A0 = 1, A1 = 0  Address 0x92
Text Notes 14050 7400 0    50   ~ 0
A0 = 0, A1 = 1  Address 0x94
Text Label 10300 4000 0    50   ~ 0
MODULE10_TEMP2
Text Label 10300 5550 0    50   ~ 0
MODULE6_TEMP2
Text Label 10300 5950 0    50   ~ 0
MODULE4_TEMP2
Wire Wire Line
	13800 7300 13800 7500
Wire Wire Line
	13800 7500 13800 7600
Connection ~ 13800 7500
Wire Wire Line
	13400 7500 13800 7500
Text Notes 10300 8000 0    50   ~ 0
Temperature Sensing
Wire Wire Line
	6600 4350 6350 4350
Wire Wire Line
	6350 4350 6350 4550
Wire Wire Line
	6350 4550 6600 4550
Wire Wire Line
	6600 5550 6350 5550
Wire Wire Line
	6350 5550 6350 5750
Wire Wire Line
	6350 5750 6600 5750
NoConn ~ 6600 4450
NoConn ~ 6600 5650
$Comp
L formula:C_1uF C?
U 1 1 5BF0CED4
P 8350 5900
F 0 "C?" H 8400 6000 50  0000 L CNN
F 1 "1uF" H 8400 5800 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8388 5750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 8375 6000 50  0001 C CNN
F 4 "DK" H 8350 5900 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 8350 5900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 8775 6400 60  0001 C CNN "PurchasingLink"
	1    8350 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF3ED4F
P 8350 6100
F 0 "#PWR?" H 8350 5850 50  0001 C CNN
F 1 "GND" H 8355 5927 50  0000 C CNN
F 2 "" H 8350 6100 50  0001 C CNN
F 3 "" H 8350 6100 50  0001 C CNN
	1    8350 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 6050 8350 6100
Connection ~ 8350 6050
Wire Wire Line
	7500 6050 7550 6050
$Comp
L formula:C_1uF C?
U 1 1 5BF4FDEE
P 8100 5900
F 0 "C?" H 8150 6000 50  0000 L CNN
F 1 "1uF" H 8150 5800 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8138 5750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 8125 6000 50  0001 C CNN
F 4 "DK" H 8100 5900 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 8100 5900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 8525 6400 60  0001 C CNN "PurchasingLink"
	1    8100 5900
	1    0    0    -1  
$EndComp
Connection ~ 8100 6050
Wire Wire Line
	8100 6050 8350 6050
$Comp
L formula:C_1uF C?
U 1 1 5BF4FE6E
P 7850 5900
F 0 "C?" H 7900 6000 50  0000 L CNN
F 1 "1uF" H 7900 5800 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 7888 5750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A105KAFNNNE.pdf" H 7875 6000 50  0001 C CNN
F 4 "DK" H 7850 5900 60  0001 C CNN "MFN"
F 5 "1276-2887-1-ND" H 7850 5900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A105KAFNNNE/1276-2887-1-ND/3890973" H 8275 6400 60  0001 C CNN "PurchasingLink"
	1    7850 5900
	1    0    0    -1  
$EndComp
Connection ~ 7850 6050
Wire Wire Line
	7850 6050 8100 6050
Wire Wire Line
	8350 5450 8350 5500
Wire Wire Line
	8350 5500 8050 5500
Wire Wire Line
	8050 5500 8050 5350
Wire Wire Line
	8050 5350 7800 5350
Connection ~ 8350 5500
Wire Wire Line
	8350 5500 8350 5750
Wire Wire Line
	7500 5550 8100 5550
Wire Wire Line
	8600 5650 8600 6150
Wire Wire Line
	8600 6150 8750 6150
Wire Wire Line
	8750 6350 8600 6350
Wire Wire Line
	8600 6350 8600 6850
Wire Wire Line
	8600 6850 9450 6850
Wire Wire Line
	9450 6850 9450 6250
Wire Wire Line
	9450 6250 9350 6250
Text Notes 12750 3650 0    50   ~ 0
Currently assuming use with thermistors.\nNeeds redesign for LMT85-Q1 CMOS temperature sensors. \nPush-pull current of +- 50 uA max, need 100K-1M pull-up resistor instead.\n\nVref2 = 3V, V_sensor =? 0.5V @ 125C,  sinking 25uA with 100K, 2.5uA for 1M. 
Text Notes 8450 5500 0    50   ~ 0
May get hot.\n
Wire Wire Line
	8100 5550 8100 5750
Wire Wire Line
	7500 5650 7850 5650
Wire Wire Line
	8950 6600 8950 6550
Wire Wire Line
	7500 5450 7700 5450
Wire Wire Line
	7700 5450 7700 6050
Wire Wire Line
	7700 6050 7850 6050
Connection ~ 7700 6050
Text Label 7850 5350 0    50   ~ 0
VREG
Text Label 7550 5750 0    50   ~ 0
SCL
Text Label 7550 5850 0    50   ~ 0
SDA
Wire Wire Line
	7550 5750 7500 5750
Wire Wire Line
	7550 5850 7500 5850
Wire Wire Line
	7850 5650 7850 5750
Wire Wire Line
	7850 5650 8600 5650
Connection ~ 7850 5650
NoConn ~ 7500 6150
NoConn ~ 7500 6250
Text Label 7500 6350 0    50   ~ 0
TEMP_SENSE
Wire Wire Line
	7500 5050 7800 5050
Wire Wire Line
	7800 5050 7800 5350
Connection ~ 7800 5350
Wire Wire Line
	7800 5350 7500 5350
NoConn ~ 7500 5150
NoConn ~ 7500 4650
NoConn ~ 7500 4750
$Comp
L formula:R_1K R?
U 1 1 5C1228F0
P 7800 4550
F 0 "R?" V 7900 4550 50  0000 C CNN
F 1 "R_1K" V 7800 4550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 7730 4550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 7880 4550 50  0001 C CNN
F 4 "DK" H 7800 4550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 7800 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8280 4950 60  0001 C CNN "PurchasingLink"
	1    7800 4550
	0    1    1    0   
$EndComp
$Comp
L formula:R_1K R?
U 1 1 5C1229EE
P 8200 4550
F 0 "R?" V 8100 4550 50  0000 C CNN
F 1 "R_1K" V 8200 4550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 8130 4550 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 8280 4550 50  0001 C CNN
F 4 "DK" H 8200 4550 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 8200 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 8680 4950 60  0001 C CNN "PurchasingLink"
	1    8200 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C1D54DA
P 8450 4550
F 0 "#PWR?" H 8450 4300 50  0001 C CNN
F 1 "GND" H 8455 4377 50  0000 C CNN
F 2 "" H 8450 4550 50  0001 C CNN
F 3 "" H 8450 4550 50  0001 C CNN
	1    8450 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4550 8350 4550
$Comp
L formula:R_100 R?
U 1 1 5C24C55E
P 8900 4600
F 0 "R?" H 8970 4646 50  0000 L CNN
F 1 "R_100" H 8970 4555 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8830 4600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 8980 4600 50  0001 C CNN
F 4 "DK" H 8900 4600 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 8900 4600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 9380 5000 60  0001 C CNN "PurchasingLink"
	1    8900 4600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C?
U 1 1 5C2AB15F
P 8900 5000
F 0 "C?" H 9015 5046 50  0000 L CNN
F 1 "C_0.1uF" H 9015 4955 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 8938 4850 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 8925 5100 50  0001 C CNN
F 4 "DK" H 8900 5000 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 8900 5000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 9325 5500 60  0001 C CNN "PurchasingLink"
	1    8900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5150 8900 5200
Text Label 8950 5950 0    50   ~ 0
VREG
Text Label 9450 6250 0    50   ~ 0
VREF2
$Comp
L formula:R_100 R?
U 1 1 5C41EE32
P 6100 3750
F 0 "R?" H 6170 3796 50  0000 L CNN
F 1 "R_100" H 6170 3705 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6030 3750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 6180 3750 50  0001 C CNN
F 4 "DK" H 6100 3750 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 6100 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 6580 4150 60  0001 C CNN "PurchasingLink"
	1    6100 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:C_0.1uF C?
U 1 1 5C4514F6
P 6100 4150
F 0 "C?" H 5950 4250 50  0000 L CNN
F 1 "C_0.1uF" H 5800 4050 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 6138 4000 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6125 4250 50  0001 C CNN
F 4 "DK" H 6100 4150 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6100 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6525 4650 60  0001 C CNN "PurchasingLink"
	1    6100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4250 6600 4250
Wire Wire Line
	6100 4300 6100 4350
Wire Wire Line
	12550 1400 12050 1400
Wire Wire Line
	12050 1400 12050 1200
Wire Wire Line
	11600 1500 11600 1550
Wire Wire Line
	12550 1800 12050 1800
Wire Wire Line
	11600 1550 11200 1550
Connection ~ 11600 1550
Wire Wire Line
	11600 1550 11600 1600
Wire Wire Line
	12550 1600 12550 1450
Wire Wire Line
	12550 1450 12300 1450
Wire Wire Line
	12300 1750 12300 1850
Wire Wire Line
	11600 2400 11600 2500
Wire Wire Line
	11600 2500 11200 2500
Wire Wire Line
	11200 2500 11200 2550
Connection ~ 11600 2500
Wire Wire Line
	11600 2500 11600 2550
Wire Wire Line
	12300 2550 12300 2650
Wire Wire Line
	11200 2850 11200 2950
Wire Wire Line
	12050 1800 12050 1900
Wire Wire Line
	12550 2300 12500 2300
Wire Wire Line
	12500 2300 12500 2200
Wire Wire Line
	12500 2200 12300 2200
Wire Wire Line
	12300 2200 12300 2250
Wire Wire Line
	12550 2500 12550 2900
Wire Wire Line
	11600 2850 11600 2900
Wire Wire Line
	11600 2900 12550 2900
NoConn ~ 13800 2300
NoConn ~ 13800 1600
Text Label 7600 4250 0    50   ~ 0
IPB
Text Label 7600 4350 0    50   ~ 0
IMB
Wire Wire Line
	7600 4250 7500 4250
Wire Wire Line
	7500 4350 7600 4350
Text Label 7600 4850 0    50   ~ 0
IPA
Text Label 7600 4950 0    50   ~ 0
IMA
Wire Wire Line
	7600 4850 7500 4850
Wire Wire Line
	7600 4950 7500 4950
Wire Wire Line
	11200 1850 11200 1950
Wire Wire Line
	11000 1600 10750 1600
Wire Wire Line
	11000 1600 11000 1900
Wire Wire Line
	11000 1200 11000 1450
Wire Wire Line
	11000 1450 10750 1450
Text Label 10750 1450 0    50   ~ 0
IPA
Text Label 10750 1600 0    50   ~ 0
IMA
Text Notes 14900 1650 0    50   ~ 0
isoSPI A towards Core
Text Notes 14900 2350 0    50   ~ 0
isoSPI B up the daisy chain\n
Wire Wire Line
	13800 2100 14000 2100
Wire Wire Line
	14000 2100 14000 2250
Wire Wire Line
	11000 2100 11000 2350
Wire Wire Line
	11000 2350 10750 2350
Wire Wire Line
	11600 2900 11000 2900
Wire Wire Line
	11000 2900 11000 2500
Wire Wire Line
	11000 2500 10750 2500
Connection ~ 11600 2900
Text Label 10750 2500 0    50   ~ 0
IMB
Text Label 10750 2350 0    50   ~ 0
IPB
Wire Notes Line
	10200 3150 10200 1050
Wire Notes Line
	10200 1050 16300 1050
Wire Notes Line
	16300 1050 16300 3150
Wire Notes Line
	16300 3150 10200 3150
Text Notes 10250 3100 0    50   ~ 0
isoSPI Transformer
Wire Wire Line
	6100 3900 6100 3950
Wire Wire Line
	6350 3950 6350 4250
Wire Wire Line
	6100 3950 6350 3950
Connection ~ 6100 3950
Wire Wire Line
	6100 3950 6100 4000
Text Label 6100 3500 0    50   ~ 0
V+
Wire Wire Line
	6100 3500 6100 3600
Wire Wire Line
	8900 4850 8350 4850
Wire Wire Line
	8900 4750 8900 4850
Connection ~ 8900 4850
Text Label 8900 4350 0    50   ~ 0
V+
Wire Wire Line
	8900 4350 8900 4450
Text Label 7600 6550 0    50   ~ 0
~DIS~1
Text Label 6350 6450 0    50   ~ 0
~DIS~2
Text Label 6350 6250 0    50   ~ 0
~DIS~3
Text Label 6350 6050 0    50   ~ 0
~DIS~4
Text Label 6350 5850 0    50   ~ 0
~DIS~5
Text Label 6350 5450 0    50   ~ 0
~DIS~6
Text Label 6350 5250 0    50   ~ 0
~DIS~7
Text Label 6350 5050 0    50   ~ 0
~DIS~8
Text Label 6350 4850 0    50   ~ 0
~DIS~9
Text Label 6350 4650 0    50   ~ 0
~DIS~10
$Comp
L formula:R_100 R?
U 1 1 5E14038F
P 3650 1500
F 0 "R?" V 3730 1500 50  0000 C CNN
F 1 "R_100" V 3550 1500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 1500 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 1500 50  0001 C CNN
F 4 "DK" H 3650 1500 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 1500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 1900 60  0001 C CNN "PurchasingLink"
	1    3650 1500
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E1403A0
P 3300 1950
F 0 "R?" V 3200 1950 50  0000 C CNN
F 1 "R_4.99K" V 3400 1950 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 1950 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 1950 50  0001 C CNN
	1    3300 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1500 3250 1600
Wire Wire Line
	3050 1950 3050 1900
Wire Wire Line
	3250 1500 3500 1500
Connection ~ 3250 1500
NoConn ~ 2850 1900
Wire Wire Line
	2600 2200 2600 2250
$Comp
L formula:LED_0805 D?
U 1 1 5E1403C1
P 2300 1750
F 0 "D?" V 2300 1850 50  0000 C CNN
F 1 "LED_0805" V 2200 2000 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 1750 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 1850 50  0001 C CNN
F 4 "DK" H 2300 1750 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 1750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 2250 60  0001 C CNN "PurchasingLink"
	1    2300 1750
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E1403CD
P 2300 2100
F 0 "R?" V 2380 2100 50  0000 C CNN
F 1 "R_475" V 2200 2100 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 2100 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 2100 50  0001 C CNN
F 4 "DK" H 2300 2100 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 2100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 2500 60  0001 C CNN "PurchasingLink"
	1    2300 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2250 2600 2250
Connection ~ 2600 2250
Wire Wire Line
	3050 1950 3150 1950
Wire Wire Line
	4050 1500 4050 1600
Connection ~ 4050 1500
Wire Wire Line
	4050 1900 4050 2100
Wire Wire Line
	4050 2100 3950 2100
$Comp
L formula:R_100 R?
U 1 1 5E172B25
P 3650 2350
F 0 "R?" V 3730 2350 50  0000 C CNN
F 1 "R_100" V 3550 2350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 2350 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 2350 50  0001 C CNN
F 4 "DK" H 3650 2350 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 2350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 2750 60  0001 C CNN "PurchasingLink"
	1    3650 2350
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E172B36
P 3300 2800
F 0 "R?" V 3200 2800 50  0000 C CNN
F 1 "R_4.99K" V 3400 2800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 2800 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 2800 50  0001 C CNN
	1    3300 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 2350 3250 2450
Wire Wire Line
	3050 2800 3050 2750
Wire Wire Line
	3250 2350 3500 2350
Connection ~ 3250 2350
NoConn ~ 2850 2750
Wire Wire Line
	2600 3050 2600 3100
$Comp
L formula:LED_0805 D?
U 1 1 5E172B57
P 2300 2600
F 0 "D?" V 2300 2700 50  0000 C CNN
F 1 "LED_0805" V 2200 2850 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 2600 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 2700 50  0001 C CNN
F 4 "DK" H 2300 2600 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 2600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 3100 60  0001 C CNN "PurchasingLink"
	1    2300 2600
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E172B63
P 2300 2950
F 0 "R?" V 2380 2950 50  0000 C CNN
F 1 "R_475" V 2200 2950 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 2950 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 2950 50  0001 C CNN
F 4 "DK" H 2300 2950 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 2950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 3350 60  0001 C CNN "PurchasingLink"
	1    2300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2750 2300 2800
Wire Wire Line
	2300 3100 2600 3100
Connection ~ 2600 3100
Wire Wire Line
	3050 2800 3150 2800
Wire Wire Line
	4050 2350 4050 2450
Connection ~ 4050 2350
Wire Wire Line
	4050 2750 4050 2950
Wire Wire Line
	4050 2950 3950 2950
Wire Wire Line
	3800 2350 3950 2350
$Comp
L formula:R_100 R?
U 1 1 5E1AADB4
P 3650 3200
F 0 "R?" V 3730 3200 50  0000 C CNN
F 1 "R_100" V 3550 3200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 3200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 3200 50  0001 C CNN
F 4 "DK" H 3650 3200 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 3200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 3600 60  0001 C CNN "PurchasingLink"
	1    3650 3200
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E1AADC5
P 3300 3650
F 0 "R?" V 3200 3650 50  0000 C CNN
F 1 "R_4.99K" V 3400 3650 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 3650 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 3650 50  0001 C CNN
	1    3300 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3200 3250 3300
Wire Wire Line
	3050 3650 3050 3600
Wire Wire Line
	3250 3200 3500 3200
Connection ~ 3250 3200
NoConn ~ 2850 3600
Wire Wire Line
	2600 3900 2600 3950
$Comp
L formula:LED_0805 D?
U 1 1 5E1AADE6
P 2300 3450
F 0 "D?" V 2300 3550 50  0000 C CNN
F 1 "LED_0805" V 2200 3700 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 3450 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 3550 50  0001 C CNN
F 4 "DK" H 2300 3450 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 3450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 3950 60  0001 C CNN "PurchasingLink"
	1    2300 3450
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E1AADF2
P 2300 3800
F 0 "R?" V 2380 3800 50  0000 C CNN
F 1 "R_475" V 2200 3800 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 3800 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 3800 50  0001 C CNN
F 4 "DK" H 2300 3800 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 3800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 4200 60  0001 C CNN "PurchasingLink"
	1    2300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3600 2300 3650
Connection ~ 2300 3650
Wire Wire Line
	2300 3650 2300 3700
Wire Wire Line
	2300 3950 2600 3950
Connection ~ 2600 3950
Wire Wire Line
	3050 3650 3150 3650
Wire Wire Line
	4050 3200 4050 3300
Connection ~ 4050 3200
Wire Wire Line
	4050 3600 4050 3800
Wire Wire Line
	4050 3800 3950 3800
Wire Wire Line
	3800 3200 3950 3200
$Comp
L formula:R_100 R?
U 1 1 5E1E8BC0
P 3650 4050
F 0 "R?" V 3730 4050 50  0000 C CNN
F 1 "R_100" V 3550 4050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 4050 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 4050 50  0001 C CNN
F 4 "DK" H 3650 4050 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 4050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 4450 60  0001 C CNN "PurchasingLink"
	1    3650 4050
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E1E8BD1
P 3300 4500
F 0 "R?" V 3200 4500 50  0000 C CNN
F 1 "R_4.99K" V 3400 4500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 4500 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 4500 50  0001 C CNN
	1    3300 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4050 3250 4150
Wire Wire Line
	3050 4500 3050 4450
Wire Wire Line
	3250 4050 3500 4050
Connection ~ 3250 4050
NoConn ~ 2850 4450
Wire Wire Line
	2600 4750 2600 4800
$Comp
L formula:LED_0805 D?
U 1 1 5E1E8BF2
P 2300 4300
F 0 "D?" V 2300 4400 50  0000 C CNN
F 1 "LED_0805" V 2200 4550 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 4300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 4400 50  0001 C CNN
F 4 "DK" H 2300 4300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 4300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 4800 60  0001 C CNN "PurchasingLink"
	1    2300 4300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E1E8BFE
P 2300 4650
F 0 "R?" V 2380 4650 50  0000 C CNN
F 1 "R_475" V 2200 4650 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 4650 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 4650 50  0001 C CNN
F 4 "DK" H 2300 4650 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 4650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 5050 60  0001 C CNN "PurchasingLink"
	1    2300 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4450 2300 4500
Wire Wire Line
	2300 4800 2600 4800
Connection ~ 2600 4800
Wire Wire Line
	3050 4500 3150 4500
Wire Wire Line
	4050 4050 4050 4150
Connection ~ 4050 4050
Wire Wire Line
	4050 4450 4050 4650
Wire Wire Line
	4050 4650 3950 4650
Wire Wire Line
	3800 4050 3950 4050
$Comp
L formula:R_100 R?
U 1 1 5E22CA6F
P 3650 4900
F 0 "R?" V 3730 4900 50  0000 C CNN
F 1 "R_100" V 3550 4900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 4900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 4900 50  0001 C CNN
F 4 "DK" H 3650 4900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 4900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 5300 60  0001 C CNN "PurchasingLink"
	1    3650 4900
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E22CA80
P 3300 5350
F 0 "R?" V 3200 5350 50  0000 C CNN
F 1 "R_4.99K" V 3400 5350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 5350 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 5350 50  0001 C CNN
	1    3300 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4900 3250 5000
Wire Wire Line
	3050 5350 3050 5300
Wire Wire Line
	3250 4900 3500 4900
Connection ~ 3250 4900
NoConn ~ 2850 5300
Wire Wire Line
	2600 5600 2600 5650
$Comp
L formula:LED_0805 D?
U 1 1 5E22CAA1
P 2300 5150
F 0 "D?" V 2300 5250 50  0000 C CNN
F 1 "LED_0805" V 2200 5400 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 5150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 5250 50  0001 C CNN
F 4 "DK" H 2300 5150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 5150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 5650 60  0001 C CNN "PurchasingLink"
	1    2300 5150
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E22CAAD
P 2300 5500
F 0 "R?" V 2380 5500 50  0000 C CNN
F 1 "R_475" V 2200 5500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 5500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 5500 50  0001 C CNN
F 4 "DK" H 2300 5500 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 5500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 5900 60  0001 C CNN "PurchasingLink"
	1    2300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 5300 2300 5350
Wire Wire Line
	2300 5650 2600 5650
Connection ~ 2600 5650
Wire Wire Line
	3050 5350 3150 5350
Wire Wire Line
	4050 4900 4050 5000
Connection ~ 4050 4900
Wire Wire Line
	4050 5300 4050 5500
Wire Wire Line
	4050 5500 3950 5500
Wire Wire Line
	3800 4900 3950 4900
$Comp
L formula:R_100 R?
U 1 1 5E276AA1
P 3650 5750
F 0 "R?" V 3730 5750 50  0000 C CNN
F 1 "R_100" V 3550 5750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 5750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 5750 50  0001 C CNN
F 4 "DK" H 3650 5750 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 5750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 6150 60  0001 C CNN "PurchasingLink"
	1    3650 5750
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E276AB2
P 3300 6200
F 0 "R?" V 3200 6200 50  0000 C CNN
F 1 "R_4.99K" V 3400 6200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 6200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 6200 50  0001 C CNN
	1    3300 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 5750 3250 5850
Wire Wire Line
	3050 6200 3050 6150
Wire Wire Line
	3250 5750 3500 5750
Connection ~ 3250 5750
NoConn ~ 2850 6150
Wire Wire Line
	2600 6450 2600 6500
$Comp
L formula:LED_0805 D?
U 1 1 5E276AD3
P 2300 6000
F 0 "D?" V 2300 6100 50  0000 C CNN
F 1 "LED_0805" V 2200 6250 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 6000 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 6100 50  0001 C CNN
F 4 "DK" H 2300 6000 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 6000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 6500 60  0001 C CNN "PurchasingLink"
	1    2300 6000
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E276ADF
P 2300 6350
F 0 "R?" V 2380 6350 50  0000 C CNN
F 1 "R_475" V 2200 6350 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 6350 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 6350 50  0001 C CNN
F 4 "DK" H 2300 6350 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 6350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 6750 60  0001 C CNN "PurchasingLink"
	1    2300 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6150 2300 6200
Wire Wire Line
	2300 6500 2600 6500
Connection ~ 2600 6500
Wire Wire Line
	3050 6200 3150 6200
Wire Wire Line
	4050 5750 4050 5850
Connection ~ 4050 5750
Wire Wire Line
	4050 6150 4050 6350
Wire Wire Line
	4050 6350 3950 6350
Wire Wire Line
	3800 5750 3950 5750
$Comp
L formula:R_100 R?
U 1 1 5E2C73B8
P 3650 6600
F 0 "R?" V 3730 6600 50  0000 C CNN
F 1 "R_100" V 3550 6600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 6600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 6600 50  0001 C CNN
F 4 "DK" H 3650 6600 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 6600 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 7000 60  0001 C CNN "PurchasingLink"
	1    3650 6600
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E2C73C9
P 3300 7050
F 0 "R?" V 3200 7050 50  0000 C CNN
F 1 "R_4.99K" V 3400 7050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 7050 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 7050 50  0001 C CNN
	1    3300 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 6600 3250 6700
Wire Wire Line
	3050 7050 3050 7000
Wire Wire Line
	3250 6600 3500 6600
Connection ~ 3250 6600
NoConn ~ 2850 7000
Wire Wire Line
	2600 7300 2600 7350
$Comp
L formula:LED_0805 D?
U 1 1 5E2C73EA
P 2300 6850
F 0 "D?" V 2300 6950 50  0000 C CNN
F 1 "LED_0805" V 2200 7100 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 6850 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 6950 50  0001 C CNN
F 4 "DK" H 2300 6850 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 6850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 7350 60  0001 C CNN "PurchasingLink"
	1    2300 6850
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E2C73F6
P 2300 7200
F 0 "R?" V 2380 7200 50  0000 C CNN
F 1 "R_475" V 2200 7200 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 7200 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 7200 50  0001 C CNN
F 4 "DK" H 2300 7200 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 7200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 7600 60  0001 C CNN "PurchasingLink"
	1    2300 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7000 2300 7050
Wire Wire Line
	2300 7350 2600 7350
Connection ~ 2600 7350
Wire Wire Line
	3050 7050 3150 7050
Wire Wire Line
	4050 6600 4050 6700
Connection ~ 4050 6600
Wire Wire Line
	4050 7000 4050 7200
Wire Wire Line
	4050 7200 3950 7200
Wire Wire Line
	3800 6600 3950 6600
$Comp
L formula:R_100 R?
U 1 1 5E31E320
P 3650 7450
F 0 "R?" V 3730 7450 50  0000 C CNN
F 1 "R_100" V 3550 7450 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 7450 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 7450 50  0001 C CNN
F 4 "DK" H 3650 7450 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 7450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 7850 60  0001 C CNN "PurchasingLink"
	1    3650 7450
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E31E331
P 3300 7900
F 0 "R?" V 3200 7900 50  0000 C CNN
F 1 "R_4.99K" V 3400 7900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 7900 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 7900 50  0001 C CNN
	1    3300 7900
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 7450 3250 7550
Wire Wire Line
	3050 7900 3050 7850
Wire Wire Line
	3250 7450 3500 7450
Connection ~ 3250 7450
NoConn ~ 2850 7850
Wire Wire Line
	2600 8150 2600 8200
$Comp
L formula:LED_0805 D?
U 1 1 5E31E352
P 2300 7700
F 0 "D?" V 2300 7800 50  0000 C CNN
F 1 "LED_0805" V 2200 7950 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 7700 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 7800 50  0001 C CNN
F 4 "DK" H 2300 7700 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 7700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 8200 60  0001 C CNN "PurchasingLink"
	1    2300 7700
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E31E35E
P 2300 8050
F 0 "R?" V 2380 8050 50  0000 C CNN
F 1 "R_475" V 2200 8050 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 8050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 8050 50  0001 C CNN
F 4 "DK" H 2300 8050 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 8050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 8450 60  0001 C CNN "PurchasingLink"
	1    2300 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7850 2300 7900
Wire Wire Line
	2300 8200 2600 8200
Connection ~ 2600 8200
Wire Wire Line
	3050 7900 3150 7900
Wire Wire Line
	4050 7450 4050 7550
Connection ~ 4050 7450
Wire Wire Line
	4050 7850 4050 8050
Wire Wire Line
	4050 8050 3950 8050
Wire Wire Line
	3800 7450 3950 7450
$Comp
L formula:R_100 R?
U 1 1 5E37BDFB
P 3650 8300
F 0 "R?" V 3730 8300 50  0000 C CNN
F 1 "R_100" V 3550 8300 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 8300 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 8300 50  0001 C CNN
F 4 "DK" H 3650 8300 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 8300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 8700 60  0001 C CNN "PurchasingLink"
	1    3650 8300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E37BE0C
P 3300 8750
F 0 "R?" V 3200 8750 50  0000 C CNN
F 1 "R_4.99K" V 3400 8750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 8750 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 8750 50  0001 C CNN
	1    3300 8750
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 8300 3250 8400
Wire Wire Line
	3050 8750 3050 8700
Wire Wire Line
	3250 8300 3500 8300
Connection ~ 3250 8300
NoConn ~ 2850 8700
Wire Wire Line
	2600 9000 2600 9050
$Comp
L formula:LED_0805 D?
U 1 1 5E37BE2D
P 2300 8550
F 0 "D?" V 2300 8650 50  0000 C CNN
F 1 "LED_0805" V 2200 8800 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 8550 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 8650 50  0001 C CNN
F 4 "DK" H 2300 8550 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 8550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 9050 60  0001 C CNN "PurchasingLink"
	1    2300 8550
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E37BE39
P 2300 8900
F 0 "R?" V 2380 8900 50  0000 C CNN
F 1 "R_475" V 2200 8900 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 8900 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 8900 50  0001 C CNN
F 4 "DK" H 2300 8900 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 8900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 9300 60  0001 C CNN "PurchasingLink"
	1    2300 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 8700 2300 8750
Wire Wire Line
	2300 9050 2600 9050
Connection ~ 2600 9050
Wire Wire Line
	3050 8750 3150 8750
Wire Wire Line
	4050 8300 4050 8400
Connection ~ 4050 8300
Wire Wire Line
	4050 8700 4050 8900
Wire Wire Line
	4050 8900 3950 8900
Wire Wire Line
	3800 8300 3950 8300
$Comp
L formula:R_100 R?
U 1 1 5E44C2C5
P 3650 9150
F 0 "R?" V 3730 9150 50  0000 C CNN
F 1 "R_100" V 3550 9150 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 9150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 9150 50  0001 C CNN
F 4 "DK" H 3650 9150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 9150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 9550 60  0001 C CNN "PurchasingLink"
	1    3650 9150
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5E44C2D6
P 3300 9600
F 0 "R?" V 3200 9600 50  0000 C CNN
F 1 "R_4.99K" V 3400 9600 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3300 9600 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0402FR-074K99L/311-4.99KLRTR-ND/2827568" H 3300 9600 50  0001 C CNN
	1    3300 9600
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 9150 3250 9250
Wire Wire Line
	3050 9600 3050 9550
Wire Wire Line
	3250 9150 3500 9150
Connection ~ 3250 9150
NoConn ~ 2850 9550
Wire Wire Line
	2600 9850 2600 9900
$Comp
L formula:LED_0805 D?
U 1 1 5E44C2F7
P 2300 9400
F 0 "D?" V 2300 9500 50  0000 C CNN
F 1 "LED_0805" V 2200 9650 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 2200 9400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 9500 50  0001 C CNN
F 4 "DK" H 2300 9400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 9400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 9900 60  0001 C CNN "PurchasingLink"
	1    2300 9400
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5E44C303
P 2300 9750
F 0 "R?" V 2380 9750 50  0000 C CNN
F 1 "R_475" V 2200 9750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 2230 9750 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2380 9750 50  0001 C CNN
F 4 "DK" H 2300 9750 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 2300 9750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 2780 10150 60  0001 C CNN "PurchasingLink"
	1    2300 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 9550 2300 9600
Wire Wire Line
	2300 9900 2600 9900
Connection ~ 2600 9900
Wire Wire Line
	3050 9600 3150 9600
Wire Wire Line
	4050 9150 4050 9250
Connection ~ 4050 9150
Wire Wire Line
	4050 9550 4050 9750
Wire Wire Line
	4050 9750 3950 9750
Wire Wire Line
	3800 9150 3950 9150
Wire Wire Line
	3950 2100 3950 2350
Connection ~ 3950 2350
Wire Wire Line
	3950 2350 4050 2350
Wire Wire Line
	2600 2250 2600 2350
Connection ~ 2600 2350
Wire Wire Line
	2600 2350 3250 2350
Wire Wire Line
	2600 3100 2600 3200
Connection ~ 2600 3200
Wire Wire Line
	2600 3200 3250 3200
Wire Wire Line
	3950 2950 3950 3200
Connection ~ 3950 3200
Wire Wire Line
	3950 3200 4050 3200
Wire Wire Line
	3950 3800 3950 4050
Connection ~ 3950 4050
Wire Wire Line
	3950 4050 4050 4050
Wire Wire Line
	2600 3950 2600 4050
Connection ~ 2600 4050
Wire Wire Line
	2600 4050 3250 4050
Wire Wire Line
	2600 4800 2600 4900
Connection ~ 2600 4900
Wire Wire Line
	2600 4900 3250 4900
Wire Wire Line
	3950 4650 3950 4900
Connection ~ 3950 4900
Wire Wire Line
	3950 4900 4050 4900
Wire Wire Line
	3950 5500 3950 5750
Connection ~ 3950 5750
Wire Wire Line
	3950 5750 4050 5750
Wire Wire Line
	2600 5650 2600 5750
Connection ~ 2600 5750
Wire Wire Line
	2600 5750 3250 5750
Wire Wire Line
	3950 6350 3950 6600
Connection ~ 3950 6600
Wire Wire Line
	3950 6600 4050 6600
Wire Wire Line
	2600 6500 2600 6600
Connection ~ 2600 6600
Wire Wire Line
	2600 6600 3250 6600
Wire Wire Line
	2600 7350 2600 7450
Connection ~ 2600 7450
Wire Wire Line
	2600 7450 3250 7450
Wire Wire Line
	3950 7200 3950 7450
Connection ~ 3950 7450
Wire Wire Line
	3950 7450 4050 7450
Wire Wire Line
	3950 8050 3950 8300
Connection ~ 3950 8300
Wire Wire Line
	3950 8300 4050 8300
Wire Wire Line
	2600 8200 2600 8300
Connection ~ 2600 8300
Wire Wire Line
	2600 8300 3250 8300
Wire Wire Line
	3950 8900 3950 9150
Connection ~ 3950 9150
Wire Wire Line
	3950 9150 4050 9150
Wire Wire Line
	2600 9050 2600 9150
Connection ~ 2600 9150
Wire Wire Line
	2600 9150 3250 9150
Wire Wire Line
	2600 9900 2600 10000
$Comp
L formula:R_100 R?
U 1 1 5EDF0A73
P 3650 10000
F 0 "R?" V 3730 10000 50  0000 C CNN
F 1 "R_100" V 3550 10000 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3580 10000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 3730 10000 50  0001 C CNN
F 4 "DK" H 3650 10000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD100RCT-ND" H 3650 10000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD100RCT-ND" H 4130 10400 60  0001 C CNN "PurchasingLink"
	1    3650 10000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 10000 3800 10000
Wire Wire Line
	3950 9750 3950 10000
Wire Wire Line
	3500 10000 2600 10000
Connection ~ 2600 10000
Connection ~ 3950 10000
Wire Wire Line
	2300 1900 2300 1950
Connection ~ 6350 5750
Wire Wire Line
	4050 5750 6350 5750
Wire Notes Line
	9850 7050 5800 7050
Text Notes 5850 7000 0    50   ~ 0
LTC6804/6811
Wire Wire Line
	6600 5850 4500 5850
Wire Wire Line
	4500 5850 4500 6200
Wire Wire Line
	3450 6200 4500 6200
Wire Wire Line
	4600 6600 4600 5950
Wire Wire Line
	4600 5950 6600 5950
Wire Wire Line
	4050 6600 4600 6600
Wire Wire Line
	4700 6050 4700 7050
Wire Wire Line
	3450 7050 4700 7050
Wire Wire Line
	4700 6050 6600 6050
Wire Wire Line
	6600 6150 4800 6150
Wire Wire Line
	4800 6150 4800 7450
Wire Wire Line
	4050 7450 4800 7450
Wire Wire Line
	4900 6250 4900 7900
Wire Wire Line
	3450 7900 4900 7900
Wire Wire Line
	4900 6250 6600 6250
Wire Wire Line
	5000 8300 5000 6350
Wire Wire Line
	5000 6350 6600 6350
Wire Wire Line
	4050 8300 5000 8300
Wire Wire Line
	5100 6450 5100 8750
Wire Wire Line
	5100 6450 6600 6450
Wire Wire Line
	3450 8750 5100 8750
Wire Wire Line
	6600 6550 5200 6550
Wire Wire Line
	5200 6550 5200 9150
Wire Wire Line
	4050 9150 5200 9150
Wire Wire Line
	7500 6550 7750 6550
Wire Wire Line
	7750 6550 7750 6650
Wire Wire Line
	5300 6650 5300 9600
Wire Wire Line
	3450 9600 5300 9600
Wire Wire Line
	5300 6650 7750 6650
Wire Wire Line
	5400 10000 5400 6750
Wire Wire Line
	5400 6750 7850 6750
Wire Wire Line
	7850 6750 7850 6450
Wire Wire Line
	7850 6450 7500 6450
Wire Wire Line
	3950 10000 5400 10000
Wire Wire Line
	4500 5450 4500 5350
Wire Wire Line
	4500 5450 6600 5450
Wire Wire Line
	3450 5350 4500 5350
Wire Wire Line
	4600 4900 4600 5350
Wire Wire Line
	4600 5350 6600 5350
Wire Wire Line
	4050 4900 4600 4900
Wire Wire Line
	4700 5250 4700 4500
Wire Wire Line
	4700 5250 6600 5250
Wire Wire Line
	3450 4500 4700 4500
Wire Wire Line
	6600 5150 4800 5150
Wire Wire Line
	4800 5150 4800 4050
Wire Wire Line
	4050 4050 4800 4050
Wire Wire Line
	4900 5050 4900 3650
Wire Wire Line
	4900 5050 6600 5050
Wire Wire Line
	3450 3650 4900 3650
Wire Wire Line
	6600 4950 5000 4950
Wire Wire Line
	5000 4950 5000 3200
Wire Wire Line
	4050 3200 5000 3200
Wire Wire Line
	5100 4850 5100 2800
Wire Wire Line
	5100 4850 6600 4850
Wire Wire Line
	3450 2800 5100 2800
Wire Wire Line
	6600 4750 5200 4750
Wire Wire Line
	5200 4750 5200 2350
Wire Wire Line
	4050 2350 5200 2350
Wire Wire Line
	5300 4650 5300 1950
Wire Wire Line
	5300 4650 6600 4650
Wire Wire Line
	3450 1950 5300 1950
Wire Wire Line
	3800 1500 4050 1500
Wire Wire Line
	5400 1500 5400 4550
Wire Wire Line
	5400 4550 6350 4550
Wire Wire Line
	4050 1500 5400 1500
Connection ~ 6350 4550
$Comp
L formula:R_100K R?
U 1 1 5CF5A087
P 11000 3750
F 0 "R?" V 11080 3750 50  0000 C CNN
F 1 "R_100K" V 11000 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10930 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11080 3750 50  0001 C CNN
F 4 "DK" H 11000 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11000 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11480 4150 60  0001 C CNN "PurchasingLink"
	1    11000 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5A9EE
P 11200 3750
F 0 "R?" V 11280 3750 50  0000 C CNN
F 1 "R_100K" V 11200 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11130 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11280 3750 50  0001 C CNN
F 4 "DK" H 11200 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11200 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11680 4150 60  0001 C CNN "PurchasingLink"
	1    11200 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5AAFA
P 11400 3750
F 0 "R?" V 11480 3750 50  0000 C CNN
F 1 "R_100K" V 11400 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11330 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11480 3750 50  0001 C CNN
F 4 "DK" H 11400 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11400 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11880 4150 60  0001 C CNN "PurchasingLink"
	1    11400 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5AC08
P 11600 3750
F 0 "R?" V 11680 3750 50  0000 C CNN
F 1 "R_100K" V 11600 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11530 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11680 3750 50  0001 C CNN
F 4 "DK" H 11600 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11600 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12080 4150 60  0001 C CNN "PurchasingLink"
	1    11600 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5AD18
P 11800 3750
F 0 "R?" V 11880 3750 50  0000 C CNN
F 1 "R_100K" V 11800 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11730 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11880 3750 50  0001 C CNN
F 4 "DK" H 11800 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11800 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12280 4150 60  0001 C CNN "PurchasingLink"
	1    11800 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5AE2A
P 12000 3750
F 0 "R?" V 12080 3750 50  0000 C CNN
F 1 "R_100K" V 12000 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11930 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12080 3750 50  0001 C CNN
F 4 "DK" H 12000 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12000 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12480 4150 60  0001 C CNN "PurchasingLink"
	1    12000 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5AF3E
P 12200 3750
F 0 "R?" V 12280 3750 50  0000 C CNN
F 1 "R_100K" V 12200 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12130 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12280 3750 50  0001 C CNN
F 4 "DK" H 12200 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12200 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12680 4150 60  0001 C CNN "PurchasingLink"
	1    12200 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B080
P 12400 3750
F 0 "R?" V 12480 3750 50  0000 C CNN
F 1 "R_100K" V 12400 3700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12330 3750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12480 3750 50  0001 C CNN
F 4 "DK" H 12400 3750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12400 3750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12880 4150 60  0001 C CNN "PurchasingLink"
	1    12400 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B315
P 11000 5300
F 0 "R?" V 11080 5300 50  0000 C CNN
F 1 "R_100K" V 11000 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10930 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11080 5300 50  0001 C CNN
F 4 "DK" H 11000 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11000 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11480 5700 60  0001 C CNN "PurchasingLink"
	1    11000 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B31F
P 11200 5300
F 0 "R?" V 11280 5300 50  0000 C CNN
F 1 "R_100K" V 11200 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11130 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11280 5300 50  0001 C CNN
F 4 "DK" H 11200 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11200 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11680 5700 60  0001 C CNN "PurchasingLink"
	1    11200 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B329
P 11400 5300
F 0 "R?" V 11480 5300 50  0000 C CNN
F 1 "R_100K" V 11400 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11330 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11480 5300 50  0001 C CNN
F 4 "DK" H 11400 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11400 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11880 5700 60  0001 C CNN "PurchasingLink"
	1    11400 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B333
P 11600 5300
F 0 "R?" V 11680 5300 50  0000 C CNN
F 1 "R_100K" V 11600 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11530 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11680 5300 50  0001 C CNN
F 4 "DK" H 11600 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11600 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12080 5700 60  0001 C CNN "PurchasingLink"
	1    11600 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B33D
P 11800 5300
F 0 "R?" V 11880 5300 50  0000 C CNN
F 1 "R_100K" V 11800 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11730 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11880 5300 50  0001 C CNN
F 4 "DK" H 11800 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11800 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12280 5700 60  0001 C CNN "PurchasingLink"
	1    11800 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B347
P 12000 5300
F 0 "R?" V 12080 5300 50  0000 C CNN
F 1 "R_100K" V 12000 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11930 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12080 5300 50  0001 C CNN
F 4 "DK" H 12000 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12000 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12480 5700 60  0001 C CNN "PurchasingLink"
	1    12000 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B351
P 12200 5300
F 0 "R?" V 12280 5300 50  0000 C CNN
F 1 "R_100K" V 12200 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12130 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12280 5300 50  0001 C CNN
F 4 "DK" H 12200 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12200 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12680 5700 60  0001 C CNN "PurchasingLink"
	1    12200 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CF5B35B
P 12400 5300
F 0 "R?" V 12480 5300 50  0000 C CNN
F 1 "R_100K" V 12400 5250 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12330 5300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12480 5300 50  0001 C CNN
F 4 "DK" H 12400 5300 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12400 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12880 5700 60  0001 C CNN "PurchasingLink"
	1    12400 5300
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD091B
P 11000 6750
F 0 "R?" V 11080 6750 50  0000 C CNN
F 1 "R_100K" V 11000 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 10930 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11080 6750 50  0001 C CNN
F 4 "DK" H 11000 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11000 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11480 7150 60  0001 C CNN "PurchasingLink"
	1    11000 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD0925
P 11200 6750
F 0 "R?" V 11280 6750 50  0000 C CNN
F 1 "R_100K" V 11200 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11130 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11280 6750 50  0001 C CNN
F 4 "DK" H 11200 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11200 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11680 7150 60  0001 C CNN "PurchasingLink"
	1    11200 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD092F
P 11400 6750
F 0 "R?" V 11480 6750 50  0000 C CNN
F 1 "R_100K" V 11400 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11330 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11480 6750 50  0001 C CNN
F 4 "DK" H 11400 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11400 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 11880 7150 60  0001 C CNN "PurchasingLink"
	1    11400 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD0939
P 11600 6750
F 0 "R?" V 11680 6750 50  0000 C CNN
F 1 "R_100K" V 11600 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11530 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11680 6750 50  0001 C CNN
F 4 "DK" H 11600 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11600 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12080 7150 60  0001 C CNN "PurchasingLink"
	1    11600 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD0943
P 11800 6750
F 0 "R?" V 11880 6750 50  0000 C CNN
F 1 "R_100K" V 11800 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11730 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 11880 6750 50  0001 C CNN
F 4 "DK" H 11800 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 11800 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12280 7150 60  0001 C CNN "PurchasingLink"
	1    11800 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD094D
P 12000 6750
F 0 "R?" V 12080 6750 50  0000 C CNN
F 1 "R_100K" V 12000 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 11930 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12080 6750 50  0001 C CNN
F 4 "DK" H 12000 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12000 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12480 7150 60  0001 C CNN "PurchasingLink"
	1    12000 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD0957
P 12200 6750
F 0 "R?" V 12280 6750 50  0000 C CNN
F 1 "R_100K" V 12200 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12130 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12280 6750 50  0001 C CNN
F 4 "DK" H 12200 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12200 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12680 7150 60  0001 C CNN "PurchasingLink"
	1    12200 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R?
U 1 1 5CFD0961
P 12400 6750
F 0 "R?" V 12480 6750 50  0000 C CNN
F 1 "R_100K" V 12400 6700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 12330 6750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 12480 6750 50  0001 C CNN
F 4 "DK" H 12400 6750 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 12400 6750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 12880 7150 60  0001 C CNN "PurchasingLink"
	1    12400 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 6250 14250 6250
Connection ~ 14250 6450
Wire Wire Line
	14250 6450 14250 6250
$Comp
L power:GND #PWR?
U 1 1 5C040302
P 6100 4350
F 0 "#PWR?" H 6100 4100 50  0001 C CNN
F 1 "GND" H 6105 4177 50  0000 C CNN
F 2 "" H 6100 4350 50  0001 C CNN
F 3 "" H 6100 4350 50  0001 C CNN
	1    6100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C040484
P 8900 5200
F 0 "#PWR?" H 8900 4950 50  0001 C CNN
F 1 "GND" H 8905 5027 50  0000 C CNN
F 2 "" H 8900 5200 50  0001 C CNN
F 3 "" H 8900 5200 50  0001 C CNN
	1    8900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0414FD
P 8950 6600
F 0 "#PWR?" H 8950 6350 50  0001 C CNN
F 1 "GND" H 8955 6427 50  0000 C CNN
F 2 "" H 8950 6600 50  0001 C CNN
F 3 "" H 8950 6600 50  0001 C CNN
	1    8950 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C041DD9
P 14700 6900
F 0 "#PWR?" H 14700 6650 50  0001 C CNN
F 1 "GND" H 14705 6727 50  0000 C CNN
F 2 "" H 14700 6900 50  0001 C CNN
F 3 "" H 14700 6900 50  0001 C CNN
	1    14700 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C041FD0
P 15600 7000
F 0 "#PWR?" H 15600 6750 50  0001 C CNN
F 1 "GND" H 15605 6827 50  0000 C CNN
F 2 "" H 15600 7000 50  0001 C CNN
F 3 "" H 15600 7000 50  0001 C CNN
	1    15600 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C0428BA
P 11200 2950
F 0 "#PWR?" H 11200 2700 50  0001 C CNN
F 1 "GND" H 11205 2777 50  0000 C CNN
F 2 "" H 11200 2950 50  0001 C CNN
F 3 "" H 11200 2950 50  0001 C CNN
	1    11200 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C042AB1
P 12300 2650
F 0 "#PWR?" H 12300 2400 50  0001 C CNN
F 1 "GND" H 12305 2477 50  0000 C CNN
F 2 "" H 12300 2650 50  0001 C CNN
F 3 "" H 12300 2650 50  0001 C CNN
	1    12300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C042CA8
P 12300 1850
F 0 "#PWR?" H 12300 1600 50  0001 C CNN
F 1 "GND" H 12305 1677 50  0000 C CNN
F 2 "" H 12300 1850 50  0001 C CNN
F 3 "" H 12300 1850 50  0001 C CNN
	1    12300 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C042E9F
P 11200 1950
F 0 "#PWR?" H 11200 1700 50  0001 C CNN
F 1 "GND" H 11205 1777 50  0000 C CNN
F 2 "" H 11200 1950 50  0001 C CNN
F 3 "" H 11200 1950 50  0001 C CNN
	1    11200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	14050 1550 14050 1400
Wire Wire Line
	14050 1400 13800 1400
Wire Wire Line
	14700 6050 14700 6250
Wire Wire Line
	15600 6900 15600 7000
Wire Wire Line
	8050 5250 7500 5250
Text Label 6500 1450 0    50   ~ 0
CELL10_VOLT
Text Label 6500 1850 0    50   ~ 0
CELL9_VOLT
Text Label 6500 2150 0    50   ~ 0
CELL8_VOLT
Text Label 6500 2450 0    50   ~ 0
CELL7_VOLT
Text Label 6500 2750 0    50   ~ 0
CELL6_VOLT
Wire Notes Line
	10200 8100 16300 8100
NoConn ~ 10300 7500
NoConn ~ 10300 7600
NoConn ~ 10300 7700
Wire Notes Line
	16300 3250 16300 8100
Wire Notes Line
	10200 8100 10200 3250
$Comp
L formula:MM_F_VT_16 J?
U 1 1 5C694FD9
P 6250 2150
F 0 "J?" H 6306 3197 60  0000 C CNN
F 1 "MM_F_VT_16" H 6306 3091 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_16" H 6150 2950 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-338068-6" H 6150 3350 60  0001 C CNN
F 4 "TE" H 6350 3550 60  0001 C CNN "MFN"
F 5 "1-338068-6" H 6450 3650 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-338068-6.html" H 6250 3450 60  0001 C CNN "PurchasingLink"
	1    6250 2150
	1    0    0    -1  
$EndComp
Text Label 6500 1350 0    50   ~ 0
MODULE10_TEMP1
Text Label 6500 1550 0    50   ~ 0
MODULE10_TEMP2
Text Label 6500 1750 0    50   ~ 0
MODULE9_TEMP1
Text Label 6500 1950 0    50   ~ 0
MODULE9_TEMP2
Text Label 6500 2050 0    50   ~ 0
MODULE8_TEMP1
Text Label 6500 2250 0    50   ~ 0
MODULE8_TEMP2
Text Label 6500 2350 0    50   ~ 0
MODULE7_TEMP1
Text Label 6500 2550 0    50   ~ 0
MODULE7_TEMP2
Text Label 6500 2650 0    50   ~ 0
MODULE6_TEMP1
Text Label 6500 2850 0    50   ~ 0
MODULE6_TEMP2
Text Label 6500 1650 0    50   ~ 0
V-
Text Label 8600 1650 0    50   ~ 0
CELL5_VOLT
Text Label 8600 1350 0    50   ~ 0
CELL4_VOLT
Text Label 8600 1950 0    50   ~ 0
CELL3_VOLT
Text Label 8600 1050 0    50   ~ 0
CELL2_VOLT
Text Label 8600 2150 0    50   ~ 0
MODULE5_TEMP1
Text Label 8600 2050 0    50   ~ 0
MODULE5_TEMP2
Text Label 8600 1850 0    50   ~ 0
MODULE4_TEMP1
Text Label 8600 1750 0    50   ~ 0
MODULE4_TEMP2
Text Label 8600 1550 0    50   ~ 0
MODULE3_TEMP1
Text Label 8600 1450 0    50   ~ 0
MODULE3_TEMP2
Text Label 8600 1150 0    50   ~ 0
MODULE2_TEMP1
Text Label 8600 950  0    50   ~ 0
MODULE2_TEMP2
Text Label 8600 2350 0    50   ~ 0
MODULE1_TEMP1
Text Label 8600 1250 0    50   ~ 0
MODULE1_TEMP2
Text Label 8600 2550 0    50   ~ 0
V+
Text Label 8600 2250 0    50   ~ 0
CELL1_VOLT
Text Label 8600 2450 0    50   ~ 0
CELL0_VOLT
Text Notes 7400 3650 0    50   ~ 0
Where do v+ and v- go?
Text Label 1750 1500 2    50   ~ 0
CELL10_VOLT
Text Label 1750 2350 2    50   ~ 0
CELL9_VOLT
Text Label 1750 3200 2    50   ~ 0
CELL8_VOLT
Text Label 1750 4050 2    50   ~ 0
CELL7_VOLT
Text Label 1750 4900 2    50   ~ 0
CELL6_VOLT
Text Label 1750 5750 2    50   ~ 0
CELL5_VOLT
Text Label 1750 6600 2    50   ~ 0
CELL4_VOLT
Text Label 1750 7450 2    50   ~ 0
CELL3_VOLT
Text Label 1750 8300 2    50   ~ 0
CELL2_VOLT
Text Label 1750 9150 2    50   ~ 0
CELL1_VOLT
Text Label 1750 10000 2    50   ~ 0
CELL0_VOLT
Text Notes 7950 3200 2    50   ~ 0
Traces from Structural PCB under Peripheral PCB
Text Notes 9800 3200 2    50   ~ 0
Ribbon cable from far side Structural PCB
$Comp
L formula:MM_F_VT_20 J?
U 1 1 5C37400A
P 8450 2050
F 0 "J?" H 8406 3397 60  0000 C CNN
F 1 "MM_F_VT_20" H 8406 3291 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_20" H 8250 3150 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F2-338068-0" H 8350 3250 60  0001 C CNN
F 4 "TE" H 8550 3450 60  0001 C CNN "MFN"
F 5 "2-338068-0" H 8650 3550 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-2-338068-0.html" H 8450 3350 60  0001 C CNN "PurchasingLink"
	1    8450 2050
	1    0    0    -1  
$EndComp
Wire Notes Line
	5800 3400 9850 3400
Wire Notes Line
	9850 3400 9850 7050
Wire Notes Line
	5800 7050 5800 3400
Text Label 8600 2750 0    50   ~ 0
GND
NoConn ~ 8600 2850
Wire Wire Line
	1750 1500 3250 1500
Wire Wire Line
	1750 2350 2600 2350
Wire Wire Line
	1750 3200 2600 3200
Wire Wire Line
	1750 4050 2600 4050
Wire Wire Line
	1750 4900 2600 4900
Wire Wire Line
	1750 5750 2600 5750
Wire Wire Line
	1750 6600 2600 6600
Wire Wire Line
	1750 7450 2600 7450
Wire Wire Line
	1750 8300 2600 8300
Wire Wire Line
	1750 9150 2600 9150
Wire Wire Line
	1750 10000 2600 10000
Text Notes 1800 1400 0    50   ~ 0
Voltage trace fuses moved to Structural PCB
NoConn ~ 10300 7400
Text Label 8600 2650 0    50   ~ 0
VREG
$Comp
L formula:T_LAN_7490100111A T?
U 1 1 5C3D2A9C
P 14050 2350
F 0 "T?" H 14925 3547 60  0000 C CNN
F 1 "T_LAN_7490100111A" H 14925 3441 60  0000 C CNN
F 2 "footprints:T_LAN_7490100111A" H 14450 3300 60  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/7490100111A.pdf" H 14050 2350 60  0001 C CNN
F 4 "DK" H 14400 2850 60  0001 C CNN "MFN"
F 5 "732-5711-1-ND" H 14300 2750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/7490100111A/732-5711-1-ND/4969381" H 14200 2650 60  0001 C CNN "PurchasingLink"
	1    14050 2350
	-1   0    0    -1  
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C318338
P 3050 1700
F 0 "Q?" V 3393 1700 50  0000 C CNN
F 1 "BSS308PE" V 3302 1700 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 1800 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 1750 50  0001 C CNN
F 4 "DK" H 3050 1700 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 1700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 2150 60  0001 C CNN "PurchasingLink"
	1    3050 1700
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C318A70
P 3050 2550
F 0 "Q?" V 3393 2550 50  0000 C CNN
F 1 "BSS308PE" V 3302 2550 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 2650 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 2600 50  0001 C CNN
F 4 "DK" H 3050 2550 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 2550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 3000 60  0001 C CNN "PurchasingLink"
	1    3050 2550
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C318B9C
P 3050 3400
F 0 "Q?" V 3393 3400 50  0000 C CNN
F 1 "BSS308PE" V 3302 3400 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 3500 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 3450 50  0001 C CNN
F 4 "DK" H 3050 3400 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 3400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 3850 60  0001 C CNN "PurchasingLink"
	1    3050 3400
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C318CCE
P 3050 4250
F 0 "Q?" V 3393 4250 50  0000 C CNN
F 1 "BSS308PE" V 3302 4250 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 4350 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 4300 50  0001 C CNN
F 4 "DK" H 3050 4250 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 4250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 4700 60  0001 C CNN "PurchasingLink"
	1    3050 4250
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C319756
P 3050 5100
F 0 "Q?" V 3393 5100 50  0000 C CNN
F 1 "BSS308PE" V 3302 5100 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 5200 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 5150 50  0001 C CNN
F 4 "DK" H 3050 5100 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 5100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 5550 60  0001 C CNN "PurchasingLink"
	1    3050 5100
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C319880
P 3050 5950
F 0 "Q?" V 3393 5950 50  0000 C CNN
F 1 "BSS308PE" V 3302 5950 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 6050 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 6000 50  0001 C CNN
F 4 "DK" H 3050 5950 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 5950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 6400 60  0001 C CNN "PurchasingLink"
	1    3050 5950
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C3199A4
P 3050 6800
F 0 "Q?" V 3393 6800 50  0000 C CNN
F 1 "BSS308PE" V 3302 6800 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 6900 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 6850 50  0001 C CNN
F 4 "DK" H 3050 6800 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 6800 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 7250 60  0001 C CNN "PurchasingLink"
	1    3050 6800
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C319AD2
P 3050 7650
F 0 "Q?" V 3393 7650 50  0000 C CNN
F 1 "BSS308PE" V 3302 7650 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 7750 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 7700 50  0001 C CNN
F 4 "DK" H 3050 7650 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 7650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 8100 60  0001 C CNN "PurchasingLink"
	1    3050 7650
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C319E9C
P 3050 8500
F 0 "Q?" V 3393 8500 50  0000 C CNN
F 1 "BSS308PE" V 3302 8500 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 8600 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 8550 50  0001 C CNN
F 4 "DK" H 3050 8500 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 8500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 8950 60  0001 C CNN "PurchasingLink"
	1    3050 8500
	0    -1   -1   0   
$EndComp
$Comp
L formula:BSS308PE Q?
U 1 1 5C31A15B
P 3050 9350
F 0 "Q?" V 3393 9350 50  0000 C CNN
F 1 "BSS308PE" V 3302 9350 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 3250 9450 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 3250 9400 50  0001 C CNN
F 4 "DK" H 3050 9350 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 3050 9350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 3650 9800 60  0001 C CNN "PurchasingLink"
	1    3050 9350
	0    -1   -1   0   
$EndComp
Text Label 7350 2850 0    50   ~ 0
V-
Text Label 7750 2850 0    50   ~ 0
GND
Wire Wire Line
	7350 2850 7750 2850
Text Notes 7250 2950 0    50   ~ 0
Connect V- to gnd net
Wire Wire Line
	8450 5050 8450 5000
Wire Wire Line
	8450 5000 8350 5000
Connection ~ 8350 5000
Wire Wire Line
	8350 5000 8350 5050
$Comp
L formula:MCP6001T-I-LT U?
U 1 1 5C96E245
P 14800 6550
F 0 "U?" H 14800 6750 50  0000 L CNN
F 1 "MCP6001T-I-LT" H 14800 6350 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 14700 6650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 14800 6750 50  0001 C CNN
F 4 "DK" H 14900 6850 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/LTCT-ND" H 15000 6950 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-LT/MCP6001T-I-LTCT-ND/669499" H 15100 7050 60  0001 C CNN "PurchasingLink"
	1    14800 6550
	1    0    0    -1  
$EndComp
$Comp
L formula:MCP6001T-I-LT U?
U 1 1 5C96E5D2
P 9050 6250
F 0 "U?" H 9050 6450 50  0000 L CNN
F 1 "MCP6001T-I-LT" H 9050 6050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 8950 6350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 9050 6450 50  0001 C CNN
F 4 "DK" H 9150 6550 60  0001 C CNN "MFN"
F 5 "MCP6001T-I/LTCT-ND" H 9250 6650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/microchip-technology/MCP6001T-I-LT/MCP6001T-I-LTCT-ND/669499" H 9350 6750 60  0001 C CNN "PurchasingLink"
	1    9050 6250
	1    0    0    -1  
$EndComp
$Comp
L formula:LTC1380IGN U?
U 1 1 5CAAC736
P 13000 4350
F 0 "U?" H 13000 4800 50  0000 C CNN
F 1 "LTC1380IGN" H 13000 3900 50  0000 C CNN
F 2 "Package_SO:SSOP-16_3.9x4.9mm_P0.635mm" H 12400 4800 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/138093f.pdf" H 12400 4800 50  0001 C CNN
F 4 "DK" H 13300 5100 50  0001 C CNN "MFN"
F 5 "LTC1380IGN#PBF-ND" H 13100 4900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/linear-technology-analog-devices/LTC1380IGN-TRPBF/LTC1380IGN-TRPBFCT-ND/9554873" H 13200 5000 50  0001 C CNN "PurchasingLink"
	1    13000 4350
	1    0    0    -1  
$EndComp
$Comp
L formula:LTC1380IGN U?
U 1 1 5CAAC895
P 13000 5900
F 0 "U?" H 13000 6350 50  0000 C CNN
F 1 "LTC1380IGN" H 13000 5450 50  0000 C CNN
F 2 "Package_SO:SSOP-16_3.9x4.9mm_P0.635mm" H 12400 6350 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/138093f.pdf" H 12400 6350 50  0001 C CNN
F 4 "DK" H 13300 6650 50  0001 C CNN "MFN"
F 5 "LTC1380IGN#PBF-ND" H 13100 6450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/linear-technology-analog-devices/LTC1380IGN-TRPBF/LTC1380IGN-TRPBFCT-ND/9554873" H 13200 6550 50  0001 C CNN "PurchasingLink"
	1    13000 5900
	1    0    0    -1  
$EndComp
$Comp
L formula:LTC1380IGN U?
U 1 1 5CAACBA0
P 13000 7350
F 0 "U?" H 13000 7800 50  0000 C CNN
F 1 "LTC1380IGN" H 13000 6900 50  0000 C CNN
F 2 "Package_SO:SSOP-16_3.9x4.9mm_P0.635mm" H 12400 7800 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/138093f.pdf" H 12400 7800 50  0001 C CNN
F 4 "DK" H 13300 8100 50  0001 C CNN "MFN"
F 5 "LTC1380IGN#PBF-ND" H 13100 7900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/linear-technology-analog-devices/LTC1380IGN-TRPBF/LTC1380IGN-TRPBFCT-ND/9554873" H 13200 8000 50  0001 C CNN "PurchasingLink"
	1    13000 7350
	1    0    0    -1  
$EndComp
$Comp
L formula:isoSPI-Cutout J?
U 1 1 5CB799CD
P 14350 1600
F 0 "J?" H 14400 1800 50  0000 C CNN
F 1 "isoSPI-Cutout" H 14350 1400 50  0000 C CNN
F 2 "footprints:iso_spi_cutout" H 14450 1600 50  0001 C CNN
F 3 "" H 14450 1600 50  0001 C CNN
	1    14350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14050 1550 14200 1550
Wire Wire Line
	14200 1650 14050 1650
Wire Wire Line
	14050 1650 14050 1800
Wire Wire Line
	14050 1800 13800 1800
Wire Wire Line
	14000 2250 14200 2250
Wire Wire Line
	14200 2350 14000 2350
Wire Wire Line
	14000 2350 14000 2500
Wire Wire Line
	14000 2500 13800 2500
$Comp
L formula:isoSPI-Cutout J?
U 1 1 5D033883
P 14350 2300
F 0 "J?" H 14400 2500 50  0000 C CNN
F 1 "isoSPI-Cutout" H 14350 2100 50  0000 C CNN
F 2 "footprints:iso_spi_cutout" H 14450 2300 50  0001 C CNN
F 3 "" H 14450 2300 50  0001 C CNN
	1    14350 2300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA14224
P 15600 6750
F 0 "C?" H 15715 6796 50  0000 L CNN
F 1 "C_10nF" H 15715 6705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 15400 6750 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1076_X7R_HV_AUTO_SMD.pdf" H 15500 6850 50  0001 C CNN
	1    15600 6750
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA13C72
P 4050 1750
F 0 "C?" H 4165 1796 50  0000 L CNN
F 1 "C_10nF" H 4165 1705 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 1750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 1850 50  0001 C CNN
F 4 "DK" H 4050 1950 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 2050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 2150 50  0001 C CNN "PurchasingLink"
	1    4050 1750
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA14139
P 4050 2600
F 0 "C?" H 4165 2646 50  0000 L CNN
F 1 "C_10nF" H 4165 2555 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 2600 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 2700 50  0001 C CNN
F 4 "DK" H 4050 2800 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 2900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 3000 50  0001 C CNN "PurchasingLink"
	1    4050 2600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA1437F
P 4050 3450
F 0 "C?" H 4165 3496 50  0000 L CNN
F 1 "C_10nF" H 4165 3405 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 3450 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 3550 50  0001 C CNN
F 4 "DK" H 4050 3650 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 3750 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 3850 50  0001 C CNN "PurchasingLink"
	1    4050 3450
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA1453F
P 4050 4300
F 0 "C?" H 4165 4346 50  0000 L CNN
F 1 "C_10nF" H 4165 4255 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 4300 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 4400 50  0001 C CNN
F 4 "DK" H 4050 4500 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 4600 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 4700 50  0001 C CNN "PurchasingLink"
	1    4050 4300
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA1470F
P 4050 5150
F 0 "C?" H 4165 5196 50  0000 L CNN
F 1 "C_10nF" H 4165 5105 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 5150 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 5250 50  0001 C CNN
F 4 "DK" H 4050 5350 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 5450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 5550 50  0001 C CNN "PurchasingLink"
	1    4050 5150
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA14A63
P 4050 6000
F 0 "C?" H 4165 6046 50  0000 L CNN
F 1 "C_10nF" H 4165 5955 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 6000 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 6100 50  0001 C CNN
F 4 "DK" H 4050 6200 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 6300 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 6400 50  0001 C CNN "PurchasingLink"
	1    4050 6000
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA14C23
P 4050 6850
F 0 "C?" H 4165 6896 50  0000 L CNN
F 1 "C_10nF" H 4165 6805 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 6850 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 6950 50  0001 C CNN
F 4 "DK" H 4050 7050 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 7150 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 7250 50  0001 C CNN "PurchasingLink"
	1    4050 6850
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA14F0A
P 4050 7700
F 0 "C?" H 4165 7746 50  0000 L CNN
F 1 "C_10nF" H 4165 7655 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 7700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 7800 50  0001 C CNN
F 4 "DK" H 4050 7900 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 8000 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 8100 50  0001 C CNN "PurchasingLink"
	1    4050 7700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA15046
P 4050 8550
F 0 "C?" H 4165 8596 50  0000 L CNN
F 1 "C_10nF" H 4165 8505 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 8550 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 8650 50  0001 C CNN
F 4 "DK" H 4050 8750 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 8850 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 8950 50  0001 C CNN "PurchasingLink"
	1    4050 8550
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA15347
P 4050 9400
F 0 "C?" H 4165 9446 50  0000 L CNN
F 1 "C_10nF" H 4165 9355 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 3850 9400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 3950 9500 50  0001 C CNN
F 4 "DK" H 4050 9600 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 4150 9700 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 4250 9800 50  0001 C CNN "PurchasingLink"
	1    4050 9400
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA169FD
P 11200 1700
F 0 "C?" H 11315 1746 50  0000 L CNN
F 1 "C_10nF" H 11315 1655 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 11000 1700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 11100 1800 50  0001 C CNN
F 4 "DK" H 11200 1900 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 11300 2000 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 11400 2100 50  0001 C CNN "PurchasingLink"
	1    11200 1700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA16B41
P 11200 2700
F 0 "C?" H 11315 2746 50  0000 L CNN
F 1 "C_10nF" H 11315 2655 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 11000 2700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 11100 2800 50  0001 C CNN
F 4 "DK" H 11200 2900 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 11300 3000 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 11400 3100 50  0001 C CNN "PurchasingLink"
	1    11200 2700
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA7B718
P 12300 1600
F 0 "C?" H 12415 1646 50  0000 L CNN
F 1 "C_10nF" H 12415 1555 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 12100 1600 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 12200 1700 50  0001 C CNN
F 4 "DK" H 12300 1800 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 12400 1900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 12500 2000 50  0001 C CNN "PurchasingLink"
	1    12300 1600
	1    0    0    -1  
$EndComp
$Comp
L formula:C_10nF C?
U 1 1 5CA7BAFF
P 12300 2400
F 0 "C?" H 12415 2446 50  0000 L CNN
F 1 "C_10nF" H 12415 2355 50  0000 L CNN
F 2 "footprints:C_0805_OEM" H 12100 2400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/07/23/CL21B103KBANNNC.pdf" H 12200 2500 50  0001 C CNN
F 4 "DK" H 12300 2600 50  0001 C CNN "MFN"
F 5 "1276-1015-1-ND" H 12400 2700 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21B103KBANNNC/1276-1015-1-ND/3889101" H 12500 2800 50  0001 C CNN "PurchasingLink"
	1    12300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 1200 11600 1200
Wire Wire Line
	11000 1900 11600 1900
Wire Wire Line
	11000 2100 11600 2100
$Comp
L formula:R_60.4 R?
U 1 1 5CAF0544
P 11600 1350
F 0 "R?" H 11670 1396 50  0000 L CNN
F 1 "R_60.4" H 11670 1305 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11400 1250 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 11500 1350 50  0001 C CNN
F 4 "DK" H 11600 1450 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 11700 1550 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 11800 1650 50  0001 C CNN "PurchasingLink"
	1    11600 1350
	1    0    0    -1  
$EndComp
Connection ~ 11600 1200
Wire Wire Line
	11600 1200 12050 1200
$Comp
L formula:R_60.4 R?
U 1 1 5CAF069A
P 11600 1750
F 0 "R?" H 11670 1796 50  0000 L CNN
F 1 "R_60.4" H 11670 1705 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11400 1650 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 11500 1750 50  0001 C CNN
F 4 "DK" H 11600 1850 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 11700 1950 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 11800 2050 50  0001 C CNN "PurchasingLink"
	1    11600 1750
	1    0    0    -1  
$EndComp
Connection ~ 11600 1900
Wire Wire Line
	11600 1900 12050 1900
$Comp
L formula:R_60.4 R?
U 1 1 5CAF07D2
P 11600 2250
F 0 "R?" H 11670 2296 50  0000 L CNN
F 1 "R_60.4" H 11670 2205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11400 2150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 11500 2250 50  0001 C CNN
F 4 "DK" H 11600 2350 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 11700 2450 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 11800 2550 50  0001 C CNN "PurchasingLink"
	1    11600 2250
	1    0    0    -1  
$EndComp
Connection ~ 11600 2100
Wire Wire Line
	11600 2100 12550 2100
$Comp
L formula:R_60.4 R?
U 1 1 5CAF0908
P 11600 2700
F 0 "R?" H 11670 2746 50  0000 L CNN
F 1 "R_60.4" H 11670 2655 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 11400 2600 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 11500 2700 50  0001 C CNN
F 4 "DK" H 11600 2800 50  0001 C CNN "MFN"
F 5 "P60.4DACT-ND" H 11700 2900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB60R4V/P60.4DACT-ND/3075204" H 11800 3000 50  0001 C CNN "PurchasingLink"
	1    11600 2700
	1    0    0    -1  
$EndComp
$Comp
L formula:NSS1C201MZ4 Q?
U 1 1 5CAF2883
P 8250 5250
F 0 "Q?" H 8491 5432 50  0000 L CNN
F 1 "NSS1C201MZ4" H 8491 5341 50  0000 L CNN
F 2 "footprints:SOT-223" H 8050 5350 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/NSS1C201MZ4-D.PDF" H 8150 5450 50  0001 C CNN
F 4 "NSS1C201MZ4T3GOSCT-ND " H 8491 5250 50  0001 L CNN "MPN"
F 5 "DK" H 8491 5159 50  0001 L CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/on-semiconductor/NSS1C201MZ4T3G/NSS1C201MZ4T3GOSCT-ND/9087487" H 8491 5068 50  0001 L CNN "PurchasingLink"
	1    8250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1600 2600 1600
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB57D42
P 2600 1900
F 0 "R?" V 2509 1822 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 1822 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 1950 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 1900 50  0001 C CNN
F 4 "DK" H 2550 2150 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 2250 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 1822 50  0001 R CNN "PurchasingLink"
	1    2600 1900
	0    1    1    0   
$EndComp
Connection ~ 2600 1600
Wire Wire Line
	2600 1600 2850 1600
Wire Wire Line
	2300 2450 2600 2450
Wire Wire Line
	2300 3300 2600 3300
Wire Wire Line
	2300 4150 2600 4150
Wire Wire Line
	2300 5000 2600 5000
Wire Wire Line
	2300 5850 2600 5850
Wire Wire Line
	2300 6700 2600 6700
Wire Wire Line
	2300 7550 2600 7550
Wire Wire Line
	2300 8400 2600 8400
Wire Wire Line
	2300 9250 2600 9250
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB58D0D
P 2600 2750
F 0 "R?" V 2509 2672 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 2672 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 2800 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 2750 50  0001 C CNN
F 4 "DK" H 2550 3000 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 3100 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 2672 50  0001 R CNN "PurchasingLink"
	1    2600 2750
	0    1    1    0   
$EndComp
Connection ~ 2600 2450
Wire Wire Line
	2600 2450 2850 2450
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB58E43
P 2600 3600
F 0 "R?" V 2509 3522 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 3522 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 3650 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 3600 50  0001 C CNN
F 4 "DK" H 2550 3850 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 3950 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 3522 50  0001 R CNN "PurchasingLink"
	1    2600 3600
	0    1    1    0   
$EndComp
Connection ~ 2600 3300
Wire Wire Line
	2600 3300 2850 3300
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB58F7B
P 2600 4450
F 0 "R?" V 2509 4372 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 4372 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 4500 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 4450 50  0001 C CNN
F 4 "DK" H 2550 4700 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 4800 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 4372 50  0001 R CNN "PurchasingLink"
	1    2600 4450
	0    1    1    0   
$EndComp
Connection ~ 2600 4150
Wire Wire Line
	2600 4150 2850 4150
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB590B5
P 2600 5300
F 0 "R?" V 2509 5222 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 5222 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 5350 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 5300 50  0001 C CNN
F 4 "DK" H 2550 5550 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 5650 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 5222 50  0001 R CNN "PurchasingLink"
	1    2600 5300
	0    1    1    0   
$EndComp
Connection ~ 2600 5000
Wire Wire Line
	2600 5000 2850 5000
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB59474
P 2600 6150
F 0 "R?" V 2509 6072 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 6072 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 6200 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 6150 50  0001 C CNN
F 4 "DK" H 2550 6400 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 6500 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 6072 50  0001 R CNN "PurchasingLink"
	1    2600 6150
	0    1    1    0   
$EndComp
Connection ~ 2600 5850
Wire Wire Line
	2600 5850 2850 5850
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB596BC
P 2600 7000
F 0 "R?" V 2509 6922 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 6922 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 7050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 7000 50  0001 C CNN
F 4 "DK" H 2550 7250 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 7350 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 6922 50  0001 R CNN "PurchasingLink"
	1    2600 7000
	0    1    1    0   
$EndComp
Connection ~ 2600 6700
Wire Wire Line
	2600 6700 2850 6700
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB5986F
P 2600 7850
F 0 "R?" V 2509 7772 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 7772 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 7900 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 7850 50  0001 C CNN
F 4 "DK" H 2550 8100 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 8200 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 7772 50  0001 R CNN "PurchasingLink"
	1    2600 7850
	0    1    1    0   
$EndComp
Connection ~ 2600 7550
Wire Wire Line
	2600 7550 2850 7550
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB599B7
P 2600 8700
F 0 "R?" V 2509 8622 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 8622 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 8750 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 8700 50  0001 C CNN
F 4 "DK" H 2550 8950 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 9050 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 8622 50  0001 R CNN "PurchasingLink"
	1    2600 8700
	0    1    1    0   
$EndComp
Connection ~ 2600 8400
Wire Wire Line
	2600 8400 2850 8400
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5CB59CC6
P 2600 9550
F 0 "R?" V 2509 9472 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 2600 9472 50  0000 R CNN
F 2 "footprints:PWR163" H 2350 9600 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 2600 9550 50  0001 C CNN
F 4 "DK" H 2550 9800 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 2650 9900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 2691 9472 50  0001 R CNN "PurchasingLink"
	1    2600 9550
	0    1    1    0   
$EndComp
Connection ~ 2600 9250
Wire Wire Line
	2600 9250 2850 9250
$Comp
L formula:24AA01 U?
U 1 1 5CB5A7AB
P 7600 8550
F 0 "U?" H 7575 7963 50  0000 C CNN
F 1 "24AA01" H 7575 8054 50  0000 C CNN
F 2 "footprints:SOT-23-5_OEM_24AA01" H 7500 8650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21711J.pdf" H 7600 8750 50  0001 C CNN
F 4 "CAT24AA01TDI-GT3OSCT-ND " H 7575 8145 50  0001 C CNN "MPN"
F 5 "DK" H 7575 8236 50  0001 C CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/on-semiconductor/CAT24AA01TDI-GT3/CAT24AA01TDI-GT3OSCT-ND/3487510" H 7575 8327 50  0001 C CNN "PurchasingLink"
	1    7600 8550
	-1   0    0    1   
$EndComp
$Comp
L formula:LTC6811-1 U?
U 1 1 5CB5B5C7
P 7100 5350
F 0 "U?" H 7050 6947 50  0000 C CNN
F 1 "LTC6811-1" H 7050 6856 50  0000 C CNN
F 2 "footprints:TSSOP-48_LTC6811-1" H 6450 6600 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/68111fb.pdf" H 6450 6600 50  0001 C CNN
F 4 "DK" H 7050 6765 50  0001 C CNN "MFN"
F 5 "LTC6811IG-1-PBF-ND" H 7050 6674 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/linear-technology-analog-devices/LTC6811IG-1-3ZZTRPBF/LTC6811IG-1-3ZZTRPBFCT-ND/9841747" H 7050 6583 50  0001 C CNN "PurchasingLink"
	1    7100 5350
	1    0    0    -1  
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5CB5C802
P 8150 8150
F 0 "R?" H 8220 8332 50  0000 L CNN
F 1 "R_4.99K" H 8220 8241 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7950 8100 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition01_en.pdf" H 8050 8200 50  0001 C CNN
F 4 "RNCP0805FTD4K99CT-ND " H 8220 8150 50  0001 L CNN "MPN"
F 5 "DK" H 8220 8059 50  0001 L CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RNCP0805FTD4K99/RNCP0805FTD4K99CT-ND/2240591" H 8220 7968 50  0001 L CNN "PurchasingLink"
	1    8150 8150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_4.99K R?
U 1 1 5CB5C93E
P 8500 8150
F 0 "R?" H 8570 8332 50  0000 L CNN
F 1 "R_4.99K" H 8570 8241 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 8300 8100 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition01_en.pdf" H 8400 8200 50  0001 C CNN
F 4 "RNCP0805FTD4K99CT-ND " H 8570 8150 50  0001 L CNN "MPN"
F 5 "DK" H 8570 8059 50  0001 L CNN "MFN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RNCP0805FTD4K99/RNCP0805FTD4K99CT-ND/2240591" H 8570 7968 50  0001 L CNN "PurchasingLink"
	1    8500 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5950 7550 5950
Wire Wire Line
	7550 5950 7550 6050
Connection ~ 7550 6050
Wire Wire Line
	7550 6050 7700 6050
Wire Wire Line
	7950 4550 8000 4550
Wire Wire Line
	8350 4850 8350 5000
Wire Wire Line
	7500 4550 7650 4550
Wire Wire Line
	8000 4450 8000 4550
Wire Wire Line
	7500 4450 8000 4450
Connection ~ 8000 4550
Wire Wire Line
	8000 4550 8050 4550
$EndSCHEMATC
