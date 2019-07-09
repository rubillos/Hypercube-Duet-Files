M116                        ; wait for temps to stabilize
M290 R0 S0                  ; reset baby-stepping
M220 S100                   ; reset speed multiplier
M221 S100                   ; reset extrusion multiplier
M300 S700 P700              ; beep
G92 Z0                      ; mark Z at 0 so we are allowed to move the bed down
M291 S2 Z1 P"Check nozzle, then press OK..." R"Home All and Level Bed"   ; Wait for OK
G28                         ; home all axes
