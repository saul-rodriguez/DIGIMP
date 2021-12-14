#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Sun Nov  8 18:11:32 2015                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.25-s034_1 (64bit) 05/28/2015 13:06 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.25-s018 NR150520-1502/14_25-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.25-s023_1 (64bit) 05/28/2015 02:11:28 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.25-s009 (64bit) 05/28/2015 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.25-s022_1 (64bit) May 28 2015 00:14:16 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.25-s029
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

setCheckMode -tapeOut true
set defHierChar /
set init_oa_ref_lib {TECH_H18A6  CORELIB_HV  }
set init_verilog VERILOG/DacCtrl_synth.v
set init_top_cell DacCtrl
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_DacCtrl_mmmc.view
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
print {---# TCL Script amsSetup.tcl loaded}
init_design
