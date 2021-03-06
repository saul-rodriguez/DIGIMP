#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Jul  5 15:26:24 2017                
#                                                     
#######################################################

#@(#)CDS: Innovus v15.28-s017_1 (64bit) 03/20/2017 11:28 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 15.28-s017_1 NR170225-1338/15_28-UB (database version 2.30, 317.6.1) {superthreading v1.26}
#@(#)CDS: AAE 15.28-s003 (64bit) 03/20/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 15.28-s006_1 () Feb 16 2017 04:38:28 ( )
#@(#)CDS: SYNTECH 15.28-s002_1 () Feb 14 2017 21:05:47 ( )
#@(#)CDS: CPE v15.28-s003
#@(#)CDS: IQRC/TQRC 15.1.4-s213 (64bit) Tue Feb  9 17:31:28 PST 2016 (Linux 2.6.18-194.el5)

setCheckMode -tapeOut true
setDelayCalMode -siAware false
setGenerateViaMode -auto true
setExtractRCMode -lefTechFileMap /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/qrclaymap.ccl
suppressMessage IMPFP-3961
suppressMessage TECHLIB-436
set defHierChar /
set init_oa_ref_lib {TECH_C18A6  CORELIB  }
set init_verilog ../VERILOG/sar5_synth.v
set init_top_cell sar5
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file ../CONFIG/ac18_sar5_mmmc.view
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
set init_io_file {}
print {---# TCL Script amsSetup.tcl loaded}
print {---# TCL Script ../SCRIPTS/amsVoltusSetup.tcl loaded}
print {---# Additional ams TCL Procedures loaded}
getVersion
getVersion
print {### austriamicrosystems HitKit-Utilities Menu added}
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
setGenerateViaMode -auto true
setDesignMode -process 180
