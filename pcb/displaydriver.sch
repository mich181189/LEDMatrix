EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:teensy
LIBS:rgbledmtx
LIBS:TXB0108-PW
LIBS:displaydriver-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RGB LED Matrix"
Date "2017-01-09"
Rev "1.1"
Comp "Michael Cullen"
Comment1 "Bodgetastic Version"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +3V3 #PWR01
U 1 1 5866D456
P 4650 4400
F 0 "#PWR01" H 4650 4250 50  0001 C CNN
F 1 "+3V3" H 4650 4540 50  0000 C CNN
F 2 "" H 4650 4400 50  0000 C CNN
F 3 "" H 4650 4400 50  0000 C CNN
	1    4650 4400
	1    0    0    -1  
$EndComp
$Comp
L Teensy3.1 U1
U 1 1 5866D593
P 2800 3400
F 0 "U1" H 2800 4900 60  0000 C CNN
F 1 "Teensy3.1" H 2800 1900 60  0000 C CNN
F 2 "Teensy:Teensy30_31_32_LC" H 2800 2600 60  0001 C CNN
F 3 "" H 2800 2600 60  0000 C CNN
	1    2800 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5866D621
P 1350 2100
F 0 "#PWR02" H 1350 1850 50  0001 C CNN
F 1 "GND" H 1350 1950 50  0000 C CNN
F 2 "" H 1350 2100 50  0000 C CNN
F 3 "" H 1350 2100 50  0000 C CNN
	1    1350 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5866D638
P 1250 3700
F 0 "#PWR03" H 1250 3450 50  0001 C CNN
F 1 "GND" H 1250 3550 50  0000 C CNN
F 2 "" H 1250 3700 50  0000 C CNN
F 3 "" H 1250 3700 50  0000 C CNN
	1    1250 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5866D64F
P 4500 3600
F 0 "#PWR04" H 4500 3350 50  0001 C CNN
F 1 "GND" H 4500 3450 50  0000 C CNN
F 2 "" H 4500 3600 50  0000 C CNN
F 3 "" H 4500 3600 50  0000 C CNN
	1    4500 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5866D674
P 4650 2500
F 0 "#PWR05" H 4650 2250 50  0001 C CNN
F 1 "GND" H 4650 2350 50  0000 C CNN
F 2 "" H 4650 2500 50  0000 C CNN
F 3 "" H 4650 2500 50  0000 C CNN
	1    4650 2500
	1    0    0    -1  
$EndComp
$Comp
L RGBLEDMTX U4
U 1 1 5866DBAF
P 7300 2250
F 0 "U4" H 7300 2250 60  0000 C CNN
F 1 "RGBLEDMTX" H 7300 1250 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08_Pitch2.54mm" H 7300 2250 60  0001 C CNN
F 3 "" H 7300 2250 60  0001 C CNN
	1    7300 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5866DC39
P 8100 2550
F 0 "#PWR06" H 8100 2300 50  0001 C CNN
F 1 "GND" H 8100 2400 50  0000 C CNN
F 2 "" H 8100 2550 50  0000 C CNN
F 3 "" H 8100 2550 50  0000 C CNN
	1    8100 2550
	1    0    0    -1  
$EndComp
$Comp
L TXB0108-PW U2
U 1 1 5866DD35
P 5850 2700
F 0 "U2" H 5650 3450 60  0000 L CNN
F 1 "TXB0108-PW" H 5650 1950 60  0000 L CNN
F 2 "txb0108_breakout:txb0108_breakout" H 5650 2650 60  0001 C CNN
F 3 "" H 5650 2650 60  0000 C CNN
	1    5850 2700
	1    0    0    -1  
$EndComp
$Comp
L TXB0108-PW U3
U 1 1 5866DD6F
P 5850 4350
F 0 "U3" H 5650 5100 60  0000 L CNN
F 1 "TXB0108-PW" H 5650 3600 60  0000 L CNN
F 2 "txb0108_breakout:txb0108_breakout" H 5650 4300 60  0001 C CNN
F 3 "" H 5650 4300 60  0000 C CNN
	1    5850 4350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5866DF08
P 6600 2100
F 0 "#PWR07" H 6600 1950 50  0001 C CNN
F 1 "+5V" H 6600 2240 50  0000 C CNN
F 2 "" H 6600 2100 50  0000 C CNN
F 3 "" H 6600 2100 50  0000 C CNN
	1    6600 2100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR08
U 1 1 5866DF61
P 5200 2100
F 0 "#PWR08" H 5200 1950 50  0001 C CNN
F 1 "+3V3" H 5200 2240 50  0000 C CNN
F 2 "" H 5200 2100 50  0000 C CNN
F 3 "" H 5200 2100 50  0000 C CNN
	1    5200 2100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR09
U 1 1 5866E004
P 5250 3750
F 0 "#PWR09" H 5250 3600 50  0001 C CNN
F 1 "+3V3" H 5250 3890 50  0000 C CNN
F 2 "" H 5250 3750 50  0000 C CNN
F 3 "" H 5250 3750 50  0000 C CNN
	1    5250 3750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 5866E024
P 6500 3750
F 0 "#PWR010" H 6500 3600 50  0001 C CNN
F 1 "+5V" H 6500 3890 50  0000 C CNN
F 2 "" H 6500 3750 50  0000 C CNN
F 3 "" H 6500 3750 50  0000 C CNN
	1    6500 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5866E044
P 5250 3300
F 0 "#PWR011" H 5250 3050 50  0001 C CNN
F 1 "GND" H 5250 3150 50  0000 C CNN
F 2 "" H 5250 3300 50  0000 C CNN
F 3 "" H 5250 3300 50  0000 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5866E0AC
P 5250 4950
F 0 "#PWR012" H 5250 4700 50  0001 C CNN
F 1 "GND" H 5250 4800 50  0000 C CNN
F 2 "" H 5250 4950 50  0000 C CNN
F 3 "" H 5250 4950 50  0000 C CNN
	1    5250 4950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR013
U 1 1 5870D874
P 9200 1950
F 0 "#PWR013" H 9200 1800 50  0001 C CNN
F 1 "+5V" H 9200 2090 50  0000 C CNN
F 2 "" H 9200 1950 50  0000 C CNN
F 3 "" H 9200 1950 50  0000 C CNN
	1    9200 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5870D89C
P 9200 2200
F 0 "#PWR014" H 9200 1950 50  0001 C CNN
F 1 "GND" H 9200 2050 50  0000 C CNN
F 2 "" H 9200 2200 50  0000 C CNN
F 3 "" H 9200 2200 50  0000 C CNN
	1    9200 2200
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP1
U 1 1 5870FE60
P 4250 4200
F 0 "JP1" H 4250 4280 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 4140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4250 4200 50  0001 C CNN
F 3 "" H 4250 4200 50  0000 C CNN
	1    4250 4200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 5870FF20
P 4500 4200
F 0 "#PWR015" H 4500 4050 50  0001 C CNN
F 1 "+5V" H 4500 4340 50  0000 C CNN
F 2 "" H 4500 4200 50  0000 C CNN
F 3 "" H 4500 4200 50  0000 C CNN
	1    4500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2100 1350 2100
Wire Wire Line
	1250 3700 1700 3700
Wire Wire Line
	4650 2500 3900 2500
Wire Wire Line
	4650 4400 3900 4400
Wire Wire Line
	7400 2550 8100 2550
Wire Wire Line
	7400 2750 8000 2750
Wire Wire Line
	8000 3150 8000 2550
Connection ~ 8000 2550
Wire Wire Line
	7400 3150 8000 3150
Connection ~ 8000 2750
Wire Wire Line
	5250 3300 5450 3300
Wire Wire Line
	5250 3750 5450 3750
Wire Wire Line
	5250 4950 5450 4950
Wire Wire Line
	6350 2400 7000 2400
Wire Wire Line
	7000 2400 7000 2450
Wire Wire Line
	7000 2450 7200 2450
Wire Wire Line
	7200 2550 6350 2550
Wire Wire Line
	6350 2550 6350 2500
Wire Wire Line
	6350 2600 7200 2600
Wire Wire Line
	7200 2600 7200 2650
Wire Wire Line
	7200 2750 6350 2750
Wire Wire Line
	6350 2750 6350 2700
Wire Wire Line
	6350 2800 7200 2800
Wire Wire Line
	7200 2800 7200 2850
Wire Wire Line
	7200 2950 6350 2950
Wire Wire Line
	6350 2950 6350 2900
Wire Wire Line
	6350 3000 7200 3000
Wire Wire Line
	7200 3000 7200 3050
Wire Wire Line
	7200 3150 6350 3150
Wire Wire Line
	6350 3150 6350 3100
Wire Wire Line
	1700 2400 1500 2400
Wire Wire Line
	1500 2400 1500 1900
Wire Wire Line
	1500 1900 5150 1900
Wire Wire Line
	5150 1900 5150 2400
Wire Wire Line
	5150 2400 5450 2400
Wire Wire Line
	5450 2500 4900 2500
Wire Wire Line
	4900 2500 4900 1850
Wire Wire Line
	4900 1850 1150 1850
Wire Wire Line
	1150 1850 1150 2500
Wire Wire Line
	1150 2500 1700 2500
Wire Wire Line
	1700 2600 1050 2600
Wire Wire Line
	1050 2600 1050 1800
Wire Wire Line
	1050 1800 4850 1800
Wire Wire Line
	4850 1800 4850 2600
Wire Wire Line
	4850 2600 5450 2600
Wire Wire Line
	5450 2700 4950 2700
Wire Wire Line
	4950 2700 4950 1750
Wire Wire Line
	4950 1750 950  1750
Wire Wire Line
	950  1750 950  2700
Wire Wire Line
	950  2700 1700 2700
Wire Wire Line
	5450 2800 5000 2800
Wire Wire Line
	5000 2800 5000 1700
Wire Wire Line
	5000 1700 800  1700
Wire Wire Line
	800  1700 800  2800
Wire Wire Line
	800  2800 1700 2800
Wire Wire Line
	1700 2900 700  2900
Wire Wire Line
	700  2900 700  1650
Wire Wire Line
	700  1650 4800 1650
Wire Wire Line
	4800 1650 4800 2900
Wire Wire Line
	4800 2900 5450 2900
Wire Wire Line
	5450 3000 5050 3000
Wire Wire Line
	5050 3000 5050 1600
Wire Wire Line
	5050 1600 600  1600
Wire Wire Line
	600  1600 600  3000
Wire Wire Line
	600  3000 1700 3000
Wire Wire Line
	1700 3100 500  3100
Wire Wire Line
	500  3100 500  1550
Wire Wire Line
	500  1550 4750 1550
Wire Wire Line
	4750 1550 4750 3100
Wire Wire Line
	4750 3100 5450 3100
Wire Wire Line
	5450 3950 5300 3950
Wire Wire Line
	5300 3950 5300 3750
Connection ~ 5300 3750
Wire Wire Line
	9000 1950 9750 1950
Wire Wire Line
	9000 2200 9200 2200
Wire Wire Line
	9000 2050 9000 2200
Wire Wire Line
	3900 4200 4150 4200
Wire Wire Line
	5200 2100 5450 2100
Wire Wire Line
	5450 2300 5350 2300
Wire Wire Line
	5350 2300 5350 2100
Connection ~ 5350 2100
Wire Wire Line
	6600 2100 6350 2100
Wire Wire Line
	6500 3750 6350 3750
Wire Wire Line
	4350 4200 4500 4200
Wire Wire Line
	4500 3600 3900 3600
Wire Wire Line
	5450 4050 4850 4050
Wire Wire Line
	4850 4050 4850 5050
Wire Wire Line
	4850 5050 1450 5050
Wire Wire Line
	1450 5050 1450 4500
Wire Wire Line
	1450 4500 1700 4500
Wire Wire Line
	1700 4400 1400 4400
Wire Wire Line
	1400 4400 1400 5100
Wire Wire Line
	1400 5100 4900 5100
Wire Wire Line
	4900 5100 4900 4150
Wire Wire Line
	4900 4150 5450 4150
Wire Wire Line
	5450 4250 4950 4250
Wire Wire Line
	4950 4250 4950 5150
Wire Wire Line
	4950 5150 1350 5150
Wire Wire Line
	1350 5150 1350 4300
Wire Wire Line
	1350 4300 1700 4300
Wire Wire Line
	1700 4200 1300 4200
Wire Wire Line
	1300 4200 1300 5200
Wire Wire Line
	1300 5200 5000 5200
Wire Wire Line
	5000 5200 5000 4350
Wire Wire Line
	5000 4350 5450 4350
Wire Wire Line
	5450 4450 5050 4450
Wire Wire Line
	5050 4450 5050 5250
Wire Wire Line
	5050 5250 1250 5250
Wire Wire Line
	1250 5250 1250 4100
Wire Wire Line
	1250 4100 1700 4100
Wire Wire Line
	6350 4450 8400 4450
Wire Wire Line
	8400 4450 8400 2450
Wire Wire Line
	8400 2450 7400 2450
Wire Wire Line
	6350 4350 8300 4350
Wire Wire Line
	8300 4350 8300 2650
Wire Wire Line
	8300 2650 7400 2650
Wire Wire Line
	6350 4250 8200 4250
Wire Wire Line
	8200 4250 8200 2850
Wire Wire Line
	8200 2850 7400 2850
Wire Wire Line
	6350 4150 8150 4150
Wire Wire Line
	8150 4150 8150 2950
Wire Wire Line
	8150 2950 7400 2950
Wire Wire Line
	7400 3050 8100 3050
Wire Wire Line
	8100 3050 8100 4050
Wire Wire Line
	8100 4050 6350 4050
$Comp
L BARREL_JACK CON1
U 1 1 589A96D6
P 8700 2050
F 0 "CON1" H 8700 2300 50  0000 C CNN
F 1 "BARREL_JACK" H 8700 1850 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 8700 2050 50  0001 C CNN
F 3 "" H 8700 2050 50  0000 C CNN
	1    8700 2050
	1    0    0    -1  
$EndComp
Connection ~ 9000 2150
$Comp
L Screw_Terminal_1x02 J1
U 1 1 5930CD16
P 9950 2050
F 0 "J1" H 9950 2300 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 9800 2050 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_PT-3.5mm_2pol" H 9950 1825 50  0001 C CNN
F 3 "" H 9925 2050 50  0001 C CNN
	1    9950 2050
	-1   0    0    1   
$EndComp
Connection ~ 9200 1950
Wire Wire Line
	9750 2150 9200 2150
Wire Wire Line
	9200 2150 9200 2200
$EndSCHEMATC
