M116                                            ; Wait for the temperatures to be reached
M584 P5                                         ; expose U axis
M291 P"Filling Bowden Tube" R"Loading Filament" T20   ; Display new message
G91                                             ; relative mode
G1 U20 F600 S1                                  ; Feed into extruder at 600mm/min
G1 U880 F3600 S1                                ; Feed bowden tube at 3600mm/min
M291 P"Press button to stop" R"Loading Filament" T200   ; Display new message
G1 U1000 F300 S1                                ; Feed until button at 300mm/min
M584 P3                                         ; hide U axis
G10 S0                                          ; Turn off heater
M84 E                                           ; Turn off extruder
M291 P"Filament Loading Complete" R"Loading Filament" T5   ; Display new message
M0
