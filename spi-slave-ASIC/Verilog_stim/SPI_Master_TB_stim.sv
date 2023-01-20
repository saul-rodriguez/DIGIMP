//Verilog HDL for "SPI_SLAVE_STIMULUS", "SPI_stimulus" "functional"

//`include "constants.vams"
//`include "disciplines.vams"

`timescale 1 ns/ 1ps

module SPI_stimulus(SPI_Clk,
	SPI_MOSI,
	SPI_CS,
	SPI_MISO,
	reset_l,
	d_Clk);

output reg SPI_Clk;
output reg SPI_MOSI;
output reg SPI_CS;
output reg reset_l;
input SPI_MISO;
output d_Clk;

/*
reg SPI_Clk;
reg SPI_MOSI;
reg SPI_CS;
reg reset_l;
wire SPI_MISO;
reg d_Clk;
*/
reg r_Clk;

//parameter SPI_MODE = 0; // CPOL = 1, CPHA = 1
parameter CLKS_PER_HALF_BIT = 4;  // 6.25 MHz (SPI_CLK = 3.125 MHz)
parameter MAIN_CLK_DELAY = 20;  // 25 MHz
parameter SPI_CLK_DELAY = MAIN_CLK_DELAY*MAIN_CLK_DELAY;


// Clock Generators:
always #(MAIN_CLK_DELAY) r_Clk = ~r_Clk;
assign #6 d_Clk = r_Clk;   //delayed clock

reg [7:0] TX_data;

initial begin

// Required for EDA Playground
 $dumpfile("dump.vcd"); 
 $dumpvars;

//Initial State
 r_Clk = 0;
 TX_data = 8'h00;
 reset_l = 1'b1;
 SPI_CS = 1'b1;
 SPI_Clk = 1'b0;
 SPI_MOSI = 1'b0;
 
 //Reset
 #(10*MAIN_CLK_DELAY) reset_l = 1'b0;
 #(10*MAIN_CLK_DELAY) reset_l = 1'b1;
 #(10*MAIN_CLK_DELAY);
 
 // Test send single byte MOSI
 send_byte_CS(8'hC1); 
 
 #(10*MAIN_CLK_DELAY);
  // Test send double byte MOSI
 send_byte_CS(8'hBE);
 send_byte_CS(8'hEF);
  
 #(100*SPI_CLK_DELAY) $finish;
 
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

task send_byte(input [7:0] data);
begin
	TX_data = data;
	#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
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


