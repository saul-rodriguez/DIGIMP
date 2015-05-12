module test;

reg in, clk, reset;

wire [3:0] out;

initial begin
	$dumpfile("ser.vcd");
	$dumpvars(0,my_ser);
	$display("reset in out[3-0]");
	$monitor("%b   %b   %b   %b   %b   %b",reset, in, out[3], out[2], out[1], out[0]);
	clk = 0;
	in = 0;
	reset = 0;
	#3 reset = 1;
	#10 reset = 0;
	#5 in = 1;
	#100 $finish;
end

always begin
	#5 clk = ~clk;
end

ser my_ser(in,clk,reset,out);

endmodule //test
