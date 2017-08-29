#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Tue Aug 29 15:42:44 2017                
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
set init_verilog ../VERILOG/cur_dec_synth.v
set init_top_cell cur_dec
set init_pwr_net {vdd!  }
set init_gnd_net {gnd! subc!  }
set init_mmmc_file ../CONFIG/ac18_cur_dec_mmmc.view
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
print {---# CheckDesign Result: ../REPORTS/checkDesignDbSetup/cur_dec.main.htm}
print {---# CheckTiming Result: ../REPORTS/checkDesignDbSetup/cur_dec.checkTiming}
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
createLib cur_dec_OADB -attachTech TECH_C18A6 -libPath ../OADB/cur_dec_OADB
saveDesign -cellview {cur_dec_OADB cur_dec loaded}
print {---#   Saved As OA: cur_dec_OADB cur_dec loaded
}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.628951747088 0.2 12 12 12 12
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.436893203883 0.2 12.32 12.32 12.32 12.32
uiSetTool select
getIoFlowFlag
fit
restoreDesign -cellview {cur_dec_OADB cur_dec loaded}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site ams018Site -r 0.628951747088 0.2 12 12 12 12
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
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3.5 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 2.52
setViaGenMode -symmetrical_via_only true
setViaGenMode -parameterized_via_only true
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AM -type core_rings -jog_distance 2.52 -threshold 2.52 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3.5 -spacing {bottom 0.36 top 0.36 right 0.4 left 0.4} -offset 2.52
editPushUndo
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AM(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AM(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AM(6) }
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec power}
print {---#   Saved As OA: cur_dec_OADB cur_dec power
}
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1.12 -pin {{in[0]} {in[1]} {in[2]} {in[3]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1.12 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]}}
setPinAssignMode -pinEditInBatch false
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec pins}
print {---#   Saved As OA: cur_dec_OADB cur_dec pins
}
set_analysis_view -setup $maxviewList -hold $minviewList
timeDesign -prePlace -expandedViews
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec preplace}
print {---#   Saved As OA: cur_dec_OADB cur_dec preplace
}
get_propagated_clock -clock in[0]
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -droutePostRouteWidenWireRule VSRDefaultSetup
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFX32 CLKBUFX24 CLKBUFX16 CLKBUFX12 CLKBUFX10 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2 BUFX32 BUFX24 BUFX16 BUFX12 BUFX8 BUFX6 BUFX4 BUFX3 BUFX2 INVX32 INVX24 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL CLKINVX32 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX10 CLKINVX8 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX2 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 2 3 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
placeDesign
setDrawView place
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report cur_dec.drc.rpt -limit 1000
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
selectWire 18.0600 14.7000 18.3400 35.7000 2 CTS_80
fit
fit
get_propagated_clock -clock in[0]
timeDesign -postCTS -expandedViews
optDesign -postCTS
setDrawView place
setDrawView ameba
setDrawView place
setDrawView place
setMaxRouteLayer 5
setNanoRouteMode -quiet -routeInsertAntennaDiode true -routeAntennaCellName ANTENNA
routeDesign -globalDetail
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report cur_dec.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
verifyConnectivity -type all -error 1000 -warning 50
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec routed}
print {---#   Saved As OA: cur_dec_OADB cur_dec routed
}
addFiller -cell FILLCAPX32 FILLCAPX16 FILLCAPX8 FILLCAPX4 -prefix FILLERCAP
addFiller -cell FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1 -prefix FILLER
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec final}
print {---#   Saved As OA: cur_dec_OADB cur_dec final
}
timeDesign -postRoute -expandedViews
timeDesign -postRoute -expandedViews -hold
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -reportfile cur_dec.antenna.rpt -error 1000
add_text -label {out[15]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 33.32 0.56
add_text -label {out[14]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 34.44 0.56
add_text -label {out[13]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 35.56 0.56
add_text -label {out[12]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 36.68 0.56
add_text -label {out[11]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 37.8 0.56
add_text -label {out[10]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 38.92 0.56
add_text -label {out[9]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 40.04 0.56
add_text -label {out[8]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 41.16 0.56
add_text -label {out[7]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 42.28 0.56
add_text -label {out[6]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 43.4 0.56
add_text -label {out[5]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 44.52 0.56
add_text -label {out[4]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 45.64 0.56
add_text -label {out[3]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 46.76 0.56
add_text -label {out[2]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 47.88 0.56
add_text -label {out[1]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 49.0 0.56
add_text -label {out[0]} -alignment centerLeft -orient R180 -height 0.5 -layer M3 -pt 50.12 0.56
add_text -label {in[3]} -alignment centerLeft -orient R90 -height 0.5 -layer M3 -pt 42.28 49.28
add_text -label {in[2]} -alignment centerLeft -orient R90 -height 0.5 -layer M3 -pt 41.16 49.28
add_text -label {in[1]} -alignment centerLeft -orient R90 -height 0.5 -layer M3 -pt 40.04 49.28
add_text -label {in[0]} -alignment centerLeft -orient R90 -height 0.5 -layer M3 -pt 38.92 49.28
print {---# 20 Port labels added to OA Database}
print {---# Run following command to save port labels on purpose label in OA}
print {---#    setOaxMode -textPurpose label}
setOaxMode -textPurpose label
print {---# Libray cur_dec_OADB already exists
}
saveDesign -cellview {cur_dec_OADB cur_dec final}
print {---#   Saved As OA: cur_dec_OADB cur_dec final
}
defOut -floorplan -netlist -routing ../FINALDATA/last/cur_dec_final.def
streamOut ../FINALDATA/last/cur_dec_final_fe.gds -mapFile ../SNW/gds2.map -libName DesignLib -structureName cur_dec -attachInstanceName 13 -attachNetName 13 -stripes 1 -units 1000 -mode ALL
print {---# 20 Ports found}
print {---# Port File written: ../FINALDATA/last/cur_dec.ports}
saveNetlist ../FINALDATA/last/cur_dec_final.v
saveNetlist ../FINALDATA/last/cur_dec_final_fillcap.v -excludeLeafCell -includePhysicalInst -excludeCellInst { FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1  }
saveNetlist ../FINALDATA/last/cur_dec_final_fillcap_pg.v -excludeLeafCell -includePhysicalInst -includePowerGround -excludeCellInst { FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1  }
setExtractRCMode -engine postRoute -effortLevel high
extractRC
rcOut -spef ../FINALDATA/last/cur_dec_final.spef
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
rcOut -spef ../FINALDATA/last/cur_dec_final_qrc.spef
print {####    Saved data
}
print {---# Save directory: ../FINALDATA/last}
print {---# DEF           : ../FINALDATA/last/cur_dec_final.def}
print {---# GDSII         : ../FINALDATA/last/cur_dec_final_fe.gds}
print {---# VerilogNL     : ../FINALDATA/last/cur_dec_final.v}
print {---# VerilogNL     : ../FINALDATA/last/cur_dec_final_fillcap.v (includes FILLCAPs)}
print {---# VerilogNL     : ../FINALDATA/last/cur_dec_final_fillcap_pg.v (includes FILLCAPs and Power/Ground Connections)}
print {---# Encounter SPEF: ../FINALDATA/last/cur_dec_final.spef}
print {---# QRC SPEF      : ../FINALDATA/last/cur_dec_final_qrc.spef}
print {---# Port List     : ../FINALDATA/last/cur_dec.ports}
print {#### 
}
get_delay_corner corner_$corner -rc_corner
set_analysis_view -setup $viewList -hold $viewList
setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
extractRC
rcOut -spef ../FINALDATA/last/SPEF/ams_rc_corner_minCaR.spef -rc_corner ams_rc_corner_minCaR
print {---# SPEF file written: ../FINALDATA/last/SPEF/ams_rc_corner_minCaR.spef}
timeDesign -signoff -expandedViews -outDir ../FINALDATA/last/timingReports/min
timeDesign -reportOnly -hold -expandedViews -outDir ../FINALDATA/last/timingReports/min
print {---# Analysis View: func_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_func_min.sdf
}
print {---# Analysis View: test_min
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_test_min.sdf
}
get_delay_corner corner_$corner -rc_corner
set_analysis_view -setup $viewList -hold $viewList
setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
extractRC
rcOut -spef ../FINALDATA/last/SPEF/ams_rc_corner_maxCaR.spef -rc_corner ams_rc_corner_maxCaR
print {---# SPEF file written: ../FINALDATA/last/SPEF/ams_rc_corner_maxCaR.spef}
timeDesign -signoff -expandedViews -outDir ../FINALDATA/last/timingReports/max
timeDesign -reportOnly -hold -expandedViews -outDir ../FINALDATA/last/timingReports/max
print {---# Analysis View: func_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_func_max.sdf
}
print {---# Analysis View: test_max
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_test_max.sdf
}
get_delay_corner corner_$corner -rc_corner
set_analysis_view -setup $viewList -hold $viewList
setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
extractRC
rcOut -spef ../FINALDATA/last/SPEF/ams_rc_corner_typ.spef -rc_corner ams_rc_corner_typ
print {---# SPEF file written: ../FINALDATA/last/SPEF/ams_rc_corner_typ.spef}
timeDesign -signoff -expandedViews -outDir ../FINALDATA/last/timingReports/typ
timeDesign -reportOnly -hold -expandedViews -outDir ../FINALDATA/last/timingReports/typ
print {---# Analysis View: func_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_func_typ.sdf
}
print {---# Analysis View: test_typ
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_test_typ.sdf
}
get_delay_corner corner_$corner -rc_corner
set_analysis_view -setup $viewList -hold $viewList
setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
extractRC
rcOut -spef ../FINALDATA/last/SPEF/ams_rc_corner_maxCaR2.spef -rc_corner ams_rc_corner_maxCaR2
print {---# SPEF file written: ../FINALDATA/last/SPEF/ams_rc_corner_maxCaR2.spef}
timeDesign -signoff -expandedViews -outDir ../FINALDATA/last/timingReports/min2
timeDesign -reportOnly -hold -expandedViews -outDir ../FINALDATA/last/timingReports/min2
print {---# Analysis View: func_min2
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_func_min2.sdf
}
print {---# Analysis View: test_min2
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_test_min2.sdf
}
get_delay_corner corner_$corner -rc_corner
set_analysis_view -setup $viewList -hold $viewList
setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
extractRC
rcOut -spef ../FINALDATA/last/SPEF/ams_rc_corner_minCaR2.spef -rc_corner ams_rc_corner_minCaR2
print {---# SPEF file written: ../FINALDATA/last/SPEF/ams_rc_corner_minCaR2.spef}
timeDesign -signoff -expandedViews -outDir ../FINALDATA/last/timingReports/max2
timeDesign -reportOnly -hold -expandedViews -outDir ../FINALDATA/last/timingReports/max2
print {---# Analysis View: func_max2
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_func_max2.sdf
}
print {---# Analysis View: test_max2
}
write_sdf -version 3.0 -prec 3 -edges check_edge  -force_calculation -average_typ_delays  -recompute_parallel_arcs  -view $view $filename
print {---# Created SDF: ../FINALDATA/last/SDF/cur_dec_test_max2.sdf
}
print ---#------------------------------------------------------
print {---# Final Timing Files written into: ../FINALDATA/last}
print {---#    SDF}
print {---#    SPEF}
print {---#    timingReports}
