#sh make.sh
#
iverilog -o fet_dec fet_dec.v fet_dec_tb.v
vvp fet_dec
gtkwave fet_dec.vcd

