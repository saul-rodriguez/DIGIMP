//amplifier tb

`timescale 1 ns / 1 ps


module amplifier_tb();

//Nets to drive
reg [1:0] amp;
reg en;
reg real in, vdd;

//output nets
wire out;

initial begin
	$dumpfile("amplifier.vcd");
    $dumpvars(0,my_amplifier);
    
    //initial digital values
    en = 0;
    amp = 2'b00;
    
    //initial voltages
    in = 0.1;
    vdd = 0.0;
    
    #10 vdd = 0;
    #10 vdd = 1;
    #10 en = 1;
    #10 amp = 2'b01;
    #10 amp = 2'b10;
    #10 amp = 2'b11;
    #10 en = 0;
	#20 $finish;   
end

amplifier my_amplifier(.in(in),
						.out(out),
						.vdd(vdd),
						.en(en),
						.amp(amp));

endmodule




