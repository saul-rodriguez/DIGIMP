iverilog -o my_counter counter.v counter_tb.v
vvp my_counter
gtkwave counter.vcd

