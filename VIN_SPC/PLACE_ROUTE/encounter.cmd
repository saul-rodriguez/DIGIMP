#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Tue Aug  2 10:21:21 2016                
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
set init_verilog VERILOG/vin_spc_synth.v
set init_top_cell vin_spc
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_vin_spc_mmmc.view
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
print {---# CheckDesign Result: checkDesignDbSetup/vin_spc.main.htm}
print {---# CheckTiming Result: checkDesignDbSetup/vin_spc.checkTiming}
print {#### }
fit
setDrawView fplan
setDrawView ameba
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
setDrawView ameba
setDrawView fplan
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
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
setDrawView ameba
setDrawView fplan
selectMarker 126.4300 126.0400 136.4300 136.0400 -1 0 0
setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -routeTopPreferredLayer MT -routeBottomPreferredLayer M1 -routeNonDefaultRule {} -routeLeafTopPreferredLayer MT -routeLeafBottomPreferredLayer M1 -routeLeafNonDefaultRule {} -useLefACLimit false -routePreferredExtraSpace 1 -routeLeafPreferredExtraSpace 1 -opt true -optAddBuffer false -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose false -reportHTML false -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setEndCapMode -reset
setEndCapMode -boundary_tap false
saveDesign vin_spc_loaded.enc
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.99518696779 0.60 25 25 25 25
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 4.9
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 12
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 6 -spacing 0.6 -offset 12
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 2.8 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 4 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 4 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -xright_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 4 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
undo
undo
undo
undo
windowSelect 30.635 145.997 49.913 -3.871
deleteSelectedFromFPlan
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -xright_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 5 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -xright_offset {} -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 5 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 AM }
zoomBox 86.458 121.689 119.818 98.388
print {---# Corebox: 25.2 25.2 121.23 115.92
}
createRouteBlk -box 15.0 14.2 25.0 126.92 -layer 1
createRouteBlk -box 25.0 116.92 121.43 126.92 -layer 1
createRouteBlk -box 25.0 14.2 121.43 24.2 -layer 1
createRouteBlk -box 121.43 14.2 131.43 126.92 -layer 1
fit
zoomBox 14.039 131.915 29.965 118.001
uiSetTool ruler
fit
getMultiCpuUsage -localCpu
verify_drc -report vin_spc.drc.rpt -limit 1000
saveDesign vin_spc_loaded_power.enc
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 0.56 -pin {Resetn Clk Cfg_in}
zoomBox 64.330 145.661 89.141 128.898
undo
undo
uiSetTool select
undo
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
fit
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 0.56 -pin {RE FS {GD[0]} {GD[1]} {GD[2]} NS CE {GS[0]} {GS[1]} {GS[2]} {GS[3]} IQ {F[0]} {F[1]} {F[2]} {F[3]} {CapSel[0]} {CapSel[1]} {CapSel[2]} {CapSel[3]} {CcompSel[0]} {CcompSel[1]} {EnRdegHF[0]} {EnRdegHF[1]} EnRdeg {DP[0]} {DP[1]} {DP[2]} {DN[0]} {DN[1]} EnHF EnMF EnLF}
zoomBox 54.607 8.367 95.678 -5.547
zoomBox 63.111 2.485 86.637 -4.360
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.12 -pin {RE FS {GD[0]} {GD[1]} {GD[2]} NS CE {GS[0]} {GS[1]} {GS[2]} {GS[3]} IQ {F[0]} {F[1]} {F[2]} {F[3]} {CapSel[0]} {CapSel[1]} {CapSel[2]} {CapSel[3]} {CcompSel[0]} {CcompSel[1]} {EnRdegHF[0]} {EnRdegHF[1]} EnRdeg {DP[0]} {DP[1]} {DP[2]} {DN[0]} {DN[1]} EnHF EnMF EnLF}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {RE FS {GD[0]} {GD[1]} {GD[2]} NS CE {GS[0]} {GS[1]} {GS[2]} {GS[3]} IQ {F[0]} {F[1]} {F[2]} {F[3]} {CapSel[0]} {CapSel[1]} {CapSel[2]} {CapSel[3]} {CcompSel[0]} {CcompSel[1]} {EnRdegHF[0]} {EnRdegHF[1]} EnRdeg {DP[0]} {DP[1]} {DP[2]} {DN[0]} {DN[1]} EnHF EnMF EnLF}
fit
zoomBox -11.777 6.020 14.039 -8.397
fit
setPinAssignMode -pinEditInBatch false
saveDesign vin_spc_loaded_power_pins.enc
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
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
setPlaceMode -fp false
placeDesign
setDrawView ameba
setDrawView place
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib vin_spc vin_spc_loaded_power_pins}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
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
setDrawView ameba
setDrawView place
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
setEndCapMode -reset
setEndCapMode -boundary_tap false
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setEndCapMode -reset
setEndCapMode -boundary_tap false
setPlaceMode -fp false
placeDesign
setDrawView ameba
setDrawView place
zoomBox 62.559 150.111 92.933 112.834
zoomBox 66.515 144.395 80.403 131.271
fit
zoomBox 41.867 22.113 121.662 -9.068
zoomBox 74.593 8.202 95.109 -5.369
fit
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
displayClockTree -skew -allLevel -preRoute
setLayerPreference io -isVisible 0
setLayerPreference io -isVisible 1
setLayerPreference io -isSelectable 0
setLayerPreference io -isSelectable 1
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
clearClockDisplay
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
saveDesign vin_spc_loaded_power_pins_placed_clock.enc
setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
zoomBox 55.426 125.686 129.978 72.237
selectMarker 71.6800 105.8400 84.5600 110.8800 -1 12 88
deselectAll
selectMarker 84.5600 105.8400 97.4400 110.8800 -1 12 88
zoomBox 71.692 112.757 113.135 100.058
fit
verify_drc -report vin_spc.drc.rpt -limit 1000
zoomBox 61.648 54.299 92.996 31.333
fit
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib vin_spc vin_spc_loaded_power_pins_placed_clock}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
setDrawView place
verify_drc -report vin_spc.drc.rpt -limit 1000
zoomBox 44.884 117.163 74.053 85.480
zoomBox 53.480 112.476 69.630 96.463
selectInst EnHF_reg
fit
zoomBox 79.921 122.528 122.836 71.231
zoomBox 82.987 114.108 106.032 94.996
deselectAll
selectInst {out_reg[31]}
deselectAll
selectWire 81.9000 108.2200 82.1800 110.3200 2 {out[29]}
deselectAll
selectInst {out_reg[29]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[29]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[29]}
deselectAll
selectInst {out_reg[31]}
deselectAll
selectInst {out_reg[31]}
fit
zoomBox 102.384 25.298 84.111 46.588
deselectAll
selectInst {GD_reg[0]}
fit
zoomBox 38.682 83.300 110.263 66.369
deselectAll
selectInst {F_reg[3]}
deselectAll
selectInst {out_reg[1]}
deselectAll
selectInst {out_reg[1]}
deselectAll
selectWire 86.9400 3.5000 87.2200 99.5400 2 {GS[2]}
deselectAll
selectInst IQ_reg
deselectAll
selectInst {F_reg[0]}
zoomBox 65.637 78.295 70.156 75.567
deselectAll
selectMarker 66.7800 77.4200 67.0600 77.7000 2 1 25
fit
zoomBox 49.411 14.402 101.881 -11.247
zoomBox 67.468 5.397 76.422 -3.258
deselectAll
selectMarker 69.0200 1.8200 69.3000 2.1000 3 1 6
verify_drc -report vin_spc.drc.rpt -limit 1000
fit
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib vin_spc vin_spc_loaded_power_pins}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
verify_drc -report vin_spc.drc.rpt -limit 1000
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
setDrawView place
verify_drc -report vin_spc.drc.rpt -limit 1000
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib vin_spc vin_spc_loaded}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.99518696779 0.5 25 25 25 25
uiSetTool select
getIoFlowFlag
fit
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 6 -spacing 0.6 -offset 12
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -xright_offset {} -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 5 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -start_from right -spacing 0.4 -xleft_offset {} -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 5 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
windowSelect 31.618 156.784 55.506 -2.351
deleteSelectedFromFPlan
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset {} -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 5 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -allowLayerChange 1 -nets { gnd! vdd! } -blockPin useLef -targetViaLayerRange { M1 AM }
print {---# Corebox: 25.2 25.2 128.92 126.0
}
createRouteBlk -box 15.0 14.2 25.0 137.0 -layer 1
createRouteBlk -box 25.0 127.0 129.12 137.0 -layer 1
createRouteBlk -box 25.0 14.2 129.12 24.2 -layer 1
createRouteBlk -box 129.12 14.2 139.12 137.0 -layer 1
setDrawView fplan
setDrawView place
zoomBox 20.123 149.959 66.462 87.275
fit
verify_drc -report vin_spc.drc.rpt -limit 1000
saveDesign vin_spc_loaded_power.enc
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -snap USERGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
zoomBox 71.132 156.066 89.812 142.236
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -snap USERGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Resetn Clk Cfg_in}
fit
setPinAssignMode -pinEditInBatch true
editPin -snap USERGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {RE FS {GD[0]} {GD[1]} {GD[2]} NS CE {GS[0]} {GS[1]} {GS[2]} {GS[3]} IQ {F[0]} {F[1]} {F[2]} {F[3]} {CapSel[0]} {CapSel[1]} {CapSel[2]} {CapSel[3]} {CcompSel[0]} {CcompSel[1]} {EnRdegHF[0]} {EnRdegHF[1]} EnRdeg {DP[0]} {DP[1]} {DP[2]} {DN[0]} {DN[1]} EnHF EnMF EnLF}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -snap USERGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {RE FS {GD[0]} {GD[1]} {GD[2]} NS CE {GS[0]} {GS[1]} {GS[2]} {GS[3]} IQ {F[0]} {F[1]} {F[2]} {F[3]} {CapSel[0]} {CapSel[1]} {CapSel[2]} {CapSel[3]} {CcompSel[0]} {CcompSel[1]} {EnRdegHF[0]} {EnRdegHF[1]} EnRdeg {DP[0]} {DP[1]} {DP[2]} {DN[0]} {DN[1]} EnHF EnMF EnLF}
setPinAssignMode -pinEditInBatch false
saveDesign vin_spc_loaded_power_pins.enc
verify_drc -report vin_spc.drc.rpt -limit 1000
verify_drc -check_only all -report vin_spc.drc.rpt -limit 1000
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
setDrawView ameba
setDrawView place
verify_drc -check_only all -report vin_spc.drc.rpt -limit 1000
zoomBox 33.773 125.532 56.225 106.852
zoomBox 37.959 121.195 40.440 118.371
fit
zoomBox 53.889 -4.507 112.443 5.731
zoomBox 77.837 -1.753 81.934 1.311
fit
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
setDrawView ameba
setDrawView place
displayClockTree -skew -allLevel -preRoute
clearClockDisplay
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
saveDesign vin_spc_loaded_power_pins_placed.enc
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
verify_drc -check_only all -report vin_spc.drc.rpt -limit 1000
zoomBox -12.993 153.276 66.036 125.077
fit
saveDesign vin_spc_loaded_power_pins_placed_routed.enc
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCELLX32_HV FILLCELLX16_HV FILLCELLX8_HV FILLCELLX4_HV FILLCELLX2_HV FILLCELLX1_HV -prefix FILLER
zoomBox 21.200 132.357 123.579 47.221
zoomBox 107.969 128.955 130.495 113.785
fit
saveDesign vin_spc_loaded_power_pins_placed_routed_filled.enc
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
verifyConnectivity -type all -error 1000 -warning 50
saveDesign vin_spc_loaded_power_pins_placed_routed_filled.enc
saveDesign vin_spc_loaded_power_pins_placed_routed_filled.enc
