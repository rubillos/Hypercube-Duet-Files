; Head Cleaning

; G1 X10 Y380                   ; behind retracted bucket
; G1 X10 Y315                   ; over bucket
; G1 X10 Y275                   ; in front of extended bucket
; G1 X48 Y350                   ; behind brush
; G1 X48 Y315                   ; middle of brush
; G1 X48 Y300                   ; in front of brush

;----- Prepare
G91                           ; relative moves
G1 Z75 F3000                  ; move the bed down

;----- Reset speed params
M98 P"fast.g"

;----- Wait for temp
M703                          ; set filament parameters
M116                          ; wait for temperature

;----- Move nozzle
G90                           ; absolute moves
G1 X10 Y450 F18000            ; behind bucket
M280 P6 S114                  ; extend bucket
G4 P500                       ; wait
G1 X10 Y315 F5000             ; over bucket

;----- Prime nozzle
M83                           ; relative extruder mode
G1 E20 F150                   ; prime extruder
M400                          ; wait for completion
G1 E-3 F1800                  ; retract filament
G4 P2000                      ; wait

;----- Clean nozzle
G91                           ; relative moves
G1 Y-50 F2000                 ; wipe nozzle
G1 X20 F5000
G1 Y50 F5000
G1 X-20 F5000

G1 Y-50 F2000                 ; wipe nozzle
G1 X20 F5000
G1 Y50 F5000
G1 X-20 F5000

G1 Y-50 F2000                 ; wipe nozzle

M280 P6 S179                  ; retract bucket

;----- Wait for confirmation
M400                          ; wait for any moves to finish
M118 P4 S"sound:attention.wav"

G90                           ; absolute
G1 X400 Y70 F18000            ; put nozzle in plain view

M291 S2 P"Check nozzle..." R"Ready to Print"   ; Wait for OK

G1 X245 Y245 Z30 F18000       ; move to center
