; resume.g

G1 R1 X0 Y0 Z4 F12000       ; go to 4mm above position of the last print move
G1 R1 X0 Y0                 ; go back to the last print move
M83                         ; relative extruder moves
G1 E10 F300                 ; extrude 10mm of filament
