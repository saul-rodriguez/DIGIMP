#sh make.sh
#
iverilog -o cur_dec cur_dec.v cur_dec_tb.v
vvp cur_dec
gtkwave cur_dec.vcd

