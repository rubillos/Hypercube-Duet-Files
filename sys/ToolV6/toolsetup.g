; V6
M550 P"Hypercube - V6"		                ; Set machine name

;----- Extruder mapping
M584 E7	U7						                    ; 1 extruder, 1 virtual axis for load/unload

;----- Extruders
M569 P7 S1										            ; Physical drive 7 goes forwards

M350 E16 U16 I1					                  ; Configure microstepping with interpolation
M92 E408 U408				                      ; Set steps per mm
M203 E6000 U6000			                    ; Set maximum speeds (mm/min)
M201 E1300 U1300				                  ; Set accelerations (mm/s^2)
M566 E700	U700  			                    ; Set maximum instantaneous speed changes (mm/min)
M906 E1200 U1200 I10                      ; Set motor currents (mA) and motor idle factor in percent

;----- Virtual Load/Unload axis
M574 U1 S0 C4                             ; active low, E1 input
M584 P3                                   ; hide virtual axis

;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P5 I1 F300 T24000 H3 R0.5 A7 S0.025  ; Digital probe, inverted trigger, z speed 300mm/min, travel 24000mm/sec, 3mm dive height, 0.5s delay, max 7 tries, max delta 0.03
G31 X0 Y0 Z0.06 P100                      ; Set probe offset, set trigger level

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S260														  ; Set temperature limit
M307 H1 A338.0 C133.1 D4.6 V24.2 B0 S1.0  ; set heating parameters

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
;M106 P2 S0 I0 F500 H-1 C"Air Pump"				; assign air pump to fan 2
M106 P1 S1.0 I0 H1 T40 L1.0 C"Nozzle"     ; Fan 1, thermostatic, 100% speed above 40º

M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"V6" D0 H1									      ; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C
M572 D0 S0.25                             ; Pressure advance

;----- Filament Sensor
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Dynamic Acceleration
M593 F36.2                                ; cancel ringing

;----- Finish
M98 P"/sys/finish.g"
