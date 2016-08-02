/**************************************
* Module: fsm_tb
* Date:2015-03-07  
* Author: saul     
*
* Description: 
***************************************/
module  fsm_tb(
);


reg clk, reset, start, in;
wire [7:0] out;


initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0,my_fsm);
    clk = 0;
    reset = 0;
    start = 0;
    #2 reset = 1;
    #10 reset = 0;
    #2 in = 1;
     start = 1;     
    #10 start = 0;
    #5 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;
    #200 $finish;
end


always begin
    #5 clk = ~clk;
end

fsm my_fsm(reset,start,clk,in,out);

endmodule

