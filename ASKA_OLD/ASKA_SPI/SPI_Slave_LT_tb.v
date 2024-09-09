//Verilog HDL for "SPI_SLAVE_STIMULUS", "SPI_stimulus" "functional"

//`include "constants.vams"
//`include "disciplines.vams"

`include "SPI_Slave_LT.v"

`timescale 1 ns/ 1ps

module SPI_stimulus(SPI_Clk,
		SPI_MOSI,
		SPI_CS,
		SPI_MISO,
		reset_l,
		d_Clk,
		SPI_Slave_RX,
		SPI_Slave_DV,
		SPI_Slave_TX);

	output reg SPI_Clk;
	output reg SPI_MOSI;
	output reg SPI_CS;
	output reg reset_l;
	output SPI_MISO;
	output d_Clk;
	output reg [7:0] SPI_Slave_RX;
	output SPI_Slave_DV;
	output reg [7:0] SPI_Slave_TX;

	/*
reg SPI_Clk;
reg SPI_MOSI;
reg SPI_CS;
reg reset_l;
wire SPI_MISO;
reg d_Clk;
	 */
	reg r_Clk;

	parameter CLKS_PER_HALF_BIT = 4;  // 6.25 MHz (SPI_CLK = 3.125 MHz)
	parameter MAIN_CLK_DELAY = 20;  // 25 MHz
	parameter SPI_CLK_DELAY = MAIN_CLK_DELAY*MAIN_CLK_DELAY;

	// Clock Generators:
	always #(MAIN_CLK_DELAY) r_Clk = ~r_Clk;
	assign #6 d_Clk = r_Clk;   //delayed clock

	reg [7:0] TX_data; // Data to send through MOSI
	reg [7:0] TX_data_old; // previous data sent through MOSI
	reg [7:0] RX_data; // Data received through MISO (circular buffer) 
	reg [7:0] SPI_Master_RX; // Data received through MISO  

	//Instantiation of UUT
	/*	
	wire [6:0] btn;
	assign btn = {{(5){1'b0}}, reset_l };
	
	wire [5:0] gp;
	assign gp = {1'b0,1'b0,1'b0,SPI_CS,SPI_MOSI,SPI_Clk};
	
	wire [5:0] gn;
	assign SPI_MISO = gn[0];
	assign SPI_Slave_DV = gn[1];
	
	wire [7:0] led;
	*/
	
	SPI_Slave_LT SPI_Slave_UUT
		(
			.clk(d_Clk),
			.resetn(reset_l),
			.SPI_CS(SPI_CS),
			.SPI_Clk(SPI_Clk),
			.SPI_MOSI(SPI_MOSI),
			.SPI_MISO(SPI_MISO),
			.Rx_DV(Rx_DV)
			//.Rx_Data(RX_Data),
			//.Tx_Byte(RX_Data) // 8 bit data to transmit  		  
		);
	
	/*
	top SPI_Slave_UUT
		(	.gp(gp),
			.gn(gn),
			.led(led),
			.btn(btn),
			.clk_25mhz(d_Clk)			
			);
    */

	initial begin

		// Required for EDA Playground
		$dumpfile("dump.vcd"); 
		$dumpvars;
		$display("************************************");
		$display("Loopback Test SPI Slave");

		//Initial State
		r_Clk = 0;
		TX_data = 8'h00;
		reset_l = 1'b1;
		SPI_CS = 1'b1;
		SPI_Clk = 1'b0;
		SPI_MOSI = 1'b0;
		SPI_Slave_TX = 8'h00;
 
		//Reset
		#(10*MAIN_CLK_DELAY) reset_l = 1'b0;
		#(10*MAIN_CLK_DELAY) reset_l = 1'b1;
		#(10*MAIN_CLK_DELAY);
 
			// Test send single byte MOSI
			//send_byte_CS(8'hC1); 
 
			//#(10*MAIN_CLK_DELAY);
			// Test send double byte MOSI
			//send_byte_CS(8'hBE);
			//send_byte_CS(8'hEF);
  
  
			// Test Send single bytes MOSI and receive MISO 
		send_and_receive_byte_CS(8'hC1, 8'hAA);
		#(10*MAIN_CLK_DELAY);
  
		send_and_receive_byte_CS(8'hBE, 8'h33);
		#(10*MAIN_CLK_DELAY);
  
		send_and_receive_byte_CS(8'hEF, 8'h54);
		#(10*MAIN_CLK_DELAY);
  
			// Test Send double bytes MOSI and receive MISO 
		send_and_receive_byte_CS(8'hA1, 8'hEE);
		send_and_receive_byte_CS(8'h5C, 8'h1D);  
		#(10*MAIN_CLK_DELAY);
   
			// Test Send double bytes MOSI and receive MISO 
		send_and_receive_byte_CS(8'h25, 8'h83);
		send_and_receive_byte_CS(8'h38, 8'h41);  
   
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
			send_byte(data);
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
			SPI_Slave_TX = data2;
			SPI_CS = 1'b0;
			send_byte(data1);
			//#SPI_CLK_DELAY;
			SPI_CS = 1'b1;	
		end
	endtask


	task send_byte(input [7:0] data);
		begin
			TX_data = data;			
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[7];
			RX_data = 8'h00;
			
			#SPI_CLK_DELAY;		
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[6];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[5];
				
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[4];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[3];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[2];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[1];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[0];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			RX_data = RX_data << 1;
			RX_data[0] = SPI_MISO;
			SPI_Master_RX = RX_data;		

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			
			// Check 
			if (TX_data_old == SPI_Master_RX) begin
				$display("Sent MOSI 0x%X, Received MISO 0x%X OK", TX_data_old, SPI_Master_RX);
			end else begin 
				$display("Sent MOSI 0x%X, Received MISO 0x%X ERROR", TX_data_old, SPI_Master_RX);
			end
				
			// keep a copy of old data to compare later MISO in next transaction
			// during loop back test
			TX_data_old = data; 
			//	$display("Received MOSI 0x%X", SPI_Slave_RX);
			//	$display("Received MISO 0x%X", SPI_Master_RX);
		end
	endtask

endmodule 

