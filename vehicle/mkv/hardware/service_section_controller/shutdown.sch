EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4650 1550 0    98   ~ 0
SHUTDOWN  CIRCUIT CONNECTOR
Wire Wire Line
	5275 3425 5425 3425
Wire Wire Line
	5275 3325 6350 3325
Wire Wire Line
	5275 3225 5900 3225
Wire Wire Line
	5900 3125 5275 3125
Wire Wire Line
	5275 3025 5900 3025
NoConn ~ 5275 3525
Text GLabel 5900 3025 2    50   Input ~ 0
TO_MPC
Text GLabel 5900 2925 2    50   Input ~ 0
TO_TSMS
Text GLabel 6425 3325 2    50   Input ~ 0
FINAL_SHUTDOWN
Text GLabel 5900 3125 2    50   Input ~ 0
FROM_MPC
Text GLabel 5425 3425 2    50   Input ~ 0
FROM_HVD_CONN
Text GLabel 5900 3225 2    50   Input ~ 0
TO_HVD_CONN
Text GLabel 5900 2825 2    50   Input ~ 0
FROM_HVD
Text GLabel 5150 3825 0    50   Input ~ 0
FROM_IMD_LATCH
Text GLabel 5675 3825 2    50   Input ~ 0
TO_TSMS
Wire Wire Line
	5275 2925 5900 2925
Wire Wire Line
	5150 3825 5175 3825
Text Notes 6975 3450 0    50   ~ 0
comes from TSMS
Text Notes 6375 2850 0    50   ~ 0
comes from HVD interlock
Text Notes 6050 3850 0    50   ~ 0
comes from IMD relay
Text GLabel 5150 4075 0    50   Input ~ 0
FROM_HVD
Text GLabel 5675 4075 2    50   Input ~ 0
TO_HVD_CONN
Wire Wire Line
	5150 4075 5175 4075
Text Notes 6275 4100 0    50   ~ 0
Interlock (purple) wires
Text GLabel 5150 4325 0    50   Input ~ 0
FROM_HVD_CONN
Text GLabel 5675 4325 2    50   Input ~ 0
TO_MPC
Wire Wire Line
	5150 4325 5175 4325
Text Notes 6050 4350 0    50   ~ 0
From HVD_CONN interlock to the MPC interlock
Text GLabel 5150 4575 0    50   Input ~ 0
FROM_MPC
Text GLabel 5675 4575 2    50   Input ~ 0
TO_BMS
Wire Wire Line
	5150 4575 5200 4575
Text Notes 6025 4600 0    50   ~ 0
From the mpc interlock to the bms relay
Text Notes 6300 2950 0    50   ~ 0
from IMD relay
Text Notes 6250 3050 0    50   ~ 0
from hvd conn
Text Notes 6400 3150 0    50   ~ 0
to bms
Text Notes 6500 3250 0    50   ~ 0
from hvd
Text Notes 5850 3550 0    50   ~ 0
to mpc
Text GLabel 6425 3425 2    50   Input ~ 0
DETECT_TSMS
Wire Wire Line
	6350 3325 6350 3425
Wire Wire Line
	6350 3425 6425 3425
Connection ~ 6350 3325
Wire Wire Line
	6350 3325 6425 3325
Text GLabel 5150 4675 0    50   Input ~ 0
DETECT_MPC
Wire Wire Line
	5200 4575 5200 4675
Wire Wire Line
	5200 4675 5150 4675
Connection ~ 5200 4575
Wire Wire Line
	5200 4575 5675 4575
Text GLabel 5150 4425 0    50   Input ~ 0
DETECT_HVD_CONN
Wire Wire Line
	5175 4325 5175 4425
Wire Wire Line
	5175 4425 5150 4425
Connection ~ 5175 4325
Wire Wire Line
	5175 4325 5675 4325
Text GLabel 5150 4175 0    50   Input ~ 0
DETECT_HVD
Wire Wire Line
	5175 4075 5175 4175
Wire Wire Line
	5175 4175 5150 4175
Connection ~ 5175 4075
Wire Wire Line
	5175 4075 5675 4075
Text GLabel 5150 3925 0    50   Input ~ 0
DETECT_IMD_LATCH
Wire Wire Line
	5175 3825 5175 3925
Wire Wire Line
	5175 3925 5150 3925
Connection ~ 5175 3825
Wire Wire Line
	5175 3825 5675 3825
Wire Wire Line
	5275 2825 5900 2825
$Comp
L formula:MicroFit_RA_08 J1101
U 1 1 6286ECF2
P 5025 3125
F 0 "J1101" H 5083 3672 60  0000 C CNN
F 1 "MicroFit_RA_08" H 5083 3566 60  0000 C CNN
F 2 "footprints:430450800" H 4925 3425 60  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/430450601_sd.pdf" H 5025 3525 60  0001 C CNN
F 4 "Molex" H 5125 4525 60  0001 C CNN "MFN"
F 5 "WM3253-ND" H 5225 4625 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/molex/0430450801/WM3253-ND/2405169" H 5125 3625 60  0001 C CNN "PurchasingLink"
	1    5025 3125
	1    0    0    -1  
$EndComp
$EndSCHEMATC
