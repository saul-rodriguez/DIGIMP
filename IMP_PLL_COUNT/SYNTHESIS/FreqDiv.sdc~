

set_units -time 1000.0ps
set_units -capacitance 1000.0fF

#Create a clock of 40 MHz(1) or 20 MHz (2)
create_clock -name "Fin" -period 25.0 -waveform {0.0 12.5} [get_ports Fin]
#create_clock -name "Fin" -period 50.0 -waveform {0.0 25} [get_ports Fin]

set_clock_uncertainty 0.1 [get_clocks Fin]

set_input_delay  -clock [get_clocks Fin] -add_delay 3.0 [all_inputs]
set_output_delay -clock [get_clocks Fin] -add_delay 4.0 [all_outputs]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [all_inputs]

#the capacitance load the outputs have to drive
# TODO ASK which capacitance should be put to drive the I/O
set_load 0.5 [all_outputs]

set_propagated_clock Fin # required for EDI P&R flow

