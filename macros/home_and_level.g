M116                        ; wait for temps to stabilize
M290 R0 S0                  ; reset baby-stepping
M220 S100                   ; reset speed multiplier
M221 S100                   ; reset extrusion multiplier
M42 P122 S0 G4 P100 M42 P122 S1 ; attention sound
G92 Z0                      ; mark Z at 0 so we are allowed to move the bed down
M291 S2 P"Check nozzle, then press OK..." R"Home All and Level Bed"   ; Wait for OK
G28                         ; home all axes
