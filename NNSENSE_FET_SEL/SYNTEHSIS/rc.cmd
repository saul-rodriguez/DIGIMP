# Cadence Encounter(R) RTL Compiler
#   version RC14.25 - v14.20-s046_1 (64-bit) built Aug 11 2015
#
# Run with the following arguments:
#   -logfile rc.log
#   -cmdfile rc.cmd

ls
source synth_rc.tcl
report timing -lint
