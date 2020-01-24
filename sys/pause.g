; pause.g

M83                               ; relative extruder moves
G1 E-5 F6000                      ; retract some filament
G91                               ; relative positioning
G1 Z8 F6000                       ; lift Z
G90                               ; absolute positioning
G1 X30 Y460 F12000                ; go to far corner
