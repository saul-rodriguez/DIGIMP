#sh make_fsm.sh
#
iverilog -o hello hello.v hello_tb.v
vvp hello
#gtkwave hello.vcd
