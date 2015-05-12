/**************************************
* Module: spc1
* Date:2015-05-02  
* Author: saul     
*
* Description: Serial to Parallel converter used for configuring BIO IC V1
* This block uses 4 control lines: Cfg_in, Clk, Strobe, and Resetn 
***************************************/
module  spc1(
Cfg_in,
Clk,
Strobe,
Resetn,
F,
IQ,
G,
CE,
GCP
);

input Cfg_in, Clk, Strobe, Resetn;

output reg[3:0] F;
output reg IQ;
output reg [2:0] G;
output reg CE;
output reg [1:0] GCP;

reg [10:0] out; 

/*
* Right Shift register with async. reset  
*/
always @(posedge Clk, negedge Resetn)
begin
    if (Resetn == 0) begin
        out <= 0;
    end else begin
        out[10] <= Cfg_in;
        out[9] <= out[10];
        out[8] <= out[9];
        out[7] <= out[8];
        out[6] <= out[7];
        out[5] <= out[6];
        out[4] <= out[5];
        out[3] <= out[4];
        out[2] <= out[3];
        out[1] <= out[2];
        out[0] <= out[1];
    end     
end

/*
* Output registers with async. reset
*/

always @(posedge Strobe, negedge Resetn)
begin
    if (Resetn == 0) begin
        F[3:0] <= 0;
        IQ <= 0;
        G[2:0] <= 0;
        CE <= 0;
        GCP[1:0] <= 0;
    end else begin
        F[3:0] <= out[10:7];
        IQ <= out[6];
        G[2:0] <= out[5:3];
        CE <= out[2];
        GCP[1:0] <= out[1:0];
    end
end

endmodule











