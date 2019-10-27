; when this is called the head will be 30mm from the left side and 30mm from the back edge
; for reference head this corresponds to X25, Y465

; V6
; left_stop         0
; left_subtract     0
; right_subtract    0
; front_subtract    0
; back_subtract     0
; nozzle_shift      0

; X(25+left_stop) Y(465-nozzle_shift)
G92 X25 Y465                              ; set actual XY coordinate

; X(left_sub):(490-right_sub)  Y(front_sub):(490-(back_sub+nozzle_shift))
M208 X0:490 Y0:490       			            ; set available xy range
