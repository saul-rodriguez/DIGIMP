#!/usr/local/bin/wish -f

####################################################################
# Interface to set up the Encounter environment for a new project
####################################################################
#  01-Apr-2016  kgo  Installed
####################################################################
#
set amsdir $env(AMS_DIR)
set oldCorner "None"
set user [exec whoami]

set selTech     "ac18"
set selMetLay   "6AM"
set selCorelib  "CORELIB"
set selIolib    "None"
set selOALIB    "cur_dec_OADB"
set selOACELL   "cur_dec"
set selOAVIEW   "final4voltus"
set selAnalysisView "None"
set selVCDFile  "None"
set selVCDScope "None"
set selCorePGVLib "None"
set projCorePGVLib [list {}]
set selCorner "None"
set oldCorner "None"
set ctt_y 0
set av_y 0
set tempList {-50deg -40deg 25deg 85deg 150deg}
set selVOLTUS   "SSV15.1ISR3"
set projAVList [list {None}]
array set voltusPath [ list {SSV15.1ISR3} {/programs/cds/SSV15.1ISR3/.ssv151isr3rc}
                         ]



proc amsVoltusSetup {} {

   package require Tk

   global user
   global amsdir
   global oldCorner
   global selTech
   global selMetLay
   global selCorelib
   global selIolib
   global selOALIB
   global selOACELL
   global selOAVIEW
   global selAnalysisView
   global selVCDFile
   global selVCDScope
   global selCorePGVLib
   global projCorePGVLib
   global selCorner
   global oldCorner
   global ctt_y
   global av_y
   global tempList
   global consList
   global projAVList

set hkpath      [format "%s/voltus/%s" $amsdir $selTech]


set AMS_LOGO $amsdir/tcl/images/logoEDI.gif

array set gheColor {}
set gheColor(AMS_DARKBLUE)   [format "#%x%x%x" 40  50  75]
set gheColor(AMS_DARKBLUE1)  [format "#%x%x%x" 70  85  95]
set gheColor(AMS_DARKBLUE2)  [format "#%x%x%x" 100 115 125]
set gheColor(AMS_RED)  [format "#%x%x%x" 56 130 165]


#font create fontheader -size 16 -family Helvetica -weight bold
#font create fontlabel -size 10  -family Helvetica -weight bold
#font create fontupdate -size 11 -family Helvetica -weight bold

tk_setPalette background white

puts "#### "
puts "---# ams Voltus Setup Tool Started"

#Window

      tk::toplevel .vs
      tk_setPalette background white foreground $gheColor(AMS_DARKBLUE)

      wm title .vs "Set Voltus Environment"
      wm iconname .vs "Set Voltus Environment"
      wm minsize .vs 10 10
      if {$user == "kgo"} {
         wm geometry .vs 435x880
      } else {
         wm geometry .vs 435x850
      }
      set x 50
      set y 50

set runamsvoltuss 1
set voltusList {SSV15.1ISR3}


set voltList {1.2V 1.8V 2.0V 2.3V 2.7V 3.0V 3.3V 4.0V 5.0V}
set cornerList {None best typical worst}






set keysym "Press any mouse button"


label .vs.logo -image [image create photo -file $AMS_LOGO]

label .vs.amsdirText -text "hitkit Version" -justify left -font fontlabel -foreground black
label .vs.amsdirVer -text $amsdir -justify left -font fontlabel -foreground black
#eval tk_optionMenu .amsdirVer selamsdir $amsdirList

label .vs.voltusVerText -text "Voltus Version" -justify left -font fontlabel -foreground black
eval tk_optionMenu .vs.voltusVer selVOLTUS $voltusList

label .vs.projOALIBText  -text "OA Library Name" -justify left -font fontlabel -foreground black
label .vs.projOALIB      -text $selOALIB         -justify left -font fontlabel -foreground black
label .vs.projOACELLText -text "OA TopCell Name" -justify left -font fontlabel -foreground black
label .vs.projOACELL     -text $selOACELL        -justify left -font fontlabel -foreground black
label .vs.projOAVIEWText -text "OA Viewname"     -justify left -font fontlabel -foreground black
#label .projOAVIEW     -text $selOAVIEW        -justify left -font fontlabel -foreground black
entry .vs.projOAVIEW -textvariable selOAVIEW -width 38 -foreground black -relief sunken

label .vs.trennline1 -text "---------------------------------------------" -justify center -font fontlabel -foreground black
label .vs.trennline2 -text "---------------------------------------------" -justify center -font fontlabel -foreground black

label .vs.lt  -text "Technology"    -justify left -font fontlabel -foreground black
label .vs.pt  -text $selTech        -justify left -font fontlabel -foreground black
label .vs.lml -text "Metal Layers"  -justify left -font fontlabel -foreground black
label .vs.pml -text $selMetLay      -justify left -font fontlabel -foreground black

label .vs.lco -text "Process Corner"  -justify left -font fontlabel -foreground black
eval tk_optionMenu .vs.pco selCorner $cornerList

label .vs.lcl -text "Corelib"    -justify left -font fontlabel -foreground black
label .vs.pcl -text $selCorelib  -justify left -font fontlabel -foreground black
label .vs.lil -text "IOlib"      -justify left -font fontlabel -foreground black
label .vs.pil -text $selIolib    -justify left -font fontlabel -foreground black
label .vs.lctt -text "Core-PGV-Corner"  -justify left -font fontlabel -foreground black
eval tk_optionMenu .vs.pctt selCorePGVLib $projCorePGVLib
#label .lit -text "IO-PGV"  -justify left -font fontlabel -foreground black
#eval tk_optionMenu .pit selIOPGVLib $projIoPGVLib
#
label .vs.lav -text "Analysis View" -justify left -font fontlabel -foreground black
#entry .vs.pav -textvariable selAnalysisView -width 38 -foreground black -relief sunken
eval tk_optionMenu .vs.pav selAnalysisView $projAVList

label .vs.lvcd -text "VCD File Name" -justify left -font fontlabel -foreground black
entry .vs.pvcd -textvariable selVCDFile -width 38 -foreground black -relief sunken

label .vs.lvcs -text "VCD Scope" -justify left -font fontlabel -foreground black
entry .vs.pvcs -textvariable selVCDScope -width 38 -foreground black -relief sunken

button .vs.createButton1 -text "Create Source File" -command amsCreateVoltusSourceFile -width 17 -foreground white -activeforeground white -background $gheColor(AMS_DARKBLUE1) -activebackground $gheColor(AMS_DARKBLUE2)
button .vs.createButton2 -text "Create Setup Files" -command amsCreateVoltusSetupFiles -width 17 -foreground white -activeforeground white -background $gheColor(AMS_DARKBLUE1) -activebackground $gheColor(AMS_DARKBLUE2)
button .vs.quitButton -text "Close" -command amsQuitButtonCB -width 16 -foreground white -activeforeground white -background $gheColor(AMS_DARKBLUE1) -activebackground $gheColor(AMS_DARKBLUE2)


set step 30

#label .l -textvariable keysym -padx 2m -pady 1m

place .vs.logo          -x 0     -y 0

set ycoor 250
set amsdir_y $ycoor
place .vs.amsdirText    -x 5     -y $amsdir_y
place .vs.amsdirVer     -x 150   -y $amsdir_y
set ycoor [expr $ycoor + $step]
set voltusVer_y $ycoor
place .vs.voltusVerText    -x 5     -y $voltusVer_y
place .vs.voltusVer        -x 150   -y $voltusVer_y
set ycoor [expr $ycoor + $step]
set projOALIB_y $ycoor
place .vs.projOALIBText   -x 5     -y $projOALIB_y
place .vs.projOALIB       -x 150   -y $projOALIB_y
set ycoor [expr $ycoor + $step]
set projOACELL_y $ycoor
place .vs.projOACELLText   -x 5     -y $projOACELL_y
place .vs.projOACELL       -x 150   -y $projOACELL_y
set ycoor [expr $ycoor + $step]
set projOAVIEW_y $ycoor
place .vs.projOAVIEWText   -x 5     -y $projOAVIEW_y
place .vs.projOAVIEW       -x 150   -y $projOAVIEW_y

set ycoor [expr $ycoor + $step]
set t_y $ycoor
place .vs.lt            -x 5     -y $t_y
place .vs.pt            -x 150   -y $t_y
set ycoor [expr $ycoor + $step]
set ml_y $ycoor
place .vs.lml           -x 5     -y $ml_y
place .vs.pml           -x 150   -y $ml_y
set ycoor [expr $ycoor + $step]
set mco_y $ycoor
place .vs.lco           -x 5     -y $mco_y
place .vs.pco           -x 150   -y $mco_y

set ycoor [expr $ycoor + $step]
place .vs.trennline1     -x 105     -y $ycoor

set ycoor [expr $ycoor + $step]
set cl_y $ycoor
place .vs.lcl           -x 5     -y $cl_y
place .vs.pcl           -x 150   -y $cl_y
set ycoor [expr $ycoor + $step]
set ctt_y $ycoor
place .vs.lctt          -x 5    -y $ctt_y
place .vs.pctt          -x 150   -y $ctt_y

set ycoor [expr $ycoor + $step]
place .vs.trennline2     -x 105     -y $ycoor

set ycoor [expr $ycoor + $step]
set il_y $ycoor
place .vs.lil           -x 5     -y $il_y
place .vs.pil           -x 150   -y $il_y
#set ycoor [expr $ycoor + $step]
#set it_y $ycoor
#place .lit           -x 30    -y $it_y
set ycoor [expr $ycoor + $step]
set av_y $ycoor
place .vs.lav           -x 5   -y $av_y
place .vs.pav           -x 150 -y $av_y

set ycoor [expr $ycoor + $step]
set vcd_y $ycoor
place .vs.lvcd           -x 5   -y $vcd_y
place .vs.pvcd           -x 150 -y $vcd_y

set ycoor [expr $ycoor + $step]
set vcs_y $ycoor
place .vs.lvcs           -x 5   -y $vcs_y
place .vs.pvcs           -x 150 -y $vcs_y

set ycoor [expr $ycoor + $step]
set butt_y $ycoor
place .vs.createButton1  -x 0     -y $butt_y
place .vs.createButton2  -x 150     -y $butt_y
place .vs.quitButton    -x 300   -y $butt_y

set ycoor [expr $ycoor + $step ]
set butt3_y $ycoor
#place .l             -x 0     -y 580
bind all <ButtonRelease> {
    changeMenu
    set keysym $selTech.$selCorelib.$selIolib.$selMetLay.$projCorePGVLib.$selCorePGVLib.$selCorner.$oldCorner
    #$projIoPGVLib.
    #$selIoPGVLib.
    set oldCorner $selCorner
}

}

proc changeMenu {} {
    global user selCorner oldCorner selTech selCorelib selMetLay selIolib projCorePGVLib amsdir voltList selCorePGVLib ctt_y tempList selCorner consList projAVList av_y selAnalysisView
    # projIoPGVLib selIoPGVLib
    if {$oldCorner != $selCorner} {
       if {$user == "kgo"} {
          puts "-V-# Corner changed"
       }
    # change analysis view selection
    set projAVList [list {}] 
    set selAnalysisView "None"
    destroy .vs.pav
    eval tk_optionMenu .vs.pav selAnalysisView $projAVList
    place .vs.pav           -x 150 -y $av_y
    foreach cons $consList {
       switch $selCorner {
          {typical} { lappend projAVList ${cons}_typ }
          {best} { lappend projAVList ${cons}_min }
          {worst} { lappend projAVList ${cons}_max }
       }
    }
    destroy .vs.pav
    eval tk_optionMenu .vs.pav selAnalysisView $projAVList
    place .vs.pav           -x 150 -y $av_y
    # change PGV Libs selection
    set selCorePGVLib "None"
    set projCorePGVLib [list {}]
    destroy .vs.pctt
    eval tk_optionMenu .vs.pctt selCorePGVLib $projCorePGVLib
    place .vs.pctt           -x 150   -y $ctt_y
    puts "---# Searching for PGV libs"
    set cnt 0
    set oldvolt1 "0.0V"
    for {set x 1.0} {$x < 5.1} {set x [expr $x+0.01]} {
       set volt1 [format "%.1fV" $x]
       set volt2 [format "%.2fV" $x]
       foreach temp $tempList {
          #puts $volt
          #puts "$volt $temp"
          set pgvFile1 [format "%s/voltus/%s/%s/%s_%s_%s_%s_%s_stdcells.cl" $amsdir $selTech $selCorelib $selCorelib $selMetLay $selCorner $volt1 $temp]
          set pgvFile2 [format "%s/voltus/%s/%s/%s_%s_%s_%s_%s_stdcells.cl" $amsdir $selTech $selCorelib $selCorelib $selMetLay $selCorner $volt2 $temp]
          if {$oldvolt1 != $volt1 } {
             if {[file isdirectory $pgvFile1]} {
	        set volttemp [format "%s_%s" $volt1 $temp]
                lappend projCorePGVLib $volttemp
	        set cnt [expr $cnt + 1]
             }
          }
          if {[file isdirectory $pgvFile2]} {
	     set volttemp [format "%s_%s" $volt2 $temp]
             lappend projCorePGVLib $volttemp
	     set cnt [expr $cnt + 1]
          }
       }
       set oldvolt1 $volt1
    }
    puts "---# $cnt PGV libs found"
    set selCorePGVLib "None"
    destroy .vs.pctt
    eval tk_optionMenu .vs.pctt selCorePGVLib $projCorePGVLib
    place .vs.pctt           -x 150   -y $ctt_y
    }
}

proc amsCreateVoltusSourceFile {} {
  global selVOLTUS voltusPath amsdir

  if {[file exists "../.prSetup"]} {
     set ochan [open "../.prSetup" a]
     set wfile "../.prSetup"
  } else {
     set ochan [open ".voltusSetup" w]
     set wfile ".voltusSetup"
  }
  puts $ochan "#### ams Voltus Setup Creation"
  puts $ochan [format "#--- Using VOLTUS Version: %s " $selVOLTUS]
  puts $ochan [format "source %s " $voltusPath($selVOLTUS)]
  puts $ochan ""
  close $ochan
  puts "---# Source Script written/added : $wfile"
}


proc amsCreateVoltusSetupFiles {} {
  global selVOLTUS voltusPath selCorner selTech selMetLay selCorelib selIolib selCorePGVLib selOALIB selOACELL selOAVIEW amsdir selIoPGVLib selAnalysisView selVCDFile selVCDScope

  switch $selTech {
     {c18} { switch $selMetLay {
               {4AM} {set techmet c18a4}
               {5AM} {set techmet c18a5}
               {6AM} {set techmet c18a6}
               {7AM} {set techmet c18a7}
             }
           }
     {h18} { switch $selMetLay {
               {4AM} {set techmet h18a4}
               {5AM} {set techmet h18a5}
               {6AM} {set techmet h18a6}
               {7AM} {set techmet h18a7}
             }
           }
     {ac18} { switch $selMetLay {
               {4AM} {set techmet ac18a4}
               {5AM} {set techmet ac18a5}
               {6AM} {set techmet ac18a6}
               {7AM} {set techmet ac18a7}
               {4ML} {set techmet ac18m4}
               {5ML} {set techmet ac18m5}
               {6ML} {set techmet ac18m6}
               {7ML} {set techmet ac18m7}
             }
           }
     {ah18} { switch $selMetLay {
               {4AM} {set techmet ah18a4}
               {5AM} {set techmet ah18a5}
               {6AM} {set techmet ah18a6}
               {7AM} {set techmet ah18a7}
               {4ML} {set techmet ah18m4}
               {5ML} {set techmet ah18m5}
               {6ML} {set techmet ah18m6}
               {7ML} {set techmet ah18m7}
             }
           }
     {c35} { switch $selMetLay {
               {3M}      {set techmet c35b3 }
               {thin4M}  {set techmet c35b4}
               {thick4M} {set techmet c35b4_thickmet }
             }
           }
     {c30} { switch $selMetLay {
               {3M}      {set techmet c35b3 }
               {thin4M}  {set techmet c35b4}
               {thick4M} {set techmet c35b4_thickmet }
             }
           }
     {h35} { switch $selMetLay {
               {thin3M}  {set techmet h35b3 }
               {thick3M}  {set techmet h35b3_thickmet }
               {thin4M}  {set techmet h35b4_thinmet }
               {thick4M}  {set techmet h35b4 }
             }
           }
     {h30} { switch $selMetLay {
               {thin3M}  {set techmet h35b3 }
               {thick3M} {set techmet h35b3 }
               {thin4M}  {set techmet h35b4_thinmet }
               {thick4M} {set techmet h35b4 }
             }
           }
     {s35} { switch $selMetLay {
               {3M}      {set techmet s35d3 }
               {thick4M} {set techmet s35d4 }
             }
           }
     {tc18c} { switch $selMetLay {
               {4M}      {set techmet tc18c4 }
             }
           }
     {tc18d} { switch $selMetLay {
               {4M}      {set techmet tc18d4 }
             }
           }
  }
  if {[scan $selCorePGVLib "%fV_%ddeg" volt temp] == 2} {
  exec cat ${amsdir}/cds/start_up/VOLTUS_templates/pa.tmpl | \
	  sed "s/zVOLTz/${volt}/g" | \
	  sed "s/zTECHz/${selTech}/g" | \
	  sed "s/zTECHMETz/${techmet}/g" | \
	  sed "s/zMETLAYz/${selMetLay}/g" | \
	  sed "s/zCORELIBz/${selCorelib}/g" | \
          sed "s/zTEMPz/${temp}/g" | \
	  sed "s/zCORNERz/${selCorner}/g" | \
	  sed "s/zPOALIBz/${selOALIB}/g" | \
	  sed "s/zPTOPCELLz/${selOACELL}/g" | \
	  sed "s/zPVIEWNAMEz/${selOAVIEW}/g" | \
	  sed "s/zANALVIEWz/${selAnalysisView}/g" | \
	  sed "s/zVCDFILEz/${selVCDFile}/g" | \
	  sed "s/zVCDSCOPEz/${selVCDScope}/g" | \
	  sed "s/zSPEFFILEz/${selOACELL}_${selCorner}.spef/g" \
	  > ../SCRIPTS/amsPa.tcl
	 } else { 
     puts "-E-# Error in getting Voltage and Temperature"
  }

  # prepare data for voltus
  # OADB
  amsSave $selOAVIEW
  # DEF
  set defFile [format "../rundir_voltus/%s.def" $selOACELL]
  defOut -floorplan -netlist -routing $defFile

  # SPEF
  set_analysis_view -setup $selAnalysisView -hold $selAnalysisView
  setExtractRCMode -engine postRoute -effortLevel signoff -coupled false
  extractRC
  set spefFile [format "../rundir_voltus/%s_%s.spef" $selOACELL $selCorner]
  rcOut -spef $spefFile
  exec cp cds.lib ../rundir_voltus
  puts "---#------------------------------------------------"
  puts "---#  Saved OA Db for Voltus Run:  $selOALIB $selOACELL $selOAVIEW "
  puts "---#  Saved SPEF for Voltus Run :  $spefFile"
  puts "---#  Voltus TCL Script written: ../SCRIPTS/amsPa.tcl"
  puts "---#      using:"
  puts "---#        OA DB          : $selOALIB $selOACELL $selOAVIEW "
  puts "---#        PGV-Tech Corner: $selCorner"
  puts "---#        Voltage        : $volt"
  puts "---#        Temperature    : $temp"
  puts "---#        AnalysisView   : $selAnalysisView"
  puts "---#        Corelib        : $selCorelib"
  puts "---#        SPEF File      : $spefFile"
  puts "---#        VCD File       : $selVCDFile"
  puts "---#        VCD Scope      : $selVCDScope"
  puts "---#------------------------------------------------"

}



proc amsQuitButtonCB { } {

    destroy .vs
    puts "---# Voltus Setup Tool Closed"
    puts "#### "

}

