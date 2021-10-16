EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 20
Title "Wheel Speed Sensing"
Date "2019-11-17"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Wesley Soo-Hoo"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6550 2880 6550 2780
$Comp
L formula:R_10K R2002
U 1 1 616A5529
P 5550 3280
AR Path="/60A3DAC4/616A5529" Ref="R2002"  Part="1" 
AR Path="/60A3D93E/616A5529" Ref="R?"  Part="1" 
F 0 "R2002" H 5620 3326 50  0000 L CNN
F 1 "R_10K" H 5620 3235 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5480 3280 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5630 3280 50  0001 C CNN
F 4 "DK" H 5550 3280 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5550 3280 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6030 3680 60  0001 C CNN "PurchasingLink"
	1    5550 3280
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616A552F
P 5550 3530
AR Path="/60A3DAC4/616A552F" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/616A552F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 3280 50  0001 C CNN
F 1 "GND" H 5555 3357 50  0000 C CNN
F 2 "" H 5550 3530 50  0001 C CNN
F 3 "" H 5550 3530 50  0001 C CNN
	1    5550 3530
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3530 5550 3430
Wire Wire Line
	5550 3130 5550 2880
Connection ~ 5550 2880
$Comp
L formula:R_10K R2005
U 1 1 616A553C
P 5550 4630
AR Path="/60A3DAC4/616A553C" Ref="R2005"  Part="1" 
AR Path="/60A3D93E/616A553C" Ref="R?"  Part="1" 
F 0 "R2005" H 5620 4676 50  0000 L CNN
F 1 "R_10K" H 5620 4585 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5480 4630 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5630 4630 50  0001 C CNN
F 4 "DK" H 5550 4630 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5550 4630 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6030 5030 60  0001 C CNN "PurchasingLink"
	1    5550 4630
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616A5542
P 5550 4880
AR Path="/60A3DAC4/616A5542" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/616A5542" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 4630 50  0001 C CNN
F 1 "GND" H 5555 4707 50  0000 C CNN
F 2 "" H 5550 4880 50  0001 C CNN
F 3 "" H 5550 4880 50  0001 C CNN
	1    5550 4880
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4480 5550 4230
Connection ~ 5550 4230
Text Notes 5550 2550 0    89   ~ 0
CONFIG
Wire Wire Line
	6350 2880 6550 2880
Wire Wire Line
	6050 2880 5850 2880
$Comp
L formula:LED_0805 D2001
U 1 1 616A5553
P 6100 3080
AR Path="/60A3DAC4/616A5553" Ref="D2001"  Part="1" 
AR Path="/60A3D93E/616A5553" Ref="D?"  Part="1" 
F 0 "D2001" H 6100 2980 50  0000 C CNN
F 1 "LED_0805" H 6100 3180 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 6000 3080 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6100 3180 50  0001 C CNN
F 4 "DK" H 6100 3080 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6100 3080 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6500 3580 60  0001 C CNN "PurchasingLink"
	1    6100 3080
	-1   0    0    1   
$EndComp
Wire Wire Line
	5950 3080 5850 3080
Wire Wire Line
	5850 3080 5850 2880
Connection ~ 5850 2880
Wire Wire Line
	5850 2880 5550 2880
Wire Wire Line
	6450 3130 6450 3080
Wire Wire Line
	6450 3080 6250 3080
$Comp
L power:GND #PWR?
U 1 1 616A555F
P 6450 3530
AR Path="/60A3DAC4/616A555F" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/616A555F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 3280 50  0001 C CNN
F 1 "GND" H 6455 3357 50  0000 C CNN
F 2 "" H 6450 3530 50  0001 C CNN
F 3 "" H 6450 3530 50  0001 C CNN
	1    6450 3530
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3530 6450 3430
$Comp
L formula:LED_0805 D2002
U 1 1 616A5569
P 6100 4430
AR Path="/60A3DAC4/616A5569" Ref="D2002"  Part="1" 
AR Path="/60A3D93E/616A5569" Ref="D?"  Part="1" 
F 0 "D2002" H 6100 4330 50  0000 C CNN
F 1 "LED_0805" H 6100 4530 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 6000 4430 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 6100 4530 50  0001 C CNN
F 4 "DK" H 6100 4430 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 6100 4430 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 6500 4930 60  0001 C CNN "PurchasingLink"
	1    6100 4430
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 4230 5850 4430
Wire Wire Line
	5850 4430 5950 4430
Wire Wire Line
	5850 4230 5550 4230
Wire Wire Line
	6450 4480 6450 4430
Wire Wire Line
	6450 4430 6250 4430
$Comp
L power:GND #PWR?
U 1 1 616A5575
P 6450 4880
AR Path="/60A3DAC4/616A5575" Ref="#PWR?"  Part="1" 
AR Path="/60A3D93E/616A5575" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 4630 50  0001 C CNN
F 1 "GND" H 6455 4707 50  0000 C CNN
F 2 "" H 6450 4880 50  0001 C CNN
F 3 "" H 6450 4880 50  0001 C CNN
	1    6450 4880
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4880 6450 4780
Wire Wire Line
	5550 4880 5550 4780
$Comp
L formula:R_200 R2006
U 1 1 616A558C
P 6450 4630
AR Path="/60A3DAC4/616A558C" Ref="R2006"  Part="1" 
AR Path="/60A3D93E/616A558C" Ref="R?"  Part="1" 
F 0 "R2006" H 6520 4676 50  0000 L CNN
F 1 "R_200" H 6520 4585 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6380 4630 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6530 4630 50  0001 C CNN
F 4 "DK" H 6450 4630 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6450 4630 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6930 5030 60  0001 C CNN "PurchasingLink"
	1    6450 4630
	1    0    0    -1  
$EndComp
$Comp
L formula:R_200 R2003
U 1 1 616A5595
P 6450 3280
AR Path="/60A3DAC4/616A5595" Ref="R2003"  Part="1" 
AR Path="/60A3D93E/616A5595" Ref="R?"  Part="1" 
F 0 "R2003" H 6520 3326 50  0000 L CNN
F 1 "R_200" H 6520 3235 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6380 3280 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6530 3280 50  0001 C CNN
F 4 "DK" H 6450 3280 60  0001 C CNN "MFN"
F 5 "RMCF0805JT200RCT-ND" H 6450 3280 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RMCF0805JT200RCT-ND" H 6930 3680 60  0001 C CNN "PurchasingLink"
	1    6450 3280
	1    0    0    -1  
$EndComp
Text GLabel 6550 2780 1    50   Input ~ 0
5V
Text GLabel 4815 2880 0    50   Input ~ 0
FRONT_SENSE
Text GLabel 5025 4230 0    50   Input ~ 0
LEFT_SENSE
$Comp
L formula:R_0 R2001
U 1 1 616B605B
P 6200 2880
F 0 "R2001" V 5993 2880 50  0000 C CNN
F 1 "R_0" V 6084 2880 50  0000 C CNN
F 2 "footprints:R_0603_1608Metric" H 6130 2880 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 6280 2880 50  0001 C CNN
F 4 "DK" H 6200 2880 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 6200 2880 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 6680 3280 60  0001 C CNN "PurchasingLink"
	1    6200 2880
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 4230 6550 4130
Wire Wire Line
	6350 4230 6550 4230
Wire Wire Line
	6050 4230 5850 4230
Text GLabel 6550 4130 1    50   Input ~ 0
5V
$Comp
L formula:R_0 R2004
U 1 1 616D00F0
P 6200 4230
F 0 "R2004" V 5993 4230 50  0000 C CNN
F 1 "R_0" V 6084 4230 50  0000 C CNN
F 2 "footprints:R_0603_1608Metric" H 6130 4230 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+AOA0001+ERJ3GEY0R00V+7+WW" H 6280 4230 50  0001 C CNN
F 4 "DK" H 6200 4230 60  0001 C CNN "MFN"
F 5 "P0.0GCT-ND" H 6200 4230 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEY0R00V/P0.0GCT-ND/134711" H 6680 4630 60  0001 C CNN "PurchasingLink"
	1    6200 4230
	0    1    1    0   
$EndComp
Connection ~ 5850 4230
$Comp
L formula:Test_Point_SMD TP?
U 1 1 6194549B
P 5250 4000
AR Path="/6194549B" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/6194549B" Ref="TP?"  Part="1" 
AR Path="/60A3DAC4/6194549B" Ref="TP?"  Part="1" 
F 0 "TP?" H 5328 4088 50  0000 L CNN
F 1 "Test_Point_SMD" H 5328 3997 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5250 3850 50  0001 C CNN
F 3 "" H 5250 4000 50  0001 C CNN
	1    5250 4000
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP?
U 1 1 61948807
P 5175 2725
AR Path="/61948807" Ref="TP?"  Part="1" 
AR Path="/60A3D93E/61948807" Ref="TP?"  Part="1" 
AR Path="/60A3DAC4/61948807" Ref="TP?"  Part="1" 
F 0 "TP?" H 5253 2813 50  0000 L CNN
F 1 "Test_Point_SMD" H 5253 2722 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5175 2575 50  0001 C CNN
F 3 "" H 5175 2725 50  0001 C CNN
	1    5175 2725
	1    0    0    -1  
$EndComp
Wire Wire Line
	5175 2880 5175 2775
Wire Wire Line
	5175 2880 5550 2880
Wire Wire Line
	4815 2880 5175 2880
Connection ~ 5175 2880
Wire Wire Line
	5025 4230 5250 4230
Wire Wire Line
	5250 4050 5250 4230
Connection ~ 5250 4230
Wire Wire Line
	5250 4230 5550 4230
$EndSCHEMATC
