M83
G1 E5 F300
M400
M291 S3 R"Extrusion test" P"Press OK to start test"

G1 X150 E50 F60
M400
M291 S3 R"Measure extrusion" P"Measure filament taken at 1mm/sec extrusion, then press OK"

G1 X100 E50 F120
M400
M291 S3 R"Measure extrusion" P"Measure filament taken at 2mm/sec extrusion, then press OK"

G1 X150 E50 F180
M400
M291 S3 R"Measure extrusion" P"Measure filament taken at 3mm/sec extrusion, then press OK"

G1 X100 E50 F240
M400
M291 S3 R"Measure extrusion" P"Measure filament taken at 4mm/sec extrusion, then press OK"

G1 X150 E50 F300
M400
M291 S3 R"Measure extrusion" P"Measure filament taken at 5mm/sec extrusion, then press OK"
