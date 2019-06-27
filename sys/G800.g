; Head Cleaning

M116                          ; wait for temperature

;----- Prepare
G60 S0                        ; save the current nozzle location
G91                           ; relative moves
G1 Z50 F1000                  ; move the bed down
G802                          ; extend purge bucket
G4 P500                       ; wait

;----- Move nozzle
G90                           ; absolute moves
G1 X0 Y300 F18000             ; position nozzle above bucket

;----- Prime nozzle
M83                           ; relative extruder mode
G1 E20 F600                   ; prime extruder with 20mm
M400                          ; wait for completion
G1 E-2 F600                   ; pull back 20mm

;----- Clean nozzle
G1 X0 Y260 F18000
M400
G1 X0 Y300 F18000
M400
G1 X0 Y260 F18000
M400
G1 X0 Y300 F18000
M400
G1 X0 Y260 F18000
M400
G1 X0 Y300 F18000
M400

;----- Back to printing
G801                            ; retract purge bucket
G4 P500                         ; wait
M42 P6 S0                       ; disable servo
G0 R0 X0 Y0 Z0                  ; restore nozzle positioning
