;----- Idle Timout
M84 S30											                    ; Set idle timeout

;----- Activate Z-Axis and release brake
G91                           ; relative positioning
G1 S2 A1 F4000                ; force A axis to 'move' a tiny bit to enable it and release brake
G1 S2 Z0.1 F4000              ; tiny z move to activate motors
G90                           ; absolute positioning

M584 P3                       ; hide the A axis

;----- Tool Activation
T0                            ; select tool 0
