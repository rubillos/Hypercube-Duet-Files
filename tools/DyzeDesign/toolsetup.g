; Dyze Design
M550 P"Hypercube - Dyze Design"		        ; Set machine name

;----- Extruder mapping
M584 E4	U4						                    ; 1 extruder, 1 virtual axis for load/unload

;----- Extruder
M569 P4 S0										            ; Physical drive 9 goes reverse

M92   E578  U578				                  ; Set steps per mm
M350   E16   U16 I1					              ; Configure microstepping with interpolation
M203 E3000 U6000 			                    ; Set maximum speed (mm/min)
M201 E1500 U1500				                  ; Set accelerations (mm/s^2)
M566 E1000 U1000  			                  ; Set maximum instantaneous speed changes (mm/min)
M906  E650  U650                          ; Set motor currents (mA)

;----- Virtual Load/Unload axis
M574 U1 S0 C4                             ; active low, E1 input
M584 P3                                   ; hide virtual axis

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P9 F300 T18000 R0.3 H4 A5 B1 S0.04   ; BLTouch, z speed 500mm/min, travel 18000mm/sec, 4mm dive height, 0.2s settle time, 5 retries max, heater off during probe
G31 X0 Y-16 Z3.1 P100                     ; Set probe offset, set trigger level

;----- Bed Compensation Taper
M376 H0                                   ; no compensation taper

;----- Heater
M305 P1 T98640 B4632.86 C9.4861662E-08 R4700 S"Hotend"	; Set thermistor + ADC parameters
M143 H1 S280														  ; Set temperature limit
M307 H1 A1196.5 C254.52 D6.2, V24.0 B0 S1.0  ; set heating parameters
M570 H1 S1000                             ; long timeout for cancel after heater fault

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
M106 P1 S1.0 I0 H1 T40 L1.0 C"Nozzle"     ; Fan 1, thermostatic, 100% speed above 40º

M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"Dyze" D0 H1											; Define tool 0
G10 P0 X0 Y0 Z0													  ; Tool offset
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C
M572 D0 S0.05                             ; Pressure advance

;----- Filament Sensor
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Dynamic Acceleration
; M593 F24                                  ; cancel ringing

;----- Finish
M98 P"set_accel.g"                        ; set acceleration
M98 P"fast.g"                             ; set "fast" params

M98 P"/sys/finish.g"
