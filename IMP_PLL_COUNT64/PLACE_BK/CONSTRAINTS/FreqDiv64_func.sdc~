# ####################################################################

#  Created by Encounter(R) RTL Compiler RC14.25 - v14.20-s046_1 on Mon Apr 11 12:20:44 +0200 2016

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design FreqDiv64

create_clock -name "Fin" -add -period 25.0 -waveform {0.0 12.5} [get_ports Fin]
set_load -pin_load 0.25 [get_ports Fout]
set_load -pin_load 0.25 [get_ports F_PFD]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports Fin]
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports {Fsel[3]}]
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports {Fsel[2]}]
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports {Fsel[1]}]
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports {Fsel[0]}]
set_input_delay -clock [get_clocks Fin] -add_delay 3.0 [get_ports Resetn]
set_output_delay -clock [get_clocks Fin] -add_delay 4.0 [get_ports Fout]
set_output_delay -clock [get_clocks Fin] -add_delay 4.0 [get_ports F_PFD]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Fin]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports {Fsel[3]}]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports {Fsel[2]}]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports {Fsel[1]}]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports {Fsel[0]}]
set_driving_cell -lib_cell NAND2X1_HV -library h18_CORELIB_HV_WC -pin "Q" [get_ports Resetn]
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
set_clock_uncertainty -setup 0.1 [get_clocks Fin]
set_clock_uncertainty -hold 0.1 [get_clocks Fin]
## List of unsupported SDC commands ##
set_propagated_clock Fin 
# required for EDI P&R flow
