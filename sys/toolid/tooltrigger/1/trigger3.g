M505 P"1"

M581 T2 S-1                        ; remove T2
M581 T3 S-1                        ; remove T3

M581 T2 E4 S0									     ; Endstop 2 low - T2
M581 T3 E4 S1									     ; Endstop 2 high - T3

M582 T2											       ; Check for trigger on 2
M582 T3											       ; Check for trigger on 3
