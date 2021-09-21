EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 6050 2450
$Comp
L power:GND #PWR0144
U 1 1 610B9C4E
P 6050 2450
F 0 "#PWR0144" H 6050 2200 50  0001 C CNN
F 1 "GND" H 6055 2277 50  0000 C CNN
F 2 "" H 6050 2450 50  0001 C CNN
F 3 "" H 6050 2450 50  0001 C CNN
	1    6050 2450
	1    0    0    -1  
$EndComp
Connection ~ 6000 4350
$Comp
L power:GND #PWR0145
U 1 1 610B9C55
P 6000 4350
F 0 "#PWR0145" H 6000 4100 50  0001 C CNN
F 1 "GND" H 6005 4177 50  0000 C CNN
F 2 "" H 6000 4350 50  0001 C CNN
F 3 "" H 6000 4350 50  0001 C CNN
	1    6000 4350
	1    0    0    -1  
$EndComp
Connection ~ 3300 2450
$Comp
L power:GND #PWR0146
U 1 1 610B9C5C
P 3300 2450
F 0 "#PWR0146" H 3300 2200 50  0001 C CNN
F 1 "GND" H 3305 2277 50  0000 C CNN
F 2 "" H 3300 2450 50  0001 C CNN
F 3 "" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4350 6000 4350
Connection ~ 5500 4350
Wire Wire Line
	5150 4350 5500 4350
Wire Wire Line
	5500 4050 5500 4350
Wire Wire Line
	5550 2450 6050 2450
Connection ~ 5550 2450
Wire Wire Line
	5550 2150 5550 2450
Wire Wire Line
	5250 2450 5550 2450
Wire Wire Line
	2800 2450 3300 2450
Connection ~ 2800 2450
Wire Wire Line
	2500 2450 2800 2450
$Comp
L formula:LED_0805 D505
U 1 1 610B9C73
P 5250 2300
F 0 "D505" H 5300 2200 50  0000 R CNN
F 1 "LED_0805" H 5350 2400 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5150 2300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5250 2400 50  0001 C CNN
F 4 "DK" H 5250 2300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5250 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5650 2800 60  0001 C CNN "PurchasingLink"
	1    5250 2300
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D506
U 1 1 610B9C7C
P 5150 4200
F 0 "D506" H 5200 4100 50  0000 R CNN
F 1 "LED_0805" H 5250 4300 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5050 4200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5150 4300 50  0001 C CNN
F 4 "DK" H 5150 4200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5150 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5550 4700 60  0001 C CNN "PurchasingLink"
	1    5150 4200
	0    -1   -1   0   
$EndComp
$Comp
L formula:LED_0805 D502
U 1 1 610B9C85
P 2500 2300
F 0 "D502" H 2550 2200 50  0000 R CNN
F 1 "LED_0805" H 2600 2400 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2400 2300 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2500 2400 50  0001 C CNN
F 4 "DK" H 2500 2300 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2500 2300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2900 2800 60  0001 C CNN "PurchasingLink"
	1    2500 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 1850 5150 1850
Connection ~ 5250 1850
$Comp
L formula:R_1K R511
U 1 1 610B9C90
P 5250 2000
F 0 "R511" V 5350 1950 50  0000 L CNN
F 1 "R_1K" V 5150 1900 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5180 2000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5330 2000 50  0001 C CNN
F 4 "DK" H 5250 2000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 5250 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 5730 2400 60  0001 C CNN "PurchasingLink"
	1    5250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3750 4950 3750
Connection ~ 5150 3750
$Comp
L formula:R_1K R512
U 1 1 610B9C9B
P 5150 3900
F 0 "R512" V 5250 3850 50  0000 L CNN
F 1 "R_1K" V 5050 3800 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5080 3900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5230 3900 50  0001 C CNN
F 4 "DK" H 5150 3900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 5150 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 5630 4300 60  0001 C CNN "PurchasingLink"
	1    5150 3900
	1    0    0    -1  
$EndComp
Connection ~ 2800 1850
Connection ~ 2500 1850
Wire Wire Line
	2500 1850 2800 1850
$Comp
L formula:R_1K R502
U 1 1 610B9CA7
P 2500 2000
F 0 "R502" V 2600 1950 50  0000 L CNN
F 1 "R_1K" V 2400 1900 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2430 2000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2580 2000 50  0001 C CNN
F 4 "DK" H 2500 2000 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2500 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2980 2400 60  0001 C CNN "PurchasingLink"
	1    2500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3750 5150 3750
Connection ~ 5500 3750
$Comp
L formula:R_100K R515
U 1 1 610B9CB2
P 5500 3900
F 0 "R515" V 5400 3850 50  0000 L CNN
F 1 "R_100K" V 5600 3750 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5430 3900 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 5580 3900 50  0001 C CNN
F 4 "DK" H 5500 3900 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 5500 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 5980 4300 60  0001 C CNN "PurchasingLink"
	1    5500 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1850 5250 1850
Connection ~ 5550 1850
$Comp
L formula:R_100K R514
U 1 1 610B9CBD
P 5550 2000
F 0 "R514" V 5450 1950 50  0000 L CNN
F 1 "R_100K" V 5650 1850 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5480 2000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 5630 2000 50  0001 C CNN
F 4 "DK" H 5550 2000 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 5550 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 6030 2400 60  0001 C CNN "PurchasingLink"
	1    5550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1850 2950 1850
$Comp
L formula:R_100K R505
U 1 1 610B9CC8
P 2800 2000
F 0 "R505" V 2700 1950 50  0000 L CNN
F 1 "R_100K" V 2900 1850 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2730 2000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2880 2000 50  0001 C CNN
F 4 "DK" H 2800 2000 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 2800 2000 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 3280 2400 60  0001 C CNN "PurchasingLink"
	1    2800 2000
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q502
U 1 1 610B9CD1
P 3200 1850
F 0 "Q502" H 3406 1896 50  0000 L CNN
F 1 "SSM3K333R" H 3406 1805 50  0000 L CNN
F 2 "footprints:SOT-23F" H 3400 1775 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 3400 1925 50  0001 L CNN
F 4 "DK" H 3700 2225 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 3600 2125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 3500 2025 60  0001 C CNN "PurchasingLink"
	1    3200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3750 5650 3750
Wire Wire Line
	5750 1850 5700 1850
$Comp
L formula:SSM3K333R Q505
U 1 1 610B9CDC
P 5900 3750
F 0 "Q505" H 6106 3796 50  0000 L CNN
F 1 "SSM3K333R" H 6106 3705 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6100 3675 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6100 3825 50  0001 L CNN
F 4 "DK" H 6400 4125 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6300 4025 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6200 3925 60  0001 C CNN "PurchasingLink"
	1    5900 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q504
U 1 1 610B9CE5
P 5950 1850
F 0 "Q504" H 6156 1896 50  0000 L CNN
F 1 "SSM3K333R" H 6156 1805 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6150 1775 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6150 1925 50  0001 L CNN
F 4 "DK" H 6450 2225 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6350 2125 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6250 2025 60  0001 C CNN "PurchasingLink"
	1    5950 1850
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R517
U 1 1 610B9CEE
P 6000 3100
F 0 "R517" H 6070 3146 50  0000 L CNN
F 1 "R_10K" H 6070 3055 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5930 3100 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6080 3100 50  0001 C CNN
F 4 "DK" H 6000 3100 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6000 3100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6480 3500 60  0001 C CNN "PurchasingLink"
	1    6000 3100
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R516
U 1 1 610B9CF7
P 6050 1200
F 0 "R516" H 6120 1246 50  0000 L CNN
F 1 "R_10K" H 6120 1155 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5980 1200 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6130 1200 50  0001 C CNN
F 4 "DK" H 6050 1200 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6050 1200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6530 1600 60  0001 C CNN "PurchasingLink"
	1    6050 1200
	1    0    0    -1  
$EndComp
$Comp
L formula:R_10K R508
U 1 1 610B9D00
P 3300 1250
F 0 "R508" H 3370 1296 50  0000 L CNN
F 1 "R_10K" H 3370 1205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3230 1250 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3380 1250 50  0001 C CNN
F 4 "DK" H 3300 1250 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3300 1250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3780 1650 60  0001 C CNN "PurchasingLink"
	1    3300 1250
	1    0    0    -1  
$EndComp
Text Notes 4050 750  0    98   ~ 0
SHUTDOWN SENSING
Wire Wire Line
	2800 2150 2800 2450
$Comp
L formula:R_10K R509
U 1 1 610B9D24
P 3250 3050
F 0 "R509" H 3320 3096 50  0000 L CNN
F 1 "R_10K" H 3320 3005 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3180 3050 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3330 3050 50  0001 C CNN
F 4 "DK" H 3250 3050 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3250 3050 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3730 3450 60  0001 C CNN "PurchasingLink"
	1    3250 3050
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q503
U 1 1 610B9D2D
P 3150 3750
F 0 "Q503" H 3356 3796 50  0000 L CNN
F 1 "SSM3K333R" H 3356 3705 50  0000 L CNN
F 2 "footprints:SOT-23F" H 3350 3675 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 3350 3825 50  0001 L CNN
F 4 "DK" H 3650 4125 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 3550 4025 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 3450 3925 60  0001 C CNN "PurchasingLink"
	1    3150 3750
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R506
U 1 1 610B9D36
P 2650 3900
F 0 "R506" V 2550 3850 50  0000 L CNN
F 1 "R_100K" V 2750 3750 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2580 3900 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2730 3900 50  0001 C CNN
F 4 "DK" H 2650 3900 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 2650 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 3130 4300 60  0001 C CNN "PurchasingLink"
	1    2650 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3750 2900 3750
Connection ~ 2650 3750
Wire Wire Line
	2650 3750 2300 3750
$Comp
L formula:R_1K R503
U 1 1 610B9D42
P 2300 3900
F 0 "R503" V 2400 3850 50  0000 L CNN
F 1 "R_1K" V 2200 3800 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2230 3900 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2380 3900 50  0001 C CNN
F 4 "DK" H 2300 3900 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2300 3900 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2780 4300 60  0001 C CNN "PurchasingLink"
	1    2300 3900
	1    0    0    -1  
$EndComp
Connection ~ 2300 3750
Wire Wire Line
	2300 3750 2050 3750
$Comp
L formula:LED_0805 D503
U 1 1 610B9D4D
P 2300 4200
F 0 "D503" H 2350 4100 50  0000 R CNN
F 1 "LED_0805" H 2400 4300 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2200 4200 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2300 4300 50  0001 C CNN
F 4 "DK" H 2300 4200 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2300 4200 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2700 4700 60  0001 C CNN "PurchasingLink"
	1    2300 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 4050 2650 4350
Wire Wire Line
	2300 4350 2650 4350
Connection ~ 2650 4350
Wire Wire Line
	2650 4350 3250 4350
$Comp
L power:GND #PWR0151
U 1 1 610B9D58
P 3250 4350
F 0 "#PWR0151" H 3250 4100 50  0001 C CNN
F 1 "GND" H 3255 4177 50  0000 C CNN
F 2 "" H 3250 4350 50  0001 C CNN
F 3 "" H 3250 4350 50  0001 C CNN
	1    3250 4350
	1    0    0    -1  
$EndComp
Connection ~ 3250 4350
$Comp
L formula:R_1K R510
U 1 1 610B9D66
P 5100 6150
F 0 "R510" V 5200 6100 50  0000 L CNN
F 1 "R_1K" V 5000 6050 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5030 6150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5180 6150 50  0001 C CNN
F 4 "DK" H 5100 6150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 5100 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 5580 6550 60  0001 C CNN "PurchasingLink"
	1    5100 6150
	1    0    0    -1  
$EndComp
$Comp
L formula:SSM3K333R Q506
U 1 1 610B9D6F
P 5950 6000
F 0 "Q506" H 6156 6046 50  0000 L CNN
F 1 "SSM3K333R" H 6156 5955 50  0000 L CNN
F 2 "footprints:SOT-23F" H 6150 5925 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 6150 6075 50  0001 L CNN
F 4 "DK" H 6450 6375 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 6350 6275 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 6250 6175 60  0001 C CNN "PurchasingLink"
	1    5950 6000
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R513
U 1 1 610B9D78
P 5450 6150
F 0 "R513" V 5350 6100 50  0000 L CNN
F 1 "R_100K" V 5550 6000 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5380 6150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 5530 6150 50  0001 C CNN
F 4 "DK" H 5450 6150 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 5450 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 5930 6550 60  0001 C CNN "PurchasingLink"
	1    5450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6000 5700 6000
Connection ~ 5100 6000
Wire Wire Line
	5100 6000 4900 6000
Connection ~ 5450 6000
Wire Wire Line
	5450 6000 5100 6000
$Comp
L formula:LED_0805 D504
U 1 1 610B9D86
P 5100 6450
F 0 "D504" H 5150 6350 50  0000 R CNN
F 1 "LED_0805" H 5200 6550 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 5000 6450 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 5100 6550 50  0001 C CNN
F 4 "DK" H 5100 6450 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 5100 6450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 5500 6950 60  0001 C CNN "PurchasingLink"
	1    5100 6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5100 6600 5450 6600
Wire Wire Line
	5450 6600 5450 6300
Wire Wire Line
	5450 6600 6050 6600
Connection ~ 5450 6600
$Comp
L power:GND #PWR0152
U 1 1 610B9D91
P 6050 6600
F 0 "#PWR0152" H 6050 6350 50  0001 C CNN
F 1 "GND" H 6200 6550 50  0000 C CNN
F 2 "" H 6050 6600 50  0001 C CNN
F 3 "" H 6050 6600 50  0001 C CNN
	1    6050 6600
	1    0    0    -1  
$EndComp
Connection ~ 6050 6600
$Comp
L formula:R_10K R507
U 1 1 610B9DB5
P 3250 5250
F 0 "R507" H 3320 5296 50  0000 L CNN
F 1 "R_10K" H 3320 5205 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 3180 5250 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 3330 5250 50  0001 C CNN
F 4 "DK" H 3250 5250 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 3250 5250 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 3730 5650 60  0001 C CNN "PurchasingLink"
	1    3250 5250
	1    0    0    -1  
$EndComp
$Comp
L formula:R_100K R504
U 1 1 610B9DBE
P 2600 6150
F 0 "R504" V 2500 6100 50  0000 L CNN
F 1 "R_100K" V 2700 6000 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2530 6150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2680 6150 50  0001 C CNN
F 4 "DK" H 2600 6150 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 2600 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 3080 6550 60  0001 C CNN "PurchasingLink"
	1    2600 6150
	1    0    0    -1  
$EndComp
$Comp
L formula:R_1K R501
U 1 1 610B9DC7
P 2200 6150
F 0 "R501" V 2300 6100 50  0000 L CNN
F 1 "R_1K" V 2100 6050 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 2130 6150 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 2280 6150 50  0001 C CNN
F 4 "DK" H 2200 6150 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 2200 6150 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 2680 6550 60  0001 C CNN "PurchasingLink"
	1    2200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6000 2900 6000
Connection ~ 2200 6000
Wire Wire Line
	2200 6000 1950 6000
Connection ~ 2600 6000
Wire Wire Line
	2600 6000 2200 6000
$Comp
L formula:LED_0805 D501
U 1 1 610B9DD5
P 2200 6450
F 0 "D501" H 2250 6350 50  0000 R CNN
F 1 "LED_0805" H 2300 6550 50  0000 R CNN
F 2 "footprints:LED_0805_OEM" H 2100 6450 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00078860_0.pdf" H 2200 6550 50  0001 C CNN
F 4 "DK" H 2200 6450 60  0001 C CNN "MFN"
F 5 "475-1410-1-ND" H 2200 6450 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=475-1410-1-ND" H 2600 6950 60  0001 C CNN "PurchasingLink"
	1    2200 6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 6600 2600 6600
Wire Wire Line
	2600 6300 2600 6600
Connection ~ 2600 6600
Wire Wire Line
	2600 6600 3250 6600
$Comp
L power:GND #PWR0155
U 1 1 610B9DE0
P 3250 6600
F 0 "#PWR0155" H 3250 6350 50  0001 C CNN
F 1 "GND" H 3400 6550 50  0000 C CNN
F 2 "" H 3250 6600 50  0001 C CNN
F 3 "" H 3250 6600 50  0001 C CNN
	1    3250 6600
	1    0    0    -1  
$EndComp
Connection ~ 3250 6600
$Comp
L formula:SSM3K333R Q501
U 1 1 610B9DEC
P 3150 6000
F 0 "Q501" H 3350 5900 50  0000 L CNN
F 1 "SSM3K333R" H 3356 5955 50  0000 L CNN
F 2 "footprints:SOT-23F" H 3350 5925 50  0001 L CIN
F 3 "https://drive.google.com/drive/folders/0B-V-iZf33Y4GNzhDQTJZanJRbVk" H 3350 6075 50  0001 L CNN
F 4 "DK" H 3650 6375 60  0001 C CNN "MFN"
F 5 "SSM3K333RLFCT-ND" H 3550 6275 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/toshiba-semiconductor-and-storage/SSM3K333RLF/SSM3K333RLFCT-ND/3522391" H 3450 6175 60  0001 C CNN "PurchasingLink"
	1    3150 6000
	1    0    0    -1  
$EndComp
Text GLabel 1950 6000 0    50   Input ~ 0
DETECT_HVD_CONN
Text GLabel 3500 5500 2    50   Input ~ 0
SS_HVD_CONN
Text GLabel 4900 6000 0    50   Input ~ 0
DETECT_TSMS
Text GLabel 6400 5550 2    50   Input ~ 0
SS_TSMS
Text GLabel 4950 3750 0    50   Input ~ 0
DETECT_IMD_LATCH
Text GLabel 6350 3350 2    50   Input ~ 0
SS_IMD_LATCH
Text GLabel 2050 3750 0    50   Input ~ 0
DETECT_MPC
Text GLabel 3600 3300 2    50   Input ~ 0
SS_MPC
Text GLabel 2350 1850 0    50   Input ~ 0
DETECT_HVD
Text GLabel 3550 1450 2    50   Input ~ 0
SS_HVD
Text GLabel 5150 1850 0    50   Input ~ 0
DETECT_BMS
Text GLabel 6350 1400 2    50   Input ~ 0
SS_BMS
Text GLabel 3300 1050 2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 6050 950  2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 6000 2850 2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 6050 5050 2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 3250 4950 2    50   Input ~ 0
5V_AIR_CONTROL
Text GLabel 3250 2800 2    50   Input ~ 0
5V_AIR_CONTROL
Wire Wire Line
	2350 1850 2500 1850
$Comp
L formula:Test_Point_SMD TP503
U 1 1 6144DF79
P 2950 1600
F 0 "TP503" H 2200 1700 50  0000 L CNN
F 1 "DETECT_HVD" H 2450 1700 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2950 1450 50  0001 C CNN
F 3 "" H 2950 1600 50  0001 C CNN
	1    2950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1650 2950 1850
Connection ~ 2950 1850
Wire Wire Line
	2950 1850 2800 1850
Wire Wire Line
	3300 1050 3300 1100
Wire Wire Line
	3300 1650 3300 1600
Wire Wire Line
	3550 1450 3300 1450
Connection ~ 3300 1450
Wire Wire Line
	3300 1450 3300 1400
$Comp
L formula:Test_Point_SMD TP505
U 1 1 614853C0
P 3600 1600
F 0 "TP505" V 3550 1750 50  0000 L CNN
F 1 "SS_HVD" V 3640 1778 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3600 1450 50  0001 C CNN
F 3 "" H 3600 1600 50  0001 C CNN
	1    3600 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1600 3550 1600
Connection ~ 3300 1600
Wire Wire Line
	3300 1600 3300 1450
Wire Wire Line
	6050 950  6050 1050
Wire Wire Line
	6050 1350 6050 1400
Wire Wire Line
	6050 1400 6350 1400
Connection ~ 6050 1400
Wire Wire Line
	6050 1400 6050 1550
$Comp
L formula:Test_Point_SMD TP510
U 1 1 614BF062
P 6400 1550
F 0 "TP510" V 6349 1728 50  0000 L CNN
F 1 "SS_BMS" V 6440 1728 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6400 1400 50  0001 C CNN
F 3 "" H 6400 1550 50  0001 C CNN
	1    6400 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 1550 6350 1550
Connection ~ 6050 1550
Wire Wire Line
	6050 1550 6050 1650
$Comp
L formula:Test_Point_SMD TP508
U 1 1 614C31B9
P 5700 1600
F 0 "TP508" H 4900 1700 50  0000 L CNN
F 1 "DETECT_BMS" H 5150 1700 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5700 1450 50  0001 C CNN
F 3 "" H 5700 1600 50  0001 C CNN
	1    5700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1650 5700 1850
Connection ~ 5700 1850
Wire Wire Line
	5700 1850 5550 1850
Wire Wire Line
	3250 2800 3250 2900
Wire Wire Line
	3250 3200 3250 3300
Wire Wire Line
	3600 3300 3250 3300
Connection ~ 3250 3300
Wire Wire Line
	3250 3300 3250 3450
Wire Wire Line
	6000 2850 6000 2950
Wire Wire Line
	6000 3250 6000 3350
Wire Wire Line
	6350 3350 6000 3350
Connection ~ 6000 3350
Wire Wire Line
	6000 3350 6000 3500
Wire Wire Line
	6050 5450 6050 5550
Wire Wire Line
	6400 5550 6050 5550
Connection ~ 6050 5550
Wire Wire Line
	6050 5550 6050 5750
$Comp
L formula:Test_Point_SMD TP501
U 1 1 615812D8
P 2900 3500
F 0 "TP501" H 2100 3600 50  0000 L CNN
F 1 "DETECT_MPC" H 2350 3600 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2900 3350 50  0001 C CNN
F 3 "" H 2900 3500 50  0001 C CNN
	1    2900 3500
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP506
U 1 1 615818EE
P 3650 3450
F 0 "TP506" V 3599 3628 50  0000 L CNN
F 1 "SS_MPC" V 3690 3628 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3650 3300 50  0001 C CNN
F 3 "" H 3650 3450 50  0001 C CNN
	1    3650 3450
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP507
U 1 1 61590E9D
P 5650 3500
F 0 "TP507" H 4650 3600 50  0000 L CNN
F 1 "DETECT_IMD_LATCH" H 4900 3600 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5650 3350 50  0001 C CNN
F 3 "" H 5650 3500 50  0001 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP511
U 1 1 6159161A
P 6400 3500
F 0 "TP511" V 6349 3678 50  0000 L CNN
F 1 "SS_IMD_LATCH" V 6440 3678 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6400 3350 50  0001 C CNN
F 3 "" H 6400 3500 50  0001 C CNN
	1    6400 3500
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP512
U 1 1 61594549
P 6450 5750
F 0 "TP512" V 6399 5928 50  0000 L CNN
F 1 "SS_TSMS" V 6490 5928 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6450 5600 50  0001 C CNN
F 3 "" H 6450 5750 50  0001 C CNN
	1    6450 5750
	0    1    1    0   
$EndComp
$Comp
L formula:Test_Point_SMD TP509
U 1 1 61596258
P 5700 5750
F 0 "TP509" H 4800 5850 50  0000 L CNN
F 1 "DETECT_TSMS" H 5100 5850 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5700 5600 50  0001 C CNN
F 3 "" H 5700 5750 50  0001 C CNN
	1    5700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4950 3250 5100
Wire Wire Line
	3250 5400 3250 5500
Wire Wire Line
	3500 5500 3250 5500
Connection ~ 3250 5500
Wire Wire Line
	3250 5500 3250 5700
$Comp
L formula:Test_Point_SMD TP502
U 1 1 615BCDC6
P 2900 5750
F 0 "TP502" H 2600 5850 50  0000 L CNN
F 1 "DETECT_HVD_CONN" H 1850 5850 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2900 5600 50  0001 C CNN
F 3 "" H 2900 5750 50  0001 C CNN
	1    2900 5750
	1    0    0    -1  
$EndComp
$Comp
L formula:Test_Point_SMD TP504
U 1 1 615BDF63
P 3550 5700
F 0 "TP504" V 3499 5878 50  0000 L CNN
F 1 "SS_HVD_CONN" V 3590 5878 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3550 5550 50  0001 C CNN
F 3 "" H 3550 5700 50  0001 C CNN
	1    3550 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 5800 2900 6000
Connection ~ 2900 6000
Wire Wire Line
	2900 6000 2600 6000
Wire Wire Line
	3500 5700 3250 5700
Connection ~ 3250 5700
Wire Wire Line
	3250 5700 3250 5800
Wire Wire Line
	5700 5800 5700 6000
Connection ~ 5700 6000
Wire Wire Line
	5700 6000 5450 6000
Wire Wire Line
	6400 5750 6050 5750
Connection ~ 6050 5750
Wire Wire Line
	6050 5750 6050 5800
Wire Wire Line
	5650 3550 5650 3750
Connection ~ 5650 3750
Wire Wire Line
	5650 3750 5500 3750
Wire Wire Line
	6350 3500 6000 3500
Connection ~ 6000 3500
Wire Wire Line
	6000 3500 6000 3550
Wire Wire Line
	2900 3550 2900 3750
Connection ~ 2900 3750
Wire Wire Line
	2900 3750 2650 3750
Wire Wire Line
	3600 3450 3250 3450
Connection ~ 3250 3450
Wire Wire Line
	3250 3450 3250 3550
Wire Wire Line
	6050 5050 6050 5150
$Comp
L formula:R_10K R518
U 1 1 610B9D9C
P 6050 5300
F 0 "R518" H 6120 5346 50  0000 L CNN
F 1 "R_10K" H 6120 5255 50  0000 L CNN
F 2 "footprints:R_0805_OEM" H 5980 5300 50  0001 C CNN
F 3 "http://www.bourns.com/data/global/pdfs/CRS.pdf" H 6130 5300 50  0001 C CNN
F 4 "DK" H 6050 5300 60  0001 C CNN "MFN"
F 5 "CRS0805-FX-1002ELFCT-ND" H 6050 5300 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=CRS0805-FX-1002ELFCT-ND" H 6530 5700 60  0001 C CNN "PurchasingLink"
	1    6050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2050 3300 2450
Wire Wire Line
	6050 2050 6050 2450
Wire Wire Line
	6000 3950 6000 4350
Wire Wire Line
	3250 3950 3250 4350
Wire Wire Line
	3250 6200 3250 6600
Wire Wire Line
	6050 6200 6050 6600
$EndSCHEMATC
