/*
*	counter example for PapilioDuo
*	Author: Saul Rodriguez
*	Date: 2016-09-13
*/

module counter(resetn,clk,en,out)

input resetn,clk,en;
output reg [25:0] out;

wire res, aux;

always @(posedge clk, negedge resetn) begin
	if (resetn == 0)
		out <= 0;
	else if (en) 
		out = out + 1
		
end

always @(out) begin	
	if (out == 32000) 
		aux = 0;
	else 
		aux = 1;
end

assign res = resetn & aux;

endmodule
