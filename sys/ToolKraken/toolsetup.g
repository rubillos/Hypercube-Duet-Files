; Kraken
M550 P"Hypercube - Kraken"		            ; Set machine name

;----- Extruder mapping
M584 E5:6:7:8				                      ; 4 extruders

;----- Drives
M569 P5 S0  									            ; Physical drive 5 goes reverse - 1
M569 P6 S0										            ; Physical drive 6 goes reverse - 2
M569 P7 S0										            ; Physical drive 7 goes reverse - 3
M569 P8 S0										            ; Physical drive 8 goes reverse - 4

M92 E415:415:415:415 U415:415:415:415		  ; Set steps per mm
M350 E16:16:16:16 U16:16:16:16 I1				  ; Configure microstepping with interpolation

M203 E3000 U6000			                    ; Set maximum speeds (mm/min)
M201 E1000 U1300	                        ; Set accelerations (mm/s^2)
M566 E1000 U1000					                ; Set maximum instantaneous speed changes (mm/min)
M906 E1200 U1200                          ; Set motor currents (mA)

M203 X6000 Y6000                          ; limit XY speed

;----- Virtual Load/Unload axis
M574 U1 S0 C4                             ; active low, E1 input
M584 P3                                   ; hide virtual axis

;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P5 I1 F300 T18000 H3 R0.5 A7 S0.025  ; Digital probe, inverted trigger, z speed 300mm/min, travel 18000mm/sec, 3mm dive height, 0.5s delay, max 7 tries, max delta 0.03
G31 X0 Y0 Z0.06 P100                     ; Set probe offset, set trigger level

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heaters
M305 P1 T100000 B4138 R4700 S"1"				  ; Set thermistor + ADC parameters
M143 H1 S260														  ; Set temperature limit
M570 H1 S1000                             ; long timeout for cancel after heater fault
M305 P2 T100000 B4138 R4700 S"2"				  ; Set thermistor + ADC parameters
M143 H2 S260														  ; Set temperature limit
M570 H2 S1000                             ; long timeout for cancel after heater fault
M305 P3 T100000 B4138 R4700 S"3"				  ; Set thermistor + ADC parameters
M143 H3 S260														  ; Set temperature limit
M570 H3 S1000                             ; long timeout for cancel after heater fault
M305 P4 T100000 B4138 R4700 S"4"				  ; Set thermistor + ADC parameters
M143 H4 S260														  ; Set temperature limit
M570 H4 S1 000                            ; long timeout for cancel after heater fault

;----- Virtual Heater
M305 P800 X7 S"Water Radiator"            ; Thermistor on water radiator

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
;M106 P2 S0 I0 F500 H-1 C"Air Pump"
M106 P5 S1.0 I0 H1 T35 C"Water Pump"      ; water pump activates with hot end heat

M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"Kraken 1" D0 H1 F0							; Define tool 0
G10 P0 X-10 Y-10 Z0												; Set tool 0 axis offsets
G10 P0 R0 S0															; Set temps

M563 P1 S"Kraken 2" D1 H2 F0							; Define tool 1
G10 P1 X10 Y-10 Z0												; Set tool 1 axis offsets
G10 P1 R0 S0															; Set temps

M563 P2 S"Kraken 3" D2 H3 F0							; Define tool 2
G10 P2 X-10 Y10 Z0												; Set tool 2 axis offsets
G10 P2 R0 S0															; Set temps

M563 P3 S"Kraken 4" D3 H4 F0							; Define tool 3
G10 P3 X10 Y10 Z0												  ; Set tool 3 axis offsets
G10 P3 R0 S0															; Set temps

;----- Filament Sensors
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input
M591 D1 P1 C3 S1													; filament sensor on E0 endstop input
M591 D2 P1 C3 S1													; filament sensor on E0 endstop input
M591 D3 P1 C3 S1													; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0:1:2:3 S0.4  											; set pressure advance for all 5 extruders

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Finish
M98 P"set_accel.g"                        ; set acceleration
M98 P"fast.g"                             ; set "fast" params

M98 P"/sys/finish.g"
