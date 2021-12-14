# ####################################################################

#  Created by Encounter(R) RTL Compiler RC14.24 - v14.20-s034_1 on Fri Jul 01 18:50:00 +0200 2016

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design spc2

create_clock -name "Clk" -add -period 250.0 -waveform {0.0 125.0} [get_ports Clk]
set_load -pin_load 0.25 [get_ports {F[3]}]
set_load -pin_load 0.25 [get_ports {F[2]}]
set_load -pin_load 0.25 [get_ports {F[1]}]
set_load -pin_load 0.25 [get_ports {F[0]}]
set_load -pin_load 0.25 [get_ports IQ]
set_load -pin_load 0.25 [get_ports {GS[3]}]
set_load -pin_load 0.25 [get_ports {GS[2]}]
set_load -pin_load 0.25 [get_ports {GS[1]}]
set_load -pin_load 0.25 [get_ports {GS[0]}]
set_load -pin_load 0.25 [get_ports CE]
set_load -pin_load 0.25 [get_ports NS]
set_load -pin_load 0.25 [get_ports {GD[2]}]
set_load -pin_load 0.25 [get_ports {GD[1]}]
set_load -pin_load 0.25 [get_ports {GD[0]}]
set_load -pin_load 0.25 [get_ports FS]
set_load -pin_load 0.25 [get_ports RE]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Cfg_in]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Clk]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Resetn]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {F[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {F[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {F[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {F[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports IQ]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GS[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GS[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GS[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GS[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports CE]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports NS]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GD[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GD[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {GD[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports FS]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports RE]
#set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Cfg_in]
#set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Clk]
#set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Resetn]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "sub_micron" -library "h18_CORELIB_HV_WC"
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/BUSHDX1_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX1_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX2_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX4_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX8_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX16_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/FILLCELLX32_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/TIE0_HV]
#set_dont_use [get_lib_cells h18_CORELIB_HV_WC/TIE1_HV]
set_clock_uncertainty -setup 0.1 [get_clocks Clk]
set_clock_uncertainty -hold 0.1 [get_clocks Clk]
## List of unsupported SDC commands ##

set_propagated_clock Clk 

