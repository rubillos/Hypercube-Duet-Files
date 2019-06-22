M291 P"Heating Nozzle..." R"Unloading PLA+" T5  ; Display message
G10 S220                                        ; Set current tool temperature to 220C
M116                                            ; Wait for the temperatures to be reached

M291 P"Retracting from nozzle..." R"Unloading PLA+" T5  ; Display new message

M98 P"/sys/extrude-unload.g"                    ; use standardized unloading

M400                                            ; Wait for moves to complete
G10 S0                                          ; Turn off heater
M292                                            ; Hide the message
M84 E                                           ; Turn off extruder
