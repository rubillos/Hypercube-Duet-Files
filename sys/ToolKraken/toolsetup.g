; Kraken

;----- Drive mapping
M584 X0 Y1 Z2:3 E5:6:7:8				          ; X, Y, 2 x Z, 1 extruder
M671 X-30:530 Y250:250 S2.0			          ; leadscrews at left and right of X axis

;----- Drives
M569 P0 S0										            ; Physical drive 0 goes backwards - X
M569 P1 S0										            ; Physical drive 1 goes backwards - Y
M569 P2 S0										            ; Physical drive 2 goes reverse - Z1
M569 P3 S0										            ; Physical drive 3 goes reverse - Z2
M569 P5 S1										            ; Physical drive 5 goes forwards - E2
M569 P6 S1										            ; Physical drive 6 goes forwards - E3
M569 P7 S1										            ; Physical drive 7 goes forwards - E4
M569 P8 S1										            ; Physical drive 8 goes forwards - E5

M350     X16			  Y16			  Z16		  E16:16:16:16 I1				               	; Configure microstepping with interpolation
M92	     X80.00	    Y80.00	Z4000.00	E420.00:420.00:420.00:420.00					; Set steps per mm
M203	X18000.00  Y18000.00	 Z360.00	E3000.00:3000.00:3000.00:3000.00			; Set maximum speeds (mm/min)
M201	 X3000.00		Y3000.00	 Z120.00	E500.00:500.00:500.00:500.00					; Set accelerations (mm/s^2)
M566    X900.00	   Y900.00	  Z24.00	E120.00:120.00:120.00:120.00					; Set maximum instantaneous speed changes (mm/min)
M906   X1800.00		Y1800.00	Z1800.00	E1800.00:1800.00:1800.00:1800.00 I30	; Set motor currents (mA) and motor idle factor in percent

M84 S30											              ; Set idle timeout

;----- Endstops
M574 X1 Y1 S3									            ; Set endstops controlled by motor load detection

;----- Z-Probe
M574 Z1 S2														  	; Set Z endstops controlled by probe
M558 P5 R0.4 H5 F1200 T9000								; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.5												; Set Z probe trigger value, offset and trigger height
M557 X0:500 Y0:500 S50										; Define mesh grid

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heaters
M305 P3 T100000 B4138 R4700 S"1"				  ; Set thermistor + ADC parameters
M143 H3 S280														  ; Set temperature limit to 280C
M305 P4 T100000 B4138 R4700 S"2"				  ; Set thermistor + ADC parameters
M143 H4 S280														  ; Set temperature limit to 280C
M305 P5 T100000 B4138 R4700 S"3"				  ; Set thermistor + ADC parameters
M143 H5 S280														  ; Set temperature limit to 280C
M305 P6 T100000 B4138 R4700 S"4"				  ; Set thermistor + ADC parameters
M143 H6 S280														  ; Set temperature limit to 280C

;----- Fans
M106 P0 S0 I0 F500 H-1 C"Part Cooling"					; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
;M106 P2 S0 I0 F500 H-1 C"Air Pump"

M106 P5 S0 I0 H2:3:4:5 T45  C"Water Pump"
M106 P6 S0 I0 H2:3:4:5 T45  C"Water Cooling"

;----- Tools
M563 P0 S"Kraken 1" D0 H3 F0							; Define tool 0
G10 P0 X-10 Y0 Z0												  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"Kraken 2" D1 H4 F0							; Define tool 1
G10 P1 X10 Y0 Z0												  ; Set tool 1 axis offsets
G10 P1 R0 S0															; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"Kraken 3" D2 H5 F0							; Define tool 2
G10 P2 X10 Y-20 Z0												; Set tool 2 axis offsets
G10 P2 R0 S0															; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"Kraken 4" D3 H6 F0							; Define tool 3
G10 P3 X-10 Y-20 Z0												; Set tool 3 axis offsets
G10 P3 R0 S0															; Set initial tool 3 active and standby temperatures to 0C

;----- Filament Sensors
M591 D0 P2 C3															; filament sensor on E0 endstop input
M591 D1 P2 C3															; filament sensor on E0 endstop input
M591 D2 P2 C3													  	; filament sensor on E0 endstop input
M591 D3 P2 C3													  	; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0 S0.1														; set pressure advance for extruder 1
M572 D1 S0.1														; set pressure advance for extruder 2
M572 D2 S0.1														; set pressure advance for extruder 3
M572 D3 S0.1														; set pressure advance for extruder 4

;----- Filament properties
M404 N1.75 D0.4													; filament width and nozzle diameter

; Automatic saving after power loss is not enabled

M117 "Setup: Kraken"
