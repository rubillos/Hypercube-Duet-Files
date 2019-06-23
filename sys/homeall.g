; homeall.g

;----- home X & Y
G91                           ; relative positioning
M400                          ; wait for any moves to finish
M913 X50 Y50                  ; reduce XY motor current to 50% to prevent belts slipping
M915 X Y S4 R0 F0             ; enable stall detection
M201 X200.00 Y200.00          ; reduce acceleration
G1 S2 Z5 F9000                ; lift Z relative to current position
M400                          ; wait for completion
G1 S2 X0.2 F4000              ; tiny move to energize stepper
M400                          ; wait for completion
G4 P100                       ; wait
G1 S1 X-525 F4000             ; home X axis
G1 X5                         ; move out 5mm
G1 S1 Y-525 F4000             ; home Y axis
G1 Y5                         ; move out 5mm
G92 X0 Y0                     ; set X and Y to 0
M400                          ; wait for any moves to finish
M913 X100 Y100                ; restore motor currents
M201 X3000.00 Y3000.00        ; restore acceleration

;----- quick home Z
G90                           ; absolute positioning
G1 X250 Y250 F24000           ; go to middle of bed
M558 F2000                    ; do fast probes
G30                           ; home Z by probing the bed
M558 F300                     ; do slow probe
G1 X20 Y250 F24000            ; go to first point

;----- level the bed
M561                          ; clear any bed transform
G30 P0 X20 Y250 Z-99999       ; probe near a leadscrew, half way along Y axis
G30 P1 X470 Y250 Z-99999 S2   ; probe near a leadscrew and calibrate 2 motors

;----- home Z
G90                           ; absolute positioning
G1 X250 Y250 F24000           ; go to middle of bed
M558 F300                     ; do a slow Probe
G30                           ; home Z by probing the bed

;----- enable bed compensation
G29 S1 P"/sys/heightmap.csv"  ; enable bed compensation
