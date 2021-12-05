EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "Cooling Pressure and Temperature Sensing Board"
Date "2019-11-18"
Rev "2"
Comp "Olin Electric Motorsports"
Comment1 "Laurel Rodriguez Mitton"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1150 1250 0    50   Input ~ 0
SENSE_1-
Text HLabel 1150 1150 0    50   Input ~ 0
SENSE_1+
Text HLabel 1150 1150 2    50   Input ~ 0
SENSE_1_OUT
Text HLabel 2200 1250 0    50   Input ~ 0
SENSE_2-
Text HLabel 2200 1150 0    50   Input ~ 0
SENSE_2+
Text HLabel 2200 1150 2    50   Input ~ 0
SENSE_2_OUT
Text HLabel 3250 1250 0    50   Input ~ 0
SENSE_3-
Text HLabel 3250 1150 0    50   Input ~ 0
SENSE_3+
Text HLabel 3250 1150 2    50   Input ~ 0
SENSE_3_OUT
Text HLabel 4300 1250 0    50   Input ~ 0
SENSE_4-
Text HLabel 4300 1150 0    50   Input ~ 0
SENSE_4+
Text HLabel 4300 1150 2    50   Input ~ 0
SENSE_4_OUT
Text HLabel 5350 1250 0    50   Input ~ 0
SENSE_5-
Text HLabel 5350 1150 0    50   Input ~ 0
SENSE_5+
Text HLabel 5350 1150 2    50   Input ~ 0
SENSE_5_OUT
Text HLabel 6400 1250 0    50   Input ~ 0
SENSE_6-
Text HLabel 6400 1150 0    50   Input ~ 0
SENSE_6+
Text HLabel 6400 1150 2    50   Input ~ 0
SENSE_6_OUT
Text HLabel 7450 1250 0    50   Input ~ 0
SENSE_7-
Text HLabel 7450 1150 0    50   Input ~ 0
SENSE_7+
Text HLabel 7450 1150 2    50   Input ~ 0
SENSE_7_OUT
$Comp
L power:VCC #PWR?
U 1 1 615E9EC8
P 1150 850
F 0 "#PWR?" H 1150 700 50  0001 C CNN
F 1 "VCC" H 1167 1023 50  0000 C CNN
F 2 "" H 1150 850 50  0001 C CNN
F 3 "" H 1150 850 50  0001 C CNN
	1    1150 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R11
U 1 1 615E9EC9
P 1150 1000
F 0 "R11" H 1220 1046 50  0000 L CNN
F 1 "R_10K" H 1220 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 1080 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 1230 1000 50  0001 C CNN
F 4 "DK" H 1150 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 1150 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 1630 1400 60  0001 C CNN "PurchasingLink"
	1    1150 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615E9ECA
P 1150 1250
F 0 "#PWR?" H 1150 1000 50  0001 C CNN
F 1 "GND" H 1155 1077 50  0000 C CNN
F 2 "" H 1150 1250 50  0001 C CNN
F 3 "" H 1150 1250 50  0001 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E593C0F
P 2200 850
F 0 "#PWR?" H 2200 700 50  0001 C CNN
F 1 "VCC" H 2217 1023 50  0000 C CNN
F 2 "" H 2200 850 50  0001 C CNN
F 3 "" H 2200 850 50  0001 C CNN
	1    2200 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R12
U 1 1 5E593C1C
P 2200 1000
F 0 "R12" H 2270 1046 50  0000 L CNN
F 1 "R_10K" H 2270 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2130 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 2280 1000 50  0001 C CNN
F 4 "DK" H 2200 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 2200 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 2680 1400 60  0001 C CNN "PurchasingLink"
	1    2200 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E593C26
P 2200 1250
F 0 "#PWR?" H 2200 1000 50  0001 C CNN
F 1 "GND" H 2205 1077 50  0000 C CNN
F 2 "" H 2200 1250 50  0001 C CNN
F 3 "" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E595505
P 3250 850
F 0 "#PWR?" H 3250 700 50  0001 C CNN
F 1 "VCC" H 3267 1023 50  0000 C CNN
F 2 "" H 3250 850 50  0001 C CNN
F 3 "" H 3250 850 50  0001 C CNN
	1    3250 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R13
U 1 1 5E595512
P 3250 1000
F 0 "R13" H 3320 1046 50  0000 L CNN
F 1 "R_10K" H 3320 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3180 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3330 1000 50  0001 C CNN
F 4 "DK" H 3250 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3250 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3730 1400 60  0001 C CNN "PurchasingLink"
	1    3250 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E59551C
P 3250 1250
F 0 "#PWR?" H 3250 1000 50  0001 C CNN
F 1 "GND" H 3255 1077 50  0000 C CNN
F 2 "" H 3250 1250 50  0001 C CNN
F 3 "" H 3250 1250 50  0001 C CNN
	1    3250 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E598727
P 4300 850
F 0 "#PWR?" H 4300 700 50  0001 C CNN
F 1 "VCC" H 4317 1023 50  0000 C CNN
F 2 "" H 4300 850 50  0001 C CNN
F 3 "" H 4300 850 50  0001 C CNN
	1    4300 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R14
U 1 1 615E9ED2
P 4300 1000
F 0 "R14" H 4370 1046 50  0000 L CNN
F 1 "R_10K" H 4370 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 4230 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 4380 1000 50  0001 C CNN
F 4 "DK" H 4300 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 4300 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 4780 1400 60  0001 C CNN "PurchasingLink"
	1    4300 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615E9ED3
P 4300 1250
F 0 "#PWR?" H 4300 1000 50  0001 C CNN
F 1 "GND" H 4305 1077 50  0000 C CNN
F 2 "" H 4300 1250 50  0001 C CNN
F 3 "" H 4300 1250 50  0001 C CNN
	1    4300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 615E9ED4
P 5350 850
F 0 "#PWR?" H 5350 700 50  0001 C CNN
F 1 "VCC" H 5367 1023 50  0000 C CNN
F 2 "" H 5350 850 50  0001 C CNN
F 3 "" H 5350 850 50  0001 C CNN
	1    5350 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R15
U 1 1 615E9ED5
P 5350 1000
F 0 "R15" H 5420 1046 50  0000 L CNN
F 1 "R_10K" H 5420 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5280 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 5430 1000 50  0001 C CNN
F 4 "DK" H 5350 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 5350 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 5830 1400 60  0001 C CNN "PurchasingLink"
	1    5350 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5B3371
P 5350 1250
F 0 "#PWR?" H 5350 1000 50  0001 C CNN
F 1 "GND" H 5355 1077 50  0000 C CNN
F 2 "" H 5350 1250 50  0001 C CNN
F 3 "" H 5350 1250 50  0001 C CNN
	1    5350 1250
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R16
U 1 1 5E5B48C4
P 6400 1000
F 0 "R16" H 6470 1046 50  0000 L CNN
F 1 "R_10K" H 6470 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 6330 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6480 1000 50  0001 C CNN
F 4 "DK" H 6400 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6400 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6880 1400 60  0001 C CNN "PurchasingLink"
	1    6400 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615E9ED8
P 6400 1250
F 0 "#PWR?" H 6400 1000 50  0001 C CNN
F 1 "GND" H 6405 1077 50  0000 C CNN
F 2 "" H 6400 1250 50  0001 C CNN
F 3 "" H 6400 1250 50  0001 C CNN
	1    6400 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E5B7C89
P 7450 850
F 0 "#PWR?" H 7450 700 50  0001 C CNN
F 1 "VCC" H 7467 1023 50  0000 C CNN
F 2 "" H 7450 850 50  0001 C CNN
F 3 "" H 7450 850 50  0001 C CNN
	1    7450 850 
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R17
U 1 1 5E5B7C96
P 7450 1000
F 0 "R17" H 7520 1046 50  0000 L CNN
F 1 "R_10K" H 7520 955 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 7380 1000 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 7530 1000 50  0001 C CNN
F 4 "DK" H 7450 1000 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 7450 1000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 7930 1400 60  0001 C CNN "PurchasingLink"
	1    7450 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5B7CA0
P 7450 1250
F 0 "#PWR?" H 7450 1000 50  0001 C CNN
F 1 "GND" H 7455 1077 50  0000 C CNN
F 2 "" H 7450 1250 50  0001 C CNN
F 3 "" H 7450 1250 50  0001 C CNN
	1    7450 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 615E9EDC
P 6400 850
F 0 "#PWR?" H 6400 700 50  0001 C CNN
F 1 "VCC" H 6417 1023 50  0000 C CNN
F 2 "" H 6400 850 50  0001 C CNN
F 3 "" H 6400 850 50  0001 C CNN
	1    6400 850 
	1    0    0    -1  
$EndComp
$EndSCHEMATC
