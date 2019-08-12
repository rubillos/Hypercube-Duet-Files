M302 P1                                   ; allow cold extrudes
G92 E0                                    ; set E position to 0
M83                                       ; relative extruder moves

G1 E10 F500                               ; gently pull in filament
G1 E900 F4000                             ; move quickly to fill bowden tube

M400                                      ; make sure all moves are complete
M913 E40                                  ; reduce motor current
M201 E100                                 ; reduce acceleration

G1 S1 E200 F1000                          ; move slowly until resistance

M400                                      ; make sure all moves are complete
M913 E100                                 ; restore motor currents
M201 E700                                 ; restore acceleration
M302 P0                                   ; forbid cold extrudes
