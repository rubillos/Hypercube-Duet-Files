; Volcano

;----- Extruder mapping
M584 E7							                      ; 1 extruder

;----- Extruders
M569 P7 S1										            ; Physical drive 7 goes forwards - E4

M350 E16 I1					                      ; Configure microstepping with interpolation
M92 E420.00					                      ; Set steps per mm
M203 E3000.00				                      ; Set maximum speeds (mm/min)
M201 E500.00					                    ; Set accelerations (mm/s^2)
M566 E120.00					                    ; Set maximum instantaneous speed changes (mm/min)
M906 1500.00 I30                          ; Set motor currents (mA) and motor idle factor in percent

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstops controlled by probe
M558 P5 R0.4 H5 F1200 T9000								; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.5												; Set Z probe trigger value, offset and trigger height
M557 X0:500 Y0:500 S50										; Define mesh grid

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S280														  ; Set temperature limit to 280C

;----- Fans
M106 P0 S0 I0 F500 H-1 C"Part Cooling"		; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
;M106 P2 S0 I0 F500 H-1 C"Air Pump"				; assign air pump to fan 2
M106 P1 S1 I0 F500 H1 T45 C"Extruder"		  ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on

;----- Tools
M563 P0 S"Volcano" D0 H1									; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Filament Sensor
M591 D0 P2 C3															; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0 S0.1														  ; set pressure advance to 0.1 seconds

;----- Filament properties
M404 N1.75 D1.0													  ; filament width and nozzle diameter

;----- Finish
M117 "Setup: Volcano"

M98 P"/sys/finish.g"
