module test;

reg clk, reset, enable;
wire [7:0] out;

initial begin
	$dumpfile("counter.vcd");
	$dumpvars(0,my_counter);
	clk = 0;
	reset = 0;
	enable = 0;
	#16 reset = 1;
	#18 reset = 0;
	#10 enable = 1;	
	#100 $finish;
end

always begin
	#5 clk = ~clk;
end

up_counter my_counter(out,enable,clk,reset);

endmodule //test
