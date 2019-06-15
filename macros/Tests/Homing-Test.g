M400                          ; make sure everything has stopped before we make changes
M574 X1 Y1 S3                 ; set endstops to use motor stall
M913 X20 Y20                  ; reduce motor current to 50% to prevent belts slipping
G91                           ; use relative positioning
G1 S1 X-550 Y-550 F4000       ; move all XY left/down by 550mm, stopping at the endstops
;G1 Z-5 F2000                 ; down a few mm so that we can centre the head
G90                           ; back to absolute positioning
M400                          ; make sure everything has stopped before we reset the motor currents
M913 X100 Y100                ; motor currents back to normal
G1 X250 Y250 F2000            ; centre the head and set a reasonable feed rate
