// This mux use assign 
module mux_21 (a,b,sel,y);
	input a,b,sel;
	output y;
	
	reg y;
	
	always @(a or b or sel)
	begin
		if (sel == 1'b0) begin
			y = a;
		end else begin
			y = b;
		end
	end	
	
	
endmodule //mux
