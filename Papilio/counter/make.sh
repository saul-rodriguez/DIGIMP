#sh make_fsm.sh
#
iverilog -o counter counter.v counter_tb.v
vvp counter
#gtkwave counter.vcd
