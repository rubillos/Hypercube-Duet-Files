; Volcano

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
;M106 P2 S0 I0 F500 H-1 C"Air Pump"						; assign air pump to fan 2
M106 P1 S1 I0 F500 H1 T45 C"Extruder Cooling"		; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on

;----- Tools
M563 P0 S"Volcano" D5 H2										; Define tool 0
G10 P0 X0 Y0 Z0													; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Filament Sensor
M591 D5 C3															; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D5 S0.1														; set pressure advance to 0.1 seconds

;----- Filament properties
M404 N1.75 D1.0													; filament width and nozzle diameter

M117 "Setup: Volcano"
