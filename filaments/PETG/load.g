G10 S230                                        ; Set current tool temperature to 220C

M291 S3 P"Load filament into extruder" R"PETG" T5    ; Wait for OK

M291 P"Heating Nozzle..." R"PETG" T5            ; Display message
M116                                            ; Wait for the temperatures to be reached

M291 P"Feeding filament..." R"PETG" T5          ; Display new message

M98 P"/sys/extrude-load.g"                      ; use standardized loading

M400                                            ; Wait for moves to complete
G10 S0                                          ; Turn off heater

M291 S2 P"Filament Loaded" R"PETG" T5           ; Ok for completion
