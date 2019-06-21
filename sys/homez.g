; homez.g

G91                       ; relative positioning
G1 Z5 F9000 S2            ; lift Z relative to current position
G90                       ; absolute positioning
G1 X250 Y250 F9000        ; go to middle of bed
M558 F2000                ; do fast probes
G30                       ; home Z by probing the bed
M558 F300                 ; do slow probes
G30                       ; home Z by probing the bed
