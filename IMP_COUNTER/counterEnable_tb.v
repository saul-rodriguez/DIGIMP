/**************************************
* Module: counterEnable_tb
* Date:2015-05-11  
* Author: saul     
*
* Description: 
***************************************/
module  counterEnable_tb(
);

//Nets to drive
reg CountEnable;
reg Clk;
reg Resetn;

//Output wires
wire P1,P2,P3,P4,P5; //Control signals for the DAC
wire IP,IN; // in-phase (I) reference clock
wire QP,QN; // quadrature (Q) reference clock

initial begin
    $dumpfile("counterEnable.vcd");
    $dumpvars(0,my_counterEnable);
    Clk = 0;
    CountEnable = 0;
    Resetn = 1;
       
    #2 Resetn = 0;
    #2 Resetn = 1;
    #50 CountEnable = 1;    
    #450 CountEnable = 0;
    #50 $finish;
    
end


always begin
    #5 Clk = ~Clk;
end

counterEnable  my_counterEnable(
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

endmodule

