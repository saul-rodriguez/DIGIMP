#sh make_fsm.sh
#
iverilog -o amplifier amplifier.v amplifier_tb.v
vvp amplifier
gtkwave amplifier.vcd


