M116                        ; wait for temps to stabilize
M300 S700 P700              ; beep
M291 S3 P"Check nozzle, then press OK..." R"Home All and Level Bed"   ; Wait for OK
M290 R0 S0                  ; reset baby-stepping
G28                         ; home all axes
