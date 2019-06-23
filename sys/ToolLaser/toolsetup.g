M550 P"Hypercube - Laser"	              	      ; Set machine name

;----- Set up laser
M307 H3 A-1 C-1 D-1                             ; disable Heater 3 to free up it's pin

M452 P3 R255 F200                               ; set laser mode, full power, 200Hz PWM

M574 Z0 C3                                      ; end stop on E0 endstop - filament sensor

;----- Tools
M563 P0 S"Laser"      									        ; Define tool 0
G10 P0 X0 Y0 Z0													        ; Set tool 0 axis offsets

;----- Finish
M550 P"Hypercube - Laser Engraver"		          ; Set machine name
M98 P"/sys/finish.g"
