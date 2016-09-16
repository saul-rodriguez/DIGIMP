#sh make.sh
#
iverilog -o top vin_spc.v top.v vin_spc_tb.v
vvp top
#gtkwave hello.vcd
