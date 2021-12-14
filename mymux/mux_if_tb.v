module tex;
	reg a = 0;
	reg b = 0;
	reg c = 0;
	
	initial begin
		$dumpfile("mux_if.vcd");
		$dumpvars(0,my_mux_if);
		$monitor("a = %b, b = %b, c = %b out = %b", a, b, c, out);
		#10 a = 1;
		#10 a = 0;
		#10 b = 1;
		#10 a = 1;
		#10 c = 1;
		#10 a = 0;
		#10 b = 0;
		#10 a = 1;
		#10 b = 1;
		#10 a = 0;
		#10 $finish;
	end
	
	wire out;
	mux_21 my_mux_if(a,b,c,out);
	
	
	  
endmodule //tex
