/**************************************
* Module: counter
* Date:2015-02-24  
* Author: saul     
*
* Description: This is my counter
***************************************/
module  counter(
out,
enable,
clk,
reset
);


output [7:0] out;

input enable, clk, reset;

reg [7:0] out;

always @(posedge clk)
begin
    if (reset) begin
        out <= 8'b0;
    end else if (enable) begin
        out <= out + 1;
    end
end



endmodule

