#sh make_counter_enable.sh
#
iverilog -o counterEnable counterEnable.v counterEnable_tb.v 
vvp counterEnable
gtkwave counterEnable.vcd

