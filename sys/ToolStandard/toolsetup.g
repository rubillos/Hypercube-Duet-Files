; Standard

;----- Drive mapping
M584 X0 Y1 Z2:3 E7							          ; X, Y, 2 x Z, 1 extruder
M671 X-20:520 Y250:250 S2.0			          ; leadscrews at left and right of X axis

;----- Drives
M569 P0 S1										            ; Physical drive 0 goes forwards - X
M569 P1 S1										            ; Physical drive 1 goes forwards - Y
M569 P2 S1										            ; Physical drive 2 goes forwards - Z1
M569 P3 S1										            ; Physical drive 3 goes forwards - Z2
M569 P7 S1										            ; Physical drive 7 goes forwards - E4

M350     X16			  Y16			  Z16		  E16 I1					; Configure microstepping with interpolation
M92	     X80.00	    Y80.00	Z4000.00	E420.00					; Set steps per mm
M203	X18000.00  Y18000.00	 Z360.00	E3000.00				; Set maximum speeds (mm/min)
M201	 X3000.00		Y3000.00	 Z120.00	E500.00					; Set accelerations (mm/s^2)
M566    X900.00	   Y900.00	  Z24.00	E120.00					; Set maximum instantaneous speed changes (mm/min)
M906   X1800.00		Y1800.00	Z1800.00	E1800.00 I30	  ; Set motor currents (mA) and motor idle factor in percent

M84 S30											              ; Set idle timeout

;----- Endstops
M574 X1 Y1 S3									            ; Set endstops controlled by motor load detection

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstops controlled by probe
M558 P5 R0.4 H5 F1200 T9000								; Set Z probe type to effector and the dive height + speeds
G31 P500 X0 Y0 Z0.5												; Set Z probe trigger value, offset and trigger height
M557 X0:500 Y0:500 S50										; Define mesh grid

;----- Bed Compensation Taper
M376 H5

;----- Heater
M305 P1 X2 T100000 B4138 R4700 S"Hotend"	; Set thermistor + ADC parameters for heater 1
M143 H1 S280														  ; Set temperature limit for heater 1 to 280C

;----- Fans
M106 P0 S0 I0 F500 H-1 C"Part Cooling"		; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
;M106 P2 S0 I0 F500 H-1 C"Air Pump"				; assign air pump to fan 2
M106 P1 S1 I0 F500 H1 T45 C"Extruder"		  ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on

;----- Tools
M563 P0 S"Standard" D0 H2									; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Filament Sensor
M591 D0 P2 C3															; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0 S0.1														  ; set pressure advance to 0.1 seconds

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

; Automatic saving after power loss is not enabled

;----- Custom settings
M501

M117 "Setup: Standard"
