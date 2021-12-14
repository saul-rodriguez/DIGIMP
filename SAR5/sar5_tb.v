/**************************************
* Module: SAR5_tb
* Date:2017-05-25  
* Author: saul     
*
* Description: Succesive Approximation Register 5 bits
***************************************/

module sar5_tb();

//nets to drive
reg clk;
reg comp;
reg resetn;

//output wires
wire [4:0] out;
wire sar_serial;
wire start_ready;

initial begin
    $dumpfile("sar5.vcd");
    $dumpvars(0,my_sar5);
    
    clk = 0;
    resetn = 0;
    comp = 0;
    #2 resetn = 1;
    #30 comp = 1;
    #80 comp = 0;
    #120 comp = 1;
    #400 $finish; 
    
    
end


always begin
    #10 clk = ~ clk;
end


sar5 my_sar5(clk,comp,resetn,out,sar_serial,start_ready);


endmodule
