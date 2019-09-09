; Nozzle Setup
M550 P"Hypercube - Nozzle Setup"	        ; Set machine name

;----- Bed Compensation Taper
M376 H5                                   ; reduce over 5mm

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S300														  ; Set temperature limit
;M307 H1 A338.0 C133.1 D4.6 V24.2 B0 S1.0  ; set heating parameters

;----- Fans
M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"Setup" H1									      ; Define tool 0
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Finish
M98 P"/sys/finish.g"
