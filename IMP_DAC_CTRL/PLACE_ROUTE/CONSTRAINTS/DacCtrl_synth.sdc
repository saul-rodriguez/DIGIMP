# ####################################################################

#  Created by Encounter(R) RTL Compiler RC14.24 - v14.20-s034_1 on Sun Nov 08 12:51:24 +0100 2015

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design DacCtrl

create_clock -name "Clk" -add -period 25.0 -waveform {0.0 12.5} [get_ports Clk]
set_load -pin_load 0.25 [get_ports {P[16]}]
set_load -pin_load 0.25 [get_ports {P[15]}]
set_load -pin_load 0.25 [get_ports {P[14]}]
set_load -pin_load 0.25 [get_ports {P[13]}]
set_load -pin_load 0.25 [get_ports {P[12]}]
set_load -pin_load 0.25 [get_ports {P[11]}]
set_load -pin_load 0.25 [get_ports {P[10]}]
set_load -pin_load 0.25 [get_ports {P[9]}]
set_load -pin_load 0.25 [get_ports {P[8]}]
set_load -pin_load 0.25 [get_ports {P[7]}]
set_load -pin_load 0.25 [get_ports {P[6]}]
set_load -pin_load 0.25 [get_ports {P[5]}]
set_load -pin_load 0.25 [get_ports {P[4]}]
set_load -pin_load 0.25 [get_ports {P[3]}]
set_load -pin_load 0.25 [get_ports {P[2]}]
set_load -pin_load 0.25 [get_ports {P[1]}]
set_load -pin_load 0.25 [get_ports {P[0]}]
set_load -pin_load 0.25 [get_ports IP]
set_load -pin_load 0.25 [get_ports IN]
set_load -pin_load 0.25 [get_ports QP]
set_load -pin_load 0.25 [get_ports QN]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports CountEnable]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Clk]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Resetn]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports StepNum]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[16]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[15]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[14]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[13]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[12]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[11]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[10]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[9]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[8]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[7]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[6]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[5]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[4]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {P[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports IP]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports IN]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports QP]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports QN]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports CountEnable]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Clk]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Resetn]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports StepNum]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "sub_micron" -library "h18_CORELIB_HV_WC"
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/BUSHDX1_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX1_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX2_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX4_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX8_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX16_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX32_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/TIE0_HV]
set_dont_use [get_lib_cells h18_CORELIB_HV_WC/TIE1_HV]
set_clock_uncertainty -setup 0.1 [get_clocks Clk]
set_clock_uncertainty -hold 0.1 [get_clocks Clk]
## List of unsupported SDC commands ##
set_propagated_clock Clk # required for EDI P&R flow
