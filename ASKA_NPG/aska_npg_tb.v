`include "aska_npg.v"

//`timescale 1 ns/ 1ps
`timescale 1 us/ 1ps

`define AMPLITUDE 10
`define FREQ 400
`define RAMP  10
`define RAMP_FACTOR (`AMPLITUDE*16)/`RAMP
//`define RAMP_FACTOR 0
`define ON_TIME  50
`define OFF_TIME  50

module aska_npg_stimulus(
    output reg clk,
    output reg resetn,
    output reg [5:0] amplitude, //0 - 50 mA
    output reg [11:0] freq,
    output reg [2:0] phaseDuration,
    output reg [5:0] ramp,
    output reg [9:0] ramp_factor,
    output reg [7:0] ON_time, // up to 4s (200 for 50 Hz)
    output reg [9:0] OFF_time, // up to 12s (600 for 50 Hz)
    output reg [3:0] electrode1,
    output reg [3:0] electrode2,
    output reg enable,
    input [3:0] up_switches,
    input [3:0] down_switches,
    input [5:0] DAC);

// Clock generation
//parameter CLK_DELAY = 25000;   // 20 kHz
parameter CLK_DELAY = 25;   // 20 kHz
always #(CLK_DELAY) clk = ~clk;


// Instantiation of UUT
aska_npg UUT (
    .clk(clk),
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
    .DAC(DAC)
);

// 

initial begin
    // Required for EDA Playground
	$dumpfile("dump.vcd"); 
	$dumpvars;
	$display("************************************");
	$display("Test ASKA NPG");
    
    //start
    clk = 0;
    resetn = 1;
    enable = 0;
    freq = `FREQ; 
    phaseDuration = 4;
    ramp = `RAMP;
    ramp_factor = `RAMP_FACTOR;
    ON_time = `ON_TIME;
    OFF_time = `OFF_TIME;
    electrode1 = 4;
    electrode2 = 1;
    amplitude = `AMPLITUDE;


    //reset async
    #(5*CLK_DELAY);
    resetn = 0;
    #(5*CLK_DELAY);
    resetn = 1;

    //enable
    enable = 1;

    #(400000*CLK_DELAY); 
    $display("************************************");
	$finish;

end

endmodule