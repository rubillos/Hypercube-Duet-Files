M116                                            ; Wait for the temperatures to be reached
M291 P"Retracting from nozzle..." R"Unloading" T23  ; Display new message
M584 P5                                         ; expose U axis
G91                                             ; relative mode
G1 U-30 F300 S1                                 ; Retract 20mm slowly
G1 U-1100 F3600 S1                              ; Retract 1100mm fast
M400                                            ; Wait for moves to complete
M584 P3                                         ; hide U axis
G10 S0                                          ; Turn off heater
M292                                            ; Hide the message
M18 E                                           ; Turn off extruder
M0
