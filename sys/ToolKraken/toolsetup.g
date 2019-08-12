; Kraken
M550 P"Hypercube - Kraken"		            ; Set machine name

;----- Extruder mapping
M584 E5:6:7:8				                      ; 4 extruders

;----- Drives
M569 P5 S1										            ; Physical drive 5 goes forwards - E2
M569 P6 S1										            ; Physical drive 6 goes forwards - E3
M569 P7 S1										            ; Physical drive 7 goes forwards - E4
M569 P8 S1										            ; Physical drive 8 goes forwards - E5

M350 E16:16:16:16 I1				              ; Configure microstepping with interpolation
M92 E420:420:420:420					            ; Set steps per mm
M203 E3000:3000:3000:3000			            ; Set maximum speeds (mm/min)
M201 E500:500:500:500					            ; Set accelerations (mm/s^2)
M566 E120:120:120:120					            ; Set maximum instantaneous speed changes (mm/min)
M906 E1500:1500:1500:1500 I30	            ; Set motor currents (mA) and motor idle factor in percent

;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
G31 X0 Y0 Z-0.05 P100                     ; Set probe offset, set trigger level
M558 P5 I1 F300 T24000 H3 R0.5 A7 S0.025  ; Digital probe, inverted trigger, z speed 300mm/min, travel 24000mm/sec, 3mm dive height, 0.5s delay, max 7 tries, max delta 0.03

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heaters
M305 P1 T100000 B4138 R4700 S"1"				  ; Set thermistor + ADC parameters
M143 H1 S280														  ; Set temperature limit to 280C
M305 P2 T100000 B4138 R4700 S"2"				  ; Set thermistor + ADC parameters
M143 H2 S280														  ; Set temperature limit to 280C
M305 P3 T100000 B4138 R4700 S"3"				  ; Set thermistor + ADC parameters
M143 H3 S280														  ; Set temperature limit to 280C
M305 P4 T100000 B4138 R4700 S"4"				  ; Set thermistor + ADC parameters
M143 H4 S280														  ; Set temperature limit to 280C

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
G10 P0 X-10 Y0 Z0												  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"Kraken 2" D1 H2 F0							; Define tool 1
G10 P1 X10 Y0 Z0												  ; Set tool 1 axis offsets
G10 P1 R0 S0															; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"Kraken 3" D2 H3 F0							; Define tool 2
G10 P2 X10 Y-20 Z0												; Set tool 2 axis offsets
G10 P2 R0 S0															; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"Kraken 4" D3 H4 F0							; Define tool 3
G10 P3 X-10 Y-20 Z0												; Set tool 3 axis offsets
G10 P3 R0 S0															; Set initial tool 3 active and standby temperatures to 0C

;----- Filament Sensors
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input
M591 D1 P1 C3 S1													; filament sensor on E0 endstop input
M591 D2 P1 C3 S1													; filament sensor on E0 endstop input
M591 D3 P1 C3 S1													; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0 S0.1														  ; set pressure advance for extruder 1
M572 D1 S0.1														  ; set pressure advance for extruder 2
M572 D2 S0.1														  ; set pressure advance for extruder 3
M572 D3 S0.1														  ; set pressure advance for extruder 4

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Finish
M550 P"Hypercube - Kraken"		            ; Set machine name
M98 P"/sys/finish.g"
