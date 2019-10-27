; homeall.g

;----- home X & Y
G91                           ; relative positioning

M584 P4                       ; expose the A axis
G1 S2 Z0.1 F4000              ; tiny z move to activate motors
G4 P100                       ; small delay
G1 S2 A1 F4000                ; force A axis to 'move' a tiny bit to enable it and release brake
M400                          ; wait for any moves to finish
M584 P3                       ; hide the A axis

M913 X50 Y50                  ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0             ; enable stall detection
M201 X200 Y200                ; reduce acceleration
G1 S2 Z4 F9000                ; lift Z relative to current position
M400                          ; wait for completion

G1 S2 X0.2 F4000              ; tiny move to energize steppers
G4 P100                       ; wait

G1 S1 X-525 F4000             ; home X axis
G1 X30                        ; move out 5mm

G1 S1 Y525 F4000              ; home Y axis
G1 Y-30                       ; move back 5mm

M98 P"set_xy.g"               ; set XY coords

M400                          ; wait for any moves to finish
M913 X100 Y100                ; restore motor currents

M98 P"set_accel.g"            ; restore acceleration

;----- quick home Z
M561                          ; clear any bed transform
G90                           ; absolute positioning
G1 X245 Y245 F18000           ; go to middle of bed
M558 F2000 A1                 ; do fast probes
G30                           ; home Z by probing the bed
M558 F1000 A7                 ; do slow probe
G1 X20 Y245 F18000            ; go to first point

;----- level the bed
G30 P0 X20 Y245 Z-99999       ; probe near a leadscrew, half way along Y axis
G30 P1 X460 Y245 Z-99999 S2   ; probe near a leadscrew and calibrate 2 motors

;----- home Z
G90                           ; absolute positioning
G1 X245 Y245 F18000           ; go to middle of bed
G30                           ; home Z by probing the bed

;----- enable bed compensation
G29 S1 P"heightmap.csv"       ; enable bed compensation
