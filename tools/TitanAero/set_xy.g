; when this is called the head will be 30mm from the left side and 30mm from the back edge
; for reference head this corresponds to X25, Y465

; Titan Aero
; left_stop         16
; left_subtract     16
; right_subtract    12
; front_subtract    16
; back_subtract     0
; nozzle_shift      8

; X(25+left_stop) Y(465-nozzle_shift)
G92 X41 Y457                              ; set actual XY coordinate

; X(left_sub):(490-right_sub)  Y(front_sub):(490-(back_sub+nozzle_shift))
M208 X16:474 Y16:482       			          ; set available xy range
