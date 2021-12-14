/**************************************
* Module: counter
* Date:2020-04-10  
* Author: saul     
*
* Description: This is my counter
***************************************/

module  counter(
output [7:0] out,
input enable,
input clk,
input reset
);

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

