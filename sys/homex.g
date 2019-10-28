; homex.g

G91                           ; relative positioning

M584 P4                       ; expose the A axis
G1 S2 Z0.1 F4000              ; tiny z move to activate motors
G4 P100                       ; small delay
G1 S2 A1 F4000                ; force A axis to 'move' a tiny bit to enable it and release brake
M400                          ; wait for any moves to finish
M584 P3                       ; hide the A axis

M913 X50 Y50                  ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0             ; enable stall detection
M201 X200 Y200                ; reduce acceleration
G1 S2 Z5 F9000                ; lower Z relative to current position
M400                          ; wait for completion

G1 S2 X0.2 F4000              ; tiny move to energize stepper
G4 P100                       ; wait
G1 S1 X-525 F4000             ; move quickly to X axis endstop and stop there
G1 X30                        ; move out

G1 S1 Y525 F4000              ; home Y axis at the back
G1 Y-30                       ; move back

M98 P"set_xy.g"               ; set XY coords

G1 S2 Z-5.1 F9000             ; raise Z again

M400                          ; wait for any moves to finish
M913 X100 Y100                ; restore motor currents

M98 P"set_accel.g"            ; restore acceleration

G90                           ; absolute positioning
