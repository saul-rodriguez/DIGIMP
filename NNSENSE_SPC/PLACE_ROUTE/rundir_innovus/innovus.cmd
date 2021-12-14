#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Aug 28 14:53:32 2017                
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
set init_verilog ../VERILOG/nnspc.v
set init_top_cell nnspc
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file ../CONFIG/ac18_nnspc_mmmc.view
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
uiSetTool select
uiSetTool moveWire
print {#### Available Functions}
print {---#     - amsDbSetup....................... Setup Database - read Config}
print {---#     - amsUserGrid...................... Sets the grid for the IO-Cells}
print {---#     - amsGlobalConnect type............ connects global nets: }
print {---#                                               type = core | both}
print {---#     - amsAddEndCaps.................... place Caps}
print {---#     - amsSetAnalysisView cond conslist.. set Analysis Views}
print {---#     - amsFillcore ...................... places core filler cells}
print {---#     - amsFillperi ...................... places periphery filler cells}
print {---#     - amsRoute router................... run routing with: }
print {---#                                               router = nano|nanodcv|wroute|wroute2(using 2CPUs)}
print {---#     - amsWrite postfix dir ............. writes GDS, Verilog NL, SPEF, DB}
print {---#     - amsWriteSDF4View viewList dir .... write SDF for all analysis views in list}
print {---#     - amsWriteFinalTiming dir .......... writes final timing data (signoff-SDF,-SPEF,-timingReports)}
print {---#     - amsZoomTo x y .................... zooms to coordinates x y}
print {#### }
setGenerateViaMode -auto true
setDesignMode -process 180
init_design
setCTSMode -bottomPreferredLayer 1
setMaxRouteLayer 5
setExtractRCMode -lefTechFileMap /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/qrclaymap.ccl
checkDesign -all -outDir ../REPORTS/checkDesignDbSetup
check_timing -verbose  > $filename2
print {#### }
print {---# CheckDesign Result: ../REPORTS/checkDesignDbSetup/nnspc.main.htm}
print {---# CheckTiming Result: ../REPORTS/checkDesignDbSetup/nnspc.checkTiming}
print {#### }
setPreference ConstraintUserXGrid 0.01
setPreference ConstraintUserXOffset 0.01
setPreference ConstraintUserYGrid 0.01
setPreference ConstraintUserYOffset 0.01
setPreference SnapAllCorners 1
setPreference BlockSnapRule 2
snapFPlanIO -usergrid
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
print {---# GlobalConnect all vdd! pins to net vdd!}
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
print {---# GlobalConnect all gnd! pins to net gnd!}
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference obsblock -isVisible 1
setLayerPreference obsstdCell -isVisible 1
setLayerPreference obsio -isVisible 1
setLayerPreference obsother -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinblock -isSelectable 1
setLayerPreference pinstdCell -isSelectable 1
setLayerPreference pinio -isSelectable 1
setLayerPreference piniopin -isSelectable 1
setLayerPreference pinother -isSelectable 1
setLayerPreference obsblock -isSelectable 1
setLayerPreference obsstdCell -isSelectable 1
setLayerPreference obsio -isSelectable 1
setLayerPreference obsother -isSelectable 1
setLayerPreference layoutObj -isSelectable 1
setDrawView fplan
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
createLib nnspc_OADB -attachTech TECH_C18A6 -libPath ../OADB/nnspc_OADB
saveDesign -cellview {nnspc_OADB nnspc loaded}
print {---#   Saved As OA: nnspc_OADB nnspc loaded
}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.894321766562 0.7 50.4 50.4 50.0 50.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.778846153846 0.696581 20 20 20 20
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.778846153846 0.696581 20.16 20.16 20.16 20.16
uiSetTool select
getIoFlowFlag
fit
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 2.52
setViaGenMode -symmetrical_via_only true
setViaGenMode -parameterized_via_only true
editPushUndo
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AM(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AM(6) } -nets { vdd! gnd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AM(6) }
getMultiCpuUsage -localCpu
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report nnspc.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
print {---# Libray nnspc_OADB already exists
}
saveDesign -cellview {nnspc_OADB nnspc floorplan}
print {---#   Saved As OA: nnspc_OADB nnspc floorplan
}
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType start -spacing 0.56 -start 0.0 0.0 -pin {Cfg_in Clk Resetn}
setPinAssignMode -pinEditInBatch false
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.778846153846 0.696581 17 17 17 17
uiSetTool select
getIoFlowFlag
fit
undo
