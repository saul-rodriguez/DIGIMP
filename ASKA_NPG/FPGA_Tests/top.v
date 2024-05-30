
/*********************************************/
/* ASKS NPG TEST IN FPGA ULX3                */
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

`include "aska_npg.v"

`define COUNT20K 625

`define AMPLITUDE 50
`define FREQ 2000
`define PHASE 4
`define RAMP  50
`define RAMP_FACTOR (`AMPLITUDE*16)/`RAMP
//`define RAMP_FACTOR 0
`define ON_TIME  50
`define OFF_TIME  50
`define ELE1  32'b0000_0000_0000_0000_1000_0000_0000_0000
`define ELE2  32'b0000_0000_0000_0000_0100_0000_0000_0000


module top (
	//input [3:0] sw, 	
	input [5:0] gp,
	output [13:0] gn,
	output [7:0] led,	
	input [6:0] btn, // [3:1] are active high, [0] is active low	
	input clk_25mhz,
	output wifi_gpio0    
);
    
	/*ULX3 related wiring*/

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

	always @(posedge clk_25mhz) begin
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

/* Instantiation of NPG*/
	
	//inputs
	wire resetn;
	wire enable;
    wire [5:0] amplitude; //0 - 50 mA
    wire [11:0] freq; // 4.88 Hz (4095) - 50 Hz (400)
    wire [2:0] phaseDuration;
    wire [5:0] ramp;
    wire [9:0] ramp_factor;
    wire [7:0] ON_time; // up to 4s (200 for 50 Hz)ramp = `RAMP;    
    wire [9:0] OFF_time; // up to 12s (600 for 50 Hz)
    wire [`ELEC_NUM:0] electrode1;
    wire [`ELEC_NUM:0] electrode2;
	    
	//Outputs
	wire [`ELEC_NUM:0] up_switches;
    wire [`ELEC_NUM:0] down_switches;
    wire [5:0] DAC;
    wire pulse_active;


	assign resetn = gp[0];
	assign enable = gp[1];

	assign amplitude = `AMPLITUDE;
	assign freq = `FREQ;
	assign phaseDuration = `PHASE;
	assign ramp = `RAMP;
    assign ramp_factor = `RAMP_FACTOR;
    assign ON_time = `ON_TIME;
    assign OFF_time = `OFF_TIME;
    assign electrode1 = `ELE1;
    assign electrode2 = `ELE2;


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
		
aska_npg UUT (
    .clk(clk_20khz),
    .resetn(resetn),
    .amplitude(amplitude),
    .freq(freq),
    .phaseDuration(phaseDuration),
    .ramp(ramp),
    .ramp_factor(ramp_factor),
    .ON_time(ON_time),
    .OFF_time(OFF_time),
    .electrode1(electrode1),
    .electrode2(electrode2),
    .enable(enable),
    .up_switches(up_switches),
    .down_switches(down_switches),
    .DAC(DAC),
    .pulse_active(pulse_active)
);
	
endmodule
