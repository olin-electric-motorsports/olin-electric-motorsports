EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "LV BMS High Current Path Tester Board"
Date "2021-09-17"
Rev "1"
Comp "Olin Electric Motorsports"
Comment1 "Adi Ramachandran"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:SQM110P06 Q1
U 1 1 613FE2BE
P 2375 1450
F 0 "Q1" V 2668 1450 50  0000 C CNN
F 1 "SQM110P06" V 2577 1450 50  0000 C CNN
F 2 "formula:TO-263-3-TabPin2" H 2325 2050 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 2375 1450 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 2325 1950 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 2425 2150 50  0001 C CNN "MPN"
	1    2375 1450
	0    -1   -1   0   
$EndComp
$Comp
L formula:SQM110P06 Q3
U 1 1 6140094F
P 3225 1450
F 0 "Q3" V 3518 1450 50  0000 C CNN
F 1 "SQM110P06" V 3427 1450 50  0000 C CNN
F 2 "formula:TO-263-3-TabPin2" H 3175 2050 50  0001 C CNN
F 3 "https://www.vishay.com/docs/62784/sqm110p068m9l.pdf" H 3225 1450 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/vishay-siliconix/SQM110P06-8M9L-GE3/7566798" H 3175 1950 50  0001 C CNN "Purchasing Link "
F 5 "SQM110P06-8m9L" H 3275 2150 50  0001 C CNN "MPN"
	1    3225 1450
	0    1    -1   0   
$EndComp
Wire Wire Line
	2575 1400 2725 1400
$Comp
L formula:redcube-7461057 U3
U 1 1 61404306
P 1525 1500
F 0 "U3" H 1650 1375 50  0000 C CNN
F 1 "redcube-7461057" H 1950 1475 50  0000 C CNN
F 2 "formula:redcube_pressfit_6pin" H 1525 1500 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/445/7461057-1723744.pdf" H 1525 1500 50  0001 C CNN
F 4 "7461057" H 1525 1500 50  0001 C CNN "MPN"
	1    1525 1500
	-1   0    0    1   
$EndComp
$Comp
L formula:redcube-7461057 U4
U 1 1 61406058
P 4475 1300
F 0 "U4" H 4550 1200 50  0000 L CNN
F 1 "redcube-7461057" H 4550 1100 50  0000 L CNN
F 2 "formula:redcube_pressfit_6pin" H 4475 1300 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/445/7461057-1723744.pdf" H 4475 1300 50  0001 C CNN
F 4 "7461057" H 4475 1300 50  0001 C CNN "MPN"
	1    4475 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 1400 4325 1400
Wire Wire Line
	1675 1400 2175 1400
$Comp
L formula:R_10K R4
U 1 1 6140D893
P 2725 1550
F 0 "R4" H 2795 1596 50  0000 L CNN
F 1 "R_10K" H 2795 1505 50  0000 L CNN
F 2 "formula:R_0805_OEM" H 2655 1550 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 2805 1550 50  0001 C CNN
F 4 "DK" H 2725 1550 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 2725 1550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3205 1950 60  0001 C CNN "PurchasingLink"
	1    2725 1550
	1    0    0    -1  
$EndComp
Connection ~ 2725 1400
Wire Wire Line
	2725 1400 2825 1400
Wire Wire Line
	2375 1700 2725 1700
Connection ~ 2725 1700
Wire Wire Line
	2725 1700 2900 1700
$Comp
L formula:R_10 R5
U 1 1 614118F3
P 2900 1850
F 0 "R5" H 2970 1896 50  0000 L CNN
F 1 "R_10" H 2970 1805 50  0000 L CNN
F 2 "formula:R_0805_OEM" H 2830 1850 50  0001 C CNN
F 3 "" H 2980 1850 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 2900 1850 60  0001 C CNN "MFN"
F 5 "ERJ-P06F10R0V" H 2900 1850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/en/products/detail/panasonic-electronic-components/ERJ-P06F10R0V/5722444" H 3380 2250 60  0001 C CNN "PurchasingLink"
	1    2900 1850
	1    0    0    -1  
$EndComp
Connection ~ 2900 1700
Wire Wire Line
	2900 1700 3225 1700
$Comp
L formula:MMBF170 Q2
U 1 1 6141242D
P 2800 2325
F 0 "Q2" H 3006 2416 50  0000 L CNN
F 1 "MMBF170" H 3006 2325 50  0000 L CNN
F 2 "formula:SOT-23-3_OEM" H 3000 2250 50  0001 L CIN
F 3 "https://rocelec.widen.net/view/pdf/bjayhgfvod/ONSM-S-A0003587638-1.pdf?t.download=true&u=5oefqw" H 3000 2400 50  0001 L CNN
F 4 "DK" H 3100 2500 50  0001 C CNN "MFN"
F 5 "MMBF170CT-ND" H 3200 2600 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/on-semiconductor/MMBF170/MMBF170CT-ND/244295" H 3006 2234 50  0001 L CNN "PurchasingLink"
	1    2800 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2325 2350 2325
$Comp
L formula:Test_Point_SMD TP1
U 1 1 6141BE4B
P 2200 2325
F 0 "TP1" V 2400 2450 50  0000 C CNN
F 1 "Test_Point_SMD" V 2325 2225 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 2200 2175 50  0001 C CNN
F 3 "" H 2200 2325 50  0001 C CNN
	1    2200 2325
	0    -1   -1   0   
$EndComp
$Comp
L formula:Test_Point_SMD TP4
U 1 1 6141C698
P 3275 1700
F 0 "TP4" V 3224 1878 50  0000 L CNN
F 1 "Test_Point_SMD" V 3315 1878 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3275 1550 50  0001 C CNN
F 3 "" H 3275 1700 50  0001 C CNN
	1    3275 1700
	0    1    1    0   
$EndComp
Connection ~ 3225 1700
$Comp
L formula:Test_Point_SMD TP2
U 1 1 6141DD75
P 2825 1350
F 0 "TP2" H 2775 1550 50  0000 L CNN
F 1 "Test_Point_SMD" H 2575 1675 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 2825 1200 50  0001 C CNN
F 3 "" H 2825 1350 50  0001 C CNN
	1    2825 1350
	1    0    0    -1  
$EndComp
Connection ~ 2825 1400
Wire Wire Line
	2825 1400 3025 1400
Wire Wire Line
	2900 2000 2900 2075
$Comp
L formula:Test_Point_SMD TP3
U 1 1 61422B3F
P 2950 2075
F 0 "TP3" V 2899 2253 50  0000 L CNN
F 1 "Test_Point_SMD" V 2990 2253 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 2950 1925 50  0001 C CNN
F 3 "" H 2950 2075 50  0001 C CNN
	1    2950 2075
	0    1    1    0   
$EndComp
Connection ~ 2900 2075
Wire Wire Line
	2900 2075 2900 2125
$Comp
L power:GND #PWR0101
U 1 1 61438557
P 2900 2800
F 0 "#PWR0101" H 2900 2550 50  0001 C CNN
F 1 "GND" H 2905 2627 50  0000 C CNN
F 2 "" H 2900 2800 50  0001 C CNN
F 3 "" H 2900 2800 50  0001 C CNN
	1    2900 2800
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP5
U 1 1 6144F96F
P 2950 2575
F 0 "TP5" V 3150 2575 50  0000 L CNN
F 1 "Test_Point_SMD" V 3075 2575 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 2950 2425 50  0001 C CNN
F 3 "" H 2950 2575 50  0001 C CNN
	1    2950 2575
	0    1    1    0   
$EndComp
Connection ~ 2900 2625
Text Notes 1275 1275 0    59   ~ 0
PACK SIDE\nRedcube conn\nMAX 16.8V
Text Notes 4250 1275 0    59   ~ 0
LOAD SIDE\nRedcube conn\nMAX 16.8V
Text Notes 575  775  0    71   ~ 0
Bidirectional Discrete High-Side\nDual-PMOS Load switch
Text Notes 3400 2375 0    50   ~ 0
Low side driven NMOS FET \nto open and close load switch
$Comp
L formula:R_100K R1
U 1 1 6147C900
P 2350 2475
F 0 "R1" H 2175 2525 50  0000 L CNN
F 1 "R_100K" H 2000 2425 50  0000 L CNN
F 2 "formula:R_0805_OEM" H 2280 2475 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2430 2475 50  0001 C CNN
F 4 "DK" H 2350 2475 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 2350 2475 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 2830 2875 60  0001 C CNN "PurchasingLink"
	1    2350 2475
	1    0    0    -1  
$EndComp
Connection ~ 2350 2325
Wire Wire Line
	2350 2325 2250 2325
Wire Wire Line
	2350 2625 2900 2625
Connection ~ 2900 2575
Wire Wire Line
	2900 2575 2900 2625
Wire Wire Line
	2900 2525 2900 2575
Wire Wire Line
	2900 2625 2900 2800
Text Label 2900 2775 2    50   ~ 0
GND
Wire Notes Line
	575  800  5375 800 
Wire Notes Line
	5375 800  5375 3100
Wire Notes Line
	5375 3100 575  3100
Wire Notes Line
	575  3100 575  800 
Text Notes 975  2400 0    47   ~ 0
Supply 5V to NMOS gate and \nGND to NMOS source to \nturn on the NMOS, pulling \nPMOS gates to GND and \nbringing PMOS Vgs to -16V\nto turn on both PMOS
Text Notes 3900 3025 0    47   ~ 0
Symmetric Load switch spec'd to 30A \nof continuous current draw\neach PMOS dissipates 6.3W over Rdson\n@30A of draw \ntemp rise from enclosure ~~20C\ntemp rise from trace thickness ~~10C  
Text Notes 625  3050 0    47   ~ 0
LAYOUT NOTE: \nUse at least a 30mm wide external 1.6 oz/ft^2 Cu trace \nor a 80mm wide internal 1.6 oz/ft^2 Cu trace for a temp\nrise of 10C with Tambient=25C & 50mm trace length\nStack both internal & external layers & lay down\nstitching via pattern to be extra safe
Text Notes 825  4800 0    63   ~ 0
README: \nThis board's objective is to test high current path on the new LV BMS boards. \nSpecifically we will be testing the thermals (heat dissipation) from\nthe onboard power MOSFETs along with the load switch circuit\nbehavior. We have already completed LT Spice simulations but would\nlike to verify circuit behavior IRL before spinning up the LV BMS\nboards. \n\nThe battery can both be charged (load side will see +16.8V and pack\nside will be between 11-16.8V), discharged (pack side will see 16.8V &\nload side will see a small load resistor tied to GND), or in an idle state\n(pack side sees 11-16.8V and load side is disconnected). \n\nNMOS gate will be driven by Atemga GPIO on LV BMS board. \n\nSee the LV BMS board in MKV-Boards for more info. 
$EndSCHEMATC
