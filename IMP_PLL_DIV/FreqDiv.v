/**************************************
* Module: FreqDiv
* Date:2015-05-03  
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
wire [14:0] divider;

wire F_PFD; // Reference for the PFD Div-by-32

assign F_PFD = divider[4];

//Divider by two code {F14:F0}{Fin}
Divby2 div1(Fin,divider[0],Resetn); //16MHz
Divby2 div2(divider[0],divider[1],Resetn); //8MHz
Divby2 div3(divider[1],divider[2],Resetn); //4MHz
Divby2 div4(divider[2],divider[3],Resetn); //2MHz
Divby2 div5(divider[3],divider[4],Resetn); //1MHz
Divby2 div6(divider[4],divider[5],Resetn); //500kHz
Divby2 div7(divider[5],divider[6],Resetn); //250kHz
Divby2 div8(divider[6],divider[7],Resetn); //125KHz
Divby2 div9(divider[7],divider[8],Resetn); //62.5kHz
Divby2 div10(divider[8],divider[9],Resetn); //31.25 kHz
Divby2 div11(divider[9],divider[10],Resetn); //15.625 kHz
Divby2 div12(divider[10],divider[11],Resetn); //7.8125 kHz
Divby2 div13(divider[11],divider[12],Resetn); //3.90625 kHz 
Divby2 div14(divider[12],divider[13],Resetn); //1.953125 kHz
Divby2 div15(divider[13],divider[14],Resetn); //0.9765625 kHz

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

