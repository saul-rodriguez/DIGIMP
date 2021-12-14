/**************************************
* Module: FreqDiv
* Date:2015-11-04  
* Author: saul     
*
* Description: Frequency divided and 16 mux
***************************************/
module  FreqDiv(
Fin,  //Input frequency from the VCO
Fsel, // 16-1 Mux selector (4 bits)
Resetn, 
Fout,  //Mux output
F_PFD
);

//inputs
input Fin;
input [3:0] Fsel;
input Resetn;

//outputs
output reg Fout;
output F_PFD;

//div by 2 register of size 15 (input frequency Fin will be appended so that there are 16 frecs!)
reg [14:0] divider;

wire F_PFD; // Reference for the PFD Div-by-32

// F_PFD is the clock signal that is compared with the reference frequency at the Phase-Freq detector
assign F_PFD = divider[4]; 

always @(posedge Fin, negedge Resetn)
begin
    if (Resetn == 0) begin
        divider = 0;
    end else begin
        divider = divider + 1;
    end
end

// MUX 16:1
always @(Fsel,divider,Fin)
begin
    case (Fsel)
        4'b0000: Fout <= Fin;
        4'b0001: Fout <= divider[0];
        4'b0010: Fout <= divider[1];
        4'b0011: Fout <= divider[2];
        4'b0100: Fout <= divider[3];
        4'b0101: Fout <= divider[4];
        4'b0110: Fout <= divider[5];
        4'b0111: Fout <= divider[6];
        4'b1000: Fout <= divider[7];
        4'b1001: Fout <= divider[8];
        4'b1010: Fout <= divider[9];
        4'b1011: Fout <= divider[10];
        4'b1100: Fout <= divider[11];
        4'b1101: Fout <= divider[12];
        4'b1110: Fout <= divider[13];
        4'b1111: Fout <= divider[14];
        default: Fout <= Fin;
    endcase
end
    

endmodule

