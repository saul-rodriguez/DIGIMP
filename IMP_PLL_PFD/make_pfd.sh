#sh make_pfd.sh
#
iverilog -o PFD PFD.v PFD_tb.v 
vvp PFD
gtkwave PFD.vcd
