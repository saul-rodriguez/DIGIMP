
/*********************************************/
/* ASKA DIG TEST IN FPGA ULX3                */
/*                                           */
/*  Mapping:                                 */
/* 											 */
/*  gp[0] = resetn							 */
/*  gp[1] = enable							 */
/*                                           */
/*  gn[0] = clk 20 kHz                       */
/*  gn[3:1] = up_switches[2:0]               */
/*  gn[6:4] = down_switches[2:0]             */
/*  gn[12:7] = DAC[5:0]                     */
/*                                           */
/*********************************************/

`include "aska_dig.v"

`define COUNT20K 625

module top (
	//input [3:0] sw, 	
	input [5:0] gp,
	output [13:0] gn,
	output [7:0] led,	
	input [6:0] btn, // [3:1] are active high, [0] is active low	
	input clk_25mhz,
	output wifi_gpio0);
    
	/***********************/
	/* ULX3 related wiring */
	/***********************/

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

	/* Clock 20 KHz*/

	reg [10:0] clk_counter;
	wire clk_counter_ready;
	
	reg clk_20khz;

	//inputs
	wire resetn;
	wire enable;
    
	wire SPI_Clk;
	wire SPI_MOSI;
	wire SPI_CS;
	wire porborn;

	always @(posedge clk_25mhz or negedge resetn) begin
		if (resetn == 1'b0) begin
			clk_20khz <= 1'b0;
		end else if (clk_counter < `COUNT20K) begin
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

/******************************/
/* Instantiation of aska_dig  */
/******************************/
		    
	//Outputs
	wire [`ELEC_NUM:0] up_switches;
    wire [`ELEC_NUM:0] down_switches;
    wire [5:0] DAC;
    wire pulse_active;

	assign resetn = gp[0];
	assign porborn = gp[1];
	assign SPI_Clk = gp[2];
	assign SPI_MOSI = gp[3];
	assign SPI_CS = gp[4];

//Change outputs to test different electrodes
/*
	assign gn[3:1] = up_switches[2:0];
	assign gn[6:4] = down_switches[2:0];
	
	assign gn[3:1] = up_switches[31:29];
	assign gn[6:4] = down_switches[31:29];
*/
	assign gn[3:1] = up_switches[15:13];
	assign gn[6:4] = down_switches[15:13];

	assign gn[7] = DAC[0];
	assign gn[8] = DAC[1];
	assign gn[9] = DAC[2];
	assign gn[10] = DAC[3];
	assign gn[11] = DAC[4];
	assign gn[12] = DAC[5];
	assign gn[13] = pulse_active;

aska_dig aska_dig1 (
			.clk(clk_20khz),   // internal clock 20 kHz
			.reset_l(resetn), // Reset async. (L)
            .porborn(porborn), //Power-on-Reset/Brown-out-Reset (L)
			.SPI_CS(SPI_CS), // chip select  (L)
			.SPI_Clk(SPI_Clk), // Mode 0, data is sampled at the rising edge
			.SPI_MOSI(SPI_MOSI), // Master output  Slave Input				
			.up_switches(up_switches),  // Controls the P switches in the H bridge
            .down_switches(down_switches), // Controls the N switches in the H bridge
            .DAC(DAC),
            .pulse_active(pulse_active));	
endmodule
