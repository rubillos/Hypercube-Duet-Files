; Volcano
M550 P"Hypercube - Super Volcano"         ; Set machine name

;----- Extruder mapping
M584 E7	U7						                    ; 1 extruder, 1 virtual axis for load/unload

;----- Extruders
M569 P7 S0										            ; Physical drive 7 goes reverse

M92 E415 U415				                      ; Set steps per mm
M350 E16 U16 I1					                  ; Configure microstepping with interpolation
M203 E3000 U6000			                    ; Set maximum speed (mm/min)
M201 E1500 U1500			                    ; Set accelerations (mm/s^2)
M566 E1000 U1000  			                  ; Set maximum instantaneous speed changes (mm/min)
M906 E1200 U1200                          ; Set motor currents (mA)

;----- Virtual Load/Unload axis
M574 U1 S0 C4                             ; active low, E1 input
M584 P3                                   ; hide virtual axis

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P5 I1 F300 T18000 H3 R0.5 A7 S0.025  ; Digital probe, inverted trigger, z speed 300mm/min, travel 18000mm/sec, 3mm dive height, 0.5s delay, max 7 tries, max delta 0.03
G31 X0 Y0 Z0.06 P100                      ; Set probe offset, set trigger level

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S260														  ; Set temperature limit
M307 H1 A721.6 C378.5 D6.8 V23.9 B0 S1.0  ; set heating parameters
M570 H1 S1000                             ; long timeout for cancel after heater fault

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
M106 P1 S1.0 I0 H1 T40 L1.0 C"Nozzle"     ; Fan 1, thermostatic, 100% speed above 40º

M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102           ; Active when hotend is over 38° or any driver is over temp

;----- Tools
M563 P0 S"Super Volcano" D0 H1						; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Filament Sensor
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input

;----- Filament properties
M404 N1.75 D0.8													  ; filament width and nozzle diameter

;----- Dynamic Acceleration
; M593 F36.2                                ; cancel ringing

;----- Finish
M98 P"set_accel.g"                        ; set acceleration
M98 P"fast.g"                             ; set "fast" params

M98 P"/sys/finish.g"
