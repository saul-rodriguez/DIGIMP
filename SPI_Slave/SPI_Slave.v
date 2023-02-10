`ifndef SPI_SLAVE_V
	`define SPI_SLAVE_V
	
	// MODE 0 SPI Slave V2.0
	// Author: Saul Rodriguez
	// Date: 2023-02-08

	// NOTE: This version synchronizes all SPI signals to the system's clock. It is recommended that the ratio clk / SPI_Clk >= 8;  
	// Usage:
	
	// Async resetn (L) will reset the module. Once SPI_CS goes (L) the module will receive and transmit bits through the SPI_MOSI and 
	// SPI_MISO lines. Once 8 bits have been received at the SPI_MOSI line, the Rx_DV output flag goes (H) for a clock period. The received byte 
	// is available in the register Rx_Byte. 
	// The transmit byte is copied from Ty_Byte input when SPI_CS goes (L) or in falling edge of 
	// the 8th SPI_CLK.  
		
	module SPI_Slave (
			input clk,
			input resetn, // Reset low
			input SPI_CS,
			input SPI_Clk,
			input SPI_MOSI,
			output SPI_MISO,
			output Rx_DV, // pulse high, one cycle, when 8 bits have been received 
			output reg [7:0] Rx_Byte, // 8 bit received data
			input [7:0] Tx_Byte // 8 bit data to transmit			
			);
			
		//Purpose: synchronize all master inputs to internal clk (It results in a bit slower brate, but it is safer...)
	
		reg SPI_CS_mt, SPI_CS_st, SPI_CS_del;
		reg SPI_Clk_mt, SPI_Clk_st;
		reg SPI_MOSI_mt, SPI_MOSI_st;
		
		always @(posedge clk) begin
			SPI_CS_mt <= SPI_CS;
			SPI_CS_st <= SPI_CS_mt;
			SPI_CS_del <= SPI_CS_st;
			SPI_Clk_mt <= SPI_Clk;
			SPI_Clk_st <= SPI_Clk_mt;
			SPI_MOSI_mt <= SPI_MOSI;
			SPI_MOSI_st <= SPI_MOSI_mt;
		end
		
		wire CS_resetn;
		assign CS_resetn = ~SPI_CS_st;
	
		//Purpose: Recover the SPI byte and raises a flag when done
	
		reg [2:0] Rx_count;
		reg [7:0] Rx_byte_temp;
		reg Rx_ready;
		
		always @(posedge SPI_Clk_st or negedge CS_resetn) begin
			if (CS_resetn == 1'b0) begin
				Rx_count <= 3'b0;
				Rx_ready <= 1'b0;	
				//Rx_Byte <= 8'b0;
			end else begin
				Rx_count <= Rx_count + 1;
				Rx_byte_temp <= {Rx_byte_temp[6:0],SPI_MOSI_st};			
				if (Rx_count == 3'b111) begin
					Rx_Byte <= {Rx_byte_temp[6:0],SPI_MOSI_st};
					Rx_ready <= 1'b1;
				end else if (Rx_count == 3'b001) begin
					Rx_ready <= 1'b0;
				end			
			end		
		end
	
		//Purpose: Create Rx_DV as a clk synchronized pulse
		reg Rx_ready_sync; 
		
		always @(posedge clk ) begin
			if (!resetn) begin
				Rx_ready_sync <= 0;
			end else begin
				Rx_ready_sync <= Rx_ready;			
			end
		end
		
		assign Rx_DV = (Rx_ready_sync ^ Rx_ready) & (Rx_ready);
		//assign Rx_DV = (Rx_ready_sync ^ Rx_ready) & (~Rx_ready_sync);
		
		//Purpose: transmit data to the master	
		reg [7:0] Tx_Byte_temp;		
		wire [7:0] Tx_data_ro; // Reorder Tx data
		assign Tx_data_ro = {Tx_Byte[0],Tx_Byte[1],Tx_Byte[2],Tx_Byte[3],Tx_Byte[4],Tx_Byte[5],Tx_Byte[6],Tx_Byte[7]};
			
		wire CS_pulse;
		assign CS_pulse = (SPI_CS_st ^ SPI_CS_del) & (~SPI_CS_st);
		
		always @(posedge clk ) begin
			if (!resetn) begin				
				Tx_Byte_temp <= 0;
			end else begin
				if (Rx_DV | CS_pulse) begin
					Tx_Byte_temp <= Tx_data_ro;
				end							
			end
		end
				
		reg [2:0] Tx_count;
		
		always @(negedge SPI_Clk_st or negedge CS_resetn) begin			
			if (CS_resetn == 1'b0) begin			
				Tx_count <= 3'b0;
			end else begin
				Tx_count <= Tx_count + 1;
			end
		end
			
		assign SPI_MISO = Tx_Byte_temp[Tx_count];
		
	endmodule
		
`endif

