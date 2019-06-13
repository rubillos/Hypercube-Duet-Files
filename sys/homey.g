; homey.g

G91                     ; relative positioning
M913 X30 Y30            ; reduce XY motor current to 30% to prevent belts slipping
G1 Z5 F9000 S2          ; lift Z relative to current position
G1 S1 Y-505 F1800       ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F9000             ; go back a few mm
G1 S1 Y-505 F360        ; move slowly to Y axis endstop once more (second pass)
G1 Z-5 F9000 S2         ; lower Z again
M913 X100 Y100          ; restore motor currents
G90                     ; absolute positioning
