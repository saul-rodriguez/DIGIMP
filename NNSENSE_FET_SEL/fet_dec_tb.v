/**************************************
* Module: cur_dec_tb
* Date:2017-08-22  
* Author: saul     
*
* Description: 4-bit decoder for current DAC
***************************************/

module fet_dec_tb();

//nets to drive
reg [4:0]in;

//output wires
wire [31:0]out;

initial begin
    $dumpfile("fet_dec.vcd");
    $dumpvars(0,my_fet_dec);
    
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
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
    #10 in = in + 1;
        
    #10 $finish;
end

fet_dec my_fet_dec(in,out);


endmodule
