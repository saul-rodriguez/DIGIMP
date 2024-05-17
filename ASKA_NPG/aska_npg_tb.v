`include "aska_npg.v"

`timescale 1 ns/ 1ps

module aska_npg_stimulus(
    output reg clk,
    output reg resetn,
    output reg [11:0] freq,
    output reg [2:0] phaseDuration,
    output reg [5:0] ramp,
    output reg [3:0] up,
    output reg [3:0] down,
    output reg enable);

// Clock generation
parameter CLK_DELAY = 25000;   // 20 kHz
always #(CLK_DELAY) clk = ~clk;


// Instantiation of UUT
aska_npg UUT (
    .clk(clk),
    .resetn(resetn),
    .freq(freq),
    .phaseDuration(phaseDuration),
    .ramp(ramp),
    .up(up),
    .down(down),
    .enable(enable)
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
    freq = 49; 
    phaseDuration = 3;
    ramp = 0;
    up = 4;
    down = 1;

    //reset async
    #(5*CLK_DELAY);
    resetn = 0;
    #(5*CLK_DELAY);
    resetn = 1;

    //enable
    enable = 1;






    #(500*CLK_DELAY); 
    $display("************************************");
	$finish;

end



endmodule