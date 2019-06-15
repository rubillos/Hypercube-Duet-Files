; homex.g

G91                     ; relative positioning
M400
M913 X50 Y50            ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0       ; enable stall detection
M201 X500.00 Y500.00    ; reduce acceleration
G1 Z3 F9000 S2          ; lift Z relative to current position
G1 S3 X-525 F4000       ; move quickly to X axis endstop and stop there
G92 X0                  ; set X to 0
G1 Z-3 F9000 S2         ; lower Z again
M400
M913 X100 Y100          ; restore motor currents
M201 X1500.00 Y1500.00  ; restore acceleration
