#sh make_amplifier.sh
#

iverilog -m va_math -o amplifier amplifier.v amplifier_tb.v
vvp amplifier
gtkwave amplifier.vcd



