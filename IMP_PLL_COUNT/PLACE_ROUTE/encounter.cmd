#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Fri Nov  6 13:35:47 2015                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.24-s039_1 (64bit) 04/28/2015 11:46 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.24-s029 NR150421-2040/14_24-UB (database version 2.30, 264.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.24-s017_1 (64bit) 04/17/2015 04:49:06 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.24-s007 (64bit) 04/28/2015 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.24-s019_1 (64bit) Apr 24 2015 04:06:27 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.24-s029
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

setCheckMode -tapeOut true
set defHierChar /
set init_oa_ref_lib {TECH_H18A6  CORELIB_HV  }
set init_verilog VERILOG/FreqDiv_synth.v
set init_top_cell FreqDiv
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file h18_FreqDiv_mmmc.view
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
print {---# CheckDesign Result: checkDesignDbSetup/FreqDiv.main.htm}
print {---# CheckTiming Result: checkDesignDbSetup/FreqDiv.checkTiming}
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
setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -routeTopPreferredLayer MT -routeBottomPreferredLayer M1 -routeNonDefaultRule {} -routeLeafTopPreferredLayer MT -routeLeafBottomPreferredLayer M1 -routeLeafNonDefaultRule {} -useLefACLimit false -routePreferredExtraSpace 1 -routeLeafPreferredExtraSpace 1 -opt true -optAddBuffer false -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose false -reportHTML false -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setEndCapMode -reset
setEndCapMode -boundary_tap false
saveDesign FreqDiv_loaded.enc
setDrawView fplan
setDrawView ameba
setDrawView place
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.932949403538 0.6 25 25 25 25
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.863901268426 0.5 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.72 0.6 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.699784017279 0.599952 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.699784017279 0.5 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.583183337619 0.499986 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.460747343161 0.499943 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.352729454109 0.4999 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.352729454109 0.4999 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.352729454109 0.4999 25.2 25.2 25.0 25.0
uiSetTool select
getIoFlowFlag
fit
zoomBox 1.669 -5.288 -6.615 7.474
fit
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib FreqDiv FreqDiv_loaded}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018hvSite -r 0.932949403538 0.5 25 25 25 25
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 12
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 12
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 12
undo
redo
windowSelect 12.124 77.339 15.518 76.660
selectWire 8.2000 8.2000 13.2000 97.6400 2 gnd!
windowToggleSelect 9.919 76.320 17.894 75.133
windowSelect 10.767 73.775 18.742 72.927
selectWire 8.2000 8.2000 13.2000 97.6400 2 gnd!
uiSetTool moveWire
deselectWire 8.2000 8.2000 13.2000 97.6400 2 gnd!
selectWire 8.2000 8.2000 13.2000 97.6400 2 gnd!
windowToggleSelect 10.597 78.187 19.251 78.866
deleteSelectedFromFPlan
undo
saveDesign FreqDiv_ring.enc
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 2 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 20 -xright_offset 20 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 2 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 2 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 15 -xright_offset 15 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 2 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 2 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -xright_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 2 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
undo
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 2 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -xright_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M3 -max_same_layer_jog_length 4 -padcore_ring_bottom_layer_limit M1 -number_of_sets 2 -skip_via_on_pin Standardcell -stacked_via_top_layer AM -padcore_ring_top_layer_limit M3 -spacing 0.4 -xleft_offset 10 -xright_offset 10 -merge_stripes_value 4.9 -layer M2 -block_ring_bottom_layer_limit M1 -width 3 -nets {gnd! vdd!} -stacked_via_bottom_layer M1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -nets { vdd! gnd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 AM }
saveDesign FreqDiv_ring_stripe.enc
dbGet top.fPlan.corebox
print {---# Corebox: 25.2 25.2 88.84 80.64
}
createRouteBlk -box 15.0 14.2 25.0 91.64 -layer 1
createRouteBlk -box 25.0 81.64 89.04 91.64 -layer 1
createRouteBlk -box 25.0 14.2 89.04 24.2 -layer 1
createRouteBlk -box 89.04 14.2 99.04 91.64 -layer 1
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView place
getMultiCpuUsage -localCpu
verify_drc -report FreqDiv.drc.rpt -limit 1000
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 0.56 -pin Fout
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 0.56 -pin {Fin Resetn {Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]}}
zoomBox 111.048 61.049 116.309 50.359
fit
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 3 -spreadType center -spacing 0.56 -pin {Fin F_PFD}
zoomBox 109.691 58.334 118.684 49.002
fit
zoomBox -5.692 60.201 12.973 46.796
zoomBox -1.949 55.711 2.932 51.841
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 3 -spreadType center -spacing -1.0 -pin {Fin F_PFD}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1 -pin {Fin F_PFD}
undo
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 0.6 -pin {Fin F_PFD}
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 5 -pin {Fin F_PFD}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 1 -pin {{Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]} Resetn}
zoomBox 118.344 45.948 104.600 63.085
zoomBox 112.274 56.741 116.795 49.643
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing -1.12 -pin {{Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]} Resetn}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing -1.12 -pin {{Fsel[0]} {Fsel[1]} {Fsel[2]} {Fsel[3]} Resetn}
setPinAssignMode -pinEditInBatch false
setPinAssignMode -pinEditInBatch false
saveDesign FreqDiv_ring_stripe_pin.enc
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
verify_drc -report FreqDiv.drc.rpt -limit 1000
zoomBox 35.540 79.884 62.689 56.468
zoomBox 42.162 75.367 51.432 68.525
zoomBox 42.702 75.481 49.661 70.695
fit
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
displayClockPhaseDelay -preRoute
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
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib FreqDiv FreqDiv_ring_stripe_pin}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView place
setDrawView place
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
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
cleanupSpecifyClockTree
createClockTreeSpec -bufferList {BUFX12_HV BUFX16_HV BUFX24_HV BUFX2_HV BUFX32_HV BUFX3_HV BUFX4_HV BUFX6_HV BUFX8_HV CLKBUFX10_HV CLKBUFX12_HV CLKBUFX16_HV CLKBUFX24_HV CLKBUFX2_HV CLKBUFX32_HV CLKBUFX3_HV CLKBUFX4_HV CLKBUFX6_HV CLKBUFX8_HV CLKINVX10_HV CLKINVX12_HV CLKINVX16_HV CLKINVX1_HV CLKINVX24_HV CLKINVX2_HV CLKINVX32_HV CLKINVX3_HV CLKINVX4_HV CLKINVX6_HV CLKINVX8_HV DLY1X1_HV DLY2X1_HV DLY3X1_HV DLY4X1_HV INVX12_HV INVX16_HV INVX1_HV INVX24_HV INVX2_HV INVX32_HV INVX3_HV INVX4_HV INVX6_HV INVX8_HV INVXL_HV} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
displayClockTree -skew -allLevel -preRoute
displayClockTree -skew -allLevel -preRoute
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Fin
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
wroute -topLayerLimit MT
wroute -topLayerLimit M4
wroute
verify_drc -report FreqDiv.drc.rpt -limit 1000
saveDesign FreqDiv_ring_stripe_pin_routed.enc
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCAPX32_HV FILLCAPX16_HV FILLCAPX8_HV FILLCAPX4_HV -prefix FILLERCAP
addFiller -cell FILLCELLX32_HV FILLCELLX16_HV FILLCELLX8_HV FILLCELLX4_HV FILLCELLX2_HV FILLCELLX1_HV -prefix FILLER
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
verify_drc -report FreqDiv.drc.rpt -limit 1000
saveDesign FreqDiv_ring_stripe_pin_routed_tested.enc
