/**************************************
* Module: cur_dec
* Date:2017-08-22  
* Author: saul     
*
* Description: 4-bit decoder for current DAC
***************************************/

module cur_dec(in,out);

input [3:0]in;
output [15:0]out;

reg [15:0]out;

always @(in)
begin	
		out = (1 << in);
end
endmodule

