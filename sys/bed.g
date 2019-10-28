M561                          ; clear any bed transform

G28 XY                        ; home X and Y

G30 P0 X30 Y245 Z-99999       ; probe near a leadscrew, half way along Y axis
G30 P1 X460 Y245 Z-99999 S2   ; probe near a leadscrew and calibrate 2 motors

G29 S1 P"heightmap.csv"         ; enable bed compensation
