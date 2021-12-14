#sh make_counter_enable.sh
#
iverilog -o DacCtrl DacCtrl.v DacCtrl_tb.v 
vvp DacCtrl
gtkwave DacCtrl.vcd

