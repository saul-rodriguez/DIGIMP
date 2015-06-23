#sh make_fsm.sh
#
iverilog -o I2C I2C.v I2C_tb.v
vvp I2C
gtkwave I2C.vcd
