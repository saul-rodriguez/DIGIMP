/*
* PapilioDuo top module of spc2
* top.v
*
*
*/

module  top(
Cfg_in,
Clk,
Resetn,
DIR_LEFT,
LED0,
LED1,
LED2,
LED3,
LED4,
LED5,
LED6,
LED7,
ARDUINO_RESET
);

input Cfg_in, Clk, Resetn, DIR_LEFT;

wire [3:0] F;
wire IQ;
wire [3:0] GS;
wire CE;
wire NS;
wire [2:0] GD;
wire FS;
wire RE;

output reg LED0;
output reg LED1;
output reg LED2;
output reg LED3;
output reg LED4;
output reg LED5;
output reg LED6;
output reg LED7;

output wire ARDUINO_RESET;

//behaviour
assign ARDUINO_RESET = 0;

always @(*) 
begin

    if (!DIR_LEFT) begin
        LED0 = RE;
        LED1 = FS;
        LED2 = GD[0];
        LED3 = GD[1];
        LED4 = GD[2];
        LED5 = NS;
        LED6 = CE;
        LED7 = GS[0];
    end else begin
        LED0 = GS[1];
        LED1 = GS[2];
        LED2 = GS[3];
        LED3 = IQ;
        LED4 = F[0];
        LED5 = F[1];
        LED6 = F[2];
        LED7 = F[3];    
    end

end


spc2 spc2_1(Cfg_in,Clk,Resetn,F,IQ,GS,CE,NS,GD,FS,RE);


endmodule
