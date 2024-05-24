
//`include "SPI_Slave.v"
//`include "SPI_Slave_LT.v"

`define COUNT20K 625

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
//	assign gn = {1'b0,1'b0,1'b0,1'b0,gno[1],gno[0]};

	//Clock 20 kHz
	wire clk;
	assign clk = clk_25mhz;


	reg [10:0] clk_counter;
	wire clk_counter_ready;
	
	reg clk_20khz;

	always @(posedge clk) begin
		if (clk_counter < `COUNT20K) begin
			clk_counter <= clk_counter + 1;		
		end else begin
			clk_counter <= 0;
			if (clk_20khz == 1'b0) begin
				clk_20khz <= 1'b1;
			end else begin
				clk_20khz <= 1'b0;
			end
		end
	end	
	
	assign gn[0] = clk_20khz;	
	
endmodule
