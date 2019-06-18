; homez.g

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

; lift Z after probing
G91                       ; relative positioning
G1 Z5 F9000               ; lift Z relative to current position
G90                       ; absolute positioning
