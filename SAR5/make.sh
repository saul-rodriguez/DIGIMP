#sh make.sh
#sar5

iverilog -o sar5 sar5.v sar5_tb.v
vvp sar5
gtkwave sar5.vcd
