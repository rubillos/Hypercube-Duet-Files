; homez.g

G29 S2                    ; disable any bed compensation

G91                       ; relative positioning
G1 Z3 F9000 S2            ; lift Z relative to current position
G90                       ; absolute positioning
G1 X250 Y250 F9000        ; go to middle of bed
M400                      ; wait for completion
G4 P200                   ; wait
M558 F2000                ; do a fast Probe
G30                       ; home Z by probing the bed
M400                      ; wait for completion
G4 P200                   ; wait
M558 F300                 ; do a slow Probe
G30                       ; home Z by probing the bed

G30 P0 X20 Y250 Z-99999       ; probe near a leadscrew, half way along Y axis
G30 P1 X480 Y250 Z-99999 S2   ; probe near a leadscrew and calibrate 2 motors
G1 X250 Y250 Z15 F24000       ; go to middle of bed

G29 S1 P"/sys/heightmap.csv"  ; activate bed compensation
