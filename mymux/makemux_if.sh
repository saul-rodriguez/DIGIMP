#sh makemux_if.sh
#
iverilog -o my_mux_if mux_if.v mux_if_tb.v
vvp my_mux_if
gtkwave mux_if.vcd



