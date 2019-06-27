M84 A                         ; engage Z brake
G4 P200                       ; wait
M84                           ; stop all other steppers
M552 S0                       ; shut down networking
M106 P3 S5                    ; dim frame lights
G4 P500                       ; wait 500ms
M999                          ; restart
