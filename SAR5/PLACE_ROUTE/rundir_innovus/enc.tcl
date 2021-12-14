#######################################################
##                                                     
##  Encounter Command File                             
##                                                     
##  Owner: austriamicrosystems                         
##  HIT-Kit: Digital                                   
##  version: 02-February-2017                         
##                                                     
##  Created on: ons jul  5 15:11:34 CEST 2017
##                                                     
########################################################

## Global variables
set topcellname "sar5"
set libname [format "%s_OADB" $topcellname] 
set techlibname      "TECH_C18A6"
set antennacell "ANTENNA"
set consList {func test}

setCheckMode -tapeOut true
setDelayCalMode -siAware false
setGenerateViaMode -auto true
setExtractRCMode -lefTechFileMap /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/qrclaymap.ccl

## Don't show following known warings
suppressMessage IMPFP-3961 ;  # The techSite 'xxx' has no related cells in LEF/OA library
suppressMessage TECHLIB-436 ; #  Attribute 'max_fanout' on 'output/inout' pin 'Q' of cell 'xxx' is not defined in the library.


## load global design variables: EDI11
source ../CONFIG/ac18_sar5.globals

if {[info exists HKMenuAdded]} { print "HK-Menu already added!"} else { set HKMenuAdded 0 }

set HOME $env(HOME)
set AMS_DIR $env(AMS_DIR)
 
set checkedLogTilLine 0
 
if {[file exists "../SCRIPTS/amsSetup.tcl"]} {
  source ../SCRIPTS/amsSetup.tcl
}

if {[file exists $HOME/.encounter_personal.tcl]} {
  source $HOME/.encounter_personal.tcl
  print "---# TCL Script $HOME/.encounter_personal.tcl loaded"
}

if {[file exists ../SCRIPTS/amsVoltusSetup.tcl]} {
  source ../SCRIPTS/amsVoltusSetup.tcl
  print "---# TCL Script ../SCRIPTS/amsVoltusSetup.tcl loaded"
}
if {[file exists $AMS_DIR/cds/start_up/INNOVUS_templates/apoaProcs.tcl]} {
  source $AMS_DIR/cds/start_up/INNOVUS_templates/apoaProcs.tcl
  print "---# Additional ams TCL Procedures loaded"
}


proc amc {start {end -1}} {
 if {$end == -1} { set end $start }
 for {set i $start} {$i<=$end} {incr i} {
   print "---# ---- Step $i -----"
   set step [format "s%d" $i]
   switch -exact $step {
   
      "s0"  { freeDesign }            
      "s1"  { amsDbSetup }            
      "s2"  { amsUserGrid }           
      "s3"  { amsGlobalConnect core } 
      "s6"  { amsFloorplan core 0.8 50 }
      "s9"  { amsPowerRoute  {{vdd! 10} {gnd! 10}} }
      "s10" { amsPlace ntd }       
      "s11" { amsCts }             
      "s12" { amsTa postCTS }
      "s13" { optDesign -postCTS }
      "s14" { amsFillperi }        
      "s15" { amsRoute nano }   
      "s16" { amsFillcore }        
      "s17" { amsTa postRoute }
      "s18" { amsWrite final last }
      "s19" { amsWriteFinalTiming last }
     } 
  }
  amsCheckLog
}

proc ha {} {
   info body amc
}
proc amsCheckLog {} {
   global checkedLogTilLine

   set logfilename [getLogFileName]
   system ams_checkInnLogs.pl -e -w -l $checkedLogTilLine $logfilename
   set chan [open $logfilename]
   set i 0
   while {[gets $chan line] >= 0} {
      set i [expr $i + 1]
   }
   set checkedLogTilLine $i
   close $chan
}

 if {$HKMenuAdded == 0 } { addAMSHKMenu }

##-- End of First Encounter TCL command file

