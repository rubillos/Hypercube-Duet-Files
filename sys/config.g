;M929 P"eventlog.txt" S1

;----- General preferences
G90													                    ; Send absolute coordinates...
M83													                    ; ...but relative extruder moves

M667 S1											                    ; Select CoreXY mode

;----- Network
M550 P"Hypercube"											          ; Set machine name
M551 P"***REMOVED***"										          ; Set password
M552 S1															            ; Enable network
;M587 S"18th Street Air Net" P"***REMOVED***" 	; Configure access point.
;M587 S"Hypercube Wifi" P"seattle1"            	; Configure access point.
M586 P0 S1														          ; Enable HTTP
M586 P1 S1										                  ; Enable FTP
M586 P2 S1										                  ; Enable Telnet

;----- Axis Limits
M208 X0:495 Y0:500 Z0:745			                  ; X range 0 to 490, Y range 0 to 500, Z range 0 to 750

;----- Bed heater
M305 P0 T100000 B4138 R4700		                  ; Set thermistor + ADC parameters for heater 0
M143 H0 S120									                  ; Set temperature limit for heater 0 to 120C
M307 H0 A107.0 C390.6 D0.9 V0 B0 S1.0           ; set heating parameters

M307 H6 A-1 C-1 D-1                             ; free up heater 6 pin
M307 H7 A-1 C-1 D-1                             ; free up heater 7 pin

;----- Built-in temperature sensors
M305 P100 S"CPU"							                  ; Main CPU
M305 P101 S"Drivers Duet"			                  ; Drivers on Duet
M305 P102 S"Drivers Duex5"				              ; Drivers on Duex5

M912 P0 S-12                                    ; CPU temp calibration

;----- Fans
M106 P3 S0.5 I1 H-1 C"Frame Light"							; Frame lights
M106 P4 S1.0 I0 H-1 C"Nozzle Light"							; Nozzle lights

M106 P7 T35:65 H100:101:102 L0.1 C"Electronics 1"		; Duet cooling set #1
M106 P8 T35:65 H100:101:102 L0.1 C"Electronics 2"		; Duet cooling set #2

;----- Drive mapping
M584 X0 Y1 Z2:3							                    ; X, Y, 2 x Z
M671 X-35:535 Y250:250 S2.0 F1.0                ; leadscrews at left and right of X axis, 100% fudge factor

;----- Drives
M569 P0 S0										                  ; Physical drive 0 goes backwards - X
M569 P1 S0										                  ; Physical drive 1 goes backwards - Y
M569 P2 S0										                  ; Physical drive 2 goes reverse - Z1
M569 P3 S0										                  ; Physical drive 3 goes reverse - Z2

M350     X16			  Y16			  Z16					      ; Configure microstepping with interpolation
M92	     X80.00	    Y80.00	 Z400.00            ; Set steps per mm
M203	X30000.00  Y30000.00	Z6000.00            ; Set maximum speeds (mm/min)
M201	 X3000.00		Y3000.00	 Z600.00            ; Set accelerations (mm/s^2)
M566   X1200.00	  Y1200.00	 Z600.00            ; Set maximum instantaneous speed changes (mm/min)
M906   X1500.00		Y1500.00	Z1500.00 I30	      ; Set motor currents (mA) and motor idle factor in percent

;----- Stepper Brake
M584 A11                                        ; map stepper 11 to A axis
M569 P11 R1                                     ; set enable to active high

M92 A80.00                                      ; dummy steps/mm
M203 A360                                       ; dummy max speed
M201 A120.00                                    ; dummy acceleration
M566 A24.00                                     ; dummy jerk
M906 A200.0                                     ; enable stepper

;----- Endstops
M574 X1 Y1 S3									                  ; Set XY endstops controlled by motor load detection

;----- Run tool specific macros
M581 T2 E2 S0									                  ; Endstop 2 pulled low indicates Standard setup
M581 T3 E3 S0									                  ; Endstop 3 pulled low indicates Volcano setup
M581 T4 E4 S0									                  ; Endstop 4 pulled low indicates Kraken
M581 T5 E5 S0									                  ; Endstop 5 pulled low indicates Diamond setup

M582 T2											                    ; Check for trigger on 2
M582 T3											                    ; Check for trigger on 3
M582 T4											                    ; Check for trigger on 4
M582 T5											                    ; Check for trigger on 5
