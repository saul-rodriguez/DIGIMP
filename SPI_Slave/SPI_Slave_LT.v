`ifndef SPI_SLAVE_LT_V
	`define SPI_SLAVE_LT_V

`include "SPI_Slave.v"

module SPI_Slave_LT(
		input clk,
		input resetn, // Reset low
		input SPI_CS,
		input SPI_Clk,
		input SPI_MOSI,
		output SPI_MISO,
		output Rx_DV, // pulse high, one cycle, when 8 bits have been received
		output [7:0] RX_Data
);
	
//wire [7:0] RX_Data;
	
	SPI_Slave SPI_Slave_UUT
		(
			.clk(clk),
			.resetn(resetn),
			.SPI_CS(SPI_CS),
			.SPI_Clk(SPI_Clk),
			.SPI_MOSI(SPI_MOSI),
			.SPI_MISO(SPI_MISO),
			.Rx_DV(Rx_DV),
			.Rx_Byte(RX_Data),
			.Tx_Byte(RX_Data) // 8 bit data to transmit  		  
		);

endmodule

`endif