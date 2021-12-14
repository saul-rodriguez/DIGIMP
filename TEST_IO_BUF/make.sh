#sh make.sh
#
iverilog -o top test_io.v test_io_tb.v
vvp top
#gtkwave hello.vcd
