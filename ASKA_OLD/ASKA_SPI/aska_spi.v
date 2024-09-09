`ifndef ASKA_SPI_V
`define ASKA_SPI_V
	
	// MODE 0 SPI Slave V2.0
	// Author: Saul Rodriguez
	// Date: 2024-05-31

	// NOTE: This version implements an asynchronous SPI slave block for the ASKA ASIC. The SPI has a 2 bit address so that up to 4 devices can
	// be attached to the same SPI master.
	// Usage:
	
	// Async resetn (L) will reset the module. Once SPI_CS goes (L) the module will receive and transmit bits through the SPI_MOSI and 
	// SPI_MISO lines. The configuration word is composed of 40 bits (5 bytes):
	// | 8 bits IC address + reg address | 32 bits data |
	// Once 40 bits have been received at the SPI_MOSI line, the configuration registers (32 bits)
	// conf0, conf1, ele1, and ele2 are updated if IC_addr_received matches IC_addr. The registers are synchronized to the internal clk (20 kHz).
	// The MSB of the configuration word contains the following information:

	// bit7 -> IC_addr_received[1]         
	// bit6 -> IC_addr_received[0]
	// bit5 -> not used / reserved
	// bit4 -> not used / reserved
	// bit3 -> not used / reserved
	// bit2 -> not used / reserved
	// bit1 -> reg_addr[1]
	// bit0 -> reg_addr[0]


	// The register address reg_addr points to the following 32 bit registers: 
	// 00 -> conf0
	// 01 -> conf1
	// 10 -> ele1
	// 11 -> ele2 
	
    //`define N 40
    //`define M 32

	module aska_spi (
			input clk,   // internal clock 20 kHz
			input resetn, // Reset async. (L)
			input SPI_CS, // chip select  (L)
			input SPI_Clk, // Mode 0, data is sampled at the rising edge
			input SPI_MOSI, // Master output  Slave Input	
			input [1:0] IC_addr, // IC address			
			output reg [31:0] conf0,
			output reg [31:0] conf1,
			output reg [31:0] ele1,
			output reg [31:0] ele2
			);
		
	/******************************************************/
    /* Recover the SPI_MOSI data only when SPI_CS is (L)  */
	/******************************************************/
		
		reg [39:0] Rx_data_temp;
				
		always @(posedge SPI_Clk or negedge resetn) begin
			if (resetn == 1'b0) begin
				//Rx_count <= 5'b0_0000;
                Rx_data_temp <= 0;				
			end else begin
                if (SPI_CS == 1'b0) begin                   
                    Rx_data_temp <= {Rx_data_temp[38:0],SPI_MOSI};	                                        
                end
			end		
		end

    /****************************************************************/
    /* Count the number of bits being received while SPI_CS is (L)  */
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

		wire [1:0] IC_addr_received;
		assign IC_addr_received = Rx_data_temp[39:38];

		wire IC_selected;
		assign IC_selected = (IC_addr == IC_addr_received) ? 1'b1 : 1'b0;

        wire [1:0] addr;
		assign addr = Rx_data_temp[33:32];
        //assign addr[0] = Rx_data_temp[32];
        //assign addr[1] = Rx_data_temp[33];

		reg [31:0] conf0_asyn;
		reg [31:0] conf1_asyn;
		reg [31:0] ele1_asyn;
		reg [31:0] ele2_asyn;

        always @(posedge SPI_CS or negedge resetn) begin
            if (resetn == 1'b0) begin
				conf0_asyn <= 0;
				conf1_asyn <= 0;
				ele1_asyn <= 0;
				ele2_asyn <= 0;                
            end else begin
                // Copy data only if 40 bits (5 bytes) have been completely received
                if (Rx_count == 40 && IC_selected) begin 
					case (addr)
						2'b00 : conf0_asyn <= Rx_data_temp[31:0];
						2'b01 : conf1_asyn <= Rx_data_temp[31:0];
						2'b10 : ele1_asyn <= Rx_data_temp[31:0];
						2'b11 : ele2_asyn <= Rx_data_temp[31:0];  						
					endcase                                                      
                end                
            end
        end

	/*************************************************/
	/* Synchronize SPI config words to internal clk  */
	/*************************************************/

		reg [31:0] conf0_meta;
		reg [31:0] conf1_meta;
		reg [31:0] ele1_meta;
		reg [31:0] ele2_meta;

		always @(posedge clk or negedge resetn) begin
			if (resetn == 1'b0) begin
				conf0 <= 0;
				conf0_meta <= 0;
				conf1 <= 0;
				conf1_meta <= 0;
				ele1 <= 0;
				ele1_meta <= 0;
				ele2 <= 0;
				ele2_meta <= 0;
			end else begin
				conf0_meta <= conf0_asyn;
				conf0 <= conf0_meta;

				conf1_meta <= conf1_asyn;
				conf1 <= conf1_meta;

				ele1_meta <= ele1_asyn;
				ele1 <= ele1_meta;

				ele2_meta <= ele2_asyn;
				ele2 <= ele2_meta;
			end
		end

	endmodule
		
`endif

