/**************************************
* Module: counterEnable
* Date:2015-05-11  
* Author: saul     
*
* Description: state machine that controls the DAC and I/Q generation
***************************************/
module  counterEnable(
CountEnable,
Clk,
Resetn,
P1,
P2,
P3,
P4,
P5,
IP,
IN,
QP,
QN
);

//Inputs
input CountEnable;
input Clk;
input Resetn;

//Outputs
//output wire P1,P2,P3,P4,P5; //Control signals for the DAC
output reg P1,P2,P3,P4,P5; //Control signals for the DAC
output wire IP,IN; // in-phase (I) reference clock
output reg QP; // quadrature (Q) reference clock
output wire QN; 

reg [2:0] count;


// 3bit counter state machine
always @(posedge Clk, negedge Resetn)
begin
    if (Resetn == 0) begin
        count <= 0;
    end else begin
        count <= count + 1;    
    end    
end

// DAC Outputs

/*
// LFOUNDRY BIO VERSION 
assign P1 = count[1] & count[0] & CountEnable;
assign P2 = (~count[2]) & (~count[0]) & CountEnable;
assign P3 = (~count[2]) & (~count[1] & count[0]) & CountEnable;
assign P4 = count[2] & (~count[0]) & CountEnable;   
assign P5 = count[2] & (~count[1]) & count[0] & CountEnable;
*/

// AMS VERSION
// P1 is active when CountEnable == 0 (input differential voltage at GM Cur. Gen = 0V)
always @(CountEnable, count)
begin
    if (CountEnable == 1) begin
        P1 = count[1] & count[0];
        P2 = (~count[2]) & (~count[0]);
        P3 = (~count[2]) & (~count[1] & count[0]);
        P4 = count[2] & (~count[0]);   
        P5 = count[2] & (~count[1]) & count[0];
    end else begin
        P1 = 1;
        P2 = 0;
        P3 = 0;
        P4 = 0;  
        P5 = 0;    
    end
end



// I/Q Outputs
assign IP = (~count[2]);
assign IN = ~IP;


always @(posedge count[1], negedge Resetn)
begin
    if (Resetn == 0) begin
        QP <= 0;         
    end else begin
        QP <= IP; 
    end    
end

assign QN = ~QP;

endmodule

