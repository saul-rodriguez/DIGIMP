/**************************************
* Module: cur_dec_tb
* Date:2017-08-22  
* Author: saul     
*
* Description: 4-bit decoder for current DAC
***************************************/

module cur_dec_tb();

//nets to drive
reg [3:0]in;

//output wires
wire [15:0]out;

initial begin
    $dumpfile("cur_dec.vcd");
    $dumpvars(0,my_cur_dec);
    
    in = 0;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
        
    #10 $finish;
end

cur_dec my_cur_dec(in,out);


endmodule
