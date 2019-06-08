; Diamond

;----- Z-Probe
M574 Z1 S2															; Set Z endstops controlled by probe
M558 P5 R0.4 H5 F1200 T9000								; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.5												; Set Z probe trigger value, offset and trigger height
M557 X0:500 Y0:500 S50										; Define mesh grid

;----- Heater
M305 P1 X2 T100000 B4138 R4700 S"Hotend"			; Set thermistor + ADC parameters for heater 1
M143 H1 S280														; Set temperature limit for heater 1 to 280C

;----- Fans
M106 P0 S0 I0 F500 H-1 C"Part Cooling"					; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
;M106 P2 S0 I0 F500 H-1 C"Air Pump"

M106 P5 S0 I0 H2:3:4:5 T45  C"Water Pump"
M106 P6 S0 I0 H2:3:4:5 T45  C"Water Cooling"

;----- Tools
M563 P0 S"Cyan" D0 H2 F0										; Define tool 0
G10 P0 X0 Y0 Z0													; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"Yellow" D1 H2 F0									; Define tool 1
G10 P1 X0 Y0 Z0													; Set tool 1 axis offsets
G10 P1 R0 S0															; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"Magenta" D2 H2 F0								; Define tool 2
G10 P2 X0 Y0 Z0													; Set tool 2 axis offsets
G10 P2 R0 S0															; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"Black" D3 H2 F0										; Define tool 3
G10 P3 X0 Y0 Z0													; Set tool 3 axis offsets
G10 P3 R0 S0															; Set initial tool 3 active and standby temperatures to 0C

M563 P4 S"White" D4 H2 F0									; Define tool 4
G10 P4 X0 Y0 Z0													; Set tool 4 axis offsets
G10 P4 R0 S0															; Set initial tool 4 active and standby temperatures to 0C

M563 P5 S"Mixing" D0:1:2:3:4 H2 F0						; Define tool 5
G10 P5 X0 Y0 Z0													; Set tool 5 axis offsets
G10 P5 R0 S0															; Set initial tool 5 active and standby temperatures to 0C

M568 P5 S1															; Enable mixing for tool 5
M567 P5 E0.2:0.2:0.2:0.2:0.2									; Set mixing ratios for tool 5

;----- Filament Sensors
M591 D5 C3															; filament sensor on E0 endstop input
M591 D6 C3															; filament sensor on E0 endstop input
M591 D7 C3															; filament sensor on E0 endstop input
M591 D8 C3															; filament sensor on E0 endstop input
M591 D9 C3															; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D5:6:7:8:9 S0.25											; set pressure advance for all 5 extruders

;----- Filament properties
M404 N1.75 D0.4													; filament width and nozzle diameter

M117 "Setup: Diamond"
