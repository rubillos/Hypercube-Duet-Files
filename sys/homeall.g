; homeall.g
; called to home all axes

G91                     ; relative positioning
G1 Z5 F9000 S2          ; lift Z relative to current position
M913 X30 Y30            ; reduce XY motor current to 30% to prevent belts slipping
G1 S1 X-505 Y-505 F1800 ; move quickly to X or Y endstop and stop there (first pass)
G1 S1 X-505             ; home X axis
G1 S1 Y-505             ; home Y axis
G1 X5 Y5 F9000          ; go back a few mm
G1 S1 X-505 F360        ; move slowly to X axis endstop once more (second pass)
G1 S1 Y-505             ; then move slowly to Y axis endstop
M913 X100 Y100          ; restore motor currents
G90                     ; absolute positioning
G1 X0 Y0 F9000          ; go to first bed probe point and home Z
G30                     ; home Z by probing the bed

; lift Z after probing
G91                     ; relative positioning
G1 S2 Z5 F150           ; lift Z relative to current position
G90                     ; absolute positioning
