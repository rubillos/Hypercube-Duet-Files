; Kraken

;----- Z-Probe
M574 Z1 S2															; Set Z endstops controlled by probe
M558 P5 R0.4 H5 F1200 T9000								; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.5												; Set Z probe trigger value, offset and trigger height
M557 X0:500 Y0:500 S50										; Define mesh grid

;----- Heaters
M305 P1 T100000 B4138 R4700 X2 S"1"					; Set thermistor + ADC parameters for heater 1 and remap it to channel 3
M143 H1 S280														; Set temperature limit for heater 1 to 280C
M305 P2 T100000 B4138 R4700 X3 S"2"					; Set thermistor + ADC parameters for heater 2 and remap it to channel 4
M143 H2 S280														; Set temperature limit for heater 2 to 280C
M305 P3 T100000 B4138 R4700 X4 S"3"					; Set thermistor + ADC parameters for heater 3 and remap it to channel 5
M143 H3 S280														; Set temperature limit for heater 3 to 280C
M305 P4 T100000 B4138 R4700 X5 S"4"					; Set thermistor + ADC parameters for heater 4 and remap it to channel 6
M143 H4 S280														; Set temperature limit for heater 4 to 280C

;----- Fans
M106 P0 S0 I0 F500 H-1 C"Part Cooling"					; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
;M106 P2 S0 I0 F500 H-1 C"Air Pump"

M106 P5 S0 I0 H2:3:4:5 T45  C"Water Pump"
M106 P6 S0 I0 H2:3:4:5 T45  C"Water Cooling"

;----- Tools
M563 P0 S"Kraken 1" D5 H2 F0								; Define tool 0
G10 P0 X-10 Y-10 Z0												; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"Kraken 2" D6 H3 F0								; Define tool 1
G10 P1 X10 Y-10 Z0												; Set tool 1 axis offsets
G10 P1 R0 S0															; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"Kraken 3" D7 H4 F0								; Define tool 2
G10 P2 X10 Y10 Z0												; Set tool 2 axis offsets
G10 P2 R0 S0															; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"Kraken 4" D8 H5 F0								; Define tool 3
G10 P3 X-10 Y10 Z0												; Set tool 3 axis offsets
G10 P3 R0 S0															; Set initial tool 3 active and standby temperatures to 0C

;----- Filament Sensors
M591 D5 C3															; filament sensor on E0 endstop input
M591 D6 C3															; filament sensor on E0 endstop input
M591 D7 C3															; filament sensor on E0 endstop input
M591 D8 C3															; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D5 S0.1														; set pressure advance for extruder 1
M572 D6 S0.1														; set pressure advance for extruder 2
M572 D7 S0.1														; set pressure advance for extruder 3
M572 D8 S0.1														; set pressure advance for extruder 4

;----- Filament properties
M404 N1.75 D0.4													; filament width and nozzle diameter

M117 "Setup: Kraken"
