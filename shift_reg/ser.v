module ser(in,clk,reset,out);

input in, clk, reset;
output [7:0] out;

reg [7:0] out;

always @(posedge clk)
	begin
		if (reset) begin
			out <= 8'b0;
		end else begin
			out <= (out << 1) | in;
		end
	end
endmodule //ser




