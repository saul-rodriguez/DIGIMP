/*
*  hello wold test bench
*/

module hello_tb();

//lines to drive
reg in;

//output signals
wire out;

initial begin
    $dumpfile("hello.vcd");
    $dumpvars(0,my_hello);
    
    in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 $finish;   
    
end

hello my_hello(in,out);

endmodule
