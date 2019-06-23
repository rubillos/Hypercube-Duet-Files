M505 P"10XX"

M581 T2 S-1                        ; remove T2
M581 T3 S-1                        ; remove T3

M581 T2 E3 S1									     ; Endstop 3 on - T2
M581 T3 E3 S0									     ; Endstop 3 off - T3

M582 T2											       ; Check for trigger on 2
M582 T3											       ; Check for trigger on 3
