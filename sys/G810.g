G21                         ; Set metric values
M703                        ; set heater temps
G10 S140                    ; preheat extruder not enough to melt filament
M116                        ; wait for temps to stabilize
M116 H0                     ; make sure bed is heated
M291 S3 P"Check nozzle..." R"Ready to Home All and Level Bed"   ; Wait for OK
G28                         ; home all axes
M703                        ; reset extruder temp
M116                        ; wait for temp
G800                        ; clean nozzle
