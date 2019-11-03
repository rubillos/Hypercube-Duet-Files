M116                                            ; wait for the temperatures to be reached
M584 P5                                         ; expose U axis

M291 P"Filling Bowden Tube" R"Loading Filament" T20   ; Display new message
G91                                             ; relative mode
G1 U20 F600 S1                                  ; feed into extruder at 600mm/min
G1 U880 F3600 S1                                ; feed bowden tube at 3600mm/min

M291 P"Press button to stop" R"Loading Filament" T200   ; display new message
M400                          									; wait for any moves to finish
M118 P4 S"sound:attention.wav"
G1 U1000 F300 S1                                ; feed until button at 300mm/min

G10                                             ; retract

M584 P3                                         ; hide U axis
G10 S0                                          ; turn off heater
M18 E                                           ; turn off extruder

M291 P"Filament Loading Complete" R"Loading Filament" T5   ; display new message
M0
