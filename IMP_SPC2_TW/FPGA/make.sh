#sh make.sh
#
iverilog -o top spc2.v top.v spc2_pap_tb.v
vvp top
#gtkwave hello.vcd
