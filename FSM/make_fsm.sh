#sh make_fsm.sh
#
iverilog -o fsm fsm.v fsm_tb.v
vvp fsm
gtkwave fsm.vcd
