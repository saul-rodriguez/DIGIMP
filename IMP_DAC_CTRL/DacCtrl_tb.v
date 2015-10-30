/**************************************
* Module: DacCtrl_tb
* Date:2015-09-26  
* Author: saul     
*
* Description: 
***************************************/
module  DacCtrl_tb(
);

//Nets to drive
reg CountEnable;
reg Clk;
reg Resetn;
reg StepNum;

//Output wires
wire [16:0] P; //Control signals for the DAC
wire IP,IN; // in-phase (I) reference clock
wire QP,QN; // quadrature (Q) reference clock

initial begin
    $dumpfile("DacCtrl.vcd");
    $dumpvars(0,my_DacCtrl);
    Clk = 0;
    CountEnable = 0;
    Resetn = 1;
       
    #2 Resetn = 0;
       StepNum = 0; // 32 steps 
    #20 Resetn = 1;
    #30 CountEnable = 1; 
    #500 StepNum = 1; // 16 steps   
    #500 CountEnable = 0;
    #50 $finish;
    
end


always begin
    #5 Clk = ~Clk;
end

DacCtrl  my_DacCtrl(
CountEnable,
Clk,
Resetn,
StepNum,
P,
IP,
IN,
QP,
QN
);


endmodule

