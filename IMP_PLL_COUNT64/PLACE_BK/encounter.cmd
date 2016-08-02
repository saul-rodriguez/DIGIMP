#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Mon Apr 11 14:16:25 2016                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.27-s035_1 (64bit) 10/07/2015 12:46 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.27-s012 NR150928-2308/14_27-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.27-s018_1 (64bit) 10/06/2015 22:57:34 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.27-s003 (64bit) 10/07/2015 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.27-s022_1 (64bit) Oct  6 2015 07:33:36 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.27-s021
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

setCheckMode -tapeOut true
set defHierChar /
set init_oa_ref_lib {TECH_H18A6  CORELIB_HV  }
set init_verilog VERILOG/FreqDiv64_synth.v
set init_top_cell FreqDiv64.v
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_FreqDiv64.v_mmmc.view
set conf_gen_footprint 1
set fp_core_to_left 50.000000
set fp_core_to_right 50.000000
set fp_core_to_top 50.000000
set fp_core_to_bottom 50.000000
set lsgOCPGainMult 1.000000
set conf_ioOri R0
set fp_core_util 0.800
set init_assign_buffer 0
set conf_in_tran_delay 0.1ps
set init_import_mode { -keepEmptyModule 1 -treatUndefinedCellAsBbox 0}
set init_layout_view layout
set init_abstract_view abstract
print {---# TCL Script amsSetup.tcl loaded}
print {---# Additional ams TCL Procedures loaded}
getVersion
getVersion
print {### austriamicrosystems HitKit-Utilities Menu added}
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
fit
print {---# TCL Script amsSetup.tcl loaded}
init_design
