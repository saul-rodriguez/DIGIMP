/**************************************
* Module: FreqDiv_tb
* Date:2015-05-03  
* Author: saul     
*
* Description: 
***************************************/
//`timescale 1ns / 1ps

module  FreqDiv_tb(
);

//Nets to drive
reg Fin;
reg [3:0] Fsel;
reg Resetn;

//Output nets
wire Fout;
wire F_PFD;

parameter [3:0] sel1 = 4'b0001; //div 2
parameter [3:0] sel2 = 4'b0101; //div 32
parameter [3:0] sel3 = 4'b1100;//div 4096


initial begin
    $dumpfile("FreqDiv.vcd");
    $dumpvars(0,my_FreqDiv);
    Fin = 0;
    
    #2 Fsel = sel1;
       Resetn = 0;
    #4 Resetn = 1;
    #100 Fsel = sel2;    
    #2000 Fsel = sel3;
    #60000 $finish;
    
end


always begin
    #5 Fin = ~Fin;
end

FreqDiv my_FreqDiv(Fin,Fsel,Resetn,Fout,F_PFD);


endmodule

