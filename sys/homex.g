; homex.g

G91                     ; relative positioning
M400                    ; wait for any moves to finish
M913 X50 Y50            ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0       ; enable stall detection
M201 X200.00 Y200.00    ; reduce acceleration
G1 S2 Z5 F9000          ; lift Z relative to current position
M400                    ; wait for completion
G1 S2 X0.2 F4000        ; tiny move to energize stepper
M400                    ; wait for completion
G4 P100                 ; wait
G1 S1 X-525 F4000       ; move quickly to X axis endstop and stop there
G1 X5                   ; move out 5mm
G92 X0                  ; set X to 0
G1 S2 Z-5 F9000         ; lower Z again
M400                    ; wait for any moves to finish
M913 X100 Y100          ; restore motor currents
M201 X3000.00 Y3000.00  ; restore acceleration
G90                     ; absolute positioning
