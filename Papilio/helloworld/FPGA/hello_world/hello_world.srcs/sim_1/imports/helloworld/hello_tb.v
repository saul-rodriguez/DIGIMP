/*
*  hello wold test bench
*/

module hello_tb();

//lines to drive
reg in;

//output signals
wire out, ard_res;

initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,my_top);
    
    in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 $finish;   
    
end

top my_top(in,out,ard_res);

endmodule
