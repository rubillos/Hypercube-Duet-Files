; homez.g

M561                          ; clear any bed transform
G91                           ; relative positioning
M584 P4                       ; expose the A axis
G1 S2 Z0.1 F4000              ; tiny z move to activate motors
M400
G4 100                        ; small delay
G1 S2 A1 F4000                ; force A axis to 'move' a tiny bit to enable it and release brake
M400
M584 P3                       ; hide the A axis
G1 Z4 F9000 S2                ; lift Z relative to current position
G90                           ; absolute positioning
G1 X250 Y250 F9000            ; go to middle of bed
M558 F2000 A1                 ; do fast probes
G30                           ; home Z by probing the bed
M558 F1400 A7                  ; do slow probes
G30                           ; home Z by probing the bed
G29 S1 P"heightmap.csv"       ; enable bed compensation
