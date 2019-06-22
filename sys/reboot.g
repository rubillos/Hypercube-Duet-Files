M0                            ; stop everything
M552 S0                       ; shut down networking
M106 P3 S0.5                  ; set frame lights to 50%
G4 P500                       ; wait 500ms
M999                          ; restart
