;M929 P"eventlog.txt" S1

;----- General preferences
G90													                    ; Send absolute coordinates...
M83													                    ; ...but relative extruder moves

M669 K1											                    ; Select CoreXY mode

;----- Network
M550 P"Hypercube"		                            ; Set machine name
M552 P0.0.0.0 S1															  ; Ethernet: Enable network
M586 P0 S1														          ; Enable HTTP
M586 P1 S1										                  ; Enable FTP
M586 P2 S1										                  ; Enable Telnet

;----- Bed heater
M305 P0 T100000 B4138 R4700 S"Heater"           ; Set thermistor + ADC parameters for heater 0
M143 H0 S120									                  ; Set temperature limit for heater 0 to 120C
M307 H0 A107.0 C390.6 D0.9 V0 B0 S1.0           ; set heating parameters
M307 H0 B1                                      ; Bang Bang heating for now

;----- PWM Pins
M307 H6 A-1 C-1 D-1                             ; free up heater 6 pin - PWM4
M307 H7 A-1 C-1 D-1                             ; free up heater 7 pin - PWM5

;----- Purge Bucket
M280 P6 S177                                    ; retract purge bucket

;----- Built-in temperature sensors
M305 P100 S"CPU"							                  ; Main CPU
M305 P101 S"Drivers Duet"			                  ; Drivers on Duet
M305 P102 S"Drivers Duex5"				              ; Drivers on Duex5

M912 P0 S-12                                    ; CPU temp calibration

;----- Cooling Water
M305 P150 X6 T100000 B4138 R4700 S"Water Temp"	; Virtual heater on water system - set thermistor + ADC parameters
M106 P6 T30:35 H150 L0.3 C"Water Cooling"	      ; Water system radiator fan

;----- Fans
M106 P3 S5 I1 H-1 C"Frame Light"							  ; Frame lights
M106 P4 S1.0 I0 H-1 C"Nozzle Light"							; Nozzle lights

M106 P7 T20:30 H100:101:102 L0.5 C"Electronics 1" ; Duet cooling set #1
M106 P8 T20:30 H100:101:102 L0.5 C"Electronics 2"	; Duet cooling set #2

;----- Drive mapping
M584 X0 Y1 Z2:3							                    ; X, Y, 2 x Z
M671 X-35:535 Y250:250 S4.0 F1.0                ; leadscrews at left and right of X axis, 100% fudge factor

;----- Axis Limits
M208 X0:490 Y0:490 Z0:745			                  ; X range 0 to 495, Y range 0 to 500, Z range 0 to 745

;----- Drives
M569 P0 S0										                  ; Physical drive 0 goes backwards - X
M569 P1 S0										                  ; Physical drive 1 goes backwards - Y
M569 P2 S0										                  ; Physical drive 2 goes reverse - Z1
M569 P3 S0										                  ; Physical drive 3 goes reverse - Z2

M350     X16		Y16		Z16 I1   		              ; Configure microstepping with interpolation
M92	     X80	  Y80	 Z400                       ; Set steps per mm
M203	X30000 Y30000	Z3000                       ; Set maximum speeds (mm/min)
M201	 X3000  Y3000	 Z600                       ; Set accelerations (mm/s^2)
M566   X1200	Y1200	 Z600                       ; Set maximum instantaneous speed changes (mm/min)
M906   X1500	Y1500	Z1500 I10	                  ; Set motor currents (mA) and motor idle factor in percent

M917     X70    Y70   Z40                       ; Set standstill current reduction

;----- Stepper Brake
M584 A11                                        ; map stepper 11 to A axis
M569 P11 R1                                     ; set enable to active high

M92 A80                                         ; dummy steps/mm
M203 A360                                       ; dummy max speed
M201 A120                                       ; dummy acceleration
M566 A24                                        ; dummy jerk
M906 A200                                       ; enable stepper

;----- Endstops
M574 X1 Y1 S3									                  ; Set XY endstops controlled by motor load detection
M574 Z0                                         ; No Z endstop yet

;----- Idle Timout
M84 S30											                    ; Set idle timeout

;----- Activate Z-Axis and release brake
G91                                             ; relative positioning
G1 S2 Z0.2 F4000                                ; tiny z move to activate motors
M400
G4 100                                          ; small delay
G1 S2 A1 F4000                                  ; force A axis to 'move' a tiny bit to enable it and release brake
G90                                             ; absolute positioning

M584 P3                                         ; hide the A axis

;----- Configure Installed Tool
M505 P"toolid"
M98 P"tools.g"
