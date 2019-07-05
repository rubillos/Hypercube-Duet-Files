M291 S3 P"Load filament into extruder" R"Loading PLA+"  ; Wait for OK

M291 P"Heating Nozzle..." R"Loading PLA+" T30           ; Display message
G10 S220                                        ; Set current tool temperature to 220C
M116                                            ; Wait for the temperatures to be reached

M291 P"Feeding filament..." R"Loading PLA+" T10   ; Display new message

M98 P"/sys/extrude-load.g"                      ; use standardized loading

M400                                            ; Wait for moves to complete
G10 S0                                          ; Turn off heater

M291 S2 P"Filament Loaded" R"Loading PLA+"      ; Ok for completion
M84 E                                           ; Turn off extruder
