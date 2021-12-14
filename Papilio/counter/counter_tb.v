/*
 * counter_tb
 */
 
 
module counter_tb();

//lines to drive
reg resetn,clk,en;

//output signals
wire [25:0] out;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,my_counter);
    
    resetn = 1;
    en = 0;
    clk = 0;
    
    #1 resetn = 0;
    #2 resetn = 1;
    #3 en = 1;
    #150 $finish;   
    
end

always begin
    #5 clk = ~clk;
end

counter my_counter(resetn,clk,en,out);

endmodule

