; Present Print

G91                               ; relative mode
G1 E-3 F1800                      ; retract
G1 Z150 F9000                     ; move z axis down
M106 S0                           ; part fan off
M400                          		; wait for any moves to finish
M118 P4 S"sound:finished.wav"
G90                               ; absolute mode
G1 X90 Y400 F18000                ; move XY gantry away
