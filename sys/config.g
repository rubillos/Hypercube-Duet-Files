M929 P"eventlog.txt" S1

;----- General preferences
G90													; Send absolute coordinates...
M83													; ...but relative extruder moves

M667 S1											; Select CoreXY mode

;----- Network
M550 P"Hypercube"											          ; Set machine name
M551 P"***REMOVED***"										          ; Set password
M552 S1															            ; Enable network
M587 S"18th Street Air Net" P"***REMOVED***" 		; Configure access point.
M586 P0 S1														          ; Enable HTTP
M586 P1 S1										                  ; Enable FTP
M586 P2 S1										                  ; Enable Telnet

;----- Axis Limits
M208 X0:500 Y0:500 Z0:750			; X range 0 to 500, Y range 0 to 500, Z range 0 to 750

;----- Run tool specific macros
M505 P"ToolStandard"
M581 T1 E1 S0									                  ; Endstop 1 pulled low indicates Standard setup
M582 T1											                    ; Check for trigger on 1
M581 T2 E2 S0									                  ; Endstop 2 pulled low indicates Volcano setup
M582 T2											                    ; Check for trigger on 2
M581 T3 E3 S0									                  ; Endstop 3 pulled low indicates Kraken
M582 T3											                    ; Check for trigger on 3
M581 T4 E4 S0									                  ; Endstop 4 pulled low indicates Diamond setup
M582 T4											                    ; Check for trigger on 4

M98 P"toolsetup.g"

;----- Bed heater
M305 P0 T100000 B4138 R4700		                  ; Set thermistor + ADC parameters for heater 0
M143 H0 S120									                  ; Set temperature limit for heater 0 to 120C

;----- Built-in temperature sensors
M305 P100 S"CPU"							                  ; Main CPU
M305 P101 S"Drivers Duet"			                  ; Drivers on Duet
M305 P102 S"Drivers Duex5"				              ; Drivers on Duex5

;----- Fans
M106 P3 S150 I1 H-1 C"Lighting"									; Frame lights
M106 P4 S255 I0 H-1 C"Nozzle Light"							; Nozzle lights

M106 P7 T35:65 H100:101:102 L0.1 C"Electronics 1"					; Duet cooling set #1
M106 P8 T35:65 H100:101:102 L0.1 C"Electronics 2"					; Duet cooling set #2

;----- Bed Compensation Taper
M376 H5

; Automatic saving after power loss is not enabled

;----- Custom settings
M501
