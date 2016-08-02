#sh make_fsm.sh
#
iverilog -o vin_spc vin_spc.v vin_spc_tb.v
vvp vin_spc
gtkwave vin_spc.vcd
