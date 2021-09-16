EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 16535 23386 portrait
encoding utf-8
Sheet 1 1
Title "BMS Sensing"
Date "2019-09-18"
Rev ""
Comp "Olin Electric Motorsports"
Comment1 "Vienna Scheyer"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L formula:200mA_Fuse F16
U 1 1 5F68FA8B
P 5550 3350
F 0 "F16" H 5550 3450 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 3250 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 3350 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 3350 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 3575 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 3574 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 3483 50  0001 C CNN "MFN"
	1    5550 3350
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT133
U 1 1 5F696EB9
P 7500 4950
F 0 "RT133" H 7750 5100 50  0000 C CNN
F 1 "Thermistor" H 7500 5208 50  0000 C CNN
F 2 "Thermistor" H 7520 4610 50  0001 C CNN
F 3 "" H 7500 4950 50  0001 C CNN
	1    7500 4950
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT132
U 1 1 5F696F77
P 7500 5500
F 0 "RT132" H 7750 5650 50  0000 C CNN
F 1 "Thermistor" H 7500 5758 50  0000 C CNN
F 2 "Thermistor" H 7520 5160 50  0001 C CNN
F 3 "" H 7500 5500 50  0001 C CNN
	1    7500 5500
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT131
U 1 1 5F6973BA
P 7500 6050
F 0 "RT131" H 7750 6200 50  0000 C CNN
F 1 "Thermistor" H 7500 6308 50  0000 C CNN
F 2 "Thermistor" H 7520 5710 50  0001 C CNN
F 3 "" H 7500 6050 50  0001 C CNN
	1    7500 6050
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT93
U 1 1 5F69749A
P 7500 6600
F 0 "RT93" H 7750 6750 50  0000 C CNN
F 1 "Thermistor" H 7500 6858 50  0000 C CNN
F 2 "Thermistor" H 7520 6260 50  0001 C CNN
F 3 "" H 7500 6600 50  0001 C CNN
	1    7500 6600
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT92
U 1 1 5F69750E
P 7500 7150
F 0 "RT92" H 7750 7300 50  0000 C CNN
F 1 "Thermistor" H 7500 7408 50  0000 C CNN
F 2 "Thermistor" H 7520 6810 50  0001 C CNN
F 3 "" H 7500 7150 50  0001 C CNN
	1    7500 7150
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT91
U 1 1 5F697580
P 7500 7700
F 0 "RT91" H 7750 7850 50  0000 C CNN
F 1 "Thermistor" H 7500 7958 50  0000 C CNN
F 2 "Thermistor" H 7520 7360 50  0001 C CNN
F 3 "" H 7500 7700 50  0001 C CNN
	1    7500 7700
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT53
U 1 1 5F697FB1
P 7500 8250
F 0 "RT53" H 7750 8400 50  0000 C CNN
F 1 "Thermistor" H 7500 8508 50  0000 C CNN
F 2 "Thermistor" H 7520 7910 50  0001 C CNN
F 3 "" H 7500 8250 50  0001 C CNN
	1    7500 8250
	1    0    0    -1  
$EndComp
Text Label 7200 8250 2    50   ~ 0
C5_T3
Text Label 7200 7700 2    50   ~ 0
C9_T1
Text Label 7200 7150 2    50   ~ 0
C9_T2
Text Label 7200 6600 2    50   ~ 0
C9_T3
Text Label 7200 6050 2    50   ~ 0
C13_T1
Text Label 7200 5500 2    50   ~ 0
C13_T2
Text Label 7200 4950 2    50   ~ 0
C13_T3
Text Label 8000 11400 0    50   ~ 0
GND1
Wire Wire Line
	7800 4950 8000 4950
Wire Wire Line
	8000 4950 8000 5500
Wire Wire Line
	7800 5500 8000 5500
Connection ~ 8000 5500
Wire Wire Line
	8000 5500 8000 6050
Wire Wire Line
	7800 6050 8000 6050
Connection ~ 8000 6050
Wire Wire Line
	8000 6050 8000 6600
Wire Wire Line
	7800 6600 8000 6600
Connection ~ 8000 6600
Wire Wire Line
	8000 6600 8000 7150
Wire Wire Line
	7800 7150 8000 7150
Connection ~ 8000 7150
Wire Wire Line
	8000 7150 8000 7700
Wire Wire Line
	7800 7700 8000 7700
Connection ~ 8000 7700
Wire Wire Line
	7800 8250 8000 8250
Connection ~ 8000 8250
Wire Wire Line
	8000 7700 8000 8250
$Comp
L formula:Thermistor RT52
U 1 1 5D830BA4
P 7500 8800
F 0 "RT52" H 7750 8950 50  0000 C CNN
F 1 "Thermistor" H 7500 9058 50  0000 C CNN
F 2 "Thermistor" H 7520 8460 50  0001 C CNN
F 3 "" H 7500 8800 50  0001 C CNN
	1    7500 8800
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT51
U 1 1 5D830C22
P 7500 9350
F 0 "RT51" H 7750 9500 50  0000 C CNN
F 1 "Thermistor" H 7500 9608 50  0000 C CNN
F 2 "Thermistor" H 7520 9010 50  0001 C CNN
F 3 "" H 7500 9350 50  0001 C CNN
	1    7500 9350
	1    0    0    -1  
$EndComp
$Comp
L formula:Thermistor RT13
U 1 1 5D830CA2
P 7500 9900
F 0 "RT13" H 7750 10050 50  0000 C CNN
F 1 "Thermistor" H 7500 10158 50  0000 C CNN
F 2 "Thermistor" H 7520 9560 50  0001 C CNN
F 3 "" H 7500 9900 50  0001 C CNN
	1    7500 9900
	1    0    0    -1  
$EndComp
Text Label 7200 8800 2    50   ~ 0
C5_T2
Text Label 7200 9350 2    50   ~ 0
C5_T1
Text Label 7200 9900 2    50   ~ 0
C1_T3
$Comp
L formula:Thermistor RT12
U 1 1 5D83159E
P 7500 10450
F 0 "RT12" H 7750 10600 50  0000 C CNN
F 1 "Thermistor" H 7500 10708 50  0000 C CNN
F 2 "Thermistor" H 7520 10110 50  0001 C CNN
F 3 "" H 7500 10450 50  0001 C CNN
	1    7500 10450
	1    0    0    -1  
$EndComp
Text Label 7200 10450 2    50   ~ 0
C1_T2
$Comp
L formula:Thermistor RT11
U 1 1 5D83177F
P 7500 11000
F 0 "RT11" H 7750 11150 50  0000 C CNN
F 1 "Thermistor" H 7500 11258 50  0000 C CNN
F 2 "Thermistor" H 7520 10660 50  0001 C CNN
F 3 "" H 7500 11000 50  0001 C CNN
	1    7500 11000
	1    0    0    -1  
$EndComp
Text Label 7200 11000 2    50   ~ 0
C1_T1
Wire Wire Line
	7800 11000 8000 11000
Connection ~ 8000 11000
Wire Wire Line
	8000 11000 8000 11400
Wire Wire Line
	7800 10450 8000 10450
Wire Wire Line
	8000 8250 8000 8800
Connection ~ 8000 10450
Wire Wire Line
	8000 10450 8000 11000
Wire Wire Line
	7800 9900 8000 9900
Connection ~ 8000 9900
Wire Wire Line
	8000 9900 8000 10450
Wire Wire Line
	7800 9350 8000 9350
Connection ~ 8000 9350
Wire Wire Line
	8000 9350 8000 9900
Wire Wire Line
	7800 8800 8000 8800
Connection ~ 8000 8800
Wire Wire Line
	8000 8800 8000 9350
Wire Wire Line
	5000 3950 5000 4050
Wire Wire Line
	4800 4400 4800 4350
NoConn ~ 4600 4350
Wire Wire Line
	4350 4650 4350 4700
$Comp
L formula:LED_0805 D?
U 1 1 5DB8765E
P 4050 4200
AR Path="/5DB8402B/5DB8765E" Ref="D?"  Part="1" 
AR Path="/5DB8765E" Ref="D16"  Part="1" 
F 0 "D16" V 4050 4300 50  0000 C CNN
F 1 "LED_0805" V 3950 4450 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 4200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 4300 50  0001 C CNN
F 4 "DK" H 4050 4200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 4700 60  0001 C CNN "PurchasingLink"
	1    4050 4200
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DB87668
P 4050 4550
AR Path="/5DB8402B/5DB87668" Ref="R?"  Part="1" 
AR Path="/5DB87668" Ref="R46"  Part="1" 
F 0 "R46" V 4130 4550 50  0000 C CNN
F 1 "R_475" V 3950 4550 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 4550 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 4550 50  0001 C CNN
F 4 "DK" H 4050 4550 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 4550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 4950 60  0001 C CNN "PurchasingLink"
	1    4050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4700 4350 4700
Wire Wire Line
	4350 5200 4350 5300
Connection ~ 4350 5300
Wire Wire Line
	4050 4350 4050 4400
Text Label 5950 3350 0    50   ~ 0
C16
Text Label 5950 5300 0    50   ~ 0
C14
Wire Wire Line
	3500 3350 3600 3350
Wire Wire Line
	3500 5300 4350 5300
$Comp
L formula:BSS308PE Q?
U 1 1 5DB876CE
P 4800 4150
AR Path="/5DB8402B/5DB876CE" Ref="Q?"  Part="1" 
AR Path="/5DB876CE" Ref="Q16"  Part="1" 
F 0 "Q16" V 5143 4150 50  0000 C CNN
F 1 "BSS308PE" V 5052 4150 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 4250 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 4200 50  0001 C CNN
F 4 "DK" H 4800 4150 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 4150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 4600 60  0001 C CNN "PurchasingLink"
	1    4800 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 4050 4350 4050
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DB876ED
P 4350 4350
AR Path="/5DB8402B/5DB876ED" Ref="R?"  Part="1" 
AR Path="/5DB876ED" Ref="R16"  Part="1" 
F 0 "R16" V 4259 4272 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 4272 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 4400 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 4350 50  0001 C CNN
F 4 "DK" H 4300 4600 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 4700 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 4272 50  0001 R CNN "PurchasingLink"
	1    4350 4350
	0    1    1    0   
$EndComp
Connection ~ 4350 4050
Wire Wire Line
	4350 4050 4600 4050
Wire Wire Line
	5000 5900 5000 6000
Wire Wire Line
	4800 6350 4800 6300
NoConn ~ 4600 6300
Wire Wire Line
	4350 6600 4350 6650
$Comp
L formula:LED_0805 D?
U 1 1 5DBA4B5D
P 4050 6150
AR Path="/5DB8402B/5DBA4B5D" Ref="D?"  Part="1" 
AR Path="/5DBA4B5D" Ref="D14"  Part="1" 
F 0 "D14" V 4050 6250 50  0000 C CNN
F 1 "LED_0805" V 3950 6400 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 6150 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 6250 50  0001 C CNN
F 4 "DK" H 4050 6150 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 6650 60  0001 C CNN "PurchasingLink"
	1    4050 6150
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBA4B67
P 4050 6500
AR Path="/5DB8402B/5DBA4B67" Ref="R?"  Part="1" 
AR Path="/5DBA4B67" Ref="R44"  Part="1" 
F 0 "R44" V 4130 6500 50  0000 C CNN
F 1 "R_475" V 3950 6500 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 6500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 6500 50  0001 C CNN
F 4 "DK" H 4050 6500 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 6500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 6900 60  0001 C CNN "PurchasingLink"
	1    4050 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6300 4050 6350
Wire Wire Line
	4050 6650 4350 6650
Text Label 5950 7250 0    50   ~ 0
C12
$Comp
L formula:BSS308PE Q?
U 1 1 5DBA4B79
P 4800 6100
AR Path="/5DB8402B/5DBA4B79" Ref="Q?"  Part="1" 
AR Path="/5DBA4B79" Ref="Q14"  Part="1" 
F 0 "Q14" V 5143 6100 50  0000 C CNN
F 1 "BSS308PE" V 5052 6100 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 6200 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 6150 50  0001 C CNN
F 4 "DK" H 4800 6100 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 6100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 6550 60  0001 C CNN "PurchasingLink"
	1    4800 6100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 6000 4350 6000
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBA4B84
P 4350 6300
AR Path="/5DB8402B/5DBA4B84" Ref="R?"  Part="1" 
AR Path="/5DBA4B84" Ref="R14"  Part="1" 
F 0 "R14" V 4259 6222 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 6222 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 6350 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 6300 50  0001 C CNN
F 4 "DK" H 4300 6550 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 6650 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 6222 50  0001 R CNN "PurchasingLink"
	1    4350 6300
	0    1    1    0   
$EndComp
Connection ~ 4350 6000
Wire Wire Line
	4350 6000 4600 6000
Wire Wire Line
	5000 7850 5000 7950
Wire Wire Line
	4800 8300 4800 8250
NoConn ~ 4600 8250
Wire Wire Line
	4350 8550 4350 8600
$Comp
L formula:LED_0805 D?
U 1 1 5DBA986D
P 4050 8100
AR Path="/5DB8402B/5DBA986D" Ref="D?"  Part="1" 
AR Path="/5DBA986D" Ref="D12"  Part="1" 
F 0 "D12" V 4050 8200 50  0000 C CNN
F 1 "LED_0805" V 3950 8350 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 8100 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 8200 50  0001 C CNN
F 4 "DK" H 4050 8100 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 8100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 8600 60  0001 C CNN "PurchasingLink"
	1    4050 8100
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBA9877
P 4050 8450
AR Path="/5DB8402B/5DBA9877" Ref="R?"  Part="1" 
AR Path="/5DBA9877" Ref="R42"  Part="1" 
F 0 "R42" V 4130 8450 50  0000 C CNN
F 1 "R_475" V 3950 8450 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 8450 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 8450 50  0001 C CNN
F 4 "DK" H 4050 8450 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 8450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 8850 60  0001 C CNN "PurchasingLink"
	1    4050 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 8250 4050 8300
Wire Wire Line
	4050 8600 4350 8600
$Comp
L formula:BSS308PE Q?
U 1 1 5DBA9889
P 4800 8050
AR Path="/5DB8402B/5DBA9889" Ref="Q?"  Part="1" 
AR Path="/5DBA9889" Ref="Q12"  Part="1" 
F 0 "Q12" V 5143 8050 50  0000 C CNN
F 1 "BSS308PE" V 5052 8050 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 8150 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 8100 50  0001 C CNN
F 4 "DK" H 4800 8050 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 8050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 8500 60  0001 C CNN "PurchasingLink"
	1    4800 8050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 7950 4350 7950
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBA9894
P 4350 8250
AR Path="/5DB8402B/5DBA9894" Ref="R?"  Part="1" 
AR Path="/5DBA9894" Ref="R12"  Part="1" 
F 0 "R12" V 4259 8172 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 8172 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 8300 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 8250 50  0001 C CNN
F 4 "DK" H 4300 8500 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 8600 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 8172 50  0001 R CNN "PurchasingLink"
	1    4350 8250
	0    1    1    0   
$EndComp
Connection ~ 4350 7950
Wire Wire Line
	4350 7950 4600 7950
Wire Wire Line
	4300 9400 4300 9500
Connection ~ 4300 9500
Text Label 5900 9500 0    50   ~ 0
C10
Wire Wire Line
	4950 10100 4950 10200
Wire Wire Line
	4750 10550 4750 10500
NoConn ~ 4550 10500
Wire Wire Line
	4300 10800 4300 10850
$Comp
L formula:LED_0805 D?
U 1 1 5DBB62B5
P 4000 10350
AR Path="/5DB8402B/5DBB62B5" Ref="D?"  Part="1" 
AR Path="/5DBB62B5" Ref="D10"  Part="1" 
F 0 "D10" V 4000 10450 50  0000 C CNN
F 1 "LED_0805" V 3900 10600 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3900 10350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4000 10450 50  0001 C CNN
F 4 "DK" H 4000 10350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4000 10350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4400 10850 60  0001 C CNN "PurchasingLink"
	1    4000 10350
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBB62BF
P 4000 10700
AR Path="/5DB8402B/5DBB62BF" Ref="R?"  Part="1" 
AR Path="/5DBB62BF" Ref="R40"  Part="1" 
F 0 "R40" V 4080 10700 50  0000 C CNN
F 1 "R_475" V 3900 10700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3930 10700 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4080 10700 50  0001 C CNN
F 4 "DK" H 4000 10700 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4000 10700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4480 11100 60  0001 C CNN "PurchasingLink"
	1    4000 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 10500 4000 10550
Wire Wire Line
	4000 10850 4300 10850
$Comp
L formula:BSS308PE Q?
U 1 1 5DBB62D1
P 4750 10300
AR Path="/5DB8402B/5DBB62D1" Ref="Q?"  Part="1" 
AR Path="/5DBB62D1" Ref="Q10"  Part="1" 
F 0 "Q10" V 5093 10300 50  0000 C CNN
F 1 "BSS308PE" V 5002 10300 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 4950 10400 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 4950 10350 50  0001 C CNN
F 4 "DK" H 4750 10300 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4750 10300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5350 10750 60  0001 C CNN "PurchasingLink"
	1    4750 10300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBB62DC
P 4300 10500
AR Path="/5DB8402B/5DBB62DC" Ref="R?"  Part="1" 
AR Path="/5DBB62DC" Ref="R10"  Part="1" 
F 0 "R10" V 4209 10422 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4300 10422 50  0000 R CNN
F 2 "footprints:PWR163" H 4050 10550 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4300 10500 50  0001 C CNN
F 4 "DK" H 4250 10750 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4350 10850 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4391 10422 50  0001 R CNN "PurchasingLink"
	1    4300 10500
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 11550 4350 11650
Connection ~ 4350 11650
Text Label 5950 11650 0    50   ~ 0
C8
Wire Wire Line
	3500 11650 3550 11650
Wire Wire Line
	5000 12250 5000 12350
Wire Wire Line
	4800 12700 4800 12650
NoConn ~ 4600 12650
Wire Wire Line
	4350 12950 4350 13000
$Comp
L formula:LED_0805 D?
U 1 1 5DBC775A
P 4050 12500
AR Path="/5DB8402B/5DBC775A" Ref="D?"  Part="1" 
AR Path="/5DBC775A" Ref="D8"  Part="1" 
F 0 "D8" V 4050 12600 50  0000 C CNN
F 1 "LED_0805" V 3950 12750 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 12500 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 12600 50  0001 C CNN
F 4 "DK" H 4050 12500 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 12500 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 13000 60  0001 C CNN "PurchasingLink"
	1    4050 12500
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBC7764
P 4050 12850
AR Path="/5DB8402B/5DBC7764" Ref="R?"  Part="1" 
AR Path="/5DBC7764" Ref="R38"  Part="1" 
F 0 "R38" V 4130 12850 50  0000 C CNN
F 1 "R_475" V 3950 12850 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 12850 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 12850 50  0001 C CNN
F 4 "DK" H 4050 12850 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 12850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 13250 60  0001 C CNN "PurchasingLink"
	1    4050 12850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 12650 4050 12700
Wire Wire Line
	4050 13000 4350 13000
$Comp
L formula:BSS308PE Q?
U 1 1 5DBC7776
P 4800 12450
AR Path="/5DB8402B/5DBC7776" Ref="Q?"  Part="1" 
AR Path="/5DBC7776" Ref="Q8"  Part="1" 
F 0 "Q8" V 5143 12450 50  0000 C CNN
F 1 "BSS308PE" V 5052 12450 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 12550 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 12500 50  0001 C CNN
F 4 "DK" H 4800 12450 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 12450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 12900 60  0001 C CNN "PurchasingLink"
	1    4800 12450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 12350 4350 12350
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBC7781
P 4350 12650
AR Path="/5DB8402B/5DBC7781" Ref="R?"  Part="1" 
AR Path="/5DBC7781" Ref="R8"  Part="1" 
F 0 "R8" V 4259 12572 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 12572 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 12700 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 12650 50  0001 C CNN
F 4 "DK" H 4300 12900 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 13000 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 12572 50  0001 R CNN "PurchasingLink"
	1    4350 12650
	0    1    1    0   
$EndComp
Connection ~ 4350 12350
Wire Wire Line
	4350 12350 4600 12350
Wire Wire Line
	4350 13350 4350 13450
Connection ~ 4350 13450
Text Label 5950 13450 0    50   ~ 0
C6
Wire Wire Line
	3500 13450 4350 13450
Wire Wire Line
	5000 14050 5000 14150
Wire Wire Line
	4800 14500 4800 14450
NoConn ~ 4600 14450
Wire Wire Line
	4350 14750 4350 14800
$Comp
L formula:LED_0805 D?
U 1 1 5DBDD431
P 4050 14300
AR Path="/5DB8402B/5DBDD431" Ref="D?"  Part="1" 
AR Path="/5DBDD431" Ref="D6"  Part="1" 
F 0 "D6" V 4050 14400 50  0000 C CNN
F 1 "LED_0805" V 3950 14550 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 14300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 14400 50  0001 C CNN
F 4 "DK" H 4050 14300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 14300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 14800 60  0001 C CNN "PurchasingLink"
	1    4050 14300
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBDD43B
P 4050 14650
AR Path="/5DB8402B/5DBDD43B" Ref="R?"  Part="1" 
AR Path="/5DBDD43B" Ref="R36"  Part="1" 
F 0 "R36" V 4130 14650 50  0000 C CNN
F 1 "R_475" V 3950 14650 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 14650 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 14650 50  0001 C CNN
F 4 "DK" H 4050 14650 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 14650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 15050 60  0001 C CNN "PurchasingLink"
	1    4050 14650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 14450 4050 14500
Wire Wire Line
	4050 14800 4350 14800
$Comp
L formula:BSS308PE Q?
U 1 1 5DBDD44D
P 4800 14250
AR Path="/5DB8402B/5DBDD44D" Ref="Q?"  Part="1" 
AR Path="/5DBDD44D" Ref="Q6"  Part="1" 
F 0 "Q6" V 5143 14250 50  0000 C CNN
F 1 "BSS308PE" V 5052 14250 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 14350 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 14300 50  0001 C CNN
F 4 "DK" H 4800 14250 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 14250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 14700 60  0001 C CNN "PurchasingLink"
	1    4800 14250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 14150 4350 14150
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBDD458
P 4350 14450
AR Path="/5DB8402B/5DBDD458" Ref="R?"  Part="1" 
AR Path="/5DBDD458" Ref="R6"  Part="1" 
F 0 "R6" V 4259 14372 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 14372 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 14500 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 14450 50  0001 C CNN
F 4 "DK" H 4300 14700 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 14800 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 14372 50  0001 R CNN "PurchasingLink"
	1    4350 14450
	0    1    1    0   
$EndComp
Connection ~ 4350 14150
Wire Wire Line
	4350 14150 4600 14150
Wire Wire Line
	4350 15450 4350 15550
Connection ~ 4350 15550
Text Label 5950 15550 0    50   ~ 0
C4
Wire Wire Line
	3500 15550 4350 15550
Wire Wire Line
	5000 16150 5000 16250
Wire Wire Line
	4800 16600 4800 16550
NoConn ~ 4600 16550
Wire Wire Line
	4350 16850 4350 16900
$Comp
L formula:LED_0805 D?
U 1 1 5DBF85E1
P 4050 16400
AR Path="/5DB8402B/5DBF85E1" Ref="D?"  Part="1" 
AR Path="/5DBF85E1" Ref="D4"  Part="1" 
F 0 "D4" V 4050 16500 50  0000 C CNN
F 1 "LED_0805" V 3950 16650 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 16400 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 16500 50  0001 C CNN
F 4 "DK" H 4050 16400 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 16400 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 16900 60  0001 C CNN "PurchasingLink"
	1    4050 16400
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DBF85EB
P 4050 16750
AR Path="/5DB8402B/5DBF85EB" Ref="R?"  Part="1" 
AR Path="/5DBF85EB" Ref="R34"  Part="1" 
F 0 "R34" V 4130 16750 50  0000 C CNN
F 1 "R_475" V 3950 16750 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 16750 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 16750 50  0001 C CNN
F 4 "DK" H 4050 16750 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 16750 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 17150 60  0001 C CNN "PurchasingLink"
	1    4050 16750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 16550 4050 16600
Wire Wire Line
	4050 16900 4350 16900
$Comp
L formula:BSS308PE Q?
U 1 1 5DBF85FD
P 4800 16350
AR Path="/5DB8402B/5DBF85FD" Ref="Q?"  Part="1" 
AR Path="/5DBF85FD" Ref="Q4"  Part="1" 
F 0 "Q4" V 5143 16350 50  0000 C CNN
F 1 "BSS308PE" V 5052 16350 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 16450 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 16400 50  0001 C CNN
F 4 "DK" H 4800 16350 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 16350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 16800 60  0001 C CNN "PurchasingLink"
	1    4800 16350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 16250 4350 16250
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DBF8608
P 4350 16550
AR Path="/5DB8402B/5DBF8608" Ref="R?"  Part="1" 
AR Path="/5DBF8608" Ref="R4"  Part="1" 
F 0 "R4" V 4259 16472 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 16472 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 16600 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 16550 50  0001 C CNN
F 4 "DK" H 4300 16800 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 16900 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 16472 50  0001 R CNN "PurchasingLink"
	1    4350 16550
	0    1    1    0   
$EndComp
Connection ~ 4350 16250
Wire Wire Line
	4350 16250 4600 16250
Wire Wire Line
	4350 17400 4350 17500
Connection ~ 4350 17500
Wire Wire Line
	3500 17500 4350 17500
Wire Wire Line
	5000 18100 5000 18200
Wire Wire Line
	4800 18550 4800 18500
NoConn ~ 4600 18500
Wire Wire Line
	4350 18800 4350 18850
$Comp
L formula:LED_0805 D?
U 1 1 5DC19E8A
P 4050 18350
AR Path="/5DB8402B/5DC19E8A" Ref="D?"  Part="1" 
AR Path="/5DC19E8A" Ref="D2"  Part="1" 
F 0 "D2" V 4050 18450 50  0000 C CNN
F 1 "LED_0805" V 3950 18600 50  0000 C CNN
F 2 "footprints:LED_0805_OEM" H 3950 18350 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 4050 18450 50  0001 C CNN
F 4 "DK" H 4050 18350 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 4050 18350 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 4450 18850 60  0001 C CNN "PurchasingLink"
	1    4050 18350
	0    -1   -1   0   
$EndComp
$Comp
L formula:R_475 R?
U 1 1 5DC19E94
P 4050 18700
AR Path="/5DB8402B/5DC19E94" Ref="R?"  Part="1" 
AR Path="/5DC19E94" Ref="R32"  Part="1" 
F 0 "R32" V 4130 18700 50  0000 C CNN
F 1 "R_475" V 3950 18700 50  0000 C CNN
F 2 "footprints:R_0805_OEM" H 3980 18700 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4130 18700 50  0001 C CNN
F 4 "DK" H 4050 18700 60  0001 C CNN "MFN"
F 5 "311-475CRCT-ND" H 4050 18700 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=311-475CRCT-ND" H 4530 19100 60  0001 C CNN "PurchasingLink"
	1    4050 18700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 18500 4050 18550
Wire Wire Line
	4050 18850 4350 18850
$Comp
L formula:BSS308PE Q?
U 1 1 5DC19EA6
P 4800 18300
AR Path="/5DB8402B/5DC19EA6" Ref="Q?"  Part="1" 
AR Path="/5DC19EA6" Ref="Q2"  Part="1" 
F 0 "Q2" V 5150 18350 50  0000 C CNN
F 1 "BSS308PE" V 5050 18400 50  0000 C CNN
F 2 "footprints:SOT-23-3_OEM" H 5000 18400 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/BSS308PE_Rev2.03.pdf?folderId=db3a304314dca38901154a72e3951a65&fileId=db3a304330f686060131099c80400073" H 5000 18350 50  0001 C CNN
F 4 "DK" H 4800 18300 60  0001 C CNN "MFN"
F 5 "BSS308PEH6327XTSA1CT-ND" H 4800 18300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en/discrete-semiconductor-products/transistors-fets-mosfets-single/278?k=bss308pe&k=&pkeyword=bss308pe&pv7=2&pv1989=0&sf=0&quantity=&ColumnSort=0&page=1&stock=1&datasheet=1&pageSize=25" H 5400 18750 60  0001 C CNN "PurchasingLink"
	1    4800 18300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 18200 4350 18200
$Comp
L formula:R_3.3_25W_TO163 R?
U 1 1 5DC19EB1
P 4350 18500
AR Path="/5DB8402B/5DC19EB1" Ref="R?"  Part="1" 
AR Path="/5DC19EB1" Ref="R2"  Part="1" 
F 0 "R2" V 4259 18422 50  0000 R CNN
F 1 "R_3.3_25W_TO163" V 4350 18422 50  0000 R CNN
F 2 "footprints:PWR163" H 4100 18550 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/PWR163.pdf" H 4350 18500 50  0001 C CNN
F 4 "DK" H 4300 18750 50  0001 C CNN "MFN"
F 5 "PWR163S-25-3R30F-ND" H 4400 18850 50  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=PWR163S-25-3R30F-ND" V 4441 18422 50  0001 R CNN "PurchasingLink"
	1    4350 18500
	0    1    1    0   
$EndComp
Connection ~ 4350 18200
Wire Wire Line
	4350 18200 4600 18200
Connection ~ 4350 19350
Text Label 5950 19350 0    50   ~ 0
C0
Wire Wire Line
	4350 19350 5250 19350
Wire Wire Line
	4800 4400 5250 4400
Text Label 5250 4400 0    50   ~ 0
Q16
Text Label 5250 6350 0    50   ~ 0
Q14
Wire Wire Line
	4800 6350 5250 6350
Text Label 5250 8300 0    50   ~ 0
Q12
Wire Wire Line
	4800 8300 5250 8300
Text Label 5200 10550 0    50   ~ 0
Q10
Wire Wire Line
	4750 10550 5200 10550
Wire Wire Line
	3500 7250 4350 7250
Wire Wire Line
	4350 7150 4350 7250
Connection ~ 4350 7250
Text Label 5250 12700 0    50   ~ 0
Q8
Wire Wire Line
	4800 12700 5250 12700
Text Label 5250 14500 0    50   ~ 0
Q6
Wire Wire Line
	4800 14500 5250 14500
Text Label 5250 16600 0    50   ~ 0
Q4
Wire Wire Line
	4800 16600 5250 16600
Wire Wire Line
	4800 18550 5250 18550
Wire Wire Line
	5850 3350 5950 3350
$Comp
L formula:200mA_Fuse F14
U 1 1 5DFEDE3B
P 5550 5300
F 0 "F14" H 5550 5400 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 5200 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 5300 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 5300 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 5525 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 5524 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 5433 50  0001 C CNN "MFN"
	1    5550 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5300 5950 5300
$Comp
L formula:200mA_Fuse F12
U 1 1 5E0144DB
P 5550 7250
F 0 "F12" H 5550 7350 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 7150 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 7250 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 7250 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 7475 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 7474 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 7383 50  0001 C CNN "MFN"
	1    5550 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 7250 5950 7250
$Comp
L formula:200mA_Fuse F10
U 1 1 5E03B065
P 5500 9500
F 0 "F10" H 5500 9600 50  0000 C CNN
F 1 "200mA_Fuse" H 5500 9400 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5450 9500 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5450 9500 50  0001 C CNN
F 4 "507-1767-1-ND " H 5500 9725 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5500 9724 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5500 9633 50  0001 C CNN "MFN"
	1    5500 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 9500 5900 9500
$Comp
L formula:200mA_Fuse F8
U 1 1 5E062DFE
P 5550 11650
F 0 "F8" H 5550 11750 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 11550 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 11650 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 11650 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 11875 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 11874 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 11783 50  0001 C CNN "MFN"
	1    5550 11650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 11650 5950 11650
$Comp
L formula:200mA_Fuse F6
U 1 1 5E08B789
P 5550 13450
F 0 "F6" H 5550 13550 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 13350 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 13450 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 13450 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 13675 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 13674 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 13583 50  0001 C CNN "MFN"
	1    5550 13450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 13450 5950 13450
$Comp
L formula:200mA_Fuse F4
U 1 1 5E0B5E27
P 5550 15550
F 0 "F4" H 5550 15650 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 15450 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 15550 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 15550 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 15775 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 15774 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 15683 50  0001 C CNN "MFN"
	1    5550 15550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 15550 5950 15550
$Comp
L formula:200mA_Fuse F2
U 1 1 5E0DEF99
P 5550 17500
F 0 "F2" H 5550 17600 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 17400 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 17500 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 17500 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 17725 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 17724 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 17633 50  0001 C CNN "MFN"
	1    5550 17500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 17500 5950 17500
$Comp
L formula:200mA_Fuse F0
U 1 1 5E109BA2
P 5550 19350
F 0 "F0" H 5550 19450 50  0000 C CNN
F 1 "200mA_Fuse" H 5550 19250 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 5500 19350 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 5500 19350 50  0001 C CNN
F 4 "507-1767-1-ND " H 5550 19575 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 5550 19574 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 5550 19483 50  0001 C CNN "MFN"
	1    5550 19350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 19350 5950 19350
$Comp
L formula:MM_M_VT_12 J3
U 1 1 5E20BE7C
P 6950 13650
F 0 "J3" H 6906 14997 60  0000 C CNN
F 1 "MM_M_VT_12" H 6906 14891 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 6750 14750 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 6850 14850 60  0001 C CNN
F 4 "TE" H 7050 15050 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 7150 15150 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 6950 14950 60  0001 C CNN "PurchasingLink"
	1    6950 13650
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_12 J4
U 1 1 5E20FB90
P 6950 16900
F 0 "J4" H 6906 18247 60  0000 C CNN
F 1 "MM_M_VT_12" H 6906 18141 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 6750 18000 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 6850 18100 60  0001 C CNN
F 4 "TE" H 7050 18300 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 7150 18400 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 6950 18200 60  0001 C CNN "PurchasingLink"
	1    6950 16900
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_16 J5
U 1 1 5E21125C
P 8100 15700
F 0 "J5" H 8056 17047 60  0000 C CNN
F 1 "MM_M_VT_16" H 8056 16941 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_16" H 7900 16800 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-6" H 8000 16900 60  0001 C CNN
F 4 "TE" H 8200 17100 60  0001 C CNN "MFN"
F 5 "1-215464-6" H 8300 17200 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-6.html" H 8100 17000 60  0001 C CNN "PurchasingLink"
	1    8100 15700
	1    0    0    -1  
$EndComp
Text Label 8250 14600 0    50   ~ 0
Q16
Text Label 8250 14700 0    50   ~ 0
Q15
Text Label 8250 14800 0    50   ~ 0
Q14
Text Label 8250 14900 0    50   ~ 0
Q13
Text Label 8250 15000 0    50   ~ 0
Q12
Text Label 8250 15100 0    50   ~ 0
Q11
Text Label 8250 15200 0    50   ~ 0
Q10
Text Label 8250 15300 0    50   ~ 0
Q9
Text Label 8250 15400 0    50   ~ 0
Q8
Text Label 8250 15500 0    50   ~ 0
Q7
Text Label 8250 15600 0    50   ~ 0
Q6
Text Label 8250 15700 0    50   ~ 0
Q5
Text Label 8250 15800 0    50   ~ 0
Q4
Text Label 8250 15900 0    50   ~ 0
Q3
Text Label 8250 16000 0    50   ~ 0
Q2
Text Label 8250 16100 0    50   ~ 0
Q1
Text Label 7100 12550 0    50   ~ 0
C15
Text Label 7100 12650 0    50   ~ 0
C13_T3
Text Label 7100 12750 0    50   ~ 0
C13_T2
Text Label 7100 12850 0    50   ~ 0
C13_T1
Text Label 7100 12950 0    50   ~ 0
C13
Text Label 7100 13050 0    50   ~ 0
C11
Text Label 7100 13150 0    50   ~ 0
C9_T3
Text Label 7100 13250 0    50   ~ 0
C9_T2
Text Label 7100 13350 0    50   ~ 0
C9_T1
Text Label 7100 13450 0    50   ~ 0
C9
Text Label 7100 13550 0    50   ~ 0
C7
Text Label 7100 13650 0    50   ~ 0
C5_T3
Text Label 7050 14250 0    50   ~ 0
C5_T2
Text Label 7050 14350 0    50   ~ 0
C5_T1
Text Label 7050 14450 0    50   ~ 0
C5
Text Label 7050 14550 0    50   ~ 0
C3
Text Label 7050 14650 0    50   ~ 0
C1_T3
Text Label 7050 14750 0    50   ~ 0
C1_T2
Text Label 7050 14850 0    50   ~ 0
C1_T1
Text Label 7050 14950 0    50   ~ 0
C1
Text Label 7050 15050 0    50   ~ 0
C0
Text Label 7100 18300 0    50   ~ 0
C2
Text Label 7100 18200 0    50   ~ 0
C4
Text Label 7100 18100 0    50   ~ 0
C3_T1
Text Label 7100 18000 0    50   ~ 0
C3_T2
Text Label 7100 17900 0    50   ~ 0
C3_T3
Text Label 7100 17800 0    50   ~ 0
C6
Text Label 7100 17500 0    50   ~ 0
C8
Text Label 7100 17400 0    50   ~ 0
C7_T1
Text Label 7100 17300 0    50   ~ 0
C7_T2
Text Label 7100 16900 0    50   ~ 0
C7_T3
Text Label 7100 16800 0    50   ~ 0
C10
Text Label 7100 16700 0    50   ~ 0
C12
Text Label 7100 16600 0    50   ~ 0
C11_T1
Text Label 7100 16500 0    50   ~ 0
C11_T2
Text Label 7100 16400 0    50   ~ 0
C11_T3
Text Label 7100 16300 0    50   ~ 0
C14
Text Label 7100 16100 0    50   ~ 0
C16
Text Label 7100 16000 0    50   ~ 0
C15_T1
Text Label 7100 15900 0    50   ~ 0
C15_T2
Text Label 7100 15800 0    50   ~ 0
C15_T3
Text Label 7100 16200 0    50   ~ 0
V+1
Text Label 7100 17600 0    50   ~ 0
V-1
Text Label 7050 15150 0    50   ~ 0
V-2
Text Label 7100 17700 0    50   ~ 0
V+2
Text Label 7100 18400 0    50   ~ 0
GND1
Text Notes 7300 17750 0    50   ~ 0
C8, V-1, and \nV+2 are all the \nsame, for Kelvin \nconnection
Text Notes 7400 16250 0    50   ~ 0
V+1 is same \nas C16, for\nKelvin connection
$Comp
L formula:200mA_Fuse F+2
U 1 1 5E449070
P 2550 2800
F 0 "F+2" H 2550 2900 50  0000 C CNN
F 1 "200mA_Fuse" H 2550 2700 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 2500 2800 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 2500 2800 50  0001 C CNN
F 4 "507-1767-1-ND " H 2550 3025 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 2550 3024 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 2550 2933 50  0001 C CNN "MFN"
	1    2550 2800
	-1   0    0    1   
$EndComp
Text Label 2200 2800 2    50   ~ 0
V+2
Wire Wire Line
	2250 2800 2200 2800
$Comp
L formula:200mA_Fuse F-1
U 1 1 5E46FFB5
P 2450 19850
F 0 "F-1" H 2450 19950 50  0000 C CNN
F 1 "200mA_Fuse" H 2450 19750 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 2400 19850 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 2400 19850 50  0001 C CNN
F 4 "507-1767-1-ND " H 2450 20075 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 2450 20074 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 2450 19983 50  0001 C CNN "MFN"
	1    2450 19850
	-1   0    0    1   
$EndComp
Text Label 2100 19850 2    50   ~ 0
V-1
Wire Wire Line
	2150 19850 2100 19850
$Comp
L formula:200mA_Fuse F-2
U 1 1 5E4858A2
P 2600 11200
F 0 "F-2" H 2600 11300 50  0000 C CNN
F 1 "200mA_Fuse" H 2600 11100 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 2550 11200 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 2550 11200 50  0001 C CNN
F 4 "507-1767-1-ND " H 2600 11425 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 2600 11424 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 2600 11333 50  0001 C CNN "MFN"
	1    2600 11200
	-1   0    0    1   
$EndComp
Text Label 2250 11200 2    50   ~ 0
V-2
Wire Wire Line
	2300 11200 2250 11200
$Comp
L formula:200mA_Fuse F+1
U 1 1 5E512653
P 2600 12050
F 0 "F+1" H 2600 12150 50  0000 C CNN
F 1 "200mA_Fuse" H 2600 11950 50  0000 C CNN
F 2 "footprints:Fuse_1812" H 2550 12050 50  0001 C CNN
F 3 "https://www.belfuse.com/resources/CircuitProtection/datasheets/0ZCG%20Nov2016.pdf" H 2550 12050 50  0001 C CNN
F 4 "507-1767-1-ND " H 2600 12275 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/bel-fuse-inc/0ZCG0110AF2C/507-1767-1-ND/4156157" H 2600 12274 50  0001 C CNN "PurchasingLink"
F 6 "DK" H 2600 12183 50  0001 C CNN "MFN"
	1    2600 12050
	-1   0    0    1   
$EndComp
Text Label 2250 12050 2    50   ~ 0
V+1
Wire Wire Line
	2300 12050 2250 12050
Wire Wire Line
	3450 9500 4300 9500
Wire Wire Line
	3500 19350 3600 19350
Wire Wire Line
	3600 19850 3600 19350
Wire Wire Line
	2750 19850 3600 19850
Connection ~ 3600 19350
Wire Wire Line
	3600 19350 4350 19350
Wire Wire Line
	3550 12050 3550 11650
Wire Wire Line
	2900 12050 3550 12050
Connection ~ 3550 11650
Wire Wire Line
	3550 11650 4350 11650
Wire Wire Line
	3550 11200 3550 11650
Wire Wire Line
	2900 11200 3550 11200
Wire Wire Line
	3600 2800 3600 3350
Wire Wire Line
	2850 2800 3600 2800
Connection ~ 3600 3350
Text Label 4350 19250 0    50   ~ 0
PWR1
Text Label 4350 19000 0    50   ~ 0
PWR2
Connection ~ 4350 18850
Text Label 4350 17400 0    50   ~ 0
PWR3
Text Label 4350 17050 0    50   ~ 0
PWR4
Connection ~ 4350 16900
Text Label 4350 15450 0    50   ~ 0
PWR5
Text Label 4350 14950 0    50   ~ 0
PWR6
Connection ~ 4350 14800
Text Label 4350 13350 0    50   ~ 0
PWR7
Text Label 4350 13150 0    50   ~ 0
PWR8
Wire Wire Line
	4350 13000 4350 13150
Connection ~ 4350 13000
Text Label 4350 11550 0    50   ~ 0
PWR9
Text Label 4300 11000 0    50   ~ 0
PWR10
Wire Wire Line
	4300 10850 4300 11000
Connection ~ 4300 10850
Text Label 4300 9400 0    50   ~ 0
PWR11
Text Label 4350 8750 0    50   ~ 0
PWR12
Wire Wire Line
	4350 8600 4350 8750
Connection ~ 4350 8600
Text Label 4350 7150 0    50   ~ 0
PWR13
Text Label 4350 6800 0    50   ~ 0
PWR14
Connection ~ 4350 6650
Wire Wire Line
	4350 6650 4350 6800
Text Label 4350 5200 0    50   ~ 0
PWR15
Text Label 4350 4850 0    50   ~ 0
PWR16
Wire Wire Line
	4350 4700 4350 4850
Connection ~ 4350 4700
Wire Notes Line
	9500 13100 11850 13100
Wire Notes Line
	11850 13100 11850 16400
Wire Notes Line
	11850 16400 9500 16400
Wire Notes Line
	9500 16400 9500 13100
Text Notes 9550 13200 0    50   ~ 0
Connectors from far side DA board
Text Label 5250 18550 0    50   ~ 0
Q2
Text Label 5950 17500 0    50   ~ 0
C2
Wire Wire Line
	4350 14800 4350 14950
Wire Wire Line
	4350 16900 4350 17050
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T16
U 1 1 5DBC215F
P 3200 3350
F 0 "T16" H 3256 3615 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 3524 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 3550 50  0001 C CNN
F 3 "" H 3200 3550 50  0001 C CNN
	1    3200 3350
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T14
U 1 1 5DBC2478
P 3200 5300
F 0 "T14" H 3256 5565 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 5474 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 5500 50  0001 C CNN
F 3 "" H 3200 5500 50  0001 C CNN
	1    3200 5300
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T12
U 1 1 5DBC293E
P 3200 7250
F 0 "T12" H 3256 7515 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 7424 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 7450 50  0001 C CNN
F 3 "" H 3200 7450 50  0001 C CNN
	1    3200 7250
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T10
U 1 1 5DBC30ED
P 3150 9500
F 0 "T10" H 3206 9765 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3206 9674 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3150 9700 50  0001 C CNN
F 3 "" H 3150 9700 50  0001 C CNN
	1    3150 9500
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T8
U 1 1 5DBC3413
P 3200 11650
F 0 "T8" H 3256 11915 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 11824 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 11850 50  0001 C CNN
F 3 "" H 3200 11850 50  0001 C CNN
	1    3200 11650
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T6
U 1 1 5DBC38FD
P 3200 13450
F 0 "T6" H 3256 13715 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 13624 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 13650 50  0001 C CNN
F 3 "" H 3200 13650 50  0001 C CNN
	1    3200 13450
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T4
U 1 1 5DBC3E1D
P 3200 15550
F 0 "T4" H 3256 15815 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 15724 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 15750 50  0001 C CNN
F 3 "" H 3200 15750 50  0001 C CNN
	1    3200 15550
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T0
U 1 1 5DBC50F8
P 3200 19350
F 0 "T0" H 3256 19615 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 19524 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 19550 50  0001 C CNN
F 3 "" H 3200 19550 50  0001 C CNN
	1    3200 19350
	1    0    0    -1  
$EndComp
$Comp
L DA_Board_1-rescue:Tab_Connect_BMS-formula T2
U 1 1 5DBC56FE
P 3200 17500
F 0 "T2" H 3256 17765 50  0000 C CNN
F 1 "Tab_Connect_BMS" H 3256 17674 50  0000 C CNN
F 2 "footprints:Tab_connect_BMS" H 3200 17700 50  0001 C CNN
F 3 "" H 3200 17700 50  0001 C CNN
	1    3200 17500
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_12 J2
U 1 1 5DBE8177
P 6950 18400
F 0 "J2" H 6906 19747 60  0000 C CNN
F 1 "MM_M_VT_12" H 6906 19641 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 6750 19500 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 6850 19600 60  0001 C CNN
F 4 "TE" H 7050 19800 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 7150 19900 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 6950 19700 60  0001 C CNN "PurchasingLink"
	1    6950 18400
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_10 J1
U 1 1 5DBE78A1
P 6800 14900
F 0 "J1" H 6856 15797 60  0000 C CNN
F 1 "MM_M_VT_10" H 6856 15691 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_10" H 6700 15550 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-0" H 6700 16100 60  0001 C CNN
F 4 "TE" H 6900 16300 60  0001 C CNN "MFN"
F 5 "1-215464-0" H 7000 16400 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-0.html" H 6800 16200 60  0001 C CNN "PurchasingLink"
	1    6800 14900
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_12 J8
U 1 1 5DC0F961
P 11050 14650
F 0 "J8" H 11006 15997 60  0000 C CNN
F 1 "MM_M_VT_12" H 11006 15891 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 10850 15750 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 10950 15850 60  0001 C CNN
F 4 "TE" H 11150 16050 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 11250 16150 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 11050 15950 60  0001 C CNN "PurchasingLink"
	1    11050 14650
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_12 J7
U 1 1 5DC0F96B
P 10000 16150
F 0 "J7" H 9956 17497 60  0000 C CNN
F 1 "MM_M_VT_12" H 9956 17391 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 9800 17250 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 9900 17350 60  0001 C CNN
F 4 "TE" H 10100 17550 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 10200 17650 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 10000 17450 60  0001 C CNN "PurchasingLink"
	1    10000 16150
	1    0    0    -1  
$EndComp
$Comp
L formula:MM_M_VT_10 J6
U 1 1 5DC0F975
P 9850 14200
F 0 "J6" H 9906 15097 60  0000 C CNN
F 1 "MM_M_VT_10" H 9906 14991 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_10" H 9750 14850 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-0" H 9750 15400 60  0001 C CNN
F 4 "TE" H 9950 15600 60  0001 C CNN "MFN"
F 5 "1-215464-0" H 10050 15700 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-0.html" H 9850 15500 60  0001 C CNN "PurchasingLink"
	1    9850 14200
	1    0    0    -1  
$EndComp
Text Label 10100 14250 0    50   ~ 0
C15
Text Label 11200 14550 0    50   ~ 0
C13
Text Label 11200 14150 0    50   ~ 0
C11
Text Label 10150 16150 0    50   ~ 0
C9
Text Label 10150 15750 0    50   ~ 0
C7
Text Label 11200 16100 0    50   ~ 0
C5
Text Label 11200 15700 0    50   ~ 0
C3
Text Label 11200 15000 0    50   ~ 0
C1
Text Label 10100 13750 0    50   ~ 0
C15_T3
Text Label 10100 13850 0    50   ~ 0
C15_T2
Text Label 10100 13950 0    50   ~ 0
C15_T1
Text Label 11200 13850 0    50   ~ 0
C11_T3
Text Label 11200 13950 0    50   ~ 0
C11_T2
Text Label 11200 14050 0    50   ~ 0
C11_T1
Text Label 10150 15450 0    50   ~ 0
C7_T3
Text Label 10150 15550 0    50   ~ 0
C7_T2
Text Label 10150 15650 0    50   ~ 0
C7_T1
Text Label 11200 15400 0    50   ~ 0
C3_T3
Text Label 11200 15500 0    50   ~ 0
C3_T2
Text Label 11200 15600 0    50   ~ 0
C3_T1
Text Label 10100 13650 0    50   ~ 0
PWR14
Text Label 11200 14650 0    50   ~ 0
PWR13
Text Label 11200 14450 0    50   ~ 0
PWR12
Text Label 11200 14250 0    50   ~ 0
PWR11
Text Label 11200 13750 0    50   ~ 0
PWR10
Text Label 11200 13550 0    50   ~ 0
PWR9
Text Label 10150 16050 0    50   ~ 0
PWR8
Text Label 10150 15850 0    50   ~ 0
PWR7
Text Label 10150 15350 0    50   ~ 0
PWR6
Text Label 10150 15150 0    50   ~ 0
PWR5
Text Label 11200 16000 0    50   ~ 0
PWR4
Text Label 11200 15800 0    50   ~ 0
PWR3
Text Label 11200 15300 0    50   ~ 0
PWR2
Text Label 11200 15100 0    50   ~ 0
PWR1
Text Label 10100 14350 0    50   ~ 0
Q15
Text Label 10100 13550 0    50   ~ 0
Q13
Text Label 11200 14350 0    50   ~ 0
Q11
Text Label 11200 13650 0    50   ~ 0
Q9
Text Label 10150 15950 0    50   ~ 0
Q7
Text Label 10150 15250 0    50   ~ 0
Q5
Text Label 11200 15900 0    50   ~ 0
Q3
Text Label 11200 15200 0    50   ~ 0
Q1
Text Label 10100 14050 0    50   ~ 0
GND1
Text Label 10100 14150 0    50   ~ 0
PWR16
Text Label 10100 14450 0    50   ~ 0
PWR15
$Comp
L formula:MM_M_VT_12 J9
U 1 1 5DC0F9AC
P 11050 16100
F 0 "J9" H 11006 17447 60  0000 C CNN
F 1 "MM_M_VT_12" H 11006 17341 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_12" H 10850 17200 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F1-1-215464-2" H 10950 17300 60  0001 C CNN
F 4 "TE" H 11150 17500 60  0001 C CNN "MFN"
F 5 "1-215464-2" H 11250 17600 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-1-215464-2.html" H 11050 17400 60  0001 C CNN "PurchasingLink"
	1    11050 16100
	1    0    0    -1  
$EndComp
NoConn ~ 10150 15050
Wire Wire Line
	4350 18850 4350 19000
Wire Wire Line
	4350 19250 4350 19350
Wire Wire Line
	4000 10200 4300 10200
Connection ~ 4300 10200
Wire Wire Line
	4300 10200 4550 10200
Wire Wire Line
	3600 3350 5000 3350
Connection ~ 5000 3350
Wire Wire Line
	5000 3350 5250 3350
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F3
U 1 1 5E4B42BC
P 5000 3650
F 0 "F3" H 5000 3875 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 3784 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 3350 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 3650 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 3965 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 3874 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 3783 50  0001 C CNN "MFN"
	1    5000 3650
	0    1    1    0   
$EndComp
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F5
U 1 1 5E5319F0
P 5000 5600
F 0 "F5" H 5000 5825 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 5734 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 5300 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 5600 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 5915 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 5824 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 5733 50  0001 C CNN "MFN"
	1    5000 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5300 5000 5300
Wire Wire Line
	4350 7250 5000 7250
Wire Wire Line
	4300 9500 4950 9500
Wire Wire Line
	4350 11650 5000 11650
Wire Wire Line
	4350 13450 5000 13450
Wire Wire Line
	4350 15550 5000 15550
Wire Wire Line
	4350 17500 5000 17500
Connection ~ 5000 5300
Wire Wire Line
	5000 5300 5250 5300
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F7
U 1 1 5E54E77E
P 5000 7550
F 0 "F7" H 5000 7775 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 7684 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 7250 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 7550 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 7865 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 7774 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 7683 50  0001 C CNN "MFN"
	1    5000 7550
	0    1    1    0   
$EndComp
Connection ~ 5000 7250
Wire Wire Line
	5000 7250 5250 7250
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F1
U 1 1 5E54EF95
P 4950 9800
F 0 "F1" H 4950 10025 50  0000 C CNN
F 1 "1.5A_Fuse" H 4950 9934 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 4950 9500 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4900 9800 50  0001 C CNN
F 4 "F1462CT-ND" H 4950 10115 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 4950 10024 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 4950 9933 50  0001 C CNN "MFN"
	1    4950 9800
	0    1    1    0   
$EndComp
Connection ~ 4950 9500
Wire Wire Line
	4950 9500 5200 9500
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F9
U 1 1 5E5518AC
P 5000 11950
F 0 "F9" H 5000 12175 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 12084 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 11650 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 11950 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 12265 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 12174 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 12083 50  0001 C CNN "MFN"
	1    5000 11950
	0    1    1    0   
$EndComp
Connection ~ 5000 11650
Wire Wire Line
	5000 11650 5250 11650
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F11
U 1 1 5E55211D
P 5000 13750
F 0 "F11" H 5000 13975 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 13884 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 13450 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 13750 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 14065 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 13974 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 13883 50  0001 C CNN "MFN"
	1    5000 13750
	0    1    1    0   
$EndComp
Connection ~ 5000 13450
Wire Wire Line
	5000 13450 5250 13450
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F13
U 1 1 5E5549A0
P 5000 15850
F 0 "F13" H 5000 16075 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 15984 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 15550 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 15850 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 16165 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 16074 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 15983 50  0001 C CNN "MFN"
	1    5000 15850
	0    1    1    0   
$EndComp
Connection ~ 5000 15550
Wire Wire Line
	5000 15550 5250 15550
$Comp
L DA_Board_1-rescue:1.5A_Fuse-formula F15
U 1 1 5E559D35
P 5000 17800
F 0 "F15" H 5000 18025 50  0000 C CNN
F 1 "1.5A_Fuse" H 5000 17934 50  0000 C CNN
F 2 "footprints:Fuse_1206" H 5000 17500 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_466_datasheet.pdf.pdf" H 4950 17800 50  0001 C CNN
F 4 "F1462CT-ND" H 5000 18115 50  0001 C CNN "MPN"
F 5 "https://www.digikey.com/product-detail/en/littelfuse-inc/046601.5NR/F1462CT-ND/521360" H 5000 18024 50  0001 C CNN "PurchasingLink"
F 6 "046601.5NR" H 5000 17933 50  0001 C CNN "MFN"
	1    5000 17800
	0    1    1    0   
$EndComp
Connection ~ 5000 17500
Wire Wire Line
	5000 17500 5250 17500
$Comp
L formula:MM_F_VT_04 J10
U 1 1 5E58FCF8
P 9350 17550
F 0 "J10" H 9408 17997 60  0000 C CNN
F 1 "MM_F_VT_04" H 9408 17891 60  0000 C CNN
F 2 "footprints:micromatch_female_vert_4" H 9150 18650 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F338068%7FF1%7Fpdf%7FEnglish%7FENG_CD_338068_F1.pdf%7F338068-4" H 9250 18750 60  0001 C CNN
F 4 "TE" H 9450 18950 60  0001 C CNN "MFN"
F 5 "338068-4" H 9550 19050 60  0001 C CNN "MPN"
F 6 "http://www.te.com/global-en/product-338068-4.html" H 9350 18850 60  0001 C CNN "PurchasingLink"
	1    9350 17550
	1    0    0    -1  
$EndComp
Text Notes 9250 17900 0    50   ~ 0
RETENTION
$EndSCHEMATC
