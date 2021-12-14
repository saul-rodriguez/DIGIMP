// Generated by Cadence Encounter(R) RTL Compiler RC14.24 - v14.20-s034_1
tclmode
set env(RC_VERSION) "RC14.24 - v14.20-s034_1"
vpxmode
set dofile abort exit
usage -auto -elapse
set log file fv/DacCtrl/rtl_to_g1.log -replace
tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
vpxmode
tclmode
set env(CDN_SYNTH_ROOT) /pkg/Cadence/installs/RC142/tools.lnx86
set CDN_SYNTH_ROOT /pkg/Cadence/installs/RC142/tools.lnx86
vpxmode
tclmode
if {$ver >= 08.10} {
  vpx set naming style rc
}
vpxmode
set naming rule "%s[%d]" -instance_array
set naming rule "%s_reg" -register -golden
set naming rule "%L.%s" "%L[%d].%s" "%s" -instance
set naming rule "%L.%s" "%L[%d].%s" "%s" -variable
set undefined cell black_box -noascend -both
set hdl options -VERILOG_INCLUDE_DIR "sep:src:cwd"
set undriven signal Z -golden

add search path -library /pkg/AMS411/liberty/h18_1.8V
read library -statetable -liberty -both  \
	/pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_WC.lib

add search path -design .
tclmode
if {$ver < 13.10} {
vpx read design   -define SYNTHESIS  -golden -lastmod -noelab -verilog2k \
	../DacCtrl.v
} else {
vpx read design   -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -verilog2k \
	../DacCtrl.v
}
vpxmode

elaborate design -golden -root DacCtrl -rootonly

tclmode
if {$ver < 13.10} {
vpx read design -verilog -revised -lastmod -noelab \
	-unzip fv/DacCtrl/g1.v.gz
} else {
vpx read design -verilog95 -revised -lastmod -noelab \
	-unzip fv/DacCtrl/g1.v.gz
}
vpxmode

elaborate design -revised -root DacCtrl

tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
if {$ver < 13.10} {
vpx substitute blackbox model -golden
}
vpxmode
report design data
report black box

uniquify -all -nolib
set flatten model -seq_constant -seq_constant_x_to 0
set flatten model -nodff_to_dlat_zero -nodff_to_dlat_feedback
set parallel option -threads 4 -license xl -norelease_license
set analyze option -auto

set system mode lec
analyze datapath -module -verbose
usage
analyze datapath  -verbose
// report mapped points
report unmapped points -summary
report unmapped points -extra -unreachable -notmapped
add compared points -all
// report compared points
compare
usage
// report compare data
report compare data -class nonequivalent -class abort -class notcompared
report verification -verbose
report statistics
tclmode
puts "No of compare points = [get_compare_points -count]"
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
puts "No of abort points   = [get_compare_points -abort -count]"
puts "No of unknown points = [get_compare_points -unknown -count]"
if {[get_compare_points -count] == 0} {
    puts "---------------------------------"
    puts "ERROR: No compare points detected"
    puts "---------------------------------"
}
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
#     foreach i [get_compare_points -NONequivalent] {
#         vpx report test vector [get_keypoint $i]
#         puts "     ----------------------------"
#     }
}
if {[get_compare_points -abort -count] > 0} {
    puts "-----------------------------"
    puts "ERROR: Abort Points detected "
    puts "-----------------------------"
}
if {[get_compare_points -unknown -count] > 0} {
    puts "----------------------------------"
    puts "ERROR: Unknown Key Points detected"
    puts "----------------------------------"
}
vpxmode
exit -force
