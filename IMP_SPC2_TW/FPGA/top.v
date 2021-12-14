/*
* PapilioDuo top module of spc2
* top.v
*/

module  top(
Cfg_in,
Clk,
Resetn,
F,
IQ,
GS,
CE,
NS,
GD,
FS,
RE,
ARDUINO_RESET
);


input Cfg_in, Clk, Resetn;

output wire[3:0] F;
output wire IQ;
output wire [3:0] GS;
output wire CE;
output wire NS;
output wire [2:0] GD;
output wire FS;
output wire RE;

output wire ARDUINO_RESET;

assign ARDUINO_RESET = 0;

spc2 spc2_1(Cfg_in,Clk,Resetn,F,IQ,GS,CE,NS,GD,FS,RE);


endmodule
