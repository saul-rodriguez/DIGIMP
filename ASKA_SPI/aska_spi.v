`ifndef SPI_SLAVE_V
	`define SPI_SLAVE_V
	
	// MODE 0 SPI Slave V2.0
	// Author: Saul Rodriguez
	// Date: 2024-05-31

	// NOTE: This version implements an asynchronous SPI slave block 
	// Usage:
	
	// Async resetn (L) will reset the module. Once SPI_CS goes (L) the module will receive and transmit bits through the SPI_MOSI and 
	// SPI_MISO lines. Once N bytes have been received at the SPI_MOSI line, the Rx_DV output flag goes (H). The received byte 
	// is available in the register Rx_Byte. 
	// The transmit byte is copied from Ty_Byte input when SPI_CS goes (L) or in falling edge of 
	// the 8th SPI_CLK.  

    `define N 40
    `define M 32

	module aska_spi (
			//input clk,
			input resetn, // Reset async. (L)
			input SPI_CS, // chip select  (L)
			input SPI_Clk, // Mode 0, data is sampled at the rising edge
			input SPI_MOSI, // Master output  Slave Input
			//output SPI_MISO,
			//output Rx_DV, // pulse high, one cycle, when 8 bits have been received 
			output reg [`M-1:0] Rx_data [3:0]// N bit received data
			//input [7:0] Tx_Byte // 8 bit data to transmit			
			);
		
	/******************************************************/
    /* Recover the SPI_MOSI data only when SPI_CS is (L)  */
	/******************************************************/
		
		reg [`N-1:0] Rx_data_temp;
				
		always @(posedge SPI_Clk or negedge resetn) begin
			if (resetn == 1'b0) begin
				//Rx_count <= 5'b0_0000;
                Rx_data_temp <= 0;				
			end else begin
                if (SPI_CS == 1'b0) begin                   
                    Rx_data_temp <= {Rx_data_temp[`N-2:0],SPI_MOSI};	                                        
                end
			end		
		end

    /****************************************************************/
    /* Count the numbed of bits being received while SPI_CS is (L)  */
	/****************************************************************/

        reg [5:0] Rx_count;
        always @(posedge SPI_Clk or posedge SPI_CS) begin
			if (SPI_CS == 1'b1) begin
				Rx_count <= 5'b0_0000;                
			end else begin
                Rx_count <= Rx_count + 1;
			end		
		end

    /*********************************************/
    /* Copy the temp data to the output registers */
    /*********************************************/

        wire addr[1:0];
        assign addr[0] = Rx_data_temp[32];
        assign addr[1] = Rx_data_temp[33];

        always @(posedge SPI_CS or negedge resetn) begin
            if (resetn == 1'b0) begin
                Rx_data[0] <= 0;
                Rx_data[1] <= 0;
                Rx_data[2] <= 0;
                Rx_data[3] <= 0;
            end else begin
                // Copy data only if 5 bytes have been completely received
                if (Rx_count == `N) begin 
                    if (addr == 2'b01) begin 
                        Rx_data[0] <= Rx_data_temp[31:0];
                    end
                        //RX_data[address] <= Rx_data_temp[31:0];
                                      
                end                
            end
        end


	endmodule
		
`endif

