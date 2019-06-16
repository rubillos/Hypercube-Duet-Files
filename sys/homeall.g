; homeall.g

G91                     ; relative positioning
M400                    ; wait for any moves to finish
M913 X50 Y50            ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0       ; enable stall detection
M201 X200.00 Y200.00    ; reduce acceleration
G1 S2 Z3 F9000          ; lift Z relative to current position
M400                    ; wait for completion
G1 S2 X-0.2 F4000       ; tiny move to energize stepper
M400                    ; wait for completion
G4 P100                 ; wait
G1 S3 X-525 Y-525 F4000 ; move quickly to X or Y endstop and stop there
G1 S3 X-525             ; home X axis
G1 S3 Y-525             ; home Y axis
G92 X0 Y0               ; set X and Y to 0
M400                    ; wait for any moves to finish
M913 X100 Y100          ; restore motor currents
M201 X3000.00 Y3000.00  ; restore acceleration

G90                     ; absolute positioning
G1 X20 Y250 F9000       ; go to first bed probe point and home Z
G30                     ; home Z by probing the bed

; lift Z after probing
G91                     ; relative positioning
G1 Z5 F150              ; lift Z relative to current position
G90                     ; absolute positioning
