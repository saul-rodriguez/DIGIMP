#sh make_fsm.sh
#
iverilog -o nnspc nnspc.v nnspc_tb.v
vvp nnspc
gtkwave nnspc.vcd
#gtkwave spc2.vcd
