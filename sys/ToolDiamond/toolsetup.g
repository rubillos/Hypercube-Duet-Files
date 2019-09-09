; Diamond

M550 P"Hypercube - Diamond"		            ; Set machine name

;----- Extruder mapping
M584 E5:6:7:8:9 U5:6:7:8:9	              ; 5 extruders, 5 virtual axis for load/unload

;----- Drives
M569 P5 S1										            ; Physical drive 5 goes forwards - 1
M569 P6 S1										            ; Physical drive 6 goes forwards - 2
M569 P7 S1										            ; Physical drive 7 goes forwards - 3
M569 P8 S1										            ; Physical drive 8 goes forwards - 4
M569 P9 S1										            ; Physical drive 9 goes forwards - 5

M92 E408:415:415:415:415 U415:415:415:415:415				          ; Set steps per mm
M350 E16:16:16:16:16 U16:16:16:16:16 I1                       ; Configure microstepping with interpolation
M203 E900:900:900:900:900 U6000:6000:6000:6000:6000 	        ; Set maximum speeds (mm/min)
M201 E1300:1300:1300:1300:1300 U1300:1300:1300:1300:1300	    ; Set accelerations (mm/s^2)
M566 E700:700:700:700:700 U700:700:700:700:700				        ; Set maximum instantaneous speed changes (mm/min)
M906 E1200:1200:1200:1200:1200 U1200:1200:1200:1200:1200    	; Set motor currents (mA)

; M201 X2000 Y2000                          ; limit XY acceleration
; M203 X9000 Y9000                          ; limit XY speed

;----- Virtual Load/Unload axis
M574 U1 S0 C4                             ; active low, E1 input
M584 P3                                   ; hide virtual axis

;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P5 I1 F300 T18000 H3 R1.0 A7 S0.025  ; Digital probe, inverted trigger, z speed 300mm/min, travel 18000mm/sec, 3mm dive height, 1.0s delay, max 7 tries, max delta 0.03
G31 X0 Y0 Z0.06 P100                      ; Set probe offset, set trigger level

;----- Bed Limits
M208 S1 Y30          			                ; limit low end of y range based on hot end size
M557 X30:470 Y40:470 P8									  ; adjust mesh grid

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S210														  ; Set temperature limit
M307 H1 A336.5 C138.5 D3.2 V23.9 B0 S0.6

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
;M106 P2 S0 I0 F500 H-1 C"Air Pump"

M106 P5 S1.0 I0 H1 T35 C"Water Pump"      ; water pump activates with hot end heat
;M106 P6 T23 H105 C"Water Cooling"	        ; Water system radiator fan based on radiator temp
M106 P6 T35 H1 C"Water Cooling"	          ; Water system radiator fan based on hot end temp

M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"Black" D0 H1 F0									; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"White" D1 H1 F0								  ; Define tool 1
G10 P1 X0 Y0 Z0													  ; Set tool 1 axis offsets
G10 P1 R0 S0															; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"Cyan" D2 H1 F0								  ; Define tool 2
G10 P2 X0 Y0 Z0													  ; Set tool 2 axis offsets
G10 P2 R0 S0															; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"Yellow" D3 H1 F0								; Define tool 3
G10 P3 X0 Y0 Z0													  ; Set tool 3 axis offsets
G10 P3 R0 S0															; Set initial tool 3 active and standby temperatures to 0C

M563 P4 S"Magenta" D4 H1 F0								; Define tool 4
G10 P4 X0 Y0 Z0													  ; Set tool 4 axis offsets
G10 P4 R0 S0															; Set initial tool 4 active and standby temperatures to 0C

M563 P5 S"Mixing" D0:1:2:3:4 H1 F0				; Define tool 5
G10 P5 X0 Y0 Z0													  ; Set tool 5 axis offsets
G10 P5 R0 S0															; Set initial tool 5 active and standby temperatures to 0C
M567 P5 E0.2:0.2:0.2:0.2:0.2							; Set mixing ratios for tool 5
; M567 P5 E1.0:0.0:0.0:0.0:0.0							; Set mixing ratios for tool 5

;----- Filament Sensors
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input
M591 D1 P1 C3 S1													; filament sensor on E0 endstop input
M591 D2 P1 C3 S1													; filament sensor on E0 endstop input
M591 D3 P1 C3 S1													; filament sensor on E0 endstop input
M591 D4 P1 C3 S1													; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0:1:2:3:4 S0.4											; set pressure advance for all 5 extruders

;----- Firmware Retraction
M207 S3.0 F6000                           ; firmware retraction settings

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Finish
M98 P"/sys/finish.g"
