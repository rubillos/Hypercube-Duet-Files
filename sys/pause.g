; pause.g

M83                               ; relative extruder moves
G1 E-10 F6000                     ; retract 10mm of filament
G91                               ; relative positioning
G1 Z4 F6000                       ; lift Z by 4mm
G90                               ; absolute positioning
G1 X25 Y470 F6000                 ; go to far corner
