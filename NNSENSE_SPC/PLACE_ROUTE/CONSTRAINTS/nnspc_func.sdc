# ####################################################################

#  Created by Encounter(R) RTL Compiler RC14.25 - v14.20-s046_1 on Mon Aug 28 14:06:55 +0200 2017

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design nnspc

create_clock -name "Clk" -add -period 250.0 -waveform {0.0 125.0} [get_ports Clk]
set_load -pin_load 0.25 [get_ports {NSEL[4]}]
set_load -pin_load 0.25 [get_ports {NSEL[3]}]
set_load -pin_load 0.25 [get_ports {NSEL[2]}]
set_load -pin_load 0.25 [get_ports {NSEL[1]}]
set_load -pin_load 0.25 [get_ports {NSEL[0]}]
set_load -pin_load 0.25 [get_ports {DAC[3]}]
set_load -pin_load 0.25 [get_ports {DAC[2]}]
set_load -pin_load 0.25 [get_ports {DAC[1]}]
set_load -pin_load 0.25 [get_ports {DAC[0]}]
set_load -pin_load 0.25 [get_ports RE]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Cfg_in]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Clk]
set_input_delay -clock [get_clocks Clk] -add_delay 3.0 [get_ports Resetn]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {NSEL[4]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {NSEL[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {NSEL[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {NSEL[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {NSEL[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {DAC[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {DAC[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {DAC[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports {DAC[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 4.0 [get_ports RE]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports Cfg_in]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports Clk]
set_driving_cell -lib_cell NAND2X1 -library ac18_CORELIB_WC -pin "Q" [get_ports Resetn]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "sub_micron" -library "ac18_CORELIB_WC"
#set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNA]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNAN]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/ANTENNAP]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/BUFG2_ESDIF]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/BUF2_ESDIF]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/BUSHDX1]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/ESDIFP5]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX4]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX8]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX16]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCAPX32]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX1]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX2]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX4]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX8]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX16]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/FILLCELLX32]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/TIE0]
#set_dont_use [get_lib_cells ac18_CORELIB_WC/TIE1]
set_clock_uncertainty -setup 0.1 [get_clocks Clk]
set_clock_uncertainty -hold 0.1 [get_clocks Clk]
## List of unsupported SDC commands ##
set_propagated_clock Clk 
