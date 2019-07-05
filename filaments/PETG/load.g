M291 S3 P"Load filament into extruder" R"Loading PETG"    ; Wait for OK

M291 P"Heating Nozzle..." R"Loading PETG" T30   ; Display message
M116                                            ; Wait for the temperatures to be reached

M291 P"Feeding filament..." R"Loading PETG" T5  ; Display new message

M98 P"/sys/extrude-load.g"                      ; use standardized loading

M400                                            ; Wait for moves to complete
G10 S0                                          ; Turn off heater

M291 S2 P"Filament Loaded" R"Loading PETG"      ; Ok for completion
