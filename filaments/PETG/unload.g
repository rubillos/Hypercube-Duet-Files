T0                                              ; Select Tool 0
G10 S240                                        ; Set current tool temperature
M291 P"Heating Nozzle..." R"Unloading PETG" T30  ; Display message
M98 P"/macros/extrude_unload.g"                 ; use standardized unloading
