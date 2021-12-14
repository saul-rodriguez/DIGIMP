`ifndef USART_RX_BAMSE_V
`define USART_RX_BAMSE_V

`include "uart_rx.v"

//This module connects the USART to the BAMSE
module USART_RX_BAMSE (
	rst,
	rx,
	clk,
	clk_per_bit,
	port_out,
	//rx_ready,
	address,		
	ren,
	int_rx,
);


parameter ADDR = 8'b0000_0000; 

input rst;
input rx;
input clk;
input [11:0] clk_per_bit; // clk_per_bit = clk_frequency / bit_rate (connect to CONFIG_UART_RX1,2)
output [7:0]port_out;
//output rx_ready;
input [7:0] address;
input ren;
output int_rx;

reg int_reset;
reg int_rx;

wire rx_ready;

UART_RX rx_module(
	  .i_Rst_H(rst),
	  .i_Clock(clk),
	  .i_RX_Serial_asyn(rx),
	  .i_Clk_per_bit(clk_per_bit),
      .o_RX_DV(rx_ready),
      .o_RX_Byte(port_out)
   );

always @(posedge clk) begin
	if (rst) begin
		int_reset <= 0;			
		int_rx <= 0;
	end else begin
		if (address == ADDR) begin
			if (ren) begin 
				int_reset <= 1;
			end
		end 
		
		if (int_reset) begin
			int_rx <= 0;
			int_reset <= 0;
		end else begin
			if (rx_ready) begin
				int_rx <= 1;
			end
		end
		
	end
end

endmodule


`endif

