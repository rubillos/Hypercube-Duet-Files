; Retract purge Bucket

M280 P6 S180                    ; retract bucket
G4 P500                         ; wait
M280 P6 S177                    ; release pressure
G4 P500                         ; wait
M42 P6 S0                       ; disable servo
