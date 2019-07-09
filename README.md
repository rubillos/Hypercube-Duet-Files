# Configuration Info

## Macros
- purge\_and\_prepare.g - Purge bucket procedure
- bucket\_retract.g - Retract purge bucket
- bucket\_extend.g - Extend purge bucket
- home\_and\_level.g - wait for temp
- present\_print.g - Final move to present Print
- extrude\_load.g - drive virtual axis with buttons
- extrude\_unload.g - unload filament

## Slicer
### Start Code for Slicer
```
G21 ; Set metric values
T0 ; select tool 0  
G10 S140 ; preheat extruder not enough to melt filament  
M140 S[bed0\_temperature] ; set bed temp no wait  
M98 P"/macros/home\_and\_level.g"  
M98 P"/macros/purge\_and_prepare.g"  
```

### Ending Code for Slicer
```
G10 S0 ; turn off extruder  
M140 S0 ; turn off bed  
M106 S0 ; fan off  
M98 P"/macros/present\_print.g"  
M0 ; finish  
```

### Settings for S3D for Firmware Retraction
```
Retraction Distance: 0.10mm  
Retraction Speed: 66.6mm/s
```

### Script for S3D for Firmware Retraction
```
{REPLACE "G1 E-0.1000 F3996" "G10"}  
{REPLACE "G1 E0.0000 F3996" "G11"}
```
