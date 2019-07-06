# Configuration Info





#----- Macros
purge_and_prepare.g - Purge bucket procedure
bucket_retract.g - Retract purge bucket
bucket_extend.g - Extend purge bucket
home_and_level.g - wait for temp
present_print.g - Final move to present Print
extrude_load.g - drive virtual axis with buttons
extrude_unload.g - unload filament

#----- Start Code for Slicer
G21 ; Set metric values
T0 ; select tool 0
G10 S140 ; preheat extruder not enough to melt filament
M140 S[bed0_temperature] ; set bed temp no wait
M98 P"/macros/home_and_level.g"
M109 S[extruder0_temperature] ; wait for extruder temp
M98 P"/macros/purge_and_prepare.g"

#----- Ending Code for Slicer
M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M106 S0 ; fan off
M98 P"/macros/present_print.g"
M84 ; disable motors
M0 ; finish
