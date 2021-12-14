/*
* PapilioDuo top module of spc2 Vinnova
* top.v
*/

module top(
Cfg_in,
Clk,
Resetn,
DIR_LEFT,
DIR_RIGHT,
DIR_UP,
DIR_DOWN,
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


input Cfg_in, Clk, Resetn, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN;


//Filter control Vinnova
wire EnLF;
wire EnMF;
wire EnHF;
wire [1:0] DN;
wire [2:0] DP;
wire EnRdeg;
wire [1:0] EnRdegHF;
wire [1:0] CcompSel;
wire [3:0] CapSel;

//Common with implantable
wire[3:0] F;
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

assign ARDUINO_RESET = 0;

always @(*) 
begin
	if (DIR_LEFT) begin // BYTE1
	    LED0 = GS[1];
        LED1 = GS[2];
        LED2 = GS[3];
        LED3 = IQ;
        LED4 = F[0];
        LED5 = F[1];
        LED6 = F[2];
        LED7 = F[3]; 
	end else if (DIR_RIGHT) begin // BYTE2
		LED0 = CapSel[0];
        LED1 = CapSel[1];
        LED2 = CapSel[2];
        LED3 = CapSel[3];
        LED4 = CcompSel[0];
        LED5 = CcompSel[1];
        LED6 = EnRdegHF[0];
        LED7 = EnRdegHF[1]; 	
	end else if (DIR_UP) begin // BYTE3
		LED0 = EnRdeg;
        LED1 = DP[0];
        LED2 = DP[1];
        LED3 = DP[2];
        LED4 = DN[0];
        LED5 = DN[1];
        LED6 = EnHF;
        LED7 = EnMF;
	end else if (DIR_DOWN) begin // BYTE4
		LED0 = EnLF;
        LED1 = 0;
        LED2 = 0;
        LED3 = 0;
        LED4 = 0;
        LED5 = 0;
        LED6 = 0;
        LED7 = 0;
	end else begin // Default no button pressed: BYTE0
		LED0 = RE;
        LED1 = FS;
        LED2 = GD[0];
        LED3 = GD[1];
        LED4 = GD[2];
        LED5 = NS;
        LED6 = CE;
        LED7 = GS[0];
	end

end

//spc2 spc2_1(Cfg_in,Clk,Resetn,F,IQ,GS,CE,NS,GD,FS,RE);
vin_spc vin_spc_1(Cfg_in,Clk,Resetn,EnLF,EnMF,EnHF,DN,DP,EnRdeg,EnRdegHF,CcompSel,CapSel,F,IQ,GS,CE,NS,GD,FS,RE);

endmodule
