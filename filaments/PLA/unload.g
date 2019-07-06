M291 P"Heating Nozzle..." R"Unloading PLA" T30  ; Display message
G10 S200                                        ; Set current tool temperature to 220C
M140 S0                                         ; bed temp to 0
M98 P"/macros/extrude_unload.g"                 ; use standardized unloading
