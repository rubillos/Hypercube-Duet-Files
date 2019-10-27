; when this is called the head will be 30mm from the left side and 30mm from the back edge
; for reference head this corresponds to X25, Y465

; Kraken
; left_stop         20
; left_subtract     20
; right_subtract    20
; front_subtract    10
; back_subtract     0
; nozzle_shift      -2.7

; X(25+left_stop) Y(465-nozzle_shift)
G92 X55 Y467.7                            ; set actual XY coordinate

; X(left_sub):(490-right_sub)  Y(front_sub):(490-(back_sub+nozzle_shift))
M208 X20:470 Y10:490       			          ; set available xy range
