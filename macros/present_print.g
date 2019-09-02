; Present Print

G10                               ; retract
M106 S0                           ; part fan off
M42 P124 S0 G4 P100 M42 P124 S1   ; completion sound
G91                               ; relative mode
G1 Z250 F9000                     ; move z axis down
G90                               ; absolute mode
G1 X25 Y470 F18000                ; move XY gantry away
