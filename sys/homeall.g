; homeall.g

G91                     ; relative positioning
G1 Z5 F9000 S2          ; lift Z relative to current position
M913 X50 Y50            ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S5 R0 F0       ; enable stall detection
G1 S3 X-525 Y-525 F4000 ; move quickly to X or Y endstop and stop there
G1 S3 X-525             ; home X axis
G1 S3 Y-525             ; home Y axis
G92 X0 Y0               ; set X and Y to 0
M913 X100 Y100          ; restore motor currents
G90                     ; absolute positioning
G1 X0 Y0 F9000          ; go to first bed probe point and home Z
G30                     ; home Z by probing the bed

; lift Z after probing
G91                     ; relative positioning
G1 S2 Z5 F150           ; lift Z relative to current position
G90                     ; absolute positioning
