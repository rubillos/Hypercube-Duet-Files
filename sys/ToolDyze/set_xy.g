; when this is called the head will be 30mm from the left side and 30mm from the back edge
; for reference head this corresponds to X25, Y465

; Dyze Design
; left_stop         23
; left_subtract     23
; right_subtract    0
; front_subtract    5
; back_subtract     0
; nozzle_shift      7

; X(25+left_stop) Y(465-nozzle_shift)
G92 X48 Y458                              ; set actual XY coordinate

; X(left_sub):(490-right_sub)  Y(front_sub):(490-(back_sub+nozzle_shift))
M208 X23:490 Y5:483       			          ; set available xy range
