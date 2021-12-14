/*
*	counter example for PapilioDuo
*	Author: Saul Rodriguez
*	Date: 2016-09-13
*/

module counter(resetn,clk,en,out);

input resetn,clk,en;
output reg [25:0] out;

always @(posedge clk, negedge resetn) begin
	if (resetn == 0)
		out <= 0;
	else if (en) begin
		if (out == 5)
			out <= 0;
		else
			out <= out + 1;
	end 	
end

endmodule
