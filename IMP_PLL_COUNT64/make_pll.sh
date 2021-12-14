#sh make_fsm.sh
#
iverilog -o FreqDiv64 FreqDiv64.v FreqDiv64_tb.v
vvp FreqDiv64
gtkwave FreqDiv64.vcd
