; V6

;----- Extruder mapping
M584 E7							                      ; 1 extruder

;----- Extruders
M569 P7 S1										            ; Physical drive 7 goes forwards

M350 E16 I1					                      ; Configure microstepping with interpolation
M92 E408				                          ; Set steps per mm
M203 E3600			                          ; Set maximum speeds (mm/min)
M201 E3600				                        ; Set accelerations (mm/s^2)
M566 E3600				                        ; Set maximum instantaneous speed changes (mm/min)
M906 E1500 I30                            ; Set motor currents (mA) and motor idle factor in percent

;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Z-Probe
M574 Z1 S2															  ; Set Z endstop controlled by probe
M558 P5 I1 F300 T18000 H5 R1.0            ; Digital probe, inverted trigger, z speed 300mm/min, travel 18000mm/sec, 4mm dive height, 0.4s delay
G31 X0 Y0 Z-0.05 P100                     ; Set probe offset, set trigger level
M557 X30:470 Y30:470 P8									  ; Define mesh grid

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S280														  ; Set temperature limit to 280C
M307 H1 A446.7 C176.3 D5.1 V24.3 B0 S1.0  ; set heating parameters

;----- Fans
M106 P0 S0 I0 F500 H-1 L0.3 B0.3 C"Part Cooling"		; Fan 0, off, 30% minimum speed, 0.3s 'blip' to start
;M106 P2 S0 I0 F500 H-1 C"Air Pump"				; assign air pump to fan 2
M106 P1 S1.0 I0 H1 T40 L1.0 C"Nozzle"     ; Fan 1, thermostatic, 100% speed above 40º

;----- Tools
M563 P0 S"V6" D0 H1									      ; Define tool 0
G10 P0 X0 Y0 Z0													  ; Set tool 0 axis offsets
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C
M572 D0 S0.2                              ; Pressure advance to 0.2

;----- Filament Sensor
M591 D0 P1 C3 S1													; filament sensor on E0 endstop input

;----- Pressure Advance
M572 D0 S0.4														  ; set pressure advance to 0.4 seconds

;----- Filament properties
M404 N1.75 D0.4													  ; filament width and nozzle diameter

;----- Finish
M550 P"Hypercube - V6"		                ; Set machine name
M98 P"/sys/finish.g"
