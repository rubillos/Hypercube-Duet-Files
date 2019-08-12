; Head Cleaning

; G1 X10 Y380                   ; behind retracted bucket
; G1 X10 Y325                   ; over bucket
; G1 X10 Y275                   ; in front of extended bucket
; G1 X48 Y350                   ; behind brush
; G1 X48 Y325                   ; middle of brush
; G1 X48 Y300                   ; in front of brush

M703                          ; set filament parameters
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
G1 X10 Y325 F5000             ; over bucket

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
G1 Y-50 F2000                 ; wipe nozzle
G1 X38 F5000
G1 Y75 F5000
G1 Y-25 F5000
G1 X-38 F5000

G1 Y-50 F2000                 ; wipe nozzle
G1 X38 F5000
G1 Y75 F5000
G1 Y-25 F5000
G1 X-38 F5000

G1 Y-50 F2000                 ; wipe nozzle
G1 X38 F5000
G1 Y75 F5000
G1 Y-25 F5000

G90
G1 X10 Y450 F18000            ; behind bucket

M280 P6 S179                  ; retract bucket
G4 P500                       ; wait

;----- Wait for confirmation
G90                           ; absolute
G1 X410 Y60 F24000            ; put nozzle in plain view

M300 S700 P700                ; beep

M291 S2 Z1 P"Check nozzle..." R"Ready to Print"   ; Wait for OK

;----- Back to printing
G0 R0 X0 Y0 Z0 F18000         ; restore nozzle positioning
