; Head Cleaning

; G1 X10 Y380 F6000             ; behind bucket
; G1 X10 Y325 F6000             ; over bucket
; G1 X10 Y285 F6000             ; in front of bucket
; G1 X50 Y380 F6000             ; behind brush
; G1 X50 Y280 F6000             ; in front of brush

M116                          ; wait for temperature
G10                           ; retract filament

;----- Prepare
G60 S0                        ; save the current nozzle location
G91                           ; relative moves
G1 Z75 F3000                  ; move the bed down

;----- Move nozzle
G90                           ; absolute moves
G1 X10 Y450 F18000            ; behind bucket
M280 P6 S114                  ; extend bucket
G4 P500                       ; wait
G1 X10 Y325 F6000             ; over bucket

;----- Prime nozzle
G11                           ; unretract filament
M83                           ; relative extruder mode
G1 E5 F600                    ; prime extruder with 5mm
M400                          ; wait for completion
G4 P1000                      ; wait 1 sec
G10                           ; retract filament
G4 P2000                      ; wait 1 sec

;----- Clean nozzle
G91
G1 Y-50 F1000                 ; wipe nozzle
G3 Y50 I5 J25 F3000           ; arc back to center of bucket
G1 Y-50 F1000                 ; wipe nozzle
G3 Y50 I5 J25 F3000           ; arc back to center of bucket
G1 Y-50 F1000                 ; wipe nozzle
G1 Y50 F1000                  ; wipe nozzle

; G90                           ; absolute
; G1 X50 Y360                   ; behind brush
; G91                           ; relative
; G1 Y-70 F3000
; G1 Y70 F3000
; G1 Y-70 F3000
; G1 Y70 F3000

G90
G1 X10 Y450 F6000             ; behind bucket

M280 P6 S180                  ; retract bucket
G4 P500                       ; wait
M280 P6 S177                  ; release bucket pressure
G4 P100                       ; wait
M42 P6 S0                     ; disable servo

;----- Wait for confirmation
G90                           ; absolute
G1 X410 Y60 F24000            ; put nozzle in plain view

M300 S700 P700                ; beep

M291 S3 P"Check nozzle..." R"Ready to Print"   ; Wait for OK

;----- Back to printing
G0 R0 X0 Y0 Z0 F18000         ; restore nozzle positioning
