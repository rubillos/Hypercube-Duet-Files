;M929 P"eventlog.txt" S1

;----- Stepper Brake
M584 A11                                        ; map "stepper" 11 to A axis
M569 P11 R1                                     ; set enable to active high

M92 A80                                         ; dummy steps/mm
M203 A360                                       ; dummy max speed
M201 A120                                       ; dummy acceleration
M566 A24                                        ; dummy jerk
M906 A200                                       ; enable stepper
M18 A                                           ; make sure it's off

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
M305 P0 T100000 B4138 R4700 S"Heater"           ; Set thermistor + ADC parameters for bed heater
M143 H0 S80									                    ; Set temperature limit for bed heater
M307 H0 B1                                      ; Bang Bang heating

;----- PWM Pins
M307 H6 A-1 C-1 D-1                             ; free up heater 6 pin - PWM4
M307 H7 A-1 C-1 D-1                             ; free up heater 7 pin - PWM5

;----- Purge Bucket
M280 P6 S179                                    ; retract purge bucket

;----- Built-in temperature sensors
M305 P100 S"CPU"							                  ; Main CPU
M305 P101 S"Duet Drivers"			                  ; Drivers on Duet
M305 P102 S"Duex5 Drivers"				              ; Drivers on Duex5

M912 P0 S-12                                    ; CPU temp calibration

;----- Cooling Water
M305 P105 X6 T100000 B4138 R4700 S"Water Temp"	; Virtual heater on water system - set thermistor + ADC parameters

;----- Fans and Lights
M106 P3 S5 I1 H-1 C"Frame Light"							  ; Frame lights
M106 P4 S1.0 I0 H-1 C"Nozzle Light"							; Nozzle lights

M106 P7 T20:30 H100:101:102 L0.5 C"Electronics 1" ; Duet cooling set #1
M106 P8 T20:30 H100:101:102 L0.5 C"Electronics 2"	; Duet cooling set #2

;----- Drive mapping
M584 X0 Y1 Z2:3							                    ; X, Y, 2 x Z
M671 X-38:528 Y245:245 S10.0 F1.0               ; leadscrews at left and right of X axis, 100% fudge factor

;----- Axis Limits
M208 X0:490 Y0:490 Z0:745			                  ; define XYZ volume
M557 X30:460 Y30:460 P9									        ; Define mesh grid

;----- Drives
M569 P0 S0										                  ; Physical drive 0 reverse - X
M569 P1 S0										                  ; Physical drive 1 reverse - Y
M569 P2 S0										                  ; Physical drive 2 reverse - Z1
M569 P3 S0										                  ; Physical drive 3 reverse - Z2

M92	     X80	  Y80	 Z400                       ; Set steps per mm
M350     X16		Y16		Z16 I1   		              ; Configure microstepping with interpolation
M203	X12000 Y12000	Z2000                       ; Set maximum speeds (mm/min)

M98 P"set_accel.g"                              ; set xy accel
M201	             	Z1200                       ; Set z acceleration (mm/s^2)

M566              	 Z600                       ; Set maximum instantaneous speed changes (mm/min)
M906   X1200	Y1200	Z1000    	                  ; Set motor currents (mA)

M566 P1                                         ; allow jerk between print and travel moves

M584 P3                                         ; hide the A axis

;----- Endstops
M574 X1 Y2 S3									                  ; Set XY endstops controlled by motor load detection
M574 Z0                                         ; No Z endstop yet

;----- Emergency Stop
M581 T0 E6 S0                                   ; Falling edge of E6 endstop

;----- Idle Timout
M84 S30											                    ; Set idle timeout

;----- Configure Installed Tool
M505 P"toolid"
M98 P"tools.g"
