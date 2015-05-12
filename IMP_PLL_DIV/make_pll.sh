#sh make_fsm.sh
#
iverilog -o FreqDiv Divby2.v FreqDiv.v FreqDiv_tb.v
vvp FreqDiv
gtkwave FreqDiv.vcd
