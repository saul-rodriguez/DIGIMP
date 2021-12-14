#sh make.sh
#
iverilog -o I2C I2C.v top.v I2C_f_tb.v
vvp I2C
#gtkwave I2C.vcd
