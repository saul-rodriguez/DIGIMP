#sh make_SPC_config.sh
#
iverilog -o SPC_config SPC_config.v SPC_config_tb.v
vvp SPC_config
gtkwave SPC_config.vcd
