;----- Idle Timout
M84 S30											              ; Set idle timeout

;----- Final setup
M906 I30                                  ; Set motor currents (mA) and motor idle factor in percent
M106 P3 S0.75                             ; set frame lights to operating level
G4 P300                                   ; wait
