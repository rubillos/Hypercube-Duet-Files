M550 P"Hypercube - ** NO TOOL HEAD **"		; Set machine name

M106 P5 S0 I0 C"Water Pump"               ; water pump
M106 P6 S0 C"Water Cooling"	              ; radiator fan

M106 P7 S1.0 T38 100:101:102              ; Electronics cooling trigger
M106 P8 S1.0 T38 100:101:102

M106 P3 S5                                ; dim frame lights
