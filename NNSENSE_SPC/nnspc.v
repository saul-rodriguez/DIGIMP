/**************************************
* Module: nnspc
* Date:2017-08-10  
* Author: Saul     
*
* Description: Serial to Parallel converter used for configuring NNSENSE ASIC
* This block uses 3 control lines: Cfg_in, Clk, and Resetn 
* Cfg_in is sampled at rising edge of Clk. After 10 bits, the data is latched to the parallel outputs
* 
* 
* Configuation word: NSEL4,NSEL3,NSEL2,NSEL1,NSEL0,    DAC3,DAC2,DAC1,DAC0,     RE     
* 
* NSEL[4:0] NNFET selector (selects 1 of 32 fet sensors)
* DAC[3:0] Control for the current DAC
* RE        Reserve pin
* 
***************************************/
module  nnspc(
Cfg_in,
Clk,
Resetn,
NSEL,
DAC,
RE
);

input Cfg_in, Clk, Resetn;

output reg[4:0] NSEL;
output reg [3:0] DAC;
output reg RE;

reg [9:0] out; 
reg [4:0] count;

wire strobe;

/*
* Right Shift register with async. reset  
*/
always @(posedge Clk, negedge Resetn)
begin
    if (Resetn == 0) begin
        out <= 0;
        count <= 10;
    end else begin
        //Shift the data
       
        out[9] <= Cfg_in;
        out[8] <= out[9];
        out[7] <= out[8];
        out[6] <= out[7];
        out[5] <= out[6];
        out[4] <= out[5];
        out[3] <= out[4];
        out[2] <= out[3];
        out[1] <= out[2];
        out[0] <= out[1];
        
        //Decrement the counter
        count <= count - 1;
    end    
end

assign strobe = (!count) & (~Clk);

always @(posedge strobe, negedge Resetn)
begin
    if (Resetn == 0) begin
        NSEL <= 0;
        DAC <= 0;
        RE <= 0;
    end else begin
		NSEL[4:0] <= out[9:5];
        DAC[3:0] <= out[4:1];        
        RE <= out[0];
    end
end

endmodule











