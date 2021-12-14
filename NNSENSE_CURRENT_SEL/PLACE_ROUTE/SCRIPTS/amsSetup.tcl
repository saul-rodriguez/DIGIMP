#######################################################
##                                                     
##  Encounter Command File      
##                              
##  Owner: austriamicrosystems  
##  HIT-Kit: Digital            
##  version: 06-Feb-2017        
##                              
##  Created on: tis aug 29 15:34:56 CEST 2017                          
##                                                    
########################################################

proc amsHelp {} {
    print "#### Available Functions" 
    print "---#     - amsDbSetup....................... Setup Database - read Config"
    print "---#     - amsUserGrid...................... Sets the grid for the IO-Cells"
    print "---#     - amsGlobalConnect type............ connects global nets: "
    print "---#                                               type = core | both"
    print "---#     - amsAddEndCaps.................... place Caps"
    print "---#     - amsSetAnalysisView cond conslist.. set Analysis Views"
    print "---#     - amsFillcore ...................... places core filler cells"
    print "---#     - amsFillperi ...................... places periphery filler cells"
    print "---#     - amsRoute router................... run routing with: "
    print "---#                                               router = nano|nanodcv|wroute|wroute2(using 2CPUs)"
    print "---#     - amsWrite postfix dir ............. writes GDS, Verilog NL, SPEF, DB"
    print "---#     - amsWriteSDF4View viewList dir .... write SDF for all analysis views in list"
    print "---#     - amsWriteFinalTiming dir .......... writes final timing data (signoff-SDF,-SPEF,-timingReports)"
    print "---#     - amsZoomTo x y .................... zooms to coordinates x y"
    print "#### " 
} 

proc addAMSHKMenu {} {
   global HKMenuAdded
   # add AMSMenu if Encounter version is higher or equal to 10
   set encVer [string range [getVersion] 0 [expr [string first . [getVersion]]-1]]
   if {$encVer >= 10} {
     uiAdd amsHKMenu -type menu -label "hitkit Utilities" -in main
     uiAdd expCommand -type command -label "Unfix Clock Nets" -command [list changeClockStatus -all -noFixedNetWires] -in amsHKMenu
     uiAdd expCommand -type command -label "Remove tmp_oa_db libs from cds.lib" -command [list removeTmpoalibs] -in amsHKMenu
     uiAdd expCommand -type command -label "Wroute..." -command [list ::Rda_Route::RouteStdCell::create] -in amsHKMenu
     print "### austriamicrosystems HitKit-Utilities Menu added";}
     set HKMenuAdded 1
}

proc amsDbSetup {} {
   global topcellname
   ##--- Load configuration file
   ## source ac18_cur_dec.globals
   ##--- if the netlist includes assign statements they can be replaced by buffers with following command
   ## XsetDoAssign on -buffer <buffername>
   setGenerateViaMode -auto true
   setDesignMode -process 180
   init_design
   setCTSMode -bottomPreferredLayer 1
   setMaxRouteLayer 5
   setExtractRCMode -lefTechFileMap /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/qrclaymap.ccl
   
   ##-- some design checks at the beginning
   set filename1 [format "../REPORTS/checkDesignDbSetup/%s.main.htm" $topcellname]
   checkDesign -all -outDir ../REPORTS/checkDesignDbSetup
   
   set filename2 [format "../REPORTS/checkDesignDbSetup/%s.checkTiming" $topcellname]
   check_timing -verbose  > $filename2
   print "#### "
   print "---# CheckDesign Result: $filename1"
   print "---# CheckTiming Result: $filename2"
   print "#### "
   
}


proc amsUserGrid {} {
   ##--- Set user grids
   setPreference ConstraintUserXGrid 0.01
   setPreference ConstraintUserXOffset 0.01
   setPreference ConstraintUserYGrid 0.01
   setPreference ConstraintUserYOffset 0.01
   setPreference SnapAllCorners 1
   setPreference BlockSnapRule 2

   snapFPlanIO -usergrid
}

proc amsGlobalConnect type {
   ##--- Define global power connects
   switch $type {
      "core" {
               set globalNetsList {{vdd! vdd!} {gnd! gnd!}}
               ##--- Define global Power nets - make global connections
             }
      "both" {
               ##--- Define global Power nets - make global connections
               clearGlobalNets
               set globalNetsList {{vdd! vdd!} {gnd! gnd!}}
             }
     }
     clearGlobalNets
     foreach net $globalNetsList {
        set n [lindex $net 0]
        set p [lindex $net 1]
        globalNetConnect $n -type pgpin -pin $p -inst * -module {}
        print "---# GlobalConnect all $p pins to net $n"
     }
}


proc amsSetAnalysisView {cond consList} {
    
    switch $cond {
      "typ"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_typ" $cons]
                    set viewList [lappend viewList $avname]
                 }
                 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "minmax" { 
		 set maxviewList {}
		 set minviewList {}
                 foreach cons $consList {
		           set maxavname [format "%s_max" $cons]
                    set maxviewList [lappend maxviewList $maxavname]
		           set minavname [format "%s_min" $cons]
                    set minviewList [lappend minviewList $minavname]
                 }
                 set_analysis_view -setup $maxviewList -hold $minviewList
	       } 
      "minmax2" { 
		 set maxviewList {}
		 set minviewList {}
                 foreach cons $consList {
		           set maxavname [format "%s_max2" $cons]
                    set maxviewList [lappend maxviewList $maxavname]
		           set minavname [format "%s_min2" $cons]
                    set minviewList [lappend minviewList $minavname]
                 }
                 set_analysis_view -setup $maxviewList -hold $minviewList
	       } 
      "min"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_min" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "max"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_max" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "min2"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_min2" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "max2"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_max2" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      }
}


proc amsAddEndCaps {} {
   ##-- add CAP cells
   addEndCap -prefix ENDCAP

}

proc amsAddWellTaps {{type std}} {
##-- Add Well Taps 
   switch $type {
      "std" { 
            }
      "3b"  {
	       globalNetConnect subc! -type pgpin -pin subc! -inst * -module {}
	       addStripe -skip_via_on_wire_shape Noshape \
	                 -block_ring_top_layer_limit MT \
			 -max_same_layer_jog_length 5.0 \
			 -padcore_ring_bottom_layer_limit M1 \
			 -set_to_set_distance 99.68 \
			 -skip_via_on_pin {} \
			 -stacked_via_top_layer AM \
			 -padcore_ring_top_layer_limit MT \
			 -spacing 0.4 \
			 -xleft_offset 19.74 \
			 -merge_stripes_value 2.52 \
			 -layer M2 \
			 -block_ring_bottom_layer_limit M1 \
			 -width 0.84 \
			 -nets subc! \
			 -stacked_via_bottom_layer M1
            }
   }
}

proc amsFillcore {} {
   ##-- Add Core Filler cells
   addFiller -cell FILLCAPX32 FILLCAPX16 FILLCAPX8 FILLCAPX4 -prefix FILLERCAP
   addFiller -cell FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1 -prefix FILLER
}

proc amsFillperi {} {
   ##-- Add Peri Filler cells
   foreach fillcell $fillerList {
      addIoFiller -cell PERI_SPACER_$fillcell -prefix pfill
   }
}

proc amsRoute {{router wroute}} {
    global antennacell
    switch $router {
      "nano" { 
               ##-- Run Routing
               ##-- Nano-Route
               setMaxRouteLayer 5
               setNanoRouteMode -quiet -routeInsertAntennaDiode true -routeAntennaCellName $antennacell
               routeDesign -globalDetail
             }
      "nanodcv" { 
               ##-- Run Routing
               ##-- Nano-Route using double-cut vias
               setMaxRouteLayer  5
	          setNanoRouteMode -drouteUseMultiCutViaEffort high
               setNanoRouteMode -routeReserveSpaceForMultiCut true
               setNanoRouteMode -quiet -routeInsertAntennaDiode true -routeAntennaCellName $antennacell
               routeDesign
               setNanoRouteMode -routeWithTimingDriven false
               setNanoRouteMode -droutePostRouteSwapVia multiCut
               #setNanoRouteMode -dbViaWeight "VIA1_HC 10, VIA1_VC 10, VIA2_HC 10, VIA2_VC 10, VIA1_D* 10, VIA2_D* 10, VIA1_PR 1, VIA2_PR 1"
               routeDesign -viaOpt
             }
    "wroute" {
               ##-- WROUTE
             wroute -topLayerLimit 5  -antennaInsertCellPassNumber 0 -antennaTopLayerLimit 5
             }
    "wroutedcv" {
             ##-- WROUTE using double-cut vias
             wroute -topLayerLimit 5 -optimizeMode viasOnlyDuring
             }
    "wroute2" {
               ##-- WROUTE
             wroute -topLayerLimit 5 -multiCpu 2 -antennaInsertCellPassNumber 0 -antennaTopLayerLimit 5
             }
     }
}

proc amsSave viewname {
   global topcellname
   global libname
   global techlibname
   global cds_lib

   # check if library exists
   set libexists 0
   foreach idx [array names cds_lib] {
     if { $idx == $libname } { 
        set libexists 1 
     }
   }
   if {$libexists == 0} { 
      createlib $libname -attachTech $techlibname  -libPath ../OADB/$libname
   } else { 
      print "---# Libray $libname already exists\n"
   }

   saveDesign -cellview "$libname $topcellname $viewname"
   print "---#   Saved As OA: $libname $topcellname $viewname\n"
}

proc amsWrite {postfix {dir .}} {
   global topcellname

   if {$dir != "."} {
      set dir [format "../FINALDATA/%s" $dir]
      system mkdir $dir
   }

   ##-- Save Design
   amsSave $postfix
   ##-- Write DEF
   set filename_def [format "%s/%s_%s.def" $dir $topcellname $postfix]
   defOut -floorplan -netlist -routing $filename_def
   ##-- Write GDS2
   set filename_gds [format "%s/%s_%s_fe.gds" $dir $topcellname $postfix]
   streamOut $filename_gds -mapFile ../SNW/gds2.map -libName DesignLib -structureName $topcellname \
         -attachInstanceName 13 -attachNetName 13 -stripes 1 -units 1000 -mode ALL

   ##-- Write port file
   set filename_ports [format "%s/%s.ports" $dir $topcellname]
   amsPortList $filename_ports

   ##-- Verilog Netlist
   set filename_vnl [format "%s/%s_%s.v" $dir $topcellname $postfix]
   saveNetlist $filename_vnl
  set excludeList { FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1 \
                                          }
   ##-- Verilog Netlist with FILLCAP cells
   set filename_vnl2 [format "%s/%s_%s_fillcap.v" $dir $topcellname $postfix]
   saveNetlist $filename_vnl2 -excludeLeafCell -includePhysicalInst \
                              -excludeCellInst $excludeList
   ##-- Verilog Netlist with FILLCAP cells and power/ground connections
   set filename_vnl3 [format "%s/%s_%s_fillcap_pg.v" $dir $topcellname $postfix]
   saveNetlist $filename_vnl3 -excludeLeafCell -includePhysicalInst \
                              -includePowerGround \
                              -excludeCellInst $excludeList

   ##-- Extract detail parasitics
   setExtractRCMode -engine postRoute -effortLevel high
   extractRC
   set filename_spef1 [format "%s/%s_%s.spef" $dir $topcellname $postfix]
   rcOut -spef $filename_spef1
   
   ##-- run QRC extraction
   setExtractRCMode -engine postRoute -effortLevel signoff 
   extractRC 
   set filename_spef2 [format "%s/%s_%s_qrc.spef" $dir $topcellname $postfix]
   rcOut -spef $filename_spef2

   print "####    Saved data\n"
   print "---# Save directory: $dir"
   print "---# DEF           : $filename_def"
   print "---# GDSII         : $filename_gds"
   print "---# VerilogNL     : $filename_vnl"
   print "---# VerilogNL     : $filename_vnl2 (includes FILLCAPs)"
   print "---# VerilogNL     : $filename_vnl3 (includes FILLCAPs and Power/Ground Connections)"
   print "---# Encounter SPEF: $filename_spef1"
   print "---# QRC SPEF      : $filename_spef2"
   print "---# Port List     : $filename_ports"
   print "#### \n"
}


##--  write SDF for a specific analysis view
proc amsWriteSDF4View {viewList {dir .}} {
   global topcellname

   if {$dir != "."} {
      set dir [format "../FINALDATA/%s" $dir]
      system mkdir -p $dir/SDF
   }

   set sdfver 3.0

   foreach view $viewList {
      set filename [format "%s/SDF/%s_%s.sdf" $dir $topcellname $view]
      print "---# Analysis View: $view\n"

      switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -recompute_parallel_arcs \
                     -view $view $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -recompute_parallel_arcs \
                     -view $view $filename
         ##-- additional for verilog XL: -splitrecrem
                }
      }
      print "---# Created SDF: $filename\n"
   }
}

##--  write SDF for a specific analysis view
proc amsWriteSDFbtw {minview typview maxview} {
   global topcellname

   set sdfver 3.0

   set filename [format "SDF/%s_all.sdf" $topcellname]

   switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -recompute_parallel_arcs \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
         ##-- additional for verilog XL: -splitrecrem
                }
   }
      print "---# Created SDF: $filename\n"
}

##-- Other usefule procedures

proc amsZoomTo {x y {factor 10}} {
   set llx [expr {$x - $factor}]
   set lly [expr {$y - $factor}]
   set urx [expr {$x + $factor}]
   set ury [expr {$y + $factor}]
   zoomBox $llx $lly $urx $ury
}
##-- End of First Encounter TCL command file

proc protoSDF {} {
    amsDbSetup
    amsSetMMMC
    amsSetAnalysisView minmax {func}
    floorplan -r 1.0 0.8 2 2 2 2
    setPlaceMode -fp true -timingDriven false -reorderScan false -doCongOpt false -modulePlan false
    placeDesign -noPrePlaceOpt
    trialRoute -maxRouteLayer 5 -floorplanMode
    extractRC
    amsWriteSDF4View {func_max func_min}
}


proc amsFloorplan {type util iodist {ratio 1.0} {rowdist -1}} {
  ##-- rowdistance - used with thick3M or 2M process
  ##-- Initialize floorplan
  switch $type {
     "core" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
            }
     "peri" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
              ##--- Load corner io file to add corner cells (if necessary)
              loadIoFile ../SNW/corners.io
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist

              ##-- Snap IO cells to user grid
              snapFPlanIO -usergrid
            }
  }
  ##-- Place Macros 
  ##-- Create Placement Blockages
  ##createObstruct llx lly urx ury 
  ##-- Cut Rows under Macros, Halos and Blockages
  ##cutCoreRow
  fit
}

proc amsPowerRoute {{pownetsList {}}} {
   set offset 1.1
   set spacing 0.6
   set widthlimit 8
   # foreach power net in the specified list
   # route a ring
   set pnList {}
   foreach pownet $pownetsList {
      set name [lindex $pownet 0]
      set width [lindex $pownet 1]
      set pnList [lappend pnList $name]
      if {$width > $widthlimit } {
         set stripes [expr int(floor($width/$widthlimit))]
	        if {$stripes*$widthlimit < $width} { set stripes [expr $stripes + 1] }
	        set width [ expr $width/$stripes ]
         print "----$name $width $offset $stripes ----"
         addRing -use_wire_group_bits $stripes -use_wire_group 1 \
                 -layer {bottom M1 top M1 left M2 right M2} -width $width -spacing $spacing -offset $offset \
	          -jog_distance 0.7 \
	          -threshold 0.7 \
	          -nets $name
         set offset [ expr $offset + $spacing + ($width+$spacing)*$stripes]
      } else {
      print "----$name $width $offset----"
      set lay_bt  "M1"
      set lay_lr  "M2"
      addRing \
           -layer {bottom M1 top M1 right M2 left M2} -width $width -spacing $spacing -offset $offset \
	          -jog_distance 0.7 \
	          -threshold 0.7 \
	          -nets $name
      set offset [ expr $offset + $spacing + $width]
     }
   }
   # do followpin routing
   sroute -connect { blockPin padPin corePin } \
          -nets $pnList
    setPlaceMode -prerouteAsObs 2
}


proc amsTa {state} {

    global topcellname
    switch $state {
         "prePlace"  { timeDesign -prePlace -outDir timingReports -expandedViews }
         "preCTS"    { timeDesign -preCTS   -outDir timingReports -expandedViews }
         "postCTS"   { timeDesign -postCTS  -outDir timingReports -expandedViews
                       timeDesign -postCTS -hold -outDir timingReports -expandedViews
                     }
         "postRoute" { timeDesign -postRoute -outDir timingReports -expandedViews
                       timeDesign -postRoute -hold -outDir timingReports -expandedViews
                     }
         "signOff"   { timeDesign -signOff -outDir timingReports -expandedViews
                       timeDesign -signOff -hold -outDir timingReports -expandedViews
                     }
    }
}


proc amsPlace how {
   ##-- Placement
   ## three metal placement options - can be set in the setPlaceMode command
   ## -threeLayerMode 1 -wireLenOptEffort high
   switch $how {
      "ntd"   { 
                 setPlaceMode -timingdriven false -reorderScan false -congEffort medium \
                              -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "td"    { 
                 setPlaceMode -timingdriven true -reorderScan false -congEffort medium \
                              -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "opt"   {
                 setPlaceMode -timingdriven true -reorderScan true -congEffort high \
                               -modulePlan true
                 placeDesign -prePlaceOpt
              }
   }
   amsSave placed

}

proc amsCts {} {
   global topcellname
   set filename [format "CONSTRAINTS/%s.ctstch" $topcellname]
   cleanupSpecifyClockTree
   ##-- Specify Clock tree
   specifyClockTree -file $filename

   ##-- delete existing buffers
   #deleteClockTree -clk  <clockroot>

   ##-- Run CTS
   clockDesign -specFile $filename -outDir clock_report -fixedInstBeforeCTS

   changeClockStatus -all -noFixedNetWires

   amsSave clkplaced
}

proc amsCcopt {} {
   set_ccopt_mode -cts_target_slew 1.0
   set_ccopt_mode -cts_target_nonleaf_slew 2.0
   set_ccopt_property buffer_cells {CLKBU*}
   set_ccopt_property inverter_cells {CLKIN*}
   ##-- Create Clock Tree Spec inMemory
   create_ccopt_clock_tree_spec -immediate
   ##-- Create Clock Tree Spec File and load this file
   #create_ccopt_clock_tree_spec -file ccopt.spec
   #source ccopt.spec
   setCTSMode -routeBottomPreferredLayer M1 -routeLeafBottomPreferredLayer M1 \
              -routeLeafTopPreferredLayer MT -routeTopPreferredLayer MT
   ##-- Turn off routing of clock nets
   #setCTSMode -routeClkNet false
   
   #set_ccopt_mode -modify_clock_latency false
   ##-- Ignore a clock from SDC during CTS
   #set_ccopt_property opt_ignore -clock_tree <clkname> true
   #set_ccopt_property target_insertion_delay <value>
   
   ccopt_design -cts
   
   report_ccopt_clock_trees -file ../REPORTS/ccopt_postCTS.report
   report_ccopt_skew_groups -file ../REPORTS/ccopt_postCTS_skew.report
   
}
   
proc amsUnfixClockNets {} { 
   set fixedNetsCnt 0
   set fixedWireCnt 0
   set fixedViaCnt 0
   foreach net [dbget top.nets] {
      set fixedNet 0
      if {[dbget $net.isClock] == 1 } {
         foreach wire [dbget $net.wires] {
            if {[dbget $wire.status] == "fixed"} {
               set fixedNet 1
               set fixedWireCnt [expr $fixedWireCnt + 1]
               dbSet $wire.status routed
            }
         }
         foreach via [dbget $net.vias] {
            if {[dbget $via.status] == "fixed"} {
               set fixedNet 1
               set fixedViaCnt [expr $fixedViaCnt + 1]
               dbSet $via.status routed
            }
         }
         if {$fixedNet == 1} {
            set fixedNetsCnt [expr $fixedNetsCnt + 1]
         }
      }
   }
   puts "---# $fixedNetsCnt Clock Nets unfixed!"
   puts "---# $fixedWireCnt Clock Wires and $fixedViaCnt Vias unfixed!"
}

proc amsIncrRoute {maxerror} {
  set fehler  1000
  set filename [getLogFileName]
  clearDrc
  set step 0
  set lastfehler 1000 
  while {$fehler > $maxerror} {
     if { $step < 4 } {
	       print "---# amsIncrRoute : start in incrFinal Mode ($step)"
        wroute -mode incrFinal -topLayerLimit 3
     } else {
	       print "---# amsIncrRoute : start in incrGlobalAndFinal Mode ($step)"
        wroute -mode incrGlobalAndFinal -topLayerLimit 3
	       set step 0
     }
     set chan [open $filename]
     while {[gets $chan line] >= 0} {
         if {[scan $line "Total number of violations           =        %d" f] == 1} {
            set fehler $f
         }
     }
     if {$fehler > $lastfehler} {
	       set step [expr $step + 1]
     } else {
        set step 0
        set lastfehler $fehler
	       amsSave routedIncr
     }
     close $chan
     if {$fehler > $maxerror} { 
        print "---# Still $fehler errors - starting wroute again"
     } else { 
        print "---# amsIncrRroute stopped with $fehler errors"
     }
  }
}

proc amsDefIn { defFile {rowtype "standard"} {l 2} {t 2} {r 2} {b 2} {addwidth 0} {addheight 0}} {
  
  global topcellname

  # open DEF File
  # find diearea
  set chan [open $defFile]
  while {[gets $chan line] >= 0} {
     # units for dividing coordinates
     if {[scan $line " UNITS DISTANCE MICRONS %d" u] == 1} {
            set units $u
	    print "---# DEF Units: $units"
     }
     # diearea 
     if {[scan $line " DIEAREA ( %f %f ) ( %f %f )" x1 y1 x2 y2] == 4} {
         set llx [expr ($x1 / $units)]
	 set lly [expr $y1 / $units]
	 set urx [expr $x2 / $units]
	 set ury [expr $y2 / $units]
	 print "---# DEF DieArea: $llx:$lly/$urx:$ury"
     }
  }
  close $chan
  # calculate core area for rows
  set llxc [expr $llx + $l]
  set llyc [expr $lly + $b]
  set urxc [expr $urx - $r]
  set uryc [expr $ury - $t]
  #floorPlan -b $llx $lly $urx $ury 
  floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                   $llx $lly $urx $ury \
                                   $llxc $llyc $urxc $uryc
  # load def file
  defIn $defFile


  # if the die size should be changed
  if {$addwidth != 0 || $addheight != 0} {
     print "---# Adding width: $addwidth"
     print "---# Adding height: $addheight"
     # write IO-File to get a pin locations file
     set filename [format "%s_save.io" $topcellname]
     saveIoFile -locations $filename

     # new die sizes
     set llx [expr $x1 / $units]
     set lly [expr $y1 / $units]
     set urx [expr ($x2 / $units) + $addwidth]
     set ury [expr ($y2 / $units) + $addheight]
     set llxc [expr $llx + $l]
     set llyc [expr $lly + $b]
     set urxc [expr $urx - $r]
     set uryc [expr $ury - $t]
     floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                 $llx $lly $urx $ury \
                                 $llxc $llyc $urxc $uryc
     # load pin positions
     loadIoFile $filename
 
  }

}


proc amsStat projname {
   global topcellname

   set statdir [format "%s_%s_stat" $projname $topcellname]
   print "####"
   print "---# Creating Statistics in directory $statdir";
   system mkdir -p $statdir
   print "---#    Directory $statdir created";
   print "---#    running defStat.pl -> $statdir/$statdir.txt";
   defOut -floorplan -netlist -routing $statdir/$topcellname.def
   system ams_defStat.pl -d $statdir/$topcellname.def \
                       -p $projname \
                       -t ac18a6 \
                       /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/CORELIB.lef \
		              ./LEF/*.lef > $statdir/$statdir.txt
   system mv bar.html $statdir
   print "---#    Creating Screen Dump $statdir/$topcellname.gif";
   fit
   dumpToGIF $statdir/$topcellname.gif
   print "---#    Creating Wire Statistics $statdir/$topcellname.wires";
   reportWire -detail $statdir/$topcellname.wires
   print "---# Finished";
   print "####"

}

proc removeTmpoalibs {} {
   print "---# Remove tmo_oa_db... libs from cds.lib"
   system mv cds.lib cds.lib.bck
   system grep -v tmp_oa_db cds.lib.bck > cds.lib
}

proc amsOptDesign {dstep} {
   timeDesign -$dstep 
   print "---# Should Setup optmization run (Y/N):"
   set eini [gets stdin]
   if { $eini == "y" || $eini == "Y"} {
      print "---# Running optDesign -$dstep"
      optDesign -$dstep
   }
   print "---# Continue with hold check (Y/N):"
   set goon [gets stdin]

   if {$goon == "y" || $goon == "Y"} {
      timeDesign -$dstep -hold
      print "---# Should Hold optmization run (Y/N):"
      set eini [gets stdin]
      if { $eini == "y" || $eini == "Y"} {
         print "---# Running optDesign -$dstep -hold"
         optDesign -$dstep -hold
      }
   }
   print "---# Continue WC-Hold Check (Y/N):"
   set goon [gets stdin]

   if {$goon == "y" || $goon == "Y"} {
      # check hold in WC
      print "---# Change analysis views for TYP-WC check"
      amsSetAnalysisView max {func}
      timeDesign -$dstep -hold
      print "---# Should Hold optmization run (Y/N):"
      set eini [gets stdin]
      if { $eini == "y" || $eini == "Y"} {
         print "---# Running optDesign -$dstep -hold"
         optDesign -$dstep -hold
      }
   }

   print "---# Continue with changing back to minmax Analysis (Y/N):"
   set goon [gets stdin]

   if {$goon == "y" || $goon == "Y"} {
      print "---# Change analysis views for mimax check"
      amsSetAnalysisView minmax {func}
   }
}
proc amsWriteSDF3 {} {
 #  setDelayCalMode -engine aae
 #  setAnalysisMode -cppr none -clockGatingCheck 1 \
 #                -timeBorrowing 1 -useOutputPinCap 1 \
	#	   -sequentialConstProp 0 -timingSelfLoopsNoSkew 0 \
	#	   -enableMultipleDriveNet 1 -clkSrcPath 1 \
	#	   -warn 1 -usefulSkew 0 \
	#	   -analysisType onChipVariation \
	#	   -log 1

   amsSetAnalysisView max {func}
   timeDesign -signOff
   timeDesign -signOff -hold
   amsWriteSDF4View {func_max}

   amsSetAnalysisView typ {func}
   timeDesign -signOff
   timeDesign -signOff -hold
   amsWriteSDF4View {func_typ}

   amsSetAnalysisView min {func}
   timeDesign -signOff
   timeDesign -signOff -hold
   amsWriteSDF4View {func_min}

   amsSetAnalysisView minmax {func}
}

proc amsWriteSPEF {{dir .}} {
   global topcellname
   global consList
 
   if {$dir != "."} {
      set dir [format "FINALDATA/%s" $dir]
      system mkdir -p $dir/SPEF
   } else {
      system mkdir -p SPEF
   }
   set filenamewc [format "%s/SPEF/%s_wc.spef" $dir $topcellname]
   set filenamebc [format "%s/SPEF/%s_bc.spef" $dir $topcellname]
   set filenametyp [format "%s/SPEF/%s_typ.spef" $dir $topcellname]
   amsSetAnalysisView minax $consList
   setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
   extractRC
   rcOut -spef $filenamewc -rc_corner ams_rc_corner_wc
   rcOut -spef $filenamebc -rc_corner ams_rc_corner_bc

   amsSetAnalysisView typ $consList
   extractRC
   rcOut -spef $filenametyp -rc_corner ams_rc_corner_typ
   amsSetAnalysisView minax $consList

   print "---# SPEF files written to: $dir/SPEF"
   print "---#    $filenamewc"
   print "---#    $filenamebc"
   print "---#    $filenametyp"
}

proc amsWriteFinalTiming {{dir .}} {
   global consList

   set cornerList {min max typ min2 max2}

   if {$dir != "."} {
      set fdir [format "../FINALDATA/%s" $dir]
      system mkdir -p $fdir/SPEF
      system mkdir -p $fdir/SDF
      system mkdir -p $fdir/timingReports
   } else {
      system mkdir -p SPEF
      system mkdir -p SDF
      system mkdir -p timingReports
   }

   foreach corner $cornerList {
      set rcCorner [get_delay_corner corner_$corner -rc_corner] 
      set spefFile [format "%s/SPEF/%s.spef" $fdir $rcCorner]

      amsSetAnalysisView $corner $consList
      setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
      extractRC
      rcOut -spef $spefFile -rc_corner $rcCorner
      print "---# SPEF file written: $spefFile"

      timeDesign -signoff -expandedViews -outDir $fdir/timingReports/$corner
      timeDesign -reportOnly -hold -expandedViews -outDir $fdir/timingReports/$corner
      foreach cons $consList {
         set view [format "%s_%s" $cons $corner]
         amsWriteSDF4View $view $dir
      }
   }
   print "---#------------------------------------------------------"
   print "---# Final Timing Files written into: $fdir"
   print "---#    SDF"
   system ls $fdir/SDF
   print "---#    SPEF"
   system ls $fdir/SPEF
   print "---#    timingReports"
   system ls $fdir/timingReports/*/*summary*
}

  print "---# TCL Script amsSetup.tcl loaded"

##-- End of First Encounter TCL command file

