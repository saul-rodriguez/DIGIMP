# ####################################################################

#  Created by Encounter(R) RTL Compiler RC14.25 - v14.20-s046_1 on Tue Aug 29 15:23:01 +0200 2017

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design cur_dec

create_clock -name "in[0]" -add -period 250.0 -waveform {0.0 125.0} [get_ports {in[0]}]
set_load -pin_load 0.25 [get_ports {out[15]}]
set_load -pin_load 0.25 [get_ports {out[14]}]
set_load -pin_load 0.25 [get_ports {out[13]}]
set_load -pin_load 0.25 [get_ports {out[12]}]
set_load -pin_load 0.25 [get_ports {out[11]}]
set_load -pin_load 0.25 [get_ports {out[10]}]
set_load -pin_load 0.25 [get_ports {out[9]}]
set_load -pin_load 0.25 [get_ports {out[8]}]
set_load -pin_load 0.25 [get_ports {out[7]}]
set_load -pin_load 0.25 [get_ports {out[6]}]
set_load -pin_load 0.25 [get_ports {out[5]}]
set_load -pin_load 0.25 [get_ports {out[4]}]
set_load -pin_load 0.25 [get_ports {out[3]}]
set_load -pin_load 0.25 [get_ports {out[2]}]
set_load -pin_load 0.25 [get_ports {out[1]}]
set_load -pin_load 0.25 [get_ports {out[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks {in[0]}] -add_delay 3.0 [get_ports {in[3]}]
set_input_delay -clock [get_clocks {in[0]}] -add_delay 3.0 [get_ports {in[2]}]
set_input_delay -clock [get_clocks {in[0]}] -add_delay 3.0 [get_ports {in[1]}]
set_input_delay -clock [get_clocks {in[0]}] -add_delay 3.0 [get_ports {in[0]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[15]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[14]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[13]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[12]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[11]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[10]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[9]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[8]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[7]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[6]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[5]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[4]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[3]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[2]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[1]}]
set_output_delay -clock [get_clocks {in[0]}] -add_delay 4.0 [get_ports {out[0]}]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports {in[3]}]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports {in[2]}]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports {in[1]}]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports {in[0]}]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "sub_micron" -library "ac18_CORELIB_WC"
set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNA]
set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNAN]
set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNAP]
set_dont_use [get_lib_cells ac18_CORELIB_WC/BUFG2_ESDIF]
set_dont_use [get_lib_cells ac18_CORELIB_WC/BUF2_ESDIF]
set_dont_use [get_lib_cells ac18_CORELIB_WC/BUSHDX1]
set_dont_use [get_lib_cells ac18_CORELIB_WC/ESDIFP5]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX4]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX8]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX16]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX32]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX1]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX2]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX4]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX8]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX16]
set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX32]
set_dont_use [get_lib_cells ac18_CORELIB_WC/TIE0]
set_dont_use [get_lib_cells ac18_CORELIB_WC/TIE1]
set_clock_uncertainty -setup 0.1 [get_clocks {in[0]}]
set_clock_uncertainty -hold 0.1 [get_clocks {in[0]}]
## List of unsupported SDC commands ##
set_propagated_clock in[0] 
