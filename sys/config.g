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
M208 X0:500 Y0:500 Z0:750			                  ; X range 0 to 500, Y range 0 to 500, Z range 0 to 750

;----- Bed heater
M305 P0 T100000 B4138 R4700		                  ; Set thermistor + ADC parameters for heater 0
M143 H0 S120									                  ; Set temperature limit for heater 0 to 120C
M307 H0 A30.2 C69.4 D1.7 V0 B0 S0.7             ; set heating parameters

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
M671 X-30:530 Y250:250 S2.0			                ; leadscrews at left and right of X axis

;----- Drives
M569 P0 S0										                  ; Physical drive 0 goes backwards - X
M569 P1 S0										                  ; Physical drive 1 goes backwards - Y
M569 P2 S0										                  ; Physical drive 2 goes reverse - Z1
M569 P3 S0										                  ; Physical drive 3 goes reverse - Z2

M350     X16			  Y16			  Z16					      ; Configure microstepping with interpolation
M92	     X80.00	    Y80.00	Z4000.00            ; Set steps per mm
M203	X24000.00  Y24000.00	 Z360.00            ; Set maximum speeds (mm/min)
M201	 X3000.00		Y3000.00	 Z120.00            ; Set accelerations (mm/s^2)
M566    X600.00	   Y600.00	  Z24.00            ; Set maximum instantaneous speed changes (mm/min)
M906   X1500.00		Y1500.00	Z1500.00 I30	      ; Set motor currents (mA) and motor idle factor in percent

M84 S30											                    ; Set idle timeout

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
