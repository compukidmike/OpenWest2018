EESchema Schematic File Version 2
LIBS:ws2812b
LIBS:adafruit
LIBS:GeekAmmo
LIBS:LilyPad-Wearables
LIBS:SparkFun-Aesthetics
LIBS:SparkFun-AnalogIC
LIBS:SparkFun-Boards
LIBS:SparkFun-Capacitors
LIBS:SparkFun-Connectors
LIBS:SparkFun-DigitalIC
LIBS:SparkFun-DiscreteSemi
LIBS:SparkFun-Displays
LIBS:SparkFun-Electromechanical
LIBS:SparkFun-FreqCtrl
LIBS:SparkFun-Passives
LIBS:SparkFun-PowerIC
LIBS:SparkFun-Resistors
LIBS:SparkFun-Retired
LIBS:SparkFun-RF
LIBS:SparkFun-Sensors
LIBS:Teensy_3_and_LC_Series_Boards_v1.1
LIBS:User-Submitted
LIBS:SparkFun-LED
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:wemos_mini
LIBS:OpenWest2018-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L WeMos_mini U1
U 1 1 5A712B09
P 6600 2750
F 0 "U1" H 6600 3250 60  0000 C CNN
F 1 "WeMos_mini" H 6600 2250 60  0000 C CNN
F 2 "wemos-d1-mini:wemos-d1-mini-with-pin-header-and-connector" H 7150 2050 60  0001 C CNN
F 3 "" H 7150 2050 60  0000 C CNN
	1    6600 2750
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x05 J1
U 1 1 5A712B9C
P 8550 2500
F 0 "J1" H 8550 2800 50  0000 C CNN
F 1 "Conn_01x05" H 8550 2200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x05_Pitch2.54mm" H 8550 2500 50  0001 C CNN
F 3 "" H 8550 2500 50  0001 C CNN
	1    8550 2500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x05 J2
U 1 1 5A712BF3
P 8550 3300
F 0 "J2" H 8550 3600 50  0000 C CNN
F 1 "Conn_01x05" H 8550 3000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x05_Pitch2.54mm" H 8550 3300 50  0001 C CNN
F 3 "" H 8550 3300 50  0001 C CNN
	1    8550 3300
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR01
U 1 1 5A712C36
P 4400 2500
F 0 "#PWR01" H 4400 2350 50  0001 C CNN
F 1 "+BATT" H 4400 2640 50  0000 C CNN
F 2 "" H 4400 2500 50  0001 C CNN
F 3 "" H 4400 2500 50  0001 C CNN
	1    4400 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5A712C56
P 4400 4100
F 0 "#PWR02" H 4400 3850 50  0001 C CNN
F 1 "GND" H 4400 3950 50  0000 C CNN
F 2 "" H 4400 4100 50  0001 C CNN
F 3 "" H 4400 4100 50  0001 C CNN
	1    4400 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A712C76
P 5600 2600
F 0 "#PWR03" H 5600 2350 50  0001 C CNN
F 1 "GND" H 5600 2450 50  0000 C CNN
F 2 "" H 5600 2600 50  0001 C CNN
F 3 "" H 5600 2600 50  0001 C CNN
	1    5600 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 5A712C96
P 7200 2350
F 0 "#PWR04" H 7200 2200 50  0001 C CNN
F 1 "+3.3V" H 7200 2490 50  0000 C CNN
F 2 "" H 7200 2350 50  0001 C CNN
F 3 "" H 7200 2350 50  0001 C CNN
	1    7200 2350
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR05
U 1 1 5A712CB6
P 6050 2350
F 0 "#PWR05" H 6050 2200 50  0001 C CNN
F 1 "+BATT" H 6050 2490 50  0000 C CNN
F 2 "" H 6050 2350 50  0001 C CNN
F 3 "" H 6050 2350 50  0001 C CNN
	1    6050 2350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5A712D7A
P 8200 2300
F 0 "#PWR06" H 8200 2150 50  0001 C CNN
F 1 "+3.3V" H 8200 2440 50  0000 C CNN
F 2 "" H 8200 2300 50  0001 C CNN
F 3 "" H 8200 2300 50  0001 C CNN
	1    8200 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5A712DAF
P 8000 3200
F 0 "#PWR07" H 8000 2950 50  0001 C CNN
F 1 "GND" H 8000 3050 50  0000 C CNN
F 2 "" H 8000 3200 50  0001 C CNN
F 3 "" H 8000 3200 50  0001 C CNN
	1    8000 3200
	1    0    0    -1  
$EndComp
Text GLabel 7100 3000 2    60   Input ~ 0
A0
Text GLabel 6100 2900 0    60   Input ~ 0
D1
Text GLabel 6100 2800 0    60   Input ~ 0
D2
Text GLabel 6100 2700 0    60   Input ~ 0
D3
Text GLabel 7100 2800 2    60   Input ~ 0
D5
Text GLabel 7100 2700 2    60   Input ~ 0
D6
Text GLabel 7100 2600 2    60   Input ~ 0
D7
Text GLabel 7100 2500 2    60   Input ~ 0
D8
Text GLabel 8350 3400 0    60   Input ~ 0
D8
Text GLabel 8350 3300 0    60   Input ~ 0
D7
Text GLabel 8350 3200 0    60   Input ~ 0
D6
Text GLabel 8350 2700 0    60   Input ~ 0
D5
Text GLabel 8350 2600 0    60   Input ~ 0
D3
Text GLabel 8350 2500 0    60   Input ~ 0
D2
Text GLabel 8350 2400 0    60   Input ~ 0
D1
Text GLabel 8350 3500 0    60   Input ~ 0
A0
Wire Wire Line
	8350 3100 8000 3100
Wire Wire Line
	8350 2300 8200 2300
Wire Wire Line
	7100 2400 7200 2400
Wire Wire Line
	7200 2400 7200 2350
Wire Wire Line
	6100 2400 6050 2400
Wire Wire Line
	6050 2400 6050 2350
Wire Wire Line
	6100 2500 5600 2500
Wire Wire Line
	4400 3150 4400 4000
Wire Wire Line
	4400 2500 4400 2750
Wire Wire Line
	7100 2900 7300 2900
Wire Wire Line
	7300 2900 7300 3100
Wire Wire Line
	7300 3100 7100 3100
NoConn ~ 6100 2600
NoConn ~ 6100 3000
NoConn ~ 6100 3100
$Comp
L Battery BT1
U 1 1 5AA8A7B0
P 4400 2950
F 0 "BT1" H 4500 3050 50  0000 L CNN
F 1 "Battery" H 4500 2950 50  0000 L CNN
F 2 "Battery-WireConn:Battery-WireConn" V 4400 3010 50  0001 C CNN
F 3 "" V 4400 3010 50  0001 C CNN
	1    4400 2950
	1    0    0    -1  
$EndComp
$Comp
L WS2812B LED1
U 1 1 5AA8AC33
P 6600 3900
F 0 "LED1" H 6600 3500 60  0000 C CNN
F 1 "WS2812B" H 6600 4300 60  0000 C CNN
F 2 "WS2812b-HandSolder:WS2812B" V 6550 3900 60  0001 C CNN
F 3 "" V 6550 3900 60  0000 C CNN
	1    6600 3900
	1    0    0    -1  
$EndComp
$Comp
L WS2812B LED2
U 1 1 5AA8AC7E
P 6600 4950
F 0 "LED2" H 6600 4550 60  0000 C CNN
F 1 "WS2812B" H 6600 5350 60  0000 C CNN
F 2 "WS2812b-HandSolder:WS2812B" V 6550 4950 60  0001 C CNN
F 3 "" V 6550 4950 60  0000 C CNN
	1    6600 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5AA8AD75
P 7150 4200
F 0 "#PWR08" H 7150 3950 50  0001 C CNN
F 1 "GND" H 7150 4050 50  0000 C CNN
F 2 "" H 7150 4200 50  0001 C CNN
F 3 "" H 7150 4200 50  0001 C CNN
	1    7150 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5AA8AD92
P 7150 5250
F 0 "#PWR09" H 7150 5000 50  0001 C CNN
F 1 "GND" H 7150 5100 50  0000 C CNN
F 2 "" H 7150 5250 50  0001 C CNN
F 3 "" H 7150 5250 50  0001 C CNN
	1    7150 5250
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR010
U 1 1 5AA8ADAF
P 6050 3700
F 0 "#PWR010" H 6050 3550 50  0001 C CNN
F 1 "+BATT" H 6050 3840 50  0000 C CNN
F 2 "" H 6050 3700 50  0001 C CNN
F 3 "" H 6050 3700 50  0001 C CNN
	1    6050 3700
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR011
U 1 1 5AA8ADCC
P 6050 4750
F 0 "#PWR011" H 6050 4600 50  0001 C CNN
F 1 "+BATT" H 6050 4890 50  0000 C CNN
F 2 "" H 6050 4750 50  0001 C CNN
F 3 "" H 6050 4750 50  0001 C CNN
	1    6050 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3700 6050 3700
Wire Wire Line
	5850 3400 7200 3400
Wire Wire Line
	7200 3400 7200 3700
Wire Wire Line
	7200 3700 7100 3700
Wire Wire Line
	7150 4100 7100 4100
Wire Wire Line
	6100 4100 6000 4100
Wire Wire Line
	6000 4100 6000 4450
Wire Wire Line
	6000 4450 7200 4450
Wire Wire Line
	7200 4450 7200 4750
Wire Wire Line
	7200 4750 7100 4750
Wire Wire Line
	7150 5150 7100 5150
Wire Wire Line
	6100 4750 6050 4750
Wire Wire Line
	6100 2600 5850 2600
Wire Wire Line
	5850 2600 5850 3400
$Comp
L TEST DOUT1
U 1 1 5AD67A93
P 5750 5150
F 0 "DOUT1" H 5750 5450 50  0000 C BNN
F 1 "TEST" H 5750 5400 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 5750 5150 50  0001 C CNN
F 3 "" H 5750 5150 50  0001 C CNN
	1    5750 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5150 5750 5150
$EndSCHEMATC
