; homez.g

G91                       ; relative positioning
G1 Z5 F9000 S2            ; lift Z relative to current position
G90                       ; absolute positioning
G1 X0 Y0 F9000            ; go to first probe point
G30                       ; home Z by probing the bed

; lift Z after probing
G91                       ; relative positioning
G1 S2 Z5 F150             ; lift Z relative to current position
G90                       ; absolute positioning
