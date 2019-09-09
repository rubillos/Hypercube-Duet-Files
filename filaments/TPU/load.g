T0                                              ; Select Tool 0
G10 S230                                        ; Set current tool temperature
M291 S3 P"Load filament into extruder" R"Loading TPU"   ; Wait for OK
M291 P"Heating Nozzle..." R"Loading TPU" T300   ; Display message
M98 P"/macros/extrude_load.g"                   ; use standardized loading
