//Verilog HDL for "SPI_SLAVE_STIMULUS", "SPI_stimulus" "functional"

//`include "constants.vams"
//`include "disciplines.vams"

`include "aska_dig.v"

`timescale 1us/ 1ps

//`define AMPLITUDE 50
//`define FREQ 400
//`define PHASE 4
//`define RAMP  50
//`define RAMP_FACTOR (`AMPLITUDE*16)/`RAMP
//`define RAMP_FACTOR 0
//`define ON_TIME  50
//`define OFF_TIME  50
`define ELE1  32'b0000_0000_0000_0000_1000_0000_0000_0000
`define ELE2  32'b0000_0000_0000_0000_0100_0000_0000_0000


module DIG_stimulus(	
	output reg SPI_Clk,
	output reg SPI_MOSI,
	output reg SPI_CS,
	output reg reset_l,
	output reg Clk20kHz,
	output reg porborn);
		
	

	parameter MAIN_CLK_DELAY = 25;  // 20 kHz
	parameter SPI_CLK_DELAY = 1; // 500 kHz

	// IC address
	reg [1:0] IC_addr;

    // Stimulation parameters
    reg [5:0] amplitude; //0 - 50 mA
    reg [11:0] freq; // 4.88 Hz (4095) - 50 Hz (400)
    reg [2:0] phaseDuration;
    reg [5:0] ramp;
    reg [9:0] ramp_factor;
    reg [7:0] ON_time; // up to 4s (200 for 50 Hz)ramp = `RAMP;    
    reg [9:0] OFF_time; // up to 12s (600 for 50 Hz)
    reg [31:0] electrode1;
    reg [31:0] electrode2;
    reg enable;
	    
	//Outputs
	wire [31:0] up_switches;
    wire [31:0] down_switches;
    wire [5:0] DAC;
    wire pulse_active;
	wire enable_out;

    reg [31:0] conf0;
	reg [31:0] conf1;
	
	// Clock Generators:
	always #(MAIN_CLK_DELAY) Clk20kHz = ~Clk20kHz;
	
	reg [7:0] TX_data; // Data to send through MOSI	
	reg [7:0] SPI_Master_RX; // Data received through MISO  

    aska_dig aska_dig1 (
			.clk(Clk20kHz),   // internal clock 20 kHz
			.reset_l(reset_l), // Reset async. (L)
            .porborn(porborn), //Power-on-Reset/Brown-out-Reset (L)
			.SPI_CS(SPI_CS), // chip select  (L)
			.SPI_Clk(SPI_Clk), // Mode 0, data is sampled at the rising edge
			.SPI_MOSI(SPI_MOSI), // Master output  Slave Input	
			.IC_addr(IC_addr), // address of IC			
			.up_switches(up_switches),  // Controls the P switches in the H bridge
            .down_switches(down_switches), // Controls the N switches in the H bridge
            .DAC(DAC),
            .pulse_active(pulse_active),
			.enable(enable_out));

	reg [7:0] send_address;

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
		porborn = 1'b1;
		SPI_CS = 1'b1;
		SPI_Clk = 1'b0;
		SPI_MOSI = 1'b0;

		IC_addr = 2'b00;
		send_address = 8'h00; //only the 2 msb need to be changed!


	//initial conf 50mA, pd = 4, 50Hz, rampup/dn 1s, ON/OFF 1s
		enable = 1'b1;
		amplitude = 50;
		freq = 400;
		phaseDuration = 4;
		ramp = 50;
		ramp_factor = (amplitude*16)/ramp;
 	   	ON_time = 50;
  	  	OFF_time = 50;
   	 	electrode1 = `ELE1;
    	electrode2 = `ELE2;
		update_config;
		
 
		//Reset
		#(10*MAIN_CLK_DELAY) reset_l = 1'b0;
		#(10*MAIN_CLK_DELAY) reset_l = 1'b1;
		#(10*MAIN_CLK_DELAY);

		// SPI config
        send_ASKA((8'h02 | send_address),electrode1);
		#(20*MAIN_CLK_DELAY);
		send_ASKA((8'h03 | send_address),electrode2);
        #(20*MAIN_CLK_DELAY);	
		send_ASKA((8'h00 | send_address),conf0);
		#(20*MAIN_CLK_DELAY);
		send_ASKA((8'h01 | send_address),conf1);
         
		
		#(7500000*SPI_CLK_DELAY); 

		// Disable NPG
		enable = 0;
	    update_config;	
		#1;	send_ASKA((8'h01 | send_address),conf1);

		#(5000000*SPI_CLK_DELAY); 
			// amp 25 mA, rampup/dwn 0.5s freq 50Hz
		ramp = 25;
		amplitude = 25;
		ramp_factor = (amplitude*16)/ramp;
		enable = 1;
		update_config;
		#1; send_ASKA((8'h00 | send_address),conf0);		
		send_ASKA((8'h01 | send_address),conf1);

		#(10000000*SPI_CLK_DELAY);

		

		// POR
		porborn = 0;
		#(1000000*SPI_CLK_DELAY);
		porborn = 1;

		#(20000000*SPI_CLK_DELAY); 
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

			$display("sent SPI add 0x%X, data 0x%X at time:",add, data,  $time);
			
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

	task update_config;
 		begin
			conf0[11:0] = freq;
			conf0[17:12] = amplitude;   
 			conf0[23:18] = ramp;
    			conf0[31:24] = ON_time;
		
    			conf1[9:0] = ramp_factor;
    			conf1[19:10] = OFF_time;
    			conf1[20] = enable;
    			conf1[23:21] = phaseDuration;
			conf1[31:24] = 8'b0000_0000;	
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

