M291 S3 P"Load filament into extruder" R"Loading PLA"   ; Wait for OK
G10 S200                                        ; Set current tool temperature
M140 S0                                         ; bed temp to 0
M291 P"Heating Nozzle..." R"Loading PLA" T300   ; Display message
M98 P"/macros/extrude_load.g"                   ; use standardized loading
