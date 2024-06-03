//Verilog HDL for "SPI_SLAVE_STIMULUS", "SPI_stimulus" "functional"

//`include "constants.vams"
//`include "disciplines.vams"

`include "aska_spi.v"

`timescale 1us/ 1ps

module SPI_stimulus(	
	output reg SPI_Clk,
	output reg SPI_MOSI,
	output reg SPI_CS,
	output reg reset_l);
	
	reg Clk20kHz;

	parameter MAIN_CLK_DELAY = 25;  // 20 kHz
	parameter SPI_CLK_DELAY = 1; // 500 kHz

	// Clock Generators:
	always #(MAIN_CLK_DELAY) Clk20kHz = ~Clk20kHz;
	
	reg [7:0] TX_data; // Data to send through MOSI	
	reg [7:0] SPI_Master_RX; // Data received through MISO  

	wire [`M-1:0] conf0;
	wire [`M-1:0] conf1;
	wire [`M-1:0] ele1;
	wire [`M-1:0] ele2;
	
	aska_spi aska_spi_UUT
		(
			//.clk(d_Clk),
			.resetn(reset_l),
			.SPI_CS(SPI_CS),
			.SPI_Clk(SPI_Clk),
			.SPI_MOSI(SPI_MOSI),			 
			.conf0(conf0),
			.conf1(conf1),
			.ele1(ele1),
			.ele2(ele2)
		);
		

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
 

		send_ASKA(8'h00,32'haabbccdd);
		#(20*MAIN_CLK_DELAY);
		send_ASKA_error(8'h03,32'h554466aa); // send incomplete command!
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h01,32'h3377eeff);
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h02,32'hbebecaca);
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h03,32'hcafebaba);
   
		#(100*SPI_CLK_DELAY); 
		$display("************************************");
		$finish;
 
	end

	initial begin
		//    $sdf_annotate ("/home/saul/projects/TEST_LIB2/innovus/output/typ_functional_1_8V_25C.sdf",I3,, "sdf.log", "MAXIMUM");
	end

	task send_byte_CS(input [7:0] data);
		begin
			SPI_CS = 1'b0;
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			send_byte(data);
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_CS = 1'b1;	
		end
	endtask

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

	task send_double_byte_CS(input [7:0] data1, input [7:0] data2);
		begin
			SPI_CS = 1'b0;
			send_byte(data1);
			send_byte(data2);		
			SPI_CS = 1'b1;	
		end
	endtask

	task send_and_receive_byte_CS(input [7:0] data1, input [7:0] data2);
		begin
			//SPI_Slave_TX = data2;
			SPI_CS = 1'b0;
			send_byte(data1);
			//#SPI_CLK_DELAY;
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

