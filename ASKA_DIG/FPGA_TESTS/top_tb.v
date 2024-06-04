`include "top.v"

`timescale 1 ns/ 1ps

module top_tb();

    reg resetn;
    reg enable;

// Main Clk ULX

parameter CLK_DELAY = 20;  // 25 MHz

// Clock Generators:
    reg clk25;
	always #(CLK_DELAY) clk25 = ~clk25;


//Instantiation of UUT
		
	wire [6:0] btn;
	//assign btn = {{(5){1'b0}}, reset_l };
	
	reg [5:0] gp; //inputs
	//assign gp = {1'b0,1'b0,1'b0,SPI_CS,SPI_MOSI,SPI_Clk};
	
	wire [13:0] gn;	//outputs	
	wire [7:0] led;

    always @(*) begin
        gp[0] = resetn;
        gp[1] = enable;
    end

    wire [2:0] up_switches;
    wire [2:0] down_switches;
    wire pulse_active;
    wire [5:0] DAC;
    wire clk_20khz;

    assign clk_20khz = gn[0];
    assign up_switches = gn[3:1];
    assign down_switches = gn[6:4];    
    assign DAC = gn[12:7];
    assign pulse_active = gn[13];

    
	
	top NPG
		(	.gp(gp),
			.gn(gn),
			.led(led),
			.btn(btn),
			.clk_25mhz(clk25)			
			);


initial begin
    // Required for EDA Playground
	$dumpfile("dump.vcd"); 
	$dumpvars;
	$display("************************************");
	$display("Test ASKA NPG");
    
    //start
    clk25 = 0;
    resetn = 1;
    enable = 0;
  
    //reset async
    #(5*CLK_DELAY);
    resetn = 0;
    #(5*CLK_DELAY);
    resetn = 1;

    //enable
    enable = 1;

    #(16000000*CLK_DELAY); 
    $display("************************************");
	$finish;
end

endmodule
