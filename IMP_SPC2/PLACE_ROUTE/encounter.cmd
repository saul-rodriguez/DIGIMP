#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Tue Dec  1 11:56:37 2015                
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
set init_oa_ref_lib {TECH_H18A6  CORELIB  }
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
fit
selectMarker 105.2200 100.8400 115.2200 110.8400 -1 0 0
deselectAll
selectMarker 155.2200 150.8400 165.2200 160.8400 -1 0 0
setDrawView fplan
setDrawView ameba
setDrawView place
deselectAll
selectMarker 155.2200 150.8400 165.2200 160.8400 -1 0 0
deselectAll
selectMarker 105.2200 100.8400 115.2200 110.8400 -1 0 0
windowSelect 110.100 105.503 118.246 111.427
redraw
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
saveDesign spc2_loaded.enc
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.926780341023 0.6 10 10 10 10
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.827133479212 0.599927 10.08 10.08 10.08 10.08
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.827133479212 0.599927 10.08 10.08 10.08 10.08
uiSetTool select
getIoFlowFlag
fit
uiSetTool ruler
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.827133479212 0.599927 15 15 15 15
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.827133479212 0.599927 15.12 15.12 15.12 15.12
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 4.9
undo
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 4.9
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing {bottom 0.6 top 0.6 right 0.4 left 0.4} -offset 4.9
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 4.9 -threshold 4.9 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 4 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 4.9
selectWire 1.8200 1.8600 5.8200 88.8600 2 vdd!
deselectAll
selectWire 1.8200 84.8600 101.2200 88.8600 1 vdd!
deselectAll
selectWire 6.2200 80.5000 96.8200 84.5000 1 gnd!
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1 AM } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 AM } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 AM }
getMultiCpuUsage -localCpu
verify_drc -report spc2.drc.rpt -limit 1000
saveDesign spc2_power.enc
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType start -spacing 0.56 -start 0.0 0.0 -pin {Clk Resetn Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 0.56 -pin {Clk Resetn Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1 -pin {Clk Resetn Cfg_in}
zoomBox -15.782 49.347 12.345 39.972
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {Clk Resetn Cfg_in}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{F[3]} {F[2]} {F[1]} {F[0]} IQ {GS[3]} {GS[2]} {GS[1]} {GS[0]} CE NS {GD[2]} {GD[1]} {GD[0]} FS RE}
fit
zoomBox 30.574 -4.786 68.318 9.387
zoomBox 44.741 -2.840 45.713 4.320
zoomBox 42.220 -1.520 47.705 2.675
fit
zoomBox 70.013 -6.635 33.809 9.541
zoomBox 64.911 -3.625 37.341 6.922
zoomBox 62.782 -1.919 56.020 4.394
zoomBox 61.215 -0.875 58.439 2.580
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1 -pin {{F[3]} {F[2]} {F[1]} {F[0]} IQ {GS[3]} {GS[2]} {GS[1]} {GS[0]} CE NS {GD[2]} {GD[1]} {GD[0]} FS RE}
zoomBox 37.044 -4.170 57.842 5.844
zoomBox 42.060 -2.390 47.697 4.233
deselectAll
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
fit
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{F[3]} {F[2]} {F[1]} {F[0]} IQ {GS[3]} {GS[2]} {GS[1]} {GS[0]} CE NS {GD[2]} {GD[1]} {GD[0]} FS RE}
setPinAssignMode -pinEditInBatch false
fit
saveDesign spc2_pins.enc
print {---# Setup MMMC
---#}
create_rc_corner -name ams_rc_corner_typ  -cap_table {/pkg/AMS411/cds/HK_H18/LEF/h18a6/h18a6.capTable}  -preRoute_res {1.0}  -postRoute_res {1.0}  -preRoute_cap {1.0}  -postRoute_cap {1.0}  -postRoute_xcap {1.0}  -qx_tech_file {/pkg/AMS411/assura/h18a6/h18a6/QRC/qrcTechFile}
print {---#   rc_corner        : ams_rc_corner_typ}
create_library_set -name libs_min -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_BC.lib  }
create_library_set -name libs_max -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_WC.lib  }
create_library_set -name libs_typ -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_TYP.lib  }
print {---#   lib-sets         : libs_min, libs_max, libs_typ}
create_constraint_mode -name $cons -sdc_files $filename
create_constraint_mode -name $cons -sdc_files $filename
print {---#   constraint-modes : func test}
create_delay_corner -name corner_min -library_set {libs_min} -opcond_library {h18_CORELIB_BC} -opcond {best} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_max -library_set {libs_max} -opcond_library {h18_CORELIB_WC} -opcond {worst} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_typ -library_set {libs_typ} -opcond_library {h18_CORELIB_TYP} -opcond {typical} -rc_corner {ams_rc_corner_typ}
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
createClockTreeSpec -bufferList {BUFX12 BUFX16 BUFX2 BUFX24 BUFX3 BUFX32 BUFX4 BUFX6 BUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX24 CLKBUFX3 CLKBUFX32 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKINVX1 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX24 CLKINVX3 CLKINVX32 CLKINVX4 CLKINVX6 CLKINVX8 DLY1X1 DLY2X1 DLY3X1 DLY4X1 INVX1 INVX12 INVX16 INVX2 INVX24 INVX3 INVX32 INVX4 INVX6 INVX8 INVXL} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
displayClockTree -skew -allLevel -preRoute
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
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
wroute
verify_drc -report spc2.drc.rpt -limit 1000
zoomBox 35.084 -2.273 64.504 5.379
undo
undo
fit
zoomBox 46.938 93.855 60.840 80.600
zoomBox 49.366 91.608 54.462 88.344
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
uiSetTool moveWire
deselectAll
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
uiSetTool moveWire
deselectAll
fit
zoomBox 46.615 93.424 60.625 78.121
selectPhyPin 51.1000 89.6000 51.3800 90.7200 3 Resetn
deselectAll
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
deselectAll
selectWire 50.5400 84.2800 50.8200 89.8800 4 Resetn
deselectAll
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
deselectAll
selectWire 50.5400 84.2800 50.8200 89.8800 4 Resetn
uiSetTool moveWire
deselectAll
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
deselectAll
selectMarker 50.5400 89.7400 51.2400 90.0200 3 1 25
deselectAll
selectWire 45.6400 89.7400 50.1200 90.0200 3 Clk
uiSetTool moveWire
uiSetTool moveWire
deselectAll
fit
selectWire 50.5400 84.2800 50.8200 89.8800 4 Resetn
uiSetTool moveWire
editMove x 0.58
deselectAll
selectWire 51.6600 74.2000 51.9400 89.8800 4 Cfg_in
uiSetTool moveWire
editMove x 0.55
fit
zoomBox 38.317 -3.351 66.983 7.857
deselectAll
selectWire 58.9400 0.8400 59.2200 21.5600 4 FS
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign -cellview {FEOADesignlib spc2 spc2_pins}
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
getPinAssignMode -pinEditInBatch -quiet
zoomBox 47.046 94.286 53.943 87.389
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Top -layer 3 -spreadType center -spacing 0.4 -pin {Clk Resetn Cfg_in}
fit
zoomBox 36.808 -1.842 70.324 6.780
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.28 -pinDepth 1.12 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 0.4 -pin {{F[3]} {F[2]} {F[1]} {F[0]} IQ {GS[3]} {GS[2]} {GS[1]} {GS[0]} CE NS {GD[2]} {GD[1]} {GD[0]} FS RE}
fit
setPinAssignMode -pinEditInBatch false
verify_drc -report spc2.drc.rpt -limit 1000
saveDesign spc2_pins.enc
print {---# Setup MMMC
---#}
create_rc_corner -name ams_rc_corner_typ  -cap_table {/pkg/AMS411/cds/HK_H18/LEF/h18a6/h18a6.capTable}  -preRoute_res {1.0}  -postRoute_res {1.0}  -preRoute_cap {1.0}  -postRoute_cap {1.0}  -postRoute_xcap {1.0}  -qx_tech_file {/pkg/AMS411/assura/h18a6/h18a6/QRC/qrcTechFile}
print {---#   rc_corner        : ams_rc_corner_typ}
create_library_set -name libs_min -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_BC.lib  }
create_library_set -name libs_max -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_WC.lib  }
create_library_set -name libs_typ -timing {  /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_TYP.lib  }
print {---#   lib-sets         : libs_min, libs_max, libs_typ}
create_constraint_mode -name $cons -sdc_files $filename
create_constraint_mode -name $cons -sdc_files $filename
print {---#   constraint-modes : func test}
create_delay_corner -name corner_min -library_set {libs_min} -opcond_library {h18_CORELIB_BC} -opcond {best} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_max -library_set {libs_max} -opcond_library {h18_CORELIB_WC} -opcond {worst} -rc_corner {ams_rc_corner_typ}
create_delay_corner -name corner_typ -library_set {libs_typ} -opcond_library {h18_CORELIB_TYP} -opcond {typical} -rc_corner {ams_rc_corner_typ}
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
createClockTreeSpec -bufferList {BUFX12 BUFX16 BUFX2 BUFX24 BUFX3 BUFX32 BUFX4 BUFX6 BUFX8 CLKBUFX10 CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX24 CLKBUFX3 CLKBUFX32 CLKBUFX4 CLKBUFX6 CLKBUFX8 CLKINVX1 CLKINVX10 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX24 CLKINVX3 CLKINVX32 CLKINVX4 CLKINVX6 CLKINVX8 DLY1X1 DLY2X1 DLY3X1 DLY4X1 INVX1 INVX12 INVX16 INVX2 INVX24 INVX3 INVX32 INVX4 INVX6 INVX8 INVXL} -file Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
changeClockStatus -all -noFixedNetWires
get_propagated_clock -clock Clk
timeDesign -postCTS -expandedViews
timeDesign -postCTS -hold -expandedViews
wroute
verify_drc -report spc2.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50
setDrawView place
setDrawView fplan
setDrawView ameba
setDrawView place
addFiller -cell FILLCAPX32 FILLCAPX16 FILLCAPX8 FILLCAPX4 -prefix FILLERCAP
addFiller -cell FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1 -prefix FILLER
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
timeDesign -signoff -expandedViews
timeDesign -signoff -expandedViews -hold
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
verify_drc -report spc2.drc.rpt -limit 1000
saveDesign spc2_routed.enc
saveDesign spc2_routed.enc
