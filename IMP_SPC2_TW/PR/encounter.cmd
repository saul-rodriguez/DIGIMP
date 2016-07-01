#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Fri Jul  1 19:34:44 2016                
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
set init_verilog VERILOG/spc2_synth.v
set init_top_cell spc2
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_spc2_mmmc.view
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
print {---# CheckDesign Result: checkDesignDbSetup/spc2.main.htm}
print {---# CheckTiming Result: checkDesignDbSetup/spc2.checkTiming}
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
fit
setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -routeTopPreferredLayer MT -routeBottomPreferredLayer M2 -routeNonDefaultRule {} -routeLeafTopPreferredLayer MT -routeLeafBottomPreferredLayer M2 -routeLeafNonDefaultRule {} -useLefACLimit false -routePreferredExtraSpace 1 -routeLeafPreferredExtraSpace 1 -opt true -optAddBuffer false -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose false -reportHTML false -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setEndCapMode -reset
setEndCapMode -boundary_tap false
setEndCapMode -reset
setEndCapMode -boundary_tap false
saveDesign spc2_loaded.enc
setDrawView fplan
setDrawView ameba
setDrawView place
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.926780341023 0.799976 25 25 25 25
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {vdd! gnd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
uiSetTool ruler
uiSetTool ruler
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {vdd! gnd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.76584105759 0.5 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {vdd! gnd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.689309323 0.499962 24 24 24 24
uiSetTool select
getIoFlowFlag
fit
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {vdd! gnd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {vdd! gnd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 20 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {vdd! gnd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset {} -xright_offset 20 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {vdd! gnd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -xright_offset 20 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {vdd! gnd!} -stacked_via_bottom_layer M1
uiSetTool ruler
fit
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 AM }
print {---# Corebox: 24.08 24.08 111.82 84.56
}
createRouteBlk -box 13.88 13.08 23.88 95.56 -layer 1
createRouteBlk -box 23.88 85.56 112.02 95.56 -layer 1
createRouteBlk -box 23.88 13.08 112.02 23.08 -layer 1
createRouteBlk -box 112.02 13.08 122.02 95.56 -layer 1
setDrawView fplan
setDrawView ameba
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView place
getMultiCpuUsage -localCpu
verify_drc -report spc2.drc.rpt -limit 1000
saveDesign spc2_loaded_power.enc
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType start -spacing 1 -start 20.0 0.0 -pin {{F[0]} {F[1]} {F[2]} {F[3]} IQ {GS[0]} {GS[1]} {GS[2]} {GS[3]} CE NS {GD[0]} {GD[1]} {GD[2]} FS RE}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType start -spacing -1.12 -start 30.0 0.0 -pin {{F[0]} {F[1]} {F[2]} {F[3]} IQ {GS[0]} {GS[1]} {GS[2]} {GS[3]} CE NS {GD[0]} {GD[1]} {GD[2]} FS RE}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.12 -pin {{F[0]} {F[1]} {F[2]} {F[3]} IQ {GS[0]} {GS[1]} {GS[2]} {GS[3]} CE NS {GD[0]} {GD[1]} {GD[2]} FS RE}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{F[0]} {F[1]} {F[2]} {F[3]} IQ {GS[0]} {GS[1]} {GS[2]} {GS[3]} CE NS {GD[0]} {GD[1]} {GD[2]} FS RE}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1 -pin {Cfg_in Resetn Clk}
zoomBox 64.571 112.110 72.309 103.856
fit
zoomBox 55.401 7.210 74.745 -6.073
fit
zoomBox 54.885 3.857 88.028 -2.978
fit
zoomBox 47.019 12.755 84.417 -4.267
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1 -pin {{F[0]} {F[1]} {F[2]} {F[3]} IQ {GS[0]} {GS[1]} {GS[2]} {GS[3]} CE NS {GD[0]} {GD[1]} {GD[2]} FS RE}
zoomBox 58.209 2.010 75.163 -1.926
setPinAssignMode -pinEditInBatch false
fit
saveDesign spc2_loaded_power_pin.enc
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
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
setEndCapMode -reset
setEndCapMode -boundary_tap false
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
displayClockTree -skew -allLevel -preRoute
uiSetTool select
setDrawView fplan
setDrawView ameba
setDrawView place
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
displayClockTree -skew -allLevel -preRoute
clearClockDisplay
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail -viaOpt -wireOpt
zoomBox 51.532 -3.107 81.580 59.567
undo
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinObj -isSelectable 1
setLayerPreference cellBlkgObj -isSelectable 1
setLayerPreference layoutObj -isSelectable 1
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCELLX32_HV FILLCELLX16_HV FILLCELLX8_HV FILLCELLX4_HV FILLCELLX2_HV FILLCELLX1_HV -prefix FILLER
verify_drc -report spc2.drc.rpt -limit 1000
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
saveDesign spc2_loaded_power_pin_routed.enc
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_func_min.sdf
}
print {---# Analysis View: test_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_test_min.sdf
}
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_func_max.sdf
}
print {---# Analysis View: test_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_test_max.sdf
}
set_analysis_view -setup $viewList -hold $viewList
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
print {---# Analysis View: func_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_func_typ.sdf
}
print {---# Analysis View: test_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -view $view $filename
print {---# Created SDF: SDF/spc2_test_typ.sdf
}
saveDesign spc2_loaded_power_pin_routed.enc
