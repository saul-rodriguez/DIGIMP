#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Mon Apr 11 14:40:57 2016                
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
set init_top_cell FreqDiv64
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_FreqDiv64_mmmc.view
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
setCTSMode -bottomPreferredLayer 1
setMaxRouteLayer 5
checkDesign -all -outDir checkDesignDbSetup
check_timing -verbose  > $filename2
print {#### }
print {---# CheckDesign Result: checkDesignDbSetup/FreqDiv64.main.htm}
print {---# CheckTiming Result: checkDesignDbSetup/FreqDiv64.checkTiming}
print {#### }
fit
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
fit
setDrawView ameba
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -routeTopPreferredLayer MT -routeBottomPreferredLayer M1 -routeNonDefaultRule {} -routeLeafTopPreferredLayer MT -routeLeafBottomPreferredLayer M1 -routeLeafNonDefaultRule {} -useLefACLimit false -routePreferredExtraSpace 1 -routeLeafPreferredExtraSpace 1 -opt true -optAddBuffer false -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose false -reportHTML false -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setEndCapMode -reset
setEndCapMode -boundary_tap false
saveDesign FreqDiv64_loaded.enc
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.939130434783 0.6 30 30 30 30
uiSetTool select
getIoFlowFlag
fit
uiSetTool ruler
undo
undo
getIoFlowFlag
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 2 -spacing 2.8 -offset 4.9
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 4.9
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
undo
undo
undo
undo
undo
undo
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib FreqDiv64 FreqDiv64_loaded}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.939130434783 0.5 30 30 30 30
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.876798987822 0.499993 30.24 30.24 30.24 30.24
uiSetTool select
getIoFlowFlag
fit
undo
undo
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib FreqDiv64 FreqDiv64_loaded}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.939130434783 0.5 30 30 30 30
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
uiSetTool ruler
zoomBox 15.449 41.849 33.213 34.138
uiSetTool ruler
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
undo
undo
undo
undo
uiSetTool select
windowSelect -13.176 107.259 125.288 94.637
deleteSelectedFromFPlan
windowSelect 96.842 109.520 117.188 1.009
deleteSelectedFromFPlan
windowSelect 9.807 112.911 24.313 7.414
deleteSelectedFromFPlan
windowSelect 8.112 23.050 119.637 8.733
deleteSelectedFromFPlan
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 14 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset 14 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -xright_offset 14 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
fit
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 AM }
print {---# Corebox: 30.24 30.24 93.47 85.68
}
createRouteBlk -box 20.04 19.24 30.04 96.68 -layer 1
createRouteBlk -box 30.04 86.68 93.67 96.68 -layer 1
createRouteBlk -box 30.04 19.24 93.67 29.24 -layer 1
createRouteBlk -box 93.67 19.24 103.67 96.68 -layer 1
setDrawView ameba
setDrawView fplan
uiSetTool ruler
uiSetTool ruler
uiSetTool ruler
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib FreqDiv64 FreqDiv64_loaded}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
uiSetTool select
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.939130434783 0.5 21 21 21 21
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
fit
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -xright_offset 14 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 14 -xright_offset {} -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -allowLayerChange 1 -nets { gnd! vdd! } -blockPin useLef -targetViaLayerRange { M1 AM }
print {---# Corebox: 21.28 21.28 84.51 76.72
}
createRouteBlk -box 11.08 10.28 21.08 87.72 -layer 1
createRouteBlk -box 21.08 77.72 84.71 87.72 -layer 1
createRouteBlk -box 21.08 10.28 84.71 20.28 -layer 1
createRouteBlk -box 84.71 10.28 94.71 87.72 -layer 1
fit
getMultiCpuUsage -localCpu
verify_drc -report FreqDiv64.drc.rpt -limit 1000
verify_drc -report FreqDiv64.drc.rpt -limit 1000
saveDesign FreqDiv64_loaded_power.enc
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType start -spacing 0.56 -start 30.0 0.0 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
undo
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType start -spacing -0.56 -start 105.79 50.0 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType start -spacing 1 -start 105.79 97.72 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -side Right -layer 1 -assign 105.79 97.72 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -side Right -layer 1 -assign 105.79 97.72 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 1 -spreadType center -spacing 1.12 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
zoomBox 112.382 40.967 93.407 55.519
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 1.12 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 0.4 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 1 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 1.12 -pin {Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 0.56 -pin Fout
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 3 -spreadType center -spacing 1 -pin {F_PFD Fin}
setPinAssignMode -pinEditInBatch false
saveDesign FreqDiv64_loaded_power_pin.enc
print {---# Setup MMMC
---#}
create_rc_corner -name ams_rc_corner_typ  -cap_table {/pkg/AMS411/cds/HK_H18/LEF/h18a6/h18a6.capTable}  -preRoute_res {1.0}  -postRoute_res {1.0}  -preRoute_cap {1.0}  -postRoute_cap {1.0}  -postRoute_xcap {1.0}  -qx_tech_file {/pkg/AMS411/assura/h18a6/h18a6/QRC/qrcTechFile}
print {---#   rc_corner        : ams_rc_corner_typ}
create_library_set -name libs_min -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_BC.lib  }
create_library_set -name libs_max -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_WC.lib  }
create_library_set -name libs_typ -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_TYP.lib  }
print {---#   lib-sets         : libs_min, libs_max, libs_typ}
create_constraint_mode -name $cons -sdc_files $filename
create_constraint_mode -name $cons -sdc_files $filename
print {---#   constraint-modes : func test}
create_delay_corner -name corner_min -library_set {libs_min} -opcond_library {h18_CORELIB_HV_BC} -opcond {best} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_max -library_set {libs_max} -opcond_library {h18_CORELIB_HV_WC} -opcond {worst} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_typ -library_set {libs_typ} -opcond_library {h18_CORELIB_HV_TYP} -opcond {typical} -rc_corner {ams_rc_corner_typ}
print {---#   delay-corners    : corner_min, corner_max, corner_typ}
print {---#   analysis-views   : }
print {---#
---# use following command to show analysis view definitions
         report_analysis_view 
}
fit
setDrawView ameba
setDrawView place
setDrawView fplan
setDrawView ameba
setDrawView place
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
verify_drc -report FreqDiv64.drc.rpt -limit 1000
setEndCapMode -reset
setEndCapMode -boundary_tap false
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setPlaceMode -fp false
placeDesign -inPlaceOpt
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
displayClockTree -skew -allLevel -preRoute
setLayerPreference net -isSelectable 0
setLayerPreference power -isSelectable 0
setLayerPreference pgPower -isSelectable 0
setLayerPreference pgGround -isSelectable 0
setLayerPreference shield -isSelectable 0
setLayerPreference metalFill -isSelectable 0
setLayerPreference clock -isSelectable 0
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
clearClockDisplay
fit
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
get_propagated_clock -clock Fin
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
wroute -topLayerLimit MT
wroute
verify_drc -report FreqDiv64.drc.rpt -limit 1000
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
deselectAll
fit
zoomBox 112.848 44.227 97.365 58.080
zoomBox 108.412 49.568 100.738 52.395
setLayerPreference allM3Cont -isVisible 0
fit
zoomBox 99.926 54.704 113.663 45.740
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3 -isVisible 1
setLayerPreference allM3 -isVisible 0
setLayerPreference allM3 -isVisible 1
selectPhyPin 104.6700 50.5400 105.7900 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.3000 40.6000 104.5800 50.6800 4 {Fsel[3]}
windowSelect 104.384 50.116 103.638 50.116
selectWire 104.3000 40.6000 104.5800 50.6800 4 {Fsel[3]}
deleteSelectedFromFPlan
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
deleteSelectedFromFPlan
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
windowSelect 104.539 50.619 104.480 51.219
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deleteSelectedFromFPlan
wroute
verify_drc -report FreqDiv64.drc.rpt -limit 1000
verify_drc -check_only all -report FreqDiv64.drc.rpt -limit 1000
zoomBox 107.356 47.954 103.093 53.177
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false
zoomBox 103.8 50.04 105.5 51.32
zoomBox 103.8 50.04 105.5 51.32
deselectAll
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
uiSetTool stretchWire
deselectAll
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
deselectAll
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
deleteSelectedFromFPlan
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
uiSetTool stretchWire
deselectAll
selectPhyPin 104.6700 50.5400 105.7900 50.8200 3 {Fsel[3]}
uiSetTool stretchWire
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
setEdit -force_regular 1
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
uiSetTool stretchWire
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
uiSetTool stretchWire
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
uiSetTool stretchWire
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
uiSetTool moveWire
editMove y 0.47
undo
uiSetTool moveWire
deselectAll
selectWire 104.3000 40.6000 104.5800 50.6800 4 {Fsel[3]}
uiSetTool moveWire
editMove x -0.45
deselectAll
verify_drc -check_only all -report FreqDiv64.drc.rpt -limit 1000
selectWire 103.7400 40.6000 104.0200 50.6800 4 {Fsel[3]}
zoomBox 102.261 52.054 106.853 47.807
uiSetTool select
deselectAll
selectWire 103.7400 40.6000 104.0200 50.6800 4 {Fsel[3]}
deselectAll
selectWire 103.7400 40.6000 104.0200 50.6800 4 {Fsel[3]}
windowSelect 106.634 50.302 106.905 50.229
zoomBox 103.38 40.24 104.38 41.24
zoomBox 103.38 50.04 104.38 51.04
zoomBox 103.38 40.24 104.38 41.24
zoomBox 103.38 50.04 104.38 51.04
fit
zoomBox 91.428 60.874 126.469 25.135
selectWire 103.7400 40.6000 104.0200 50.6800 4 {Fsel[3]}
deleteSelectedFromFPlan
selectWire 103.8800 50.5400 105.0000 50.8200 3 {Fsel[3]}
deselectAll
wroute
zoomBox 101.383 52.190 112.344 47.289
uiSetTool addPoly
editAddPoly 106.302 50.992
editAddPoly 106.832 50.98
editAddPoly 106.832 51.31
editAddPoly 106.221 51.236
editCancelRoute
uiSetTool select
uiSetTool addPoly
editAddPoly 107.051 50.718
editAddPoly 107.157 50.3
editAddPoly 107.624 50.194
editAddPoly 107.643 50.587
editAddPoly 107.051 50.456
editCommitPoly 107.051 50.456
editAddPoly 101.539 52.62
editAddPoly 101.57 52.614
uiSetTool select
panPage 0 1
panPage -1 0
panPage 0 -1
panPage 1 0
panPage -1 0
clearDrc
uiSetTool addPoly
setEdit -layer_polygon M3
editAddPoly 107.345 49.892
editAddPoly 107.573 49.068
editAddPoly 108.66 48.996
editAddPoly 108.696 49.821
editCommitPoly 108.696 49.821
undo
zoomBox 104.154 50.896 106.521 50.179
editAddPoly 104.951 50.82
editAddPoly 105.623 50.772
editAddPoly 105.608 50.543
editAddPoly 104.903 50.538
editAddPoly 104.907 50.633
editCommitPoly 104.907 50.633
undo
editAddPoly 104.907 50.82
editAddPoly 105.677 50.818
editAddPoly 105.655 50.539
editAddPoly 104.913 50.539
editCommitPoly 104.913 50.539
verify_drc -check_only all -report FreqDiv64.drc.rpt -limit 1000
zoomBox 104.41 50.04 105.5 51.32
zoomBox 104.41 50.04 106.18 51.32
zoomBox 103.8 50.04 105.5 51.32
zoomBox 104.41 50.04 105.5 51.32
zoomBox 103.8 50.04 105.5 51.32
zoomBox 104.41 50.04 106.18 51.32
editAddPoly 105.41 50.648
deleteSelectedFromFPlan
uiSetTool select
selectMarker 104.9100 50.5400 105.0000 50.8200 3 1 6
deleteSelectedFromFPlan
selectMarker 104.3000 50.5400 105.0000 50.8200 3 1 25
deleteSelectedFromFPlan
selectMarker 104.9100 50.5400 105.6800 50.8200 3 1 25
deselectAll
selectMarker 104.9100 50.5400 105.6800 50.8200 3 1 25
deleteSelectedFromFPlan
selectWire 104.9100 50.5400 105.6800 50.8200 3 NULL
deleteSelectedFromFPlan
selectPhyPin 104.6700 50.5400 105.7900 50.8200 3 {Fsel[3]}
deselectAll
selectWire 104.4400 50.5400 105.0000 50.8200 3 {Fsel[3]}
deleteSelectedFromFPlan
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
fit
verify_drc -check_only all -report FreqDiv64.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50
clearDrc
verify_drc -check_only all -report FreqDiv64.drc.rpt -limit 1000
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCELLX32_HV FILLCELLX16_HV FILLCELLX8_HV FILLCELLX4_HV FILLCELLX2_HV FILLCELLX1_HV -prefix FILLER
saveDesign FreqDiv64_loaded_power_pin_routed.enc
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
timeDesign -postRoute -expandedViews
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_func_min.sdf
}
print {---# Analysis View: test_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_test_min.sdf
}
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_func_max.sdf
}
print {---# Analysis View: test_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_test_max.sdf
}
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_func_typ.sdf
}
print {---# Analysis View: test_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/FreqDiv64_test_typ.sdf
}
saveDesign FreqDiv64_loaded_power_pin_routed.enc
