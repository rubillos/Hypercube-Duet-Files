; Head Cleaning

; G1 X10 Y380 F6000             ; behind bucket
; G1 X10 Y325 F6000             ; over bucket
; G1 X10 Y285 F6000             ; in front of bucket
; G1 X50 Y380 F6000             ; behind brush
; G1 X50 Y280 F6000             ; in front of brush

M116                          ; wait for temperature
G10                           ; retract

;----- Prepare
G60 S0                        ; save the current nozzle location
G91                           ; relative moves
G1 Z75 F3000                  ; move the bed down

;----- Move nozzle
G90                           ; absolute moves
G1 X10 Y450 F18000            ; behind bucket
G802                          ; extend purge bucket
G1 X10 Y325 F6000             ; over bucket

;----- Prime nozzle
G11                           ; unretract
M83                           ; relative extruder mode
G1 E40 F600                   ; prime extruder with 30mm
M400                          ; wait for completion
G4 P1000                      ; wait 1 sec
G10                           ; retract
M400                          ; wait for completion

;----- Clean nozzle
G91
G1 Y-35 F3000                 ; wipe nozzle
G3 Y35 I5 J17.5 F3000         ; arc back to center of bucket
G1 Y-35 F3000                 ; wipe nozzle
G3 Y35 I5 J17.5 F3000         ; arc back to center of bucket
G1 Y-35 F3000                 ; wipe nozzle
G3 Y35 I5 J17.5 F3000         ; arc back to center of bucket

G90
G1 X10 Y450 F6000             ; behind bucket

;----- Back to printing
G801                          ; retract purge bucket
G0 R0 X0 Y0 Z0 F18000         ; restore nozzle positioning
