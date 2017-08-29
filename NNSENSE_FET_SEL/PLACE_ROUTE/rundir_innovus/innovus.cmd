#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Tue Aug 29 13:07:09 2017                
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
set init_verilog ../VERILOG/fet_dec_synth.v
set init_top_cell fet_dec
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file ../CONFIG/ac18_fet_dec_mmmc.view
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
init_design
setCTSMode -bottomPreferredLayer 1
setMaxRouteLayer 5
setExtractRCMode -lefTechFileMap /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/qrclaymap.ccl
checkDesign -all -outDir ../REPORTS/checkDesignDbSetup
check_timing -verbose  > $filename2
print {#### }
print {---# CheckDesign Result: ../REPORTS/checkDesignDbSetup/fet_dec.main.htm}
print {---# CheckTiming Result: ../REPORTS/checkDesignDbSetup/fet_dec.checkTiming}
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
createLib fet_dec_OADB -attachTech TECH_C18A6 -libPath ../OADB/fet_dec_OADB
saveDesign -cellview {fet_dec_OADB fet_dec loaded}
print {---#   Saved As OA: fet_dec_OADB fet_dec loaded
}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.913705583756 0.7 10 10 10 10
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3.5 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 2.52
setViaGenMode -symmetrical_via_only true
setViaGenMode -parameterized_via_only true
editPushUndo
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AM(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AM(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AM(6) }
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec power}
print {---#   Saved As OA: fet_dec_OADB fet_dec power
}
getPinAssignMode -pinEditInBatch -quiet
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell fet_dec -pin {in[0]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[1]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[2]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[3]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[4]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {{in[0]} {in[1]} {in[2]} {in[3]} {in[4]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]} {out[22]} {out[23]} {out[24]} {out[25]} {out[26]} {out[27]} {out[28]} {out[29]} {out[30]} {out[31]}}
setPinAssignMode -pinEditInBatch false
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec pins}
print {---#   Saved As OA: fet_dec_OADB fet_dec pins
}
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch false
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
get_propagated_clock -clock in[0]
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
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
fit
verifyConnectivity -type all -error 1000 -warning 50
fit
fit
fit
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
fit
selectMarker 23.1000 22.5400 23.3800 22.8200 3 1 6
deselectAll
selectMarker 23.1000 22.5400 23.3800 22.8200 3 1 6
verifyConnectivity -type all -error 1000 -warning 50
fit
fit
fit
restoreDesign -cellview {fet_dec_OADB fet_dec pins}
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec preplace}
print {---#   Saved As OA: fet_dec_OADB fet_dec preplace
}
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -fp false
placeDesign
setDrawView place
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
deselectAll
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
deselectAll
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
deselectAll
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
deselectAll
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
deselectAll
selectWire 19.1800 32.6200 19.4600 34.0200 2 sll_18_12/n_11
deselectAll
selectMarker 19.4900 33.5800 19.6200 33.7200 1 1 2
fit
restoreDesign -cellview {fet_dec_OADB fet_dec preplace}
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX2 BUFX3 BUFX4 BUFX6 BUFX8 BUFX12 BUFX16 BUFX24 BUFX32 CLKBUFX2 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX24 CLKBUFX32 DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX2 CLKINVX3 CLKINVX4 CLKINVX6 CLKINVX8 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX24 CLKINVX32 INVXL INVX1 INVX2 INVX3 INVX4 INVX6 INVX8 INVX12 INVX16 INVX24 INVX32} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 2 3 4 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX2 BUFX3 BUFX4 BUFX6 BUFX8 BUFX12 BUFX16 BUFX24 BUFX32 CLKBUFX2 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX24 CLKBUFX32 DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX2 CLKINVX3 CLKINVX4 CLKINVX6 CLKINVX8 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX24 CLKINVX32 INVXL INVX1 INVX2 INVX3 INVX4 INVX6 INVX8 INVX12 INVX16 INVX24 INVX32} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 2 3 4 } -maxRouteLayer 4 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX2 BUFX3 BUFX4 BUFX6 BUFX8 BUFX12 BUFX16 BUFX24 BUFX32 CLKBUFX2 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX24 CLKBUFX32 DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX2 CLKINVX3 CLKINVX4 CLKINVX6 CLKINVX8 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX24 CLKINVX32 INVXL INVX1 INVX2 INVX3 INVX4 INVX6 INVX8 INVX12 INVX16 INVX24 INVX32} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 2 3 4 } -maxRouteLayer 4 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX2 BUFX3 BUFX4 BUFX6 BUFX8 BUFX12 BUFX16 BUFX24 BUFX32 CLKBUFX2 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX24 CLKBUFX32 DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX2 CLKINVX3 CLKINVX4 CLKINVX6 CLKINVX8 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX24 CLKINVX32 INVXL INVX1 INVX2 INVX3 INVX4 INVX6 INVX8 INVX12 INVX16 INVX24 INVX32} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 2 3 4 } -maxRouteLayer 4 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
setDrawView place
fit
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
fit
set_ccopt_mode -cts_target_slew 1.0
set_ccopt_mode -cts_target_nonleaf_slew 2.0
set_ccopt_property buffer_cells CLKBU*
set_ccopt_property inverter_cells CLKIN*
create_ccopt_clock_tree_spec -immediate
setCTSMode -routeBottomPreferredLayer M1 -routeLeafBottomPreferredLayer M1 -routeLeafTopPreferredLayer MT -routeTopPreferredLayer MT
ccopt_design -cts
report_ccopt_clock_trees -file ../REPORTS/ccopt_postCTS.report
report_ccopt_skew_groups -file ../REPORTS/ccopt_postCTS_skew.report
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
restoreDesign -cellview {fet_dec_OADB fet_dec loaded}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.913705583756 0.6 12 12 12 12
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3.5 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 2.52
editPushUndo
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AM(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AM(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AM(6) }
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec power}
print {---#   Saved As OA: fet_dec_OADB fet_dec power
}
getPinAssignMode -pinEditInBatch -quiet
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell fet_dec -pin {in[0]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[1]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[2]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[3]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[4]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell fet_dec -pin {in[0]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[1]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[2]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[3]} -status unplaced -silent
setPtnPinStatus -cell fet_dec -pin {in[4]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing -1.12 -pin {{in[0]} {in[1]} {in[2]} {in[3]} {in[4]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {{in[0]} {in[1]} {in[2]} {in[3]} {in[4]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]} {out[22]} {out[23]} {out[24]} {out[25]} {out[26]} {out[27]} {out[28]} {out[29]} {out[30]} {out[31]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.12 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]} {out[22]} {out[23]} {out[24]} {out[25]} {out[26]} {out[27]} {out[28]} {out[29]} {out[30]} {out[31]}}
setPinAssignMode -pinEditInBatch false
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec pins}
print {---#   Saved As OA: fet_dec_OADB fet_dec pins
}
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec prePlace}
print {---#   Saved As OA: fet_dec_OADB fet_dec prePlace
}
get_propagated_clock -clock in[0]
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec prePlace}
print {---#   Saved As OA: fet_dec_OADB fet_dec prePlace
}
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 1 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 1 -checkPinLayerForAccess {  3 1 2 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 1 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 0 -moduleAwareSpare 1 -checkPinLayerForAccess {  3 1 2 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
setDrawView place
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
set_ccopt_mode -cts_target_slew 1.0
set_ccopt_mode -cts_target_nonleaf_slew 2.0
set_ccopt_property buffer_cells CLKBU*
set_ccopt_property inverter_cells CLKIN*
create_ccopt_clock_tree_spec -immediate
setCTSMode -routeBottomPreferredLayer M1 -routeLeafBottomPreferredLayer M1 -routeLeafTopPreferredLayer MT -routeTopPreferredLayer MT
ccopt_design -cts
report_ccopt_clock_trees -file ../REPORTS/ccopt_postCTS.report
report_ccopt_skew_groups -file ../REPORTS/ccopt_postCTS_skew.report
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
restoreDesign -cellview {fet_dec_OADB fet_dec loaded}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.913705583756 0.4 12 12 12 12
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.887323943662 0.396378 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.887323943662 0.396378 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.887323943662 0.396378 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.8 0.396378 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.650602409639 0.395582 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.650602409639 0.395582 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3.5 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 2.52
editPushUndo
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AM(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AM(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AM(6) }
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec power}
print {---#   Saved As OA: fet_dec_OADB fet_dec power
}
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {{in[0]} {in[1]} {in[2]} {in[3]} {in[4]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]} {out[22]} {out[23]} {out[24]} {out[25]} {out[26]} {out[27]} {out[28]} {out[29]} {out[30]} {out[31]}}
setPinAssignMode -pinEditInBatch false
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
print {---# Libray fet_dec_OADB already exists
}
saveDesign -cellview {fet_dec_OADB fet_dec pins}
print {---#   Saved As OA: fet_dec_OADB fet_dec pins
}
get_propagated_clock -clock in[0]
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 3 2 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 3 2 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
setDrawView place
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
set_ccopt_mode -cts_target_slew 1.0
set_ccopt_mode -cts_target_nonleaf_slew 2.0
set_ccopt_property buffer_cells CLKBU*
set_ccopt_property inverter_cells CLKIN*
create_ccopt_clock_tree_spec -immediate
setCTSMode -routeBottomPreferredLayer M1 -routeLeafBottomPreferredLayer M1 -routeLeafTopPreferredLayer MT -routeTopPreferredLayer MT
ccopt_design -cts
report_ccopt_clock_trees -file ../REPORTS/ccopt_postCTS.report
report_ccopt_skew_groups -file ../REPORTS/ccopt_postCTS_skew.report
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report fet_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
restoreDesign -cellview {fet_dec_OADB fet_dec loaded}
