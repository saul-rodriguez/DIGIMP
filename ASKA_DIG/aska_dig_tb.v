//Verilog HDL for "SPI_SLAVE_STIMULUS", "SPI_stimulus" "functional"

//`include "constants.vams"
//`include "disciplines.vams"

`include "aska_dig.v"

`timescale 1us/ 1ps

`define AMPLITUDE 50
`define FREQ 400
`define PHASE 4
`define RAMP  50
`define RAMP_FACTOR (`AMPLITUDE*16)/`RAMP
//`define RAMP_FACTOR 0
`define ON_TIME  50
`define OFF_TIME  50
`define ELE1  32'b0000_0000_0000_0000_1000_0000_0000_0000
`define ELE2  32'b0000_0000_0000_0000_0100_0000_0000_0000


module SPI_stimulus(	
	output reg SPI_Clk,
	output reg SPI_MOSI,
	output reg SPI_CS,
	output reg reset_l);
	
	reg Clk20kHz;

	parameter MAIN_CLK_DELAY = 25;  // 20 kHz
	parameter SPI_CLK_DELAY = 1; // 500 kHz

    // Stimulation parameters
    wire [5:0] amplitude; //0 - 50 mA
    wire [11:0] freq; // 4.88 Hz (4095) - 50 Hz (400)
    wire [2:0] phaseDuration;
    wire [5:0] ramp;
    wire [9:0] ramp_factor;
    wire [7:0] ON_time; // up to 4s (200 for 50 Hz)ramp = `RAMP;    
    wire [9:0] OFF_time; // up to 12s (600 for 50 Hz)
    wire [`ELEC_NUM:0] electrode1;
    wire [`ELEC_NUM:0] electrode2;
    wire enable;
	    
	//Outputs
	wire [`ELEC_NUM:0] up_switches;
    wire [`ELEC_NUM:0] down_switches;
    wire [5:0] DAC;
    wire pulse_active;

	assign amplitude = `AMPLITUDE;
	assign freq = `FREQ;
	assign phaseDuration = `PHASE;
	assign ramp = `RAMP;
    assign ramp_factor = `RAMP_FACTOR;
    assign ON_time = `ON_TIME;
    assign OFF_time = `OFF_TIME;
    assign electrode1 = `ELE1;
    assign electrode2 = `ELE2;
    assign enable = 1'b1;

    wire [`M-1:0] conf0;
	wire [`M-1:0] conf1;

    assign conf0[17:12] = amplitude;
    assign conf0[11:0] = freq;
    assign conf1[23:21] = phaseDuration;
    assign conf0[23:18] = ramp;
    assign conf1[9:0] = ramp_factor;
    assign conf0[32:24] = ON_time;
    assign conf1[19:10] = OFF_time;
    assign conf1[20] = enable;

	// Clock Generators:
	always #(MAIN_CLK_DELAY) Clk20kHz = ~Clk20kHz;
	
	reg [7:0] TX_data; // Data to send through MOSI	
	reg [7:0] SPI_Master_RX; // Data received through MISO  

	
   
	/*
    wire [`M-1:0] ele1;
	wire [`M-1:0] ele2;
	*/

    /*
	aska_spi aska_spi_UUT
		(
			.clk(Clk20kHz),
			.resetn(reset_l),
			.SPI_CS(SPI_CS),
			.SPI_Clk(SPI_Clk),
			.SPI_MOSI(SPI_MOSI),			 
			.conf0(conf0),
			.conf1(conf1),
			.ele1(ele1),
			.ele2(ele2)
		);
	*/
       

    aska_dig aska_dig1 (
			.clk(Clk20kHz),   // internal clock 20 kHz
			.reset_l(reset_l), // Reset async. (L)
            //.porborn(reset_l), //Power-on-Reset/Brown-out-Reset (L)
			.SPI_CS(SPI_CS), // chip select  (L)
			.SPI_Clk(SPI_Clk), // Mode 0, data is sampled at the rising edge
			.SPI_MOSI(SPI_MOSI), // Master output  Slave Input				
			.up_switches(up_switches),  // Controls the P switches in the H bridge
            .down_switches(down_switches), // Controls the N switches in the H bridge
            .DAC(DAC),
            .pulse_active(pulse_active));

	initial begin

		// Required for EDA Playground
		$dumpfile("dump.vcd"); 
		$dumpvars;
		$display("************************************");
		$display("Test ASKA SPI Slave");

		//Initial State
		Clk20kHz = 0;
		TX_data = 8'h00;
		reset_l = 1'b1;
		SPI_CS = 1'b1;
		SPI_Clk = 1'b0;
		SPI_MOSI = 1'b0;
		//SPI_Slave_TX = 8'h00;
 
		//Reset
		#(10*MAIN_CLK_DELAY) reset_l = 1'b0;
		#(10*MAIN_CLK_DELAY) reset_l = 1'b1;
		#(10*MAIN_CLK_DELAY);
 
        send_ASKA(8'h02,electrode1);
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h03,electrode2);
        #(20*MAIN_CLK_DELAY);
		send_ASKA(8'h00,conf0);
		#(20*MAIN_CLK_DELAY);
		//send_ASKA_error(8'h03,32'h554466aa); // send incomplete command!
		//#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h01,conf1);
		
		
   
		#(10000000*SPI_CLK_DELAY); 
		$display("************************************");
		$finish;
 
	end

	initial begin
		//    $sdf_annotate ("/home/saul/projects/TEST_LIB2/innovus/output/typ_functional_1_8V_25C.sdf",I3,, "sdf.log", "MAXIMUM");
	end

	reg[8*6:1] str1;

	task send_ASKA(input [7:0] add, input [31:0] data);
		begin
			SPI_CS = 1'b0;
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			
			send_byte(add);
			send_byte(data[31:24]);
			send_byte(data[23:16]);
			send_byte(data[15:8]);
			send_byte(data[7:0]);
			
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_CS = 1'b1;	
			
			//Check values
			#(4*MAIN_CLK_DELAY);
			
            /*
			case (add)
				8'h00:  begin
							str1 = (data == conf0)? "OK" : "ERROR";
							$display("sent conf0 0x%X, received 0x%X, %s", data, conf0, str1);
						end
				8'h01: 	begin
							str1 = (data == conf1)? "OK" : "ERROR";
							$display("sent conf1 0x%X, received 0x%X, %s", data, conf1, str1);
						end						
				8'h02:  begin
							str1 = (data == ele1)? "OK" : "ERROR";
							$display("sent ele1 0x%X, received 0x%X, %s", data, ele1, str1);	
						end
				
				8'h03: 	begin
							str1 = (data == ele2)? "OK" : "ERROR";
							$display("sent ele2 0x%X, received 0x%X, %s", data, ele2, str1); 				
						end
						
			endcase
			*/
			
		end
	endtask

	task send_ASKA_error(input [7:0] add, input [31:0] data);
		begin
			SPI_CS = 1'b0;
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			
			send_byte(add);
			send_byte(data[31:24]);
			send_byte(data[23:16]);
			send_byte(data[15:8]);
			//send_byte(data[7:0]);
			
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_CS = 1'b1;	
			
		end
	endtask

	task send_byte(input [7:0] data);
		begin
			TX_data = data;			
			//#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[7];
						
			#SPI_CLK_DELAY;		
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[6];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[5];
				
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[4];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[3];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[2];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[1];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[0];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
						
		end
	endtask

endmodule 

