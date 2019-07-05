# Configuration Info





#----- Added Macros
G800 - Purge bucket procedure
G801 - Retract purge bucket
G802 - Extend purge bucket

G810 - Print prepare

G820 - Heaters off
G821 - Final move to present Print

#----- Start Code for Slicer
T0 ; select tool 0
G810 ; bring printer up to temp - home - prime and wipe

#----- Ending Code for Slicer
G820 ; heaters off
G821 ; present print
M0 ; finish
