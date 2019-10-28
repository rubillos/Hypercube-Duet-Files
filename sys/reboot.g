M18 A                         ; engage Z brake
G4 P300                       ; wait
M18                           ; stop all other steppers
; M552 S0                       ; shut down networking
M106 P3 S0.01                 ; dim frame lights
M106 P4 S0.01                 ; dim nozzle light
G4 P500                       ; wait 500ms
M999                          ; restart
