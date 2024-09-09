
//`include "SPI_Slave.v"
`include "SPI_Slave_LT.v"

module top (
	//input [3:0] sw, 	
	input [5:0] gp,
	output [5:0] gn,
	output [7:0] led,	
	input [6:0] btn, // [3:1] are active high, [0] is active low	
	input clk_25mhz,
	output wifi_gpio0    
);
    
	assign wifi_gpio0 = 1'b1;
	
	//switches
	//wire [7:0] switches;
	//assign switches = {{(4){1'b0}},sw[3:0]};
	
	//leds
	wire [7:0] leds;
	//assign leds = led[7:0];
	assign led = leds[7:0];
	
	//pushbuttons
	wire [3:0] pushbuttons;
	assign pushbuttons[3:0] = btn[3:0];
	//assign btn[3:0] = pushbuttons[3:0];
	
	//gio 
	wire [5:0] gno;
	//assign gn = gno;
	assign gn = {1'b0,1'b0,1'b0,1'b0,gno[1],gno[0]};
			
	
	//SPI SLAVE signals
	wire spi_clk;
	wire spi_mosi;
	wire spi_miso;
	wire spi_cs;
	//wire resetn;
	
	//assign spi_miso = gno[0];
	//assign spi_rx_dv = gno[1];
	assign gno[0] = spi_miso;
	assign gno[1] = spi_rx_dv;
	assign spi_clk = gp[0];
	assign spi_mosi = gp[1];
	assign spi_cs = gp[2];
	//assign resetn = btn[0];
		
	//resetn		
	reg resetn_meta;
	reg resetn;
	
	wire clk;
	assign clk = clk_25mhz;

	always @(posedge clk) begin
		resetn_meta <= pushbuttons[0];
		resetn <= resetn_meta;
	end
	
	//Instantiation of UUT
	/*
	SPI_Slave SPI_Slave_UUT
		(
			.clk(clk),
			.resetn(resetn),
			.SPI_CS(spi_cs),
			.SPI_Clk(spi_clk),
			.SPI_MOSI(spi_mosi),
			.SPI_MISO(spi_miso),
			.Rx_DV(spi_rx_dv),
			.Rx_Byte(leds),
			.Tx_Byte(leds) // 8 bit data to transmit  		  
		);
	*/
	
	SPI_Slave_LT SPI_Slave_LT_UUT
		(
			.clk(clk),
			.resetn(resetn),
			.SPI_CS(spi_cs),
			.SPI_Clk(spi_clk),
			.SPI_MOSI(spi_mosi),
			.SPI_MISO(spi_miso),
			.Rx_DV(spi_rx_dv),	
			.RX_Data(leds)
		);
			
endmodule
