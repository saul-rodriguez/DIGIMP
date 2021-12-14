/**************************************
* Module: FreqDiv_tb
* Date:2015-05-03  
* Author: saul     
*
* Description:  
***************************************/
module  FreqDiv64_tb(
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
    $dumpfile("FreqDiv64.vcd");
    $dumpvars(0,my_FreqDiv64);
    Fin = 0;
    
    #2 Fsel = sel1;
       Resetn = 0;
    #4 Resetn = 1;
    #100 Fsel = sel2;    
    #4000 Fsel = sel3;
    #60000 $finish;
    
end


always begin
    #5 Fin = ~Fin;
end

FreqDiv64 my_FreqDiv64(Fin,Fsel,Resetn,Fout,F_PFD);


endmodule

