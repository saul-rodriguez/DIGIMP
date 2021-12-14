set_units -time 1000.0ps
set_units -capacitance 1000.0fF

#Create a clock of 4.0 MHz 
create_clock -name "clk" -period 250 -waveform {0.0 125} [get_ports clk]

set_clock_uncertainty 0.1 [get_clocks clk]

set_input_delay  -clock [get_clocks clk] -add_delay 3.0 [all_inputs]
set_output_delay -clock [get_clocks clk] -add_delay 4.0 [all_outputs]

set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [all_inputs]

#the capacitance load the outputs have to drive
set_load 0.25 [all_outputs]

set_propagated_clock clk 
# required for EDI P&R flow
