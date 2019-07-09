# Hypercube Evolution + Duet Ethernet Configuration Files
These files support a Hypercube Evolution printer with a build size of 500x500x750.

![Hypercube](images/Hypercube.jpg)

# Hypercube Evolution + Duet Ethernet Configuration Files
These files are for Hypercube Evolution printer. A Duex 5 expansion board is used to support all of the hardware associated with the machine.

### Machine Features via Duet
- 500mm x 500mm x 750mm build size.
- 5 BMG extruders.
- Handles up to 15 tool heads, each with a unique ID# encoded using 4 endstop inputs.
- Tested and placeholder code currently for:
  - V6 (tested)
  - Volcano (tested)
  - Kraken
  - Diamond Fullcolor
  - Super Volcano
  - Zesty Nimble
  - Laser Engraver
- Multiple cooling options
  - Tool head mounted fan
  - Frame mounted water pump and radiator for water cooled heads.
- Orion Piezo sensor used for Z axis endstop.
- Two independent Z axis steppers.
- Z steppers have physical brakes controlled by a small circuit plugged into the CONN_LCD connector emulating a stepper on channel 11.
- Sensorless homing used for X and Y axis. Performs "fast then slow" homing.
- Purge bucket mounted to the frame, controlled by a servo.
- Configured for multiple filaments with separate config files.
- Physical button mounted to frame to stop filament feed during filament loading.

### Additional Features
- 5 filament sensors connected through an Arduino that maps the active filaments for the current tool head.
- Arduino with a "time of flight" distance sensor below the bed which controls a vertical light strip running down the frame to only illuminate LEDs above the bed surface. Tracks as the bed moves down.
- Raspberry Pi 3 with Camera that connects to the Duet via Telnet.
  - Watches the printer status, starts recording images when a print begins.
  - Takes a new picture at each layer change.
  - On completion:
    - Uses FFMPEG to create a movie.
    - Sends an SMS via Twilio to indicate completion.
    - Sends an email with the last recorded image.
- Main frame sits on top of a 12" tall cart made of 3030 extrusion.
  - Sorbothane pads virtually eliminate vibration transmitted down to floor.
  - 3" wheels allow easy access to all parts of the machine.

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
M140 S[bed0_temperature] ; set bed temp no wait  
M98 P"/macros/home_and_level.g"  
M98 P"/macros/purge_and_prepare.g"  
```

### Ending Code for Slicer
```
G10 S0 ; turn off extruder  
M140 S0 ; turn off bed  
M106 S0 ; fan off  
M98 P"/macros/present_print.g"  
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
