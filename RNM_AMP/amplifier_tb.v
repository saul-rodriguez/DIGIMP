//amplifier tb

/*
 *  AMPLIFIER TB
 *
 *  this tb shows how to create a rn sin signal that is passed as input
 *  to a rnm amplifier. The code must be compiled with the option:
 *
 *  iverilog -m va_math
 *
 *  the constants.vams file must be included in order to get access to PI, etc.
 *  More information is available in: /usr/share/doc/iverilog/va_math.txt
 */
 
`timescale 1 ns / 1 ps
`include "constants.vams"


module amplifier_tb();

//Nets to drive
reg [1:0] amp;
reg en;
reg real in, vdd;

reg sampling_Clk;

parameter real T = 10.0;

//output nets
wire out;

initial begin
	$dumpfile("amplifier.vcd");
    $dumpvars(0,my_amplifier);
    
    //initial digital values
    en = 0;
    amp = 2'b00;    
    sampling_Clk = 0;
    
    //initial voltages
    in = 0.0;
    vdd = 0.0;
    
    #100 vdd = 0;
    #100 vdd = 1;
    #100 en = 1;
    #100 amp = 2'b01;
    #100 amp = 2'b10;
    #100 amp = 2'b11;
    #100 en = 0;
	#200 $finish;   
end

always begin
	#1 sampling_Clk = ~sampling_Clk;	
end

always @(posedge sampling_Clk or negedge sampling_Clk) begin
	in <= $sin(`M_TWO_PI*$time/T);
	$display("input = %f",in);
end



amplifier my_amplifier(.in(in),
						.out(out),
						.vdd(vdd),
						.en(en),
						.amp(amp));

endmodule




