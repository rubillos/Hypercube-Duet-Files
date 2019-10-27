; Nozzle Setup
M550 P"Hypercube - Nozzle Setup"	        ; Set machine name

;----- Heater
M305 P1 T100000 B4138 R4700 S"Hotend"	    ; Set thermistor + ADC parameters
M143 H1 S300														  ; Set temperature limit

;----- Fans
M106 P7 S1.0 T38 H1:100:101:102           ; Use hot end temp for electronics cooling trigger
M106 P8 S1.0 T38 H1:100:101:102

;----- Tools
M563 P0 S"Setup" H1									      ; Define tool 0
G10 P0 R0 S0															; Set initial tool 0 active and standby temperatures to 0C

;----- Finish
M98 P"/sys/finish.g"
